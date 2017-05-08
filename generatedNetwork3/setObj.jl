function setObjectiveAllEnergySpeices(data_dictionary)
	obj = data_dictionary["objective_coefficient_array"]
	rxnstrs = data_dictionary["list_of_reaction_strings"]
	count =1
	for str in rxnstrs
		#@show str
		products = str[findlast(str, ' '):end]
		#@show products
		if(contains(products, "atp")|| contains(products, "nadh")|| contains(products, "nadph")) #if we're making an energy species
			obj[count]=-1.0
		end
		count = count+1
	end
	#@show obj
	data_dictionary["objective_coefficient_array"]=obj
	return data_dictionary	
end

function setObjectiveMaxATP(data_dictionary)
	obj = data_dictionary["objective_coefficient_array"]
	rxnstrs = data_dictionary["list_of_reaction_strings"]
	count =1
	for str in rxnstrs
		#@show str
		products = str[findlast(str, ' '):end]
		#@show products
		if(contains(products, "atp")) #if we're making an energy species
			obj[count]=-1.0
		end
		count = count+1
	end
	#@show obj
	data_dictionary["objective_coefficient_array"]=obj
	return data_dictionary	
end
