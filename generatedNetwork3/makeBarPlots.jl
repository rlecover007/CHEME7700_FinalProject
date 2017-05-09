function makeBarPlot()
	close("all")
	SSdata = readdlm("fluxes/At\ SS.txt",',')
	postActivationData = readdlm("fluxes/Deactivating.txt", ',')
	maxFlux = 1000
	selectedSSFluxes = Float64[]
	selectedSSRxns = AbstractString[]
	selectedDFluxes = Float64[]
	selectedDRxns = AbstractString[]
	selectedCatagory = "Transport_ Extracellular"
	selectedSSRxns, selectedSSFluxes=getInSection(selectedCatagory, SSdata)
	selectedDRxns, selectedDFluxes=getInSection(selectedCatagory, postActivationData)
	@show size(selectedSSFluxes)
	allRxns = union(selectedSSRxns, selectedDRxns)
	totalNumFluxes = size(allRxns, 1)
	paddedSSFluxes = addZeroFluxes(allRxns, selectedSSRxns, selectedSSFluxes)
	paddedDFluxes = addZeroFluxes(allRxns, selectedDRxns, selectedDFluxes)
	SSpos = collect(0:2:2*totalNumFluxes-2)
	Dpos = collect(1:2:2*totalNumFluxes-1)
	@show size(paddedSSFluxes), size(paddedDFluxes), size(SSpos), size(Dpos)
	figure(figsize = [25,15])
	bar(SSpos, paddedSSFluxes/maxFlux, color = "k")
	bar(Dpos, paddedDFluxes/maxFlux, color = ".5")
	ylabel("Scaled Flux", fontsize = 40)
	ax = gca()
	ax[:xaxis][:set_ticks](SSpos+1)
	ax[:xaxis][:set_ticklabels](allRxns, fontsize = 10, rotation = 90)
	savefig(string("../figures/bar", selectedCatagory, ".jpg"))
	
end

function makeBarPlot(selectedCatagory)
	close("all")
	SSdata = readdlm("fluxes/At\ SS.txt",',')
	postActivationData = readdlm("fluxes/Deactivating.txt", ',')
	maxFlux = 1000
	selectedSSFluxes = Float64[]
	selectedSSRxns = AbstractString[]
	selectedDFluxes = Float64[]
	selectedDRxns = AbstractString[]
	selectedCatagory
	selectedSSRxns, selectedSSFluxes=getInSection(selectedCatagory, SSdata)
	selectedDRxns, selectedDFluxes=getInSection(selectedCatagory, postActivationData)
	@show size(selectedSSFluxes)
	allRxns = union(selectedSSRxns, selectedDRxns)
	totalNumFluxes = size(allRxns, 1)
	paddedSSFluxes = addZeroFluxes(allRxns, selectedSSRxns, selectedSSFluxes)
	paddedDFluxes = addZeroFluxes(allRxns, selectedDRxns, selectedDFluxes)
	SSpos = collect(0:2:2*totalNumFluxes-2)
	Dpos = collect(1:2:2*totalNumFluxes-1)
	@show size(paddedSSFluxes), size(paddedDFluxes), size(SSpos), size(Dpos)
	figure(figsize = [30,20])
	bar(SSpos, paddedSSFluxes/maxFlux, color = "k")
	bar(Dpos, paddedDFluxes/maxFlux, color = ".5")
	ylabel("Scaled Flux", fontsize = 40)
	ax = gca()
	ax[:xaxis][:set_ticks](SSpos+1)
	if(totalNumFluxes>15)
		labelfz = 10
	else
		labelfz = 12
	end
	ax[:xaxis][:set_ticklabels](allRxns, fontsize = labelfz, rotation = 90)
	savefig(string("../figures/bar", replace(selectedCatagory, "/", "_"), ".jpg"))
	
end

function makeBarPlotKnockout(selectedCatagory, state)
	close("all")
	if(state =="SS")
		SSdata = readdlm("fluxes/At \SS.txt",',')
		postActivationData = readdlm("fluxes/AtSSPTSGKnockedout.txt", ',')
		savestr =string("../figures/barSSKnockouts[5742,5743]", replace(selectedCatagory, "/", "_"), ".eps")
	elseif(state == "A")
		SSdata = readdlm("fluxes/Activating.txt",',')
		postActivationData = readdlm("fluxes/ActivatingPTSGKnockedout.txt", ',')
		savestr =string("../figures/barActivatingKnockouts[5742,5743]", replace(selectedCatagory, "/", "_"), ".eps")
	elseif(state == "D")
		SSdata = readdlm("fluxes/Deactivating.txt",',')
		postActivationData = readdlm("fluxes/DeactivatingPTSGKnockedout.txt", ',')
		savestr =string("../figures/barDeactivatingKnockouts[5742,5743]", replace(selectedCatagory, "/", "_"), ".eps")
	end
	maxFlux = 1000
	selectedSSFluxes = Float64[]
	selectedSSRxns = AbstractString[]
	selectedDFluxes = Float64[]
	selectedDRxns = AbstractString[]
	selectedCatagory
	selectedSSRxns, selectedSSFluxes=getInSection(selectedCatagory, SSdata)
	selectedDRxns, selectedDFluxes=getInSection(selectedCatagory, postActivationData)
	@show size(selectedSSFluxes)
	allRxns = union(selectedSSRxns, selectedDRxns)
	totalNumFluxes = size(allRxns, 1)
	paddedSSFluxes = addZeroFluxes(allRxns, selectedSSRxns, selectedSSFluxes)
	paddedDFluxes = addZeroFluxes(allRxns, selectedDRxns, selectedDFluxes)
	SSpos = collect(0:2:2*totalNumFluxes-2)
	Dpos = collect(1:2:2*totalNumFluxes-1)
	@show size(paddedSSFluxes), size(paddedDFluxes), size(SSpos), size(Dpos)
	figure(figsize = [30,20])
	bar(SSpos, paddedSSFluxes/maxFlux, color = "k")
	bar(Dpos, paddedDFluxes/maxFlux, color = ".5")
	ylabel("Scaled Flux", fontsize = 40)
	ax = gca()
	ax[:xaxis][:set_ticks](SSpos+1)
	if(totalNumFluxes>15)
		labelfz = 10
	else
		labelfz = 12
	end
	ax[:xaxis][:set_ticklabels](allRxns, fontsize = labelfz, rotation = 90)
	savefig(savestr)
end

function getInSection(selectedCatagory, data)
	Rxns = AbstractString[]
	Fluxes = Float64[]
	inSection =false
	for j in collect(1:size(data,1))
		#@show SSdata[j,:]
		if(contains(data[j,1], selectedCatagory)) #in catagory of interest
			inSection = true
		elseif(contains(data[j,1], "----")) #we've moved beyond catagory of interest
			inSection = false
		end
		if(inSection && length(data[j,3])>0) #if in the section and have a number
			#@show data[j,:]
			push!(Rxns, data[j,1])
			push!(Fluxes, data[j,3])
		end

	end
	return Rxns, Fluxes
end

function addZeroFluxes(allRxns, myRxns, myFluxes)
	j = 1
	allFluxes = zeros(size(allRxns,1),1)
	for rxn in allRxns
		rxnIdx = findfirst(myRxns, rxn)
		if(rxnIdx !=0) #if we found the reaction
			allFluxes[j]=myFluxes[rxnIdx]
		end
		j = j+1
	end
	return allFluxes
end

function makeAllBarPlots()
	systems = ["Intracellular Constraint","Extracellular exchange","Transport_ Mitochondrial","Transport_ Lysosomal","Lysine Metabolism","Pyrimidine Catabolism","Tryptophan metabolism","Tyrosine metabolism","Valine_ Leucine_ and Isoleucine Metabolism","Transport_ Extracellular","CYP Metabolism","Heme Biosynthesis","Propanoate Metabolism","Glutamate metabolism","Cholesterol Metabolism","Fatty Acid Metabolism","Citric Acid Cycle","Glycolysis/Gluconeogenesis","Purine Catabolism","Nucleotides","Salvage Pathway","IMP Biosynthesis","Methionine Metabolism","Glycine_ Serine_ and Threonine Metabolism","Miscellaneous","Pyruvate Metabolism","Phenylalanine metabolism","Eicosanoid Metabolism","Glutathione Metabolism","beta-Alanine metabolism","Transport_ Endoplasmic Reticular","Urea cycle/amino group metabolism","Alanine and Aspartate Metabolism","Oxidative Phosphorylation","Heme Degradation","Carnitine shuttle","ROS Detoxification","Glycerophospholipid Metabolism","Cysteine Metabolism","Pentose and Glucuronate Interconversions","Tetrahydrobiopterin","Pentose Phosphate Pathway","Steroid Metabolism","Fatty acid oxidation","Fatty acid activation","Fatty acid elongation","Fructose and Mannose Metabolism","Folate Metabolism","Proline Metabolism","Galactose metabolism","Starch and Sucrose Metabolism","Transport_ Peroxisomal","Histidine Metabolism","Inositol Phosphate Metabolism","NAD Metabolism","Sphingolipid Metabolism","Pyrimidine Biosynthesis","Expanded DAG metabolism","Expanded Phospholipid metabolism","Expanded Glycerophospholipid metabolism"]	
	for s in systems
		makeBarPlot(s)
	end
end

function makeAllBarPlotsKnockOuts()
	systems = ["Intracellular Constraint","Extracellular exchange","Transport_ Mitochondrial","Transport_ Lysosomal","Lysine Metabolism","Pyrimidine Catabolism","Tryptophan metabolism","Tyrosine metabolism","Valine_ Leucine_ and Isoleucine Metabolism","Transport_ Extracellular","CYP Metabolism","Heme Biosynthesis","Propanoate Metabolism","Glutamate metabolism","Cholesterol Metabolism","Fatty Acid Metabolism","Citric Acid Cycle","Glycolysis/Gluconeogenesis","Purine Catabolism","Nucleotides","Salvage Pathway","IMP Biosynthesis","Methionine Metabolism","Glycine_ Serine_ and Threonine Metabolism","Miscellaneous","Pyruvate Metabolism","Phenylalanine metabolism","Eicosanoid Metabolism","Glutathione Metabolism","beta-Alanine metabolism","Transport_ Endoplasmic Reticular","Urea cycle/amino group metabolism","Alanine and Aspartate Metabolism","Oxidative Phosphorylation","Heme Degradation","Carnitine shuttle","ROS Detoxification","Glycerophospholipid Metabolism","Cysteine Metabolism","Pentose and Glucuronate Interconversions","Tetrahydrobiopterin","Pentose Phosphate Pathway","Steroid Metabolism","Fatty acid oxidation","Fatty acid activation","Fatty acid elongation","Fructose and Mannose Metabolism","Folate Metabolism","Proline Metabolism","Galactose metabolism","Starch and Sucrose Metabolism","Transport_ Peroxisomal","Histidine Metabolism","Inositol Phosphate Metabolism","NAD Metabolism","Sphingolipid Metabolism","Pyrimidine Biosynthesis","Expanded DAG metabolism","Expanded Phospholipid metabolism","Expanded Glycerophospholipid metabolism"]	
	for s in systems
		makeBarPlotKnockout(s, "SS")
	end
end
