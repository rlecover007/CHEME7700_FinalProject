function setSpeciesBounds(data_dictionary)
	sb=data_dictionary["species_bounds_array"]
	metabolites = data_dictionary["list_of_metabolite_symbols"]
	j = 1
	for m in metabolites
		#allow accumlation of external and energy species
		if(contains(m, "_e")|| contains(m, "atp")|| contains(m, "nadh")|| contains(m, "nadph")) 
			sb[j,:]=[-100.0,100.0]
		end
		#allow accumulation of intracellular calcium
		if(contains(m, "ca2_c"))
			sb[j,:]=[-100.0,100.0]
		end
		j = j+1
	end
	data_dictionary["species_bounds_array"]=sb
	return data_dictionary 	
end

