function setBoundsUsingExpData(data_dictionary)
	expBounds = readdlm("experimentalFluxBounds.txt", ',')
	bounded_rxns = expBounds[1]
	fluxbounds = data_dictionary["default_flux_bounds_array"] 
	reaction_strs = data_dictionary["list_of_reaction_strings"]
	k = 1
	for rxn in reaction_strs
		rxn_name = rxn[1:findfirst(rxn, ':')-1]
		#@show rxn_name
		j = 1
		for bounded_rxn in bounded_rxns
			if(bounded_rxn==rxn_name)
				fluxbounds[j,2]=expBounds[j,2] #set the upper bound to the experimentally derived upper bound
			end
			j = j+1
		end
		k = k+1
	end
	data_dictionary["default_flux_bounds_array"]= fluxbounds
	return data_dictionary
	
end
