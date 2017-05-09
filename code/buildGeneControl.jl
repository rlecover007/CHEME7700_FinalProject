#include("DataDictionary.jl")

function constructGeneControlledBounds()
	d = DataDictionary(0,0,0)
	reactions = d["list_of_reaction_strings"]
	reaction_dict = Dict()
	count =1
	for r in reactions
		rid = r[1:findfirst(r,':')-1]
		rid = replace(rid, "_reverse", "") #remove reverse from string
		try
			reaction_dict[rid]=hcat(reaction_dict[rid], count)
		catch
			reaction_dict[rid]=[count]
		end
		count = count+1
	end
	return reaction_dict
end

function parseRegulation(f)
	#print("parsing")
	f=replace(f, "or", "||")
	f = replace(f, "and", "&&")
	return f
end

function createControlDict()
	pathToNetwork="../srepReactions.csv"
	raw = readdlm(pathToNetwork, ',')
	num_lines = size(raw,1)
	control_dict = Dict()
	for j in collect(2:num_lines-1)
		curr_line = raw[j,:]
		#@show curr_line
		rxn_num = curr_line[1]
		RID = curr_line[2]
		description = curr_line[3]
		formula = curr_line[4]
		regulation =curr_line[8]
		#@show regulation, typeof(regulation)
		if(typeof(regulation)==SubString{String})
			regulation =parseRegulation(regulation)
		elseif(typeof(regulation)==Int64|| typeof(regulation)==Float64)
			gene_num=regulation
		
		end
		if(length(regulation)>1)
			control_dict[RID] = strip(insertLogic(regulation))
		end
	end
	return control_dict
end

function createAllGenesList()
	pathToNetwork="../srepReactions.csv"
	raw = readdlm(pathToNetwork, ',')
	num_lines = size(raw,1)
	allgenes = Int64[]
	for j in collect(2:num_lines-1)
		curr_line = raw[j,:]
		#@show curr_line
		rxn_num = curr_line[1]
		RID = curr_line[2]
		description = curr_line[3]
		formula = curr_line[4]
		regulation =curr_line[8]
		#@show regulation
		if(typeof(regulation)==SubString{String})
			regulation = replace(regulation, ")", "")
			regulation = replace(regulation , "(", "")
			regulation = replace(regulation, "and", "")
			regulation =replace(regulation, "or", "")
			all_poss = split(regulation, " ")
			for str in all_poss
				#@show str
				try
					gene_num=parse(Int64, str)
					#@show gene_num
					push!(allgenes, gene_num)
				catch
	
				end
	
			end
		elseif(typeof(regulation)==Int64|| typeof(regulation)==Float64)
			gene_num=regulation
			push!(allgenes, Int(round(gene_num)))
		end
	end
	allgenes =unique(allgenes) #remove duplicates
	return allgenes
end

function insertLogic(f)
	f = replace(f, ")", " )")
	f = replace(f, "(", "( ")
	strs = split(f, " ")
	name = "gene_control"
	res = ""
	for s in strs
		#@show s
		if(s=="&&" || s=="||")
			res = string(res, s, " ")
		elseif(s=="(" || s==")")
			res = string(res, s, " ")
		else
			res = string(res,name, "[",s, "] ")
		end
		#@show res
	end
	return res
end

function buildGeneControl()
	allgenes = createAllGenesList()
	gene_control= Dict()
	data_dict = DataDictionary(1,1,1)
	control_dict =createControlDict()
	reaction_dict = constructGeneControlledBounds()
	for gene in allgenes
		gene_control[gene]=true #lets turn everything off 
	end
	data_dict=setBounds_BasedOnGenes(gene_control, reaction_dict, control_dict, data_dict)
	return data_dict
end

function buildGeneControl(data_dict)
	allgenes = createAllGenesList()
	gene_control= Dict()
	control_dict =createControlDict()
	reaction_dict = constructGeneControlledBounds()
	for gene in allgenes
		gene_control[gene]=true #lets turn everything on
	end
	data_dict=setBounds_BasedOnGenes(gene_control, reaction_dict, control_dict, data_dict)
	return data_dict
end

function knockOutGenes(data_dict, knockedoutgenes)
	allgenes = createAllGenesList()
	gene_control= Dict()
	control_dict =createControlDict()
	reaction_dict = constructGeneControlledBounds()
	for gene in allgenes
		tagged = false
		for ko in knockedoutgenes
			if(findfirst(gene,ko)!=0) #if its a knocked out gene
				println(string("knocking out gene ", gene))
				gene_control[gene]=false
				tagged = true
			end
		end
		if(!tagged)
			gene_control[gene]=true
		end
	end
	data_dict=setBounds_BasedOnGenes(gene_control, reaction_dict, control_dict, data_dict)
	return data_dict
end

function setBounds_BasedOnGenes(genecontrol, reaction_dict, control_dict, data_dict)
	@show length(keys(control_dict))
	global gene_control = genecontrol
	fluxbounds = data_dict["default_flux_bounds_array"]
	for (rxnid, rxn_num) in reaction_dict
		usefulrxnid= rxnid[1:findfirst(rxnid,'|')-1]
		controllers = get(control_dict, usefulrxnid, 0)
		#@show controllers,usefulrxnid
		if(controllers !=0)
			#@show rxnid, controllers
			#@show reaction_dict[rxnid]
			#@show fluxbounds[reaction_dict[rxnid],:]
			#controlstr = string("if(", controllers, ") else fluxbounds[reaction_dict[rxn_id],:]=0.0 end")
			controlstr = string("if(", controllers, ")")
			#@show controlstr
			conditions=eval(parse(controllers)) 
			#conditions =eval(parse(controlstr))
			#@show conditions
			if(!conditions)
				@show fluxbounds[reaction_dict[rxnid],:]
				println(string("Setting flux bounds for rxn ", rxnid, " to zero"))
				fluxbounds[reaction_dict[rxnid],:]=[0.0, 100.0]
				@show fluxbounds[reaction_dict[rxnid],:]
			end
			#@show fluxbounds[reaction_dict[rxnid],:]
		end
	end
	#@show fluxbounds
	data_dict["default_flux_bounds_array"]=fluxbounds
	return data_dict
end
