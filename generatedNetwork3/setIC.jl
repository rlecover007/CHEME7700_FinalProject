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

function setIC_40microM_ADP_Initial(data_dictionary)
	metabs =data_dictionary["list_of_metabolite_symbols"]
	IC=fill(0.0,size(data_dictionary["list_of_metabolite_symbols"], 1),1) #set all IC to zero as default
	j = 1
	for m in metabs
		if(m=="ca2_e")
			IC[j]=2120.0 #blood calcium lower bound =8..5=10.2mg/dl = 2120 microMolar
		elseif(m=="adp_e")
			IC[j]=0 #blood adp .13 microMolar 	Plasma ADP Levels: Direct Determination withLuciferase Luminescence Using a Biometer,1978
		elseif(m =="glc_D_e")
			IC[j]=5500.0 #normal blood glucose 100 mg/dl=5500 microMolar
		elseif(m=="txa2_e")
			IC[j]=.00259#plasma concentration of TXA2
		elseif(m == "ca2_c")
			IC[j] = 35/1000 #70 nM Cytosolic calcium iri platelet activation Rink
		elseif(m == "na1_c")
			IC[j]=5.5*1000 #https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1180214/pdf/jphysiol00441-0562.pdf
		elseif(m == "na1_e")		
			IC[j] = 136*1000 #http://www.webmd.com/a-to-z-guides/sodium-na-in-blood#2

		end
		j = j+1
	end
	return IC
end

function setIC_40microM_ADP_Active(data_dictionary, IC)
	metabs =data_dictionary["list_of_metabolite_symbols"]
	#IC=fill(0.0,size(data_dictionary["list_of_metabolite_symbols"], 1),1) #set all IC to zero as default
	j = 1
	for m in metabs
		if(m=="ca2_e")
			IC[j]=2120.0 #blood calcium lower bound =8..5=10.2mg/dl = 2120 microMolar
		elseif(m=="adp_e")
			IC[j]=20 #Using Diamond simulation values
		elseif(m =="glc_D_e")
			IC[j]=5500.0 #normal blood glucose 100 mg/dl=5500 microMolar
		elseif(m=="txa2_e")
			IC[j]=.00259#plasma concentration of TXA2
		elseif(m == "ca2_c")
			IC[j] = 40/1000 #70 nM Cytosolic calcium iri platelet activation Rink
		end
		j = j+1
	end
	return IC
end

