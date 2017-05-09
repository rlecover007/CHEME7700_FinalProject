function setIC(data_dictionary)
	metabs =data_dictionary["list_of_metabolite_symbols"]
	IC=fill(0.0,size(data_dictionary["list_of_metabolite_symbols"], 1),1) #set all IC to zero as default
	j = 1
	for m in metabs
		if(m=="ca2_e")
			IC[j]=2120.0 #blood calcium lower bound =8..5=10.2mg/dl = 2120 microMolar
		elseif(m=="adp_e")
			IC[j]=.13 #blood adp .13 microMolar 	Plasma ADP Levels: Direct Determination withLuciferase Luminescence Using a Biometer,1978
		elseif(m =="glc_D_e")
			IC[j]=5500.0 #normal blood glucose 100 mg/dl=5500 microMolar
		elseif(m=="txa2_e")
			IC[j]=.00259#plasma concentration of TXA2
		elseif(m == "ca2_c")
			IC[j] = 70/1000 #70 nM Cytosolic calcium iri platelet activation Rink
		end
		j = j+1
	end
	return IC
end

function setIC_Activation(data_dictionary,IC)
	metabs =data_dictionary["list_of_metabolite_symbols"]
	#IC=fill(0.0,size(data_dictionary["list_of_metabolite_symbols"], 1),1) #set all IC to zero as default
	j = 1
	for m in metabs
		if(m=="ca2_e")
			IC[j]=2120.0*2 #blood calcium lower bound =8..5=10.2mg/dl = 2120 microMolar
		elseif(m=="adp_e")
			IC[j]=.13*10 #blood adp .13 microMolar 	Plasma ADP Levels: Direct Determination withLuciferase Luminescence Using a Biometer,1978
#		elseif(m =="glc_D_e")
#			IC[j]=5500.0 #normal blood glucose 100 mg/dl=5500 microMolar
		elseif(m=="txa2_e")
			IC[j]=.00259*50 #plasma concentration of TXA2
#		elseif(m == "ca2_c")
#			IC[j]=70/1000 #70 nM Cytosolic calcium iri platelet activation Rink
		end
		j = j+1
	end
	return IC
end

function setIC_PostActivation(data_dictionary, IC)
	metabs =data_dictionary["list_of_metabolite_symbols"]
	j =1
	for m in metabs
		if(m=="ca2_e")
			IC[j]=2120.0 #blood calcium lower bound =8..5=10.2mg/dl = 2120 microMolar
#		elseif(m=="adp_e")
#			IC[j]=.13 #blood adp .13 microMolar 	Plasma ADP Levels: Direct Determination withLuciferase Luminescence Using a Biometer,1978
#		elseif(m =="glc_D_e")
#			IC[j]=5500.0 #normal blood glucose 100 mg/dl=5500 microMolar
#		elseif(m=="txa2_e")
#			IC[j]=.00259 #plasma concentration of TXA2
#		elseif(m == "ca2_c")
#			IC[j]=70/1000 #70 nM Cytosolic calcium iri platelet activation Rink
		end
		j = j+1
	end
	return IC
end
