include("Include.jl")
include("setObj.jl")
include("setSpeciesBounds.jl")
include("setBoundsUsingExpData.jl")
include("setIC.jl")
include("setFluxBounds.jl")
include("../code/buildGeneControl.jl")
include("../code/drawNetwork.jl")

using PyPlot

function solve()
	# load the data dictionary -
	data_dictionary = DataDictionary(0,0,0)
	data_dictionary=buildGeneControl(data_dictionary)
	data_dictionary=setSpeciesBounds(data_dictionary)
	data_dictionary = setBoundsUsingExpData(data_dictionary)
	data_dictionary = setObjectiveAllEnergySpeices(data_dictionary)
	#data_dictionary = setObjectiveMaxATP(data_dictionary)
	# solve the lp problem -
	(objective_value, flux_array, dual_array, uptake_array, exit_flag) = FluxDriver(data_dictionary)
	fp = show_flux_profile(flux_array, .01, data_dictionary)
	for f in fp
		print(string(f, "\n"))
	end
	return objective_value, flux_array, dual_array, uptake_array, exit_flag, fp
end

function solveWKnockouts(knockouts)
	# load the data dictionary -
	data_dictionary = DataDictionary(0,0,0)
	data_dictionary=buildGeneControl(data_dictionary)
	data_dictionary=setSpeciesBounds(data_dictionary)
	data_dictionary = setBoundsUsingExpData(data_dictionary)
	data_dictionary = setObjectiveAllEnergySpeices(data_dictionary)
	data_dictionary=knockOutGenes(data_dictionary, knockouts)
	#data_dictionary = setObjectiveMaxATP(data_dictionary)
	# solve the lp problem -
	(objective_value, flux_array, dual_array, uptake_array, exit_flag) = FluxDriver(data_dictionary)
	fp = show_flux_profile(flux_array, .01, data_dictionary)
#	for f in fp
#		print(string(f, "\n"))
#	end
	return objective_value, flux_array, dual_array, uptake_array, exit_flag, fp
end


function calculateNorm(flux_array)
	num_fluxes = size(flux_array,1)
	sum = 0.0
	max_flux = 1000.0
	for f in flux_array
		sum = sum+f^2/max_flux^2 #so that things aren't so huge
	end
	return sqrt(sum)
end

function mass_balances(t,y,data_dictionary)
	idx_small = find(y.<0)
	y[idx_small]=0.0 #prevent concentrations from becoming negative
	savepts = [.03,.055,.2]
	savestrs =["At SS", "Activating", "Deactivating"]
	S = data_dictionary["stoichiometric_matrix"]
	data_dictionary = setFluxBounds(data_dictionary,y,t)
	(objective_value, flux_array, dual_array, uptake_array, exit_flag) = FluxDriver(data_dictionary)
	norm = calculateNorm(flux_array)
	@show norm
	f = open("fluxes/NormOverTime.txt", "a+")
	write(f, string(t, ",", norm, "\n"))
	close(f)
	at_save_pt=findfirst(savepts,t)
#	if(at_save_pt!=0) #we're at a save point'
#		println("writing fluxes to file")
#		writeOutFluxes(flux_array, string("fluxes/", savestrs[at_save_pt], ".txt"))
#		println("Drawing Network")
#		drawNetworkBySystems(flux_array, savestrs[at_save_pt], data_dictionary)
#	end
	change =S*flux_array#-flux_array[growth_flux_id]*y
	change[idx_small]=0.0
	#@show change
	return change
end

function mass_balancesCa(t,y,data_dictionary)
	idx_small = find(y.<0)
	y[idx_small]=0.0 #prevent concentrations from becoming negative
	savepts = [.03,.055,.2]
	savestrs =["At SS", "Activating", "Deactivating"]
	S = data_dictionary["stoichiometric_matrix"]
	data_dictionary = setFluxBoundsCa_Exp(data_dictionary,y,t)
	(objective_value, flux_array, dual_array, uptake_array, exit_flag) = FluxDriver(data_dictionary)
	norm = calculateNorm(flux_array)
	@show norm
	f = open("fluxes/NormOverTime.txt", "a+")
	write(f, string(t, ",", norm, "\n"))
	close(f)
	at_save_pt=findfirst(savepts,t)
#	if(at_save_pt!=0) #we're at a save point'
#		println("writing fluxes to file")
#		writeOutFluxes(flux_array, string("fluxes/", savestrs[at_save_pt], ".txt"))
#		println("Drawing Network")
#		drawNetworkBySystems(flux_array, savestrs[at_save_pt], data_dictionary)
#	end
	change =S*flux_array#-flux_array[growth_flux_id]*y
	change[idx_small]=0.0
	#@show change
	return change
end

function mass_balances(t,y,data_dictionary,normsavestr)
	idx_small = find(y.<0)
	y[idx_small]=0.0 #prevent concentrations from becoming negative
	savepts = [.03,.055,.2]
#	savestrs =["At SS", "Activating", "Deactivating"]
	savestrs =["AtSSPTSGKnockedout", "ActivatingPTSGKnockedout", "DeactivatingPTSGKnockedout"]
	S = data_dictionary["stoichiometric_matrix"]
	data_dictionary = setFluxBounds(data_dictionary,y,t)
	(objective_value, flux_array, dual_array, uptake_array, exit_flag) = FluxDriver(data_dictionary)
	norm = calculateNorm(flux_array)
	@show norm
	f = open(normsavestr, "a+")
	write(f, string(t, ",", norm, "\n"))
	close(f)
	at_save_pt=findfirst(savepts,t)
#	if(at_save_pt!=0) #we're at a save point'
#		println("writing fluxes to file")
#		writeOutFluxes(flux_array, string("fluxes/", savestrs[at_save_pt], ".txt"))
#		println("Drawing Network")
#		drawNetworkBySystems(flux_array, savestrs[at_save_pt], data_dictionary)
#	end
	change =S*flux_array#-flux_array[growth_flux_id]*y
	change[idx_small]=0.0
	#@show change
	return change
end



function eulerIntegration(y0, func, t, data_dictionary)
	num_steps = size(t, 1)
	y = zeros(size(transpose(y0)))
	all_y=y
	for j in collect(1:num_steps-1)
		if(j ==1)
			y=y0+(t[j+1]-t[j])*func(t[j], y0, data_dictionary)
		else
			y=y+(t[j+1]-t[j])*func(t[j], y, data_dictionary)
		end
		#@show size(y)
		all_y = vcat(all_y, transpose(y))
	end
	return all_y
end

function eulerIntegration(y0, func, t, data_dictionary,normsavestr)
	num_steps = size(t, 1)
	y = zeros(size(transpose(y0)))
	all_y=y
	for j in collect(1:num_steps-1)
		if(j ==1)
			y=y0+(t[j+1]-t[j])*func(t[j], y0, data_dictionary,normsavestr)
		else
			y=y+(t[j+1]-t[j])*func(t[j], y, data_dictionary, normsavestr)
		end
		#@show size(y)
		all_y = vcat(all_y, transpose(y))
	end
	return all_y
end

function dFBA(tstart::Float64,tstep::Float64,tend::Float64)
	time = collect(tstart:tstep:tend)
	data_dictionary =DataDictionary(0,0,0)
	data_dictionary=buildGeneControl(data_dictionary)
	data_dictionary=setSpeciesBounds(data_dictionary)
	data_dictionary = setBoundsUsingExpData(data_dictionary)
	data_dictionary = setObjectiveAllEnergySpeices(data_dictionary)
	inital_conditions =setIC(data_dictionary)
	res=eulerIntegration(inital_conditions, mass_balances, time, data_dictionary)
	@show size(res)
	res[1,:]=inital_conditions
	return time, res, data_dictionary
end

function dFBA(tstart,tstep,tend, inital_conditions,data_dictionary)
	time = collect(tstart:tstep:tend)
	data_dictionary=buildGeneControl(data_dictionary)
	data_dictionary=setSpeciesBounds(data_dictionary)
	data_dictionary = setBoundsUsingExpData(data_dictionary)
	data_dictionary = setObjectiveAllEnergySpeices(data_dictionary)
	res=eulerIntegration(inital_conditions, mass_balances, time, data_dictionary)
	@show size(res)
	res[1,:]=inital_conditions
	return time, res, data_dictionary
end

function dFBA_Ca(tstart,tstep,tend, inital_conditions,data_dictionary)
	time = collect(tstart:tstep:tend)
	data_dictionary=buildGeneControl(data_dictionary)
	data_dictionary=setSpeciesBounds(data_dictionary)
	data_dictionary = setBoundsUsingExpData(data_dictionary)
	data_dictionary = setObjectiveAllEnergySpeices(data_dictionary)
	res=eulerIntegration(inital_conditions, mass_balancesCa, time, data_dictionary)
	@show size(res)
	res[1,:]=inital_conditions
	return time, res, data_dictionary
end


function dFBA_Activation(tstart,tstep,tend, inital_conditions,data_dictionary)
	time = collect(tstart:tstep:tend)
	data_dictionary=buildGeneControl(data_dictionary)
	data_dictionary=setSpeciesBounds(data_dictionary)
	data_dictionary = setBoundsUsingExpData(data_dictionary)
	data_dictionary = setObjectiveAllEnergySpeices(data_dictionary)
	inital_conditions =setIC_Activation(data_dictionary, inital_conditions)
	@show inital_conditions
	res=eulerIntegration(inital_conditions, mass_balances, time, data_dictionary)
	@show size(res)
	res[1,:]=inital_conditions
	return time, res, data_dictionary
end

function dFBA(tstart,tstep,tend, inital_conditions,data_dictionary,normsavestr)
	time = collect(tstart:tstep:tend)
	data_dictionary=setSpeciesBounds(data_dictionary)
	data_dictionary = setBoundsUsingExpData(data_dictionary)
	data_dictionary = setObjectiveAllEnergySpeices(data_dictionary)
	res=eulerIntegration(inital_conditions, mass_balances, time, data_dictionary,normsavestr)
	@show size(res)
	res[1,:]=inital_conditions
	return time, res, data_dictionary
end


function dFBA_Activation(tstart,tstep,tend, inital_conditions,data_dictionary,normsavestr)
	time = collect(tstart:tstep:tend)
	data_dictionary=setSpeciesBounds(data_dictionary)
	data_dictionary = setBoundsUsingExpData(data_dictionary)
	data_dictionary = setObjectiveAllEnergySpeices(data_dictionary)
	inital_conditions =setIC_Activation(data_dictionary, inital_conditions)
	@show inital_conditions
	res=eulerIntegration(inital_conditions, mass_balances, time, data_dictionary,normsavestr)
	@show size(res)
	res[1,:]=inital_conditions
	return time, res, data_dictionary
end

function plotSpeciesOfInterest(time,res,data_dictionary,case)
	species_of_interest = ["adp_e", "ca2_e", "glc_D_e", "txa2_e", "ca2_c"]
	metabs =data_dictionary["list_of_metabolite_symbols"]
	j = 1
	k = 1
	close("all")
	figure(figsize=[10,10])
	for m in metabs
		for s in species_of_interest
			if(m ==s)
				@show k
				@show size(res[:,j])
				#PyPlot.plot(time*60*60, res[:,j])
				plt[:subplot](5,1,k)
				PyPlot.plot(time*60*60, res[:,j], "k")
				#ylabel("Concentration in mircoMolar")
				ax = gca()
				if(k<5)
					ax[:set_xticklabels]([])
				end
				title(s)
				k = k+1
			end
		end
		j = j+1
	end
	xlabel("Time in seconds", fontsize =20)
	annotate("Concentration in microMolar",
	xy=[.05;.75],
	xycoords="figure fraction",
	xytext=[0,0],
	textcoords="offset points",
	ha="right",
	va="top",
	rotation = 90,
	fontsize = 20)
	savefig(string("../figures/Allmetab","case=", case, ".jpg"))
	close("all")
end

function runAndPlot()
	time,res,data_dictionary=dFBA()
	plotSpeciesOfInterest(time,res,data_dictionary, "normal")
end

function runAndPlotActivation()
	time,res,data_dictionary=dFBA_Activation()
	idx_small = find(res.<0)
	res[idx_small]=0.0 #remove small negative concentrations
	plotSpeciesOfInterest(time,res,data_dictionary, "ActivatedWithTXA2")
	return res, data_dictionary
end

function runToSSThenActivate()
	tstart = 0.0
	tactivate = .025 #activate at 90 seconds = .025 hours
	tend_activation = .06
	tend =.3
	tstep = .005
	timeSS, resSS,data_dictionary=dFBA(tstart,tstep,tactivate)
	idx_small = find(resSS.<0)
	resSS[idx_small]=0.0 #remove small negative concentrations
	IC = resSS[end,:]
	timeActive,resActive,data_dictionary=dFBA_Activation(tactivate, tstep,tend_activation,IC,data_dictionary)
	IC = resActive[end,:]
	IC = setIC_PostActivation(data_dictionary,IC)
	time_deactive, resDeactive,data_dictionary=dFBA(tend_activation, tstep, tend,IC,data_dictionary)
	time_total =vcat(timeSS, timeActive,time_deactive)
	res_total=vcat(resSS,resActive, resDeactive)
	idx_small = find(resSS.<0)
	res_total[idx_small]=0.0 #remove small negative concentrations
	plotSpeciesOfInterest(time_total, res_total, data_dictionary, "ActivateAt90s")
end

function runCaSim()
	tstart = 0.0
	tactivate = .0167#.025 #activate at 90 seconds = .025 hours
	tend_activation = 300/(60^2)
	tend =.3
	tstep = .001
	data_dictionary = DataDictionary(0,0,0)
	IC=setIC_40microM_ADP_Initial(data_dictionary)
	timeSS, resSS,data_dictionary=dFBA_Ca(tstart,tstep,tactivate, IC, data_dictionary)
	idx_small = find(resSS.<0)
	resSS[idx_small]=0.0 #remove small negative concentrations
	IC = setIC_40microM_ADP_Active(data_dictionary)
	timeActive,resActive,data_dictionary=dFBA_Ca(tactivate, tstep,tend_activation,IC,data_dictionary)
	time_total =vcat(timeSS, timeActive)
	res_total=vcat(resSS,resActive)
	idx_small = find(res_total.<0)
	res_total[idx_small]=0.0 #remove small negative concentrations
	plotSpeciesOfInterest(time_total, res_total, data_dictionary, "ActivateAt90s")
	plotCa(time_total, res_total, data_dictionary)
end


function runAllKockouts()
	allgenes =createAllGenesList()
	for gene in allgenes
		@show gene
		runActivationWKnockout(gene)
	end
end

function knockoutPSTG()
	knockouts =[5742, 5743]
	runActivationWKnockout(knockouts)
end

function plotCa(time, res,data_dictionary)
	species_of_interest = ["ca2_c"]
	metabs =data_dictionary["list_of_metabolite_symbols"]
	Ca_data = readdlm("../experimentalData/ADP_induced_CaDeterministic.txt", ',')
	j = 1
	k = 1
	#close("all")
	figure(figsize=[10,10])
	for m in metabs
		for s in species_of_interest
			if(m ==s)
				PyPlot.plot(Ca_data[:,1], Ca_data[:,2], "rx") 
				PyPlot.plot(time*60*60, res[:,j]*1000, "k")
				title(s)
				k = k+1
			end
		end
		j = j+1
	end
	ylabel("Concentration in nanoMolar")
	xlabel("Time, in seconds")
end

function runActivationWKnockout(gene)
	tstart = 0.0
	tactivate = .05
	tend_activation = .06
	tend =.3
	tstep = .005
	normsavestr = string("fluxes/NormOfgene",gene,"knockedout.txt")
	normplotstr = string("../figures/NormPlotOf", gene, "knockedout.jpg")
	concentrationsavestr = string("ConcenrtationsOfgene",gene,"knockedout")
	data_dictionary = DataDictionary(0,0,0)
	data_dictionary=buildGeneControl(data_dictionary)
	data_dictionary=knockOutGenes(data_dictionary,gene)
	IC =setIC(data_dictionary)
	timeSS, resSS,data_dictionary=dFBA(tstart,tstep,tactivate,IC,data_dictionary,normsavestr)
	idx_small = find(resSS.<0)
	resSS[idx_small]=0.0 #remove small negative concentrations
	IC = resSS[end,:]
	timeActive,resActive,data_dictionary=dFBA_Activation(tactivate, tstep,tend_activation,IC,data_dictionary,normsavestr)
	IC = resActive[end,:]
	IC = setIC_PostActivation(data_dictionary,IC)
	time_deactive, resDeactive,data_dictionary=dFBA(tend_activation, tstep, tend,IC,data_dictionary,normsavestr)
	time_total =vcat(timeSS, timeActive,time_deactive)
	res_total=vcat(resSS,resActive, resDeactive)
	idx_small = find(resSS.<0)
	res_total[idx_small]=0.0 #remove small negative concentrations
	plotSpeciesOfInterest(time_total, res_total, data_dictionary, concentrationsavestr)
	plotNorm(normsavestr, normplotstr)
end

function plotNorm(pathToData,savestr)
	close("all")
	data = readdlm(pathToData, ',')
	figure(figsize = [10,10])
	PyPlot.plot(data[:,1]*60*60, data[:,2], "k")
	xlabel("Time in Seconds")
	ylabel("Norm of the fluxes")
	savefig(savestr)
	close("all")
end

function plotNorm()
	close("all")
	data = readdlm("fluxes/NormOverTime.txt", ',')
	figure(figsize = [10,10])
	PyPlot.plot(data[:,1]*60*60, data[:,2], "kx-")
	dataknockout = readdlm("fluxes/NormOfgene[5742,5743]knockedout.txt", ',')
	PyPlot.plot(dataknockout[:,1]*60*60, dataknockout[:,2], "rx-")
	xlabel("Time in Seconds", fontsize = 20)
	ylabel("Norm of the fluxes", fontsize = 20)
	legend(["Normal", "PTGS1 Knocked Out"])
	savefig("../figures/NormOfFluxesNormalAndKnocked.eps")
end
