function setFluxBounds(data_dictionary, y,t)
	normal_ca2= 2120.0
	normal_adp = .13
	normal_txa2 = .00259
	normal_ca2_c=70/1000 
	t_activate = .025
	fluxbounds = data_dictionary["default_flux_bounds_array"]
	speciesbounds = data_dictionary["species_bounds_array"]
	metabs = data_dictionary["list_of_metabolite_symbols"]
	rxns = data_dictionary["list_of_reaction_strings"]
	id_ca2e = findfirst(metabs, "ca2_e")
	id_ca2c = findfirst(metabs, "ca2_c")
	ca2import_id = findfirst(rxns,"EX_ca2_c_ca2_e|Intracellular Constraint_reverse::ca2_e --> ca2_c")
	ca2export_id = findfirst(rxns,"EX_ca2_c_ca2_e|Intracellular Constraint::ca2_c --> ca2_e")
	if(t>t_activate)
		width_of_cell_membrane = 3 #nm http://bionumbers.hms.harvard.edu/search.aspx?log=y&task=searchbytrmorg&trm=width+of+cell+membrane&time=2017%2f05%2f04+15%3a54%3a30.246
		k_ca =5.3*10^-6.0 #5.3 × 10−6 cm2 s−1 http://www.sciencedirect.com/science/article/pii/0143416087900273
		adjusted_k_ca = k_ca/width_of_cell_membrane*10^6*3600
		#let it get up to 1 microMolar, then force export
		if(y[id_ca2e]>y[id_ca2c] && y[id_ca2c]<1)
			println("importing ca2") 
			fluxbounds[ca2import_id,:]=.05*abs(y[id_ca2e]-y[id_ca2c]) #force import if extracellular larger than cytosolic
		elseif(y[id_ca2c]>normal_ca2_c)	
			println("export ca2")	
			fluxbounds[ca2export_id,:]=5.0*y[id_ca2c]
			fluxbounds[ca2import_id,:] =[0,0] #no import, can only explort
			speciesbounds[id_ca2c,:]=-10.0*y[id_ca2c]
		elseif(y[id_ca2c]<normal_ca2)
			fluxbounds[ca2export_id,:]=[0,1000]
			fluxbounds[ca2import_id,:]=[0,1000]
			speciesbounds[id_ca2c,:]=[0,100]

		end
	end

	id_txa2_e =findfirst(metabs,"txa2_e")
	id_txa2_c = findfirst(metabs, "txa2_c")
	txa2import_id =findfirst(rxns, "TXA2te|Transport_ Extracellular::txa2_e --> txa2_c")
	if(y[id_txa2_e]>5.69E-5 && y[id_txa2_e]>0) #plasma concentration of TXA2
		fluxbounds[txa2import_id,:]=1E-12*abs(y[id_txa2_e]-y[id_txa2_c]) #force import, proportionate to concentration difference
	else
		fluxbounds[txa2import_id,:]=[0.0,0.0]
	end
	#PIP2 to IP3
	id_adp_e = findfirst(metabs, "adp_e")
	IP3_production_id_1 = findfirst(rxns, "PI45PLC_16_0_16_0|Expanded Glycerophospholipid metabolism::pail45p_hs_16_0_16_0_c+h2o_c --> dag_hs_16_0_16_0_c+h_c+mi145p_c")
	IP3_production_id_2 = findfirst(rxns, "PI45PLC_16_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_16_0_18_0_c --> h_c+dag_hs_16_0_18_0_c+mi145p_c")
	AC_id = findfirst(rxns, "ADNCYC|Nucleotides::atp_c --> camp_c+ppi_c") #production of cAMP by adenylate cylase. Inhibitied during platelet activation	
	txa2_synthesis_id =findfirst(rxns, "TXASr|Eicosanoid Metabolism::prostgh2_r --> txa2_r")
	#@show AC_id, txa2_synthesis_id
	if(y[id_adp_e]>normal_adp) #if we have a lot of ADP, force IP3 production on
		fluxbounds[IP3_production_id_1,:] = [50, 1000]
		fluxbounds[IP3_production_id_2,:]=[50,1000]
		fluxbounds[AC_id,:]=[1,1] #if we have a lot of external ADP, activating, AC off, low flux through it
		fluxbounds[txa2_synthesis_id,:] =[50,1000] #make a lot of TXA2
	else
		fluxbounds[IP3_production_id_1,:] = [0, 1000]
		fluxbounds[IP3_production_id_2,:]=[0,1000]
	end

	@show t
	@show y[id_txa2_e], fluxbounds[txa2import_id,:]
	@show y[id_ca2e], fluxbounds[ca2import_id,:]
	@show y[id_ca2c], fluxbounds[ca2export_id,:]
	@show y[id_adp_e],fluxbounds[IP3_production_id_1,:],fluxbounds[IP3_production_id_2,:]
	data_dictionary["species_bounds_array"]=speciesbounds
	data_dictionary["default_bounds_array"]=fluxbounds
	return data_dictionary
end

function setFluxBoundsCa_Exp(data_dictionary,y,t)
	@show t
	normal_adp = 0.0
	t_activate = .025
	tpeak = 130.0/(60^2)
	max_Ca = 200/1000
	normal_ca2_c=35/1000 
	fluxbounds = data_dictionary["default_flux_bounds_array"]
	speciesbounds = data_dictionary["species_bounds_array"]
	metabs = data_dictionary["list_of_metabolite_symbols"]
	rxns = data_dictionary["list_of_reaction_strings"]
	id_ca2e = findfirst(metabs, "ca2_e")
	id_ca2c = findfirst(metabs, "ca2_c")
	ca2import_id = findfirst(rxns,"EX_ca2_c_ca2_e|Intracellular Constraint_reverse::ca2_e --> ca2_c")
	ca2export_id = findfirst(rxns,"EX_ca2_c_ca2_e|Intracellular Constraint::ca2_c --> ca2_e")

	id_adp_e = findfirst(metabs, "adp_e")
	IP3_production_id_1 = findfirst(rxns, "PI45PLC_16_0_16_0|Expanded Glycerophospholipid metabolism::pail45p_hs_16_0_16_0_c+h2o_c --> dag_hs_16_0_16_0_c+h_c+mi145p_c")
	IP3_production_id_2 = findfirst(rxns, "PI45PLC_16_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_16_0_18_0_c --> h_c+dag_hs_16_0_18_0_c+mi145p_c")
	AC_id = findfirst(rxns, "ADNCYC|Nucleotides::atp_c --> camp_c+ppi_c") #production of cAMP by adenylate cylase. Inhibitied during platelet activation	
	txa2_synthesis_id =findfirst(rxns, "TXASr|Eicosanoid Metabolism::prostgh2_r --> txa2_r")
	#@show AC_id, txa2_synthesis_id
	if(y[id_adp_e]>normal_adp) #if we have a lot of ADP, force IP3 production on
		fluxbounds[IP3_production_id_1,:] = [50, 1000]
		fluxbounds[IP3_production_id_2,:]=[50,1000]
		fluxbounds[AC_id,:]=[1,1] #if we have a lot of external ADP, activating, AC off, low flux through it
		fluxbounds[txa2_synthesis_id,:] =[50,1000] #make a lot of TXA2
		if(y[id_ca2c]<max_Ca && t<tpeak)
			println("Importing")
			fluxbounds[ca2import_id,:]=.0045*abs(y[id_ca2e]-y[id_ca2c])
			importing = true
		elseif(y[id_ca2c]>normal_ca2_c)
			fluxbounds[ca2import_id,:]=[0,0] #stop import
			fluxbounds[ca2export_id, :]=.1/2*abs(y[id_ca2c]-y[id_ca2e])^.5 #force export
			println("Exporting")
		end

	else
		fluxbounds[IP3_production_id_1,:] = [0, 1000]
		fluxbounds[IP3_production_id_2,:]=[0,1000]
		fluxbounds[ca2export_id,:]=[0,1000]
		fluxbounds[ca2import_id,:]=[0,1000]
		#speciesbounds[id_ca2c,:]=[0,100]
	end
	#@show fluxbounds[ca2import_id,:], fluxbounds[ca2export_id, :], y[id_ca2c]
	data_dictionary["species_bounds_array"]=speciesbounds
	data_dictionary["default_bounds_array"]=fluxbounds
	return data_dictionary
end
