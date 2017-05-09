using LightGraphs
#using GraphPlot
#using PlotRecipes
#using NetworkLayout
#using Compose
using TikzGraphs
using TikzPictures # this is required for saving
common_reactants = ["h2o_c","atp_c","adp_c","pi_c","h_m","na1_c","na1_e","coa_c","coa_m","h2o_m","h2o_l","nadh_m","nad_c","nad_m","nadp_c","nadph_c","o2_c","nadh_c","ppi_c","co2_c","accoa_m","glu_DASH_L_c","fad_m","fadh2_m","amp_c","h_l","crn_c","[]"]

function drawNetworkFromAdj()
	d= DataDictionary(0,0,0)
	S = d["stoichiometric_matrix"]
	num_rxns,num_species = size(S)
	g = DiGraph(num_species)
	for j in collect(1:num_species)
		curr_col = S[:,j]
		for k in collect(1:num_rxns)
			if(curr_col[k]>0)
				add_edge!(g, j,k)
			elseif(curr_col[k]<0)
				add_edge!(g,k,j)
			end
		end
	end
	@show g
	t=TikzGraphs.plot(g)
	TikzPictures.save(SVG(string("../figures/mapping_all_reactants","03_05_17")), t)
end

function drawNetwork()
	d= DataDictionary(0,0,0)
	rxns = d["list_of_reaction_strings"]
	names = AbstractString[]
	g = DiGraph(size(rxns,1))
	j = 1
	k = 1
	for rxn1 in rxns
		name1 = rxn1[1:findfirst(rxn1, ':')-1]
		push!(names, name1)
		reactants1 = rxn1[findlast(rxn1,':')+1:findfirst(rxn1, ' ')]
		products1 = rxn1[findlast(rxn1, ' '):end]
		allreactants1 = split(strip(reactants1), '+')
		allproducts1 = split(strip(products1), '+')
		@show name1, reactants1, products1
		@show allreactants1
		for rxn2 in rxns
			name2 = rxn2[1:findfirst(rxn2, ':')-1]
			reactants2 = rxn2[findlast(rxn2,':')+1:findfirst(rxn2, ' ')]
			products2 = rxn2[findlast(rxn2, ' '):end]
			allreactants2 = split(strip(reactants2), '+')
			if(reactants2==products1)
				print("adding an edge")
				add_edge!(g, j, k)
			end
			if(replace(name1, "_reverse", "")==replace(name2, "_reverse", ""))
				print("adding an edge\n")
				add_edge!(g, j, k)
			end

			for r1 in allproducts1
				for r2 in allreactants2
					if(r1==r2)
						print("adding an edge\n")
						add_edge!(g, j, k)
					end
				end

			end
			k = k+1
		end
		j = j+1
	end
	a = adjacency_matrix(g)
	#network = Layout(a, Point2f0, tol = .01, C=1, K=1, iterations = 20)
	gplot(g, nodelabel = rxns)
	draw(SVG("../figures/Network.SVG", 100cm, 100cm), gplot(g, nodelabel=names, layout=circular_layout))
end

function writeOutFluxes(flux_array, outputfn)
	#outputfn = "humanreadablefluxes_03_05_2017.txt"
	f = open(outputfn, "w")
	d= DataDictionary(0,0,0)
	rxns = d["list_of_reaction_strings"]
	systems = ["Intracellular Constraint","Extracellular exchange","Transport_ Mitochondrial","Transport_ Lysosomal","Lysine Metabolism","Pyrimidine Catabolism","Tryptophan metabolism","Tyrosine metabolism","Valine_ Leucine_ and Isoleucine Metabolism","Transport_ Extracellular","CYP Metabolism","Heme Biosynthesis","Propanoate Metabolism","Glutamate metabolism","Cholesterol Metabolism","Fatty Acid Metabolism","Citric Acid Cycle","Glycolysis/Gluconeogenesis","Purine Catabolism","Nucleotides","Salvage Pathway","IMP Biosynthesis","Methionine Metabolism","Glycine_ Serine_ and Threonine Metabolism","Miscellaneous","Pyruvate Metabolism","Phenylalanine metabolism","Eicosanoid Metabolism","Glutathione Metabolism","beta-Alanine metabolism","Transport_ Endoplasmic Reticular","Urea cycle/amino group metabolism","Alanine and Aspartate Metabolism","Oxidative Phosphorylation","Heme Degradation","Carnitine shuttle","ROS Detoxification","Glycerophospholipid Metabolism","Cysteine Metabolism","Pentose and Glucuronate Interconversions","Tetrahydrobiopterin","Pentose Phosphate Pathway","Steroid Metabolism","Fatty acid oxidation","Fatty acid activation","Fatty acid elongation","Fructose and Mannose Metabolism","Folate Metabolism","Proline Metabolism","Galactose metabolism","Starch and Sucrose Metabolism","Transport_ Peroxisomal","Histidine Metabolism","Inositol Phosphate Metabolism","NAD Metabolism","Sphingolipid Metabolism","Pyrimidine Biosynthesis","Expanded DAG metabolism","Expanded Phospholipid metabolism","Expanded Glycerophospholipid metabolism"]	
	for s in systems
		contained_rxns,contained_fluxes =determineReactionsInSystem(rxns, s, flux_array)
		write(f,string("----", s, "----\n"))
		k =1
		for rxn1 in contained_rxns
			if(contains(rxn1, "reverse"))
				name1 = string(rxn1[1:findfirst(rxn1, '|')-1], "reverse")
			else
				name1 = rxn1[1:findfirst(rxn1, '|')-1]
			end
			system1 = rxn1[findfirst(rxn1, '|')+1:findfirst(rxn1,':')-1]
			reactants1 = rxn1[findlast(rxn1,':')+1:findfirst(rxn1, '-')-2]
			products1 = rxn1[findlast(rxn1, ' '):end]
			allreactants1 = split(strip(reactants1), '+')
			allproducts1 = split(strip(products1), '+')
			if(contained_fluxes[k]>1E-8)
				write(f, string(name1, ",", reactants1, "-->", products1, ",",contained_fluxes[k], "\n"))
			end
			k=k+1
		end
	end
	close(f)
end

function drawNetworkBySystems(flux_array,savestr,d)
	#d= DataDictionary(0,0,0)
	rxns = d["list_of_reaction_strings"]
	systems = ["Intracellular Constraint","Extracellular exchange","Transport_ Mitochondrial","Transport_ Lysosomal","Lysine Metabolism","Pyrimidine Catabolism","Tryptophan metabolism","Tyrosine metabolism","Valine_ Leucine_ and Isoleucine Metabolism","Transport_ Extracellular","CYP Metabolism","Heme Biosynthesis","Propanoate Metabolism","Glutamate metabolism","Cholesterol Metabolism","Fatty Acid Metabolism","Citric Acid Cycle","Glycolysis/Gluconeogenesis","Purine Catabolism","Nucleotides","Salvage Pathway","IMP Biosynthesis","Methionine Metabolism","Glycine_ Serine_ and Threonine Metabolism","Miscellaneous","Pyruvate Metabolism","Phenylalanine metabolism","Eicosanoid Metabolism","Glutathione Metabolism","beta-Alanine metabolism","Transport_ Endoplasmic Reticular","Urea cycle/amino group metabolism","Alanine and Aspartate Metabolism","Oxidative Phosphorylation","Heme Degradation","Carnitine shuttle","ROS Detoxification","Glycerophospholipid Metabolism","Cysteine Metabolism","Pentose and Glucuronate Interconversions","Tetrahydrobiopterin","Pentose Phosphate Pathway","Steroid Metabolism","Fatty acid oxidation","Fatty acid activation","Fatty acid elongation","Fructose and Mannose Metabolism","Folate Metabolism","Proline Metabolism","Galactose metabolism","Starch and Sucrose Metabolism","Transport_ Peroxisomal","Histidine Metabolism","Inositol Phosphate Metabolism","NAD Metabolism","Sphingolipid Metabolism","Pyrimidine Biosynthesis","Expanded DAG metabolism","Expanded Phospholipid metabolism","Expanded Glycerophospholipid metabolism"]	
	for s in systems
		num_vertices = 1
		contained_rxns,contained_fluxes =determineReactionsInSystem(rxns, s, flux_array)
		active_rxns, active_fluxes=determineActiveReactions(contained_rxns, contained_fluxes)
		@show size(contained_rxns)
		#@show contained_rxns
		#if(contains(s, "exchange") || contains(s, "Transport"))
			g = DiGraph(size(active_rxns,1)+1)
			names = AbstractString["Sink/Source"]
#		else
#			g = DiGraph(size(contained_rxns,1))
#			names = AbstractString[]
#		end
		included_fluxes = Float64[]
		rxn_cntr =1
		for rxn1 in active_rxns
			#@show rxn1
			if(contains(rxn1, "reverse"))
				name1 = string(rxn1[1:findfirst(rxn1, '|')-1], "reverse")
			else
				name1 = rxn1[1:findfirst(rxn1, '|')-1]
			end
			system1 = rxn1[findfirst(rxn1, '|')+1:findfirst(rxn1,':')-1]
			reactants1 = rxn1[findlast(rxn1,':')+1:findfirst(rxn1, '-')-2]
			products1 = rxn1[findlast(rxn1, ' '):end]
			allreactants1 = split(strip(reactants1), '+')
			allproducts1 = split(strip(products1), '+')
			#@show name1, system1, reactants1, products1
			j = 1
			push!(names, replace(name1, "_", "-")) #prevent latex setting errors
			#add_vertex!(g)
			num_vertices = num_vertices+1
			#@show g
			if(contains(reactants1, "[]"))
				add_edge!(g,rxn_cntr,1) #add edge between source/sink and this reaction
				push!(included_fluxes, active_fluxes[rxn_cntr])
				#println(string("adding edge between source/sink and ",rxn1))
			elseif(contains(products1, "[]"))
				add_edge!(g,1,rxn_cntr) #add edge between source/sink and this reaction
				push!(included_fluxes, active_fluxes[rxn_cntr])
				#println(string("adding edge between source/sink and ",rxn1))
			else
				for rxn2 in active_rxns
					name2 = rxn1[1:findfirst(rxn2, '|')-1]
					system2 = rxn2[findfirst(rxn2, '|')+1:findfirst(rxn2,':')-1]
					reactants2 = rxn2[findlast(rxn2,':')+1:findfirst(rxn2, '-')-2]
					products2 = rxn2[findlast(rxn1, ' '):end]
					allreactants2 = split(strip(reactants2), '+')
					allproducts2 = split(strip(products2), '+')
					#@show products1
					#@show reactants2
					for r1 in allproducts1
						for r2 in allreactants2
							if(r1==r2 && findfirst(r2, common_reactants)==0) #only draw edges between non common reactants
	
								#@show r1, r2
								#@show g, j, rxn_cntr
								if(r1=="[]")
									#println(string("adding edge between source/sink and ",rxn2))
									add_edge!(g,1,j) #add edge between source/sink and this reaction
									push!(included_fluxes, active_fluxes[rxn_cntr])
								else
									happened= add_edge!(g, j, rxn_cntr)
									if(happened)
										push!(included_fluxes, active_fluxes[rxn_cntr])
										#print(string(happened," adding an edge between", rxn1, rxn2, "\n"))
									end
								end
							end
						end
					end
					j = j+1
				end
			end
			rxn_cntr=rxn_cntr+1
		end
		#@show size(names), edges(g), size(vertices(g))
		k = 1
		
		#@show edge_weight_dict
		#add an edge back to itself if only one vertex so set of edges isn't empty
#		if(size(vertices(g),1)==1)
#			println("Found single node")
#			add_edge!(g,1,1)
#		end
		#remove nodes with no edges, make things to visualize
#		k = 1
#		for k in collect(1:size(contained_rxns,1)+1)
#			if(degree(g, k)==0)
#				rem_vertex!(g,k)
#				deleteat!(names, k)
#			end
#			k = k+1
#		end
		@show size(names), size(vertices(g))
		@show size(included_fluxes), edges(g)
	
		if(ne(g)>0) #if we have edges
			edge_weight_dict = createEdgeLables(g, included_fluxes)
			edge_styles_dict = createEdgeColors(g,included_fluxes)	
			println(string("drawing graph for "), s)
			if(size(vertices(g),1)<10)
				t=TikzGraphs.plot(g, Layouts.Spring(randomSeed=52),names, edge_labels=edge_weight_dict,edge_styles = edge_styles_dict,node_style="draw, rounded corners, fill=blue!14")
			else
				if(size(included_fluxes,1)>30)
					t=TikzGraphs.plot(g,Layouts.SimpleNecklace(), names, edge_labels=edge_weight_dict,edge_styles = edge_styles_dict,node_style="draw, rounded corners, fill=blue!10")
				else
					t=TikzGraphs.plot(g,names, edge_labels=edge_weight_dict,edge_styles = edge_styles_dict,node_style="draw, rounded corners, fill=blue!10")
				end
			end
			TikzPictures.save(SVG(string("../figures/",replace(s, "/", "-"),savestr)), t)
		end
	end

end

function createEdgeLables(g, fluxes)
		flux_dict = Dict()
		scaled_fluxes = fluxes./maximum(fluxes)
		@show size(fluxes)
		k = 1
		for ed in edges(g)
		#@show ed
		useful_edge = replace(string(ed), "=>", ",")
		nums = split(useful_edge, ",")
		tup = (parse(Int64, nums[1]), parse(Int64, nums[2]))
		
		stredge= string(fluxes[k])
		if(fluxes[k]!=0) #don't bother labeling zero fluxes'
			if(length(stredge)>3)
				flux_dict[tup]=stredge[1:4]#limit sig figs
			else
				flux_dict[tup]=stredge[1:3]
			end
		else
			flux_dict[tup]=""
		end
		k = k+1
	end
	return flux_dict
end

function createEdgeColors(g, fluxes)
		color_dict = Dict()
		scaled_fluxes = fluxes./maximum(fluxes)
		#@show size(fluxes)
		k = 1
		for ed in edges(g)
		#@show ed
		useful_edge = replace(string(ed), "=>", ",")
		nums = split(useful_edge, ",")
		tup = (parse(Int64, nums[1]), parse(Int64, nums[2]))
		
		if(fluxes[k]==0)
			color_dict[tup]="white"
		else
			if(fluxes[k]>800)
				color_dict[tup]="black, ultra thick"
			elseif(fluxes[k]>600)
				color_dict[tup]="black, thick"
			elseif(fluxes[k]>400)
				color_dict[tup]="black, thin"
			else
				color_dict[tup]="black, very thin"
			end
		end
		k = k+1
	end
	return color_dict
end

function determineReactionsInSystem(allrxns, system,flux_array)
	contained_rxns = AbstractString[]
	contained_fluxes = Float64[]
	k =1
	for rxn1 in allrxns
		name1 = rxn1[1:findfirst(rxn1, '|')-1]
		system1 = rxn1[findfirst(rxn1, '|')+1:findfirst(rxn1,':')]
		reactants1 = rxn1[findlast(rxn1,':')+1:findfirst(rxn1, ' ')]
		products1 = rxn1[findlast(rxn1, ' '):end]
		allreactants1 = split(strip(reactants1), '+')
		allproducts1 = split(strip(products1), '+')
		if(contains(system1, system))
			push!(contained_rxns, rxn1)
			push!(contained_fluxes, flux_array[k])
		end
		k =k+1
	end
	return contained_rxns,contained_fluxes
end

function determineActiveReactions(contained_rxns, contained_fluxes)
	active_rxns = AbstractString[]
	active_fluxes = Float64[]
	k = 1
	for rxn1 in contained_rxns
		name1 = rxn1[1:findfirst(rxn1, '|')-1]
		system1 = rxn1[findfirst(rxn1, '|')+1:findfirst(rxn1,':')]
		reactants1 = rxn1[findlast(rxn1,':')+1:findfirst(rxn1, ' ')]
		products1 = rxn1[findlast(rxn1, ' '):end]
		allreactants1 = split(strip(reactants1), '+')
		allproducts1 = split(strip(products1), '+')
		if(contained_fluxes[k]>0)
			push!(active_rxns, rxn1)
			push!(active_fluxes, contained_fluxes[k])	
		end
		k = k+1
	end
	return active_rxns, active_fluxes
end

function drawNetwork(fp)
	d= DataDictionary(0,0,0)
	common_reactants = ["h2o_c","atp_c","adp_c","pi_c","h_m","na1_c","na1_e","coa_c","coa_m","h2o_m","h2o_l","nadh_m","nad_c","nad_m","nadp_c","nadph_c","o2_c","nadh_c","ppi_c","co2_c","accoa_m","glu_DASH_L_c","fad_m","fadh2_m","amp_c","h_l","crn_c","[]"]
	rxns =fp
	names = AbstractString[]
	num_non_exchange_rxns = 285
	g = DiGraph(num_non_exchange_rxns)
	exchange_graph = DiGraph(1)
	edgeweights = Float64[]
	internal_fluxes = Float64[]
	exchange_fluxes = Float64[]
	exchange_names = ["Sink/Source"]
	j = 1
	k = 1
	num_exchange_rxns = 1
	for rxn1 in rxns
		name1 = rxn1[findfirst(rxn1, ',')+1:findfirst(rxn1, ':')-1]
		reactants1 = rxn1[findlast(rxn1,':')+1:findfirst(rxn1, ' ')]
		products1 = rxn1[findlast(rxn1, ' '):findlast(rxn1, ',')-1]
		allreactants1 = split(strip(reactants1), '+')
		allproducts1 = split(strip(products1), '+')
		flux1 = rxn1[findlast(rxn1, ',')+1:end]
		@show name1, reactants1, products1,flux1
		@show allreactants1
		@show g
		k = 1
		if(contains(name1, "EX"))
			num_exchange_rxns=num_exchange_rxns+1
			add_vertex!(exchange_graph)
			if(contains(name1, "reverse"))
				happened=add_edge!(exchange_graph, num_exchange_rxns,1)
			else
				happened=add_edge!(exchange_graph, 1, num_exchange_rxns)

			end
			println(string(happened," Added edge to exchange graph"))
			@show num_exchange_rxns
			push!(exchange_names, replace(name1, "_", "-"))
			push!(exchange_fluxes,parse(Float64, flux1))
		else
			push!(names, replace(name1, "_", "-")) #so we don't run into latex problems with underscores
			push!(internal_fluxes, parse(Float64, flux1))
			for rxn2 in rxns
				name2 = rxn2[findfirst(rxn2, ','):findfirst(rxn2, ':')-1]
				reactants2 = rxn2[findlast(rxn2,':')+1:findfirst(rxn2, ' ')]
				products2 = rxn2[findlast(rxn2, ' '):findlast(rxn2, ',')-1]
				allreactants2 = split(strip(reactants2), '+')
					if(reactants2==products1)
						print(string("adding an edge between", rxn1, rxn2, "\n"))
						add_edge!(g, j, k)
						push!(internal_fluxes, parse(Float64, flux1))
					end
					if(replace(name1, "_reverse", "")==replace(name2, "_reverse", ""))
						print(string("adding an edge between", rxn1, rxn2, "\n"))
						add_edge!(g, j, k)
						push!(internal_fluxes, parse(Float64, flux1))
					end

					for r1 in allproducts1
						for r2 in allreactants2
							if(findfirst(common_reactants, r1)==0 && findfirst(common_reactants, r2)==0) #if it's not a common reactant'
								if(r1==r2)
									print(string("adding an edge between", rxn1, rxn2, "\n"))
									add_edge!(g, j, k)
									push!(internal_fluxes, parse(Float64, flux1))
								end
							end
						end

					end
					k = k+1
			end
		end
		j = j+1
	end
	scalededgewights = exchange_fluxes./(maximum(exchange_fluxes))
	scaled_internal_edge_weights = internal_fluxes./(maximum(internal_fluxes))
	flux_dict = Dict()
	k = 1
	for ed in edges(exchange_graph)
		@show ed
		useful_edge = replace(string(ed), "=>", ",")
		nums = split(useful_edge, ",")
		tup = (parse(Int64, nums[1]), parse(Int64, nums[2]))
		
		stredge= string(scalededgewights[k])
		if(length(stredge)>3)
			flux_dict[tup]=string(scalededgewights[k])[1:4] #limit sig figs
		else
			flux_dict[tup]=string(scalededgewights[k])[1:3]
		end
		k = k+1
	end
	@show size(names), edges(g), vertices(g)
	internal_flux_dict = Dict()
	k = 1
	for ed in edges(g)
		@show ed
		useful_edge = replace(string(ed), "=>", ",")
		nums = split(useful_edge, ",")
		tup = (parse(Int64, nums[1]), parse(Int64, nums[2]))
		
		stredge= string(scaled_internal_edge_weights[k])
		if(length(stredge)>3)
			internal_flux_dict[tup]=stredge[1:4]#limit sig figs
		else
			internal_flux_dict[tup]=stredge[1:3]
		end
		k = k+1
	end

	#scaled_marker_sizes =internal_fluxes/(maximum(internal_fluxes))*10
	#@show size(scaled_marker_sizes)
	#plt=graphplot(g, names = names, fontsize = 12,line=(1.0, :black), marker=(:rect), markersize=scaled_marker_sizes)
	#plt=graphplot(exchange_graph, names = exchange_names, fontsize = 12, marker=(:circle), line=(1,.5,:black), weights=scalededgewights, method=:circular, arrow=true, marker_z=scalededgewights)
	#draw(SVG("../figures/NetworkBasedOnFluxProfile.SVG", 200cm, 200cm), gplot(g, nodelabel=names, nodesize=nodesize, nodelabelsize = 4,layout=circular_layout))
	t=TikzGraphs.plot(exchange_graph, Layouts.SimpleNecklace(),exchange_names, edge_labels = flux_dict,node_style="draw, rounded corners, fill=blue!14")
	TikzPictures.save(SVG("../figures/scaled_exchange_flux_graph"), t)
	t=TikzGraphs.plot(g, Layouts.Spring(randomSeed=15), names, edge_labels=internal_flux_dict,node_style="draw, rounded corners, fill=blue!14")
	TikzPictures.save(SVG("../figures/scaled_internal_flux_graph"), t)

end
