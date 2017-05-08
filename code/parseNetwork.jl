function parseNetwork()
	pathToNetwork="../srepReactions.csv"
	outfile = "parsingAttempt3.txt"
	allsystems = AbstractString[]
	f = open(outfile, "w")
	raw = readdlm(pathToNetwork, ',')
	num_lines = size(raw,1)
	for j in collect(2:num_lines-1)
		curr_line = raw[j,:]
		@show curr_line
		rxn_num = curr_line[1]
		RID = curr_line[2]
		description = curr_line[3]
		formula = curr_line[4]
		regulation =curr_line[8]
		unparsedsystem = curr_line[7]
		#subsys = split(unparsedsystem, ',')
		system = replace(strip(curr_line[7]), ",", "_")
		if(findfirst(allsystems, system)==0) #haven't already added this system
			push!(allsystems, system)
		end
		parsed_formula = parseFormula(formula)
		@show parsed_formula
		str= string("//", "R# = ", rxn_num, " ", description, " Regulation: ", regulation, "\n")
		str = string(str, RID,"|",system, "," ,parsed_formula, "\n")
		write(f,str)
	end
	close(f)
	@show allsystems
end

function parseFormula(formula)
	formula = strip(formula) #remove white space
	formula = replace(formula, "[", "_")
	formula = replace(formula, "]", "")
	formula=replace(formula, r"(\d+)[ ]", s"\1*")# insert multiplication coefficents
	formula=replace(formula, " ", "") #remove spaces that will cause problems in JuQNC
	if(formula[end]=='>')
		#print("adding dissappearing")
		formula =string(formula, "[]")
	end
	@show formula
	str = ""
	if(contains(formula, "<=>")) #reaction is reversible
		formula = replace(formula, "<=>", ",")
		str = string(formula, ",", "-inf", ",", "inf\n")
	else
		formula = replace(formula,"->", ",")
		str = string(formula, ",", "0,inf\n")
	end
	return str
end

function parseRegulation(f)
	f=replace(f, "or", "||")
	f = replace(f, "and", "&&")
	return f
end

function createAllGenesList()
	pathToNetwork="../srepReactions.csv"
	raw = readdlm(pathToNetwork, ',')
	num_lines = size(raw,1)
	allgenes = Int64[]
	for j in collect(2:num_lines-1)
		curr_line = raw[j,:]
		@show curr_line
		rxn_num = curr_line[1]
		RID = curr_line[2]
		description = curr_line[3]
		formula = curr_line[4]
		regulation =curr_line[8]
		@show regulation
		if(typeof(regulation)==AbstractString)
			regulation = replace(regulation, ")", "")
			regulation = replace(regulation , "(", "")
			regulation = replace(regulation, "and", "")
			regulation =replace(regulation, "or", "")
			all_poss = split(regulation, " ")
			for str in all_poss
				try
					gene_num=parse(Int64, str)
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
