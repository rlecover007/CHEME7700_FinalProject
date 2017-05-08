include("RachelUtils.jl")
using PyPlot

function plot_dFBA()
	time, res, data_dictionary=dFBA()
	for j in collect(1:size(data_dictionary["list_of_metabolite_symbols"],1))
		close("all")
		curr_metab = data_dictionary["list_of_metabolite_symbols"][j]
		if(contains(curr_metab, "_e")|| contains(curr_metab, "atp")|| contains(curr_metab, "nadh")|| contains(curr_metab, "nadph")) #if its an external metabolite allowed to accumulate
			figure(figsize=[15,15])
			title(curr_metab)
			plot(time, res[:,j], "k.")
			xlabel("Time")
			ylabel("Concentration")
			savefig(string("../figures/01_05_17_", curr_metab, ".pdf"))
		end
	end
end
