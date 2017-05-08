# ----------------------------------------------------------------------------------- #
# Copyright (c) 2017 Varnerlab
# Robert Frederick Smith School of Chemical and Biomolecular Engineering
# Cornell University, Ithaca NY 14850
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# ----------------------------------------------------------------------------------- #
#
# ----------------------------------------------------------------------------------- #
# Function: DataDictionary
# Description: Holds simulation and model parameters as key => value pairs in a Julia Dict()
# Generated on: 2017-05-04T14:56:00.661
#
# Input arguments:
# time_start::Float64 => Simulation start time value (scalar) 
# time_stop::Float64 => Simulation stop time value (scalar) 
# time_step::Float64 => Simulation time step (scalar) 
#
# Output arguments:
# data_dictionary::Dict{AbstractString,Any} => Dictionary holding model and simulation parameters as key => value pairs 
# ----------------------------------------------------------------------------------- #
function DataDictionary(time_start,time_stop,time_step)

	# Load the stoichiometric network from disk - 
	stoichiometric_matrix = readdlm("Network.dat");

	# Setup default flux bounds array - 
	default_bounds_array = [
		0	1000.0	;	# 1 xan_c --> []
		0	1000.0	;	# 2 [] --> xan_c
		0	1000.0	;	# 3 35cgmp_e --> []
		0	1000.0	;	# 4 [] --> 35cgmp_e
		0	1000.0	;	# 5 4hphac_e --> []
		0	1000.0	;	# 6 [] --> 4hphac_e
		0	1000.0	;	# 7 4nph_e --> []
		0	1000.0	;	# 8 [] --> 4nph_e
		0	1000.0	;	# 9 4nphsf_e --> []
		0	1000.0	;	# 10 [] --> 4nphsf_e
		0	1000.0	;	# 11 Lcystin_e --> []
		0	1000.0	;	# 12 [] --> Lcystin_e
		0	1000.0	;	# 13 ac_e --> []
		0	1000.0	;	# 14 [] --> ac_e
		0	1000.0	;	# 15 ade_e --> []
		0	1000.0	;	# 16 [] --> ade_e
		0	1000.0	;	# 17 adn_e --> []
		0	1000.0	;	# 18 [] --> adn_e
		0	1000.0	;	# 19 adp_e --> []
		0	1000.0	;	# 20 [] --> adp_e
		0	1000.0	;	# 21 adprib_e --> []
		0	1000.0	;	# 22 [] --> adprib_e
		0	1000.0	;	# 23 adrnl_e --> []
		0	1000.0	;	# 24 [] --> adrnl_e
		0	1000.0	;	# 25 ala_L_e --> []
		0	1000.0	;	# 26 [] --> ala_L_e
		0	1000.0	;	# 27 amp_e --> []
		0	1000.0	;	# 28 [] --> amp_e
		0	1000.0	;	# 29 arachd_e --> []
		0	1000.0	;	# 30 [] --> arachd_e
		0	1000.0	;	# 31 arg_L_e --> []
		0	1000.0	;	# 32 [] --> arg_L_e
		0	1000.0	;	# 33 ascb_L_e --> []
		0	1000.0	;	# 34 [] --> ascb_L_e
		0	1000.0	;	# 35 asn_L_e --> []
		0	1000.0	;	# 36 [] --> asn_L_e
		0	1000.0	;	# 37 asp_L_e --> []
		0	1000.0	;	# 38 [] --> asp_L_e
		0	1000.0	;	# 39 bilirub_e --> []
		0	1000.0	;	# 40 [] --> bilirub_e
		0	1000.0	;	# 41 ca2_e --> []
		0	1000.0	;	# 42 [] --> ca2_e
		0	1000.0	;	# 43 chol_e --> []
		0	1000.0	;	# 44 [] --> chol_e
		0	1000.0	;	# 45 cit_e --> []
		0	1000.0	;	# 46 [] --> cit_e
		0	1000.0	;	# 47 co_e --> []
		0	1000.0	;	# 48 [] --> co_e
		0	1000.0	;	# 49 co2_e --> []
		0	1000.0	;	# 50 [] --> co2_e
		0	1000.0	;	# 51 creat_e --> []
		0	1000.0	;	# 52 [] --> creat_e
		0	1000.0	;	# 53 cyan_e --> []
		0	1000.0	;	# 54 [] --> cyan_e
		0	1000.0	;	# 55 cys_L_e --> []
		0	1000.0	;	# 56 [] --> cys_L_e
		0	1000.0	;	# 57 cytd_e --> []
		0	1000.0	;	# 58 [] --> cytd_e
		0	1000.0	;	# 59 dhdascb_e --> []
		0	1000.0	;	# 60 [] --> dhdascb_e
		0	1000.0	;	# 61 dopa_e --> []
		0	1000.0	;	# 62 [] --> dopa_e
		0	1000.0	;	# 63 dopasf_e --> []
		0	1000.0	;	# 64 [] --> dopasf_e
		0	1000.0	;	# 65 fe2_e --> []
		0	1000.0	;	# 66 [] --> fe2_e
		0	1000.0	;	# 67 fru_e --> []
		0	1000.0	;	# 68 [] --> fru_e
		0	1000.0	;	# 69 gal_e --> []
		0	1000.0	;	# 70 [] --> gal_e
		0	1000.0	;	# 71 gdp_e --> []
		0	1000.0	;	# 72 [] --> gdp_e
		0	1000.0	;	# 73 glc_D_e --> []
		0	1000.0	;	# 74 [] --> glc_D_e
		0	1000.0	;	# 75 gln_L_e --> []
		0	1000.0	;	# 76 [] --> gln_L_e
		0	1000.0	;	# 77 glu_L_e --> []
		0	1000.0	;	# 78 [] --> glu_L_e
		0	1000.0	;	# 79 gly_e --> []
		0	1000.0	;	# 80 [] --> gly_e
		0	1000.0	;	# 81 glyb_e --> []
		0	1000.0	;	# 82 [] --> glyb_e
		0	1000.0	;	# 83 gthox_e --> []
		0	1000.0	;	# 84 [] --> gthox_e
		0	1000.0	;	# 85 gthrd_e --> []
		0	1000.0	;	# 86 [] --> gthrd_e
		0	1000.0	;	# 87 h_e --> []
		0	1000.0	;	# 88 [] --> h_e
		0	1000.0	;	# 89 h2o_e --> []
		0	1000.0	;	# 90 [] --> h2o_e
		0	1000.0	;	# 91 h2o2_e --> []
		0	1000.0	;	# 92 [] --> h2o2_e
		0	1000.0	;	# 93 hco3_e --> []
		0	1000.0	;	# 94 [] --> hco3_e
		0	1000.0	;	# 95 hdca_e --> []
		0	1000.0	;	# 96 [] --> hdca_e
		0	1000.0	;	# 97 his_L_e --> []
		0	1000.0	;	# 98 [] --> his_L_e
		0	1000.0	;	# 99 hista_e --> []
		0	1000.0	;	# 100 [] --> hista_e
		0	1000.0	;	# 101 hxan_e --> []
		0	1000.0	;	# 102 [] --> hxan_e
		0	1000.0	;	# 103 ile_L_e --> []
		0	1000.0	;	# 104 [] --> ile_L_e
		0	1000.0	;	# 105 inost_e --> []
		0	1000.0	;	# 106 [] --> inost_e
		0	1000.0	;	# 107 ins_e --> []
		0	1000.0	;	# 108 [] --> ins_e
		0	1000.0	;	# 109 lac_L_e --> []
		0	1000.0	;	# 110 [] --> lac_L_e
		0	1000.0	;	# 111 leuktrF4_e --> []
		0	1000.0	;	# 112 [] --> leuktrF4_e
		0	1000.0	;	# 113 lnlc_e --> []
		0	1000.0	;	# 114 [] --> lnlc_e
		0	1000.0	;	# 115 lys_L_e --> []
		0	1000.0	;	# 116 [] --> lys_L_e
		0	1000.0	;	# 117 met_L_e --> []
		0	1000.0	;	# 118 [] --> met_L_e
		0	1000.0	;	# 119 na1_e --> []
		0	1000.0	;	# 120 [] --> na1_e
		0	1000.0	;	# 121 nad_e --> []
		0	1000.0	;	# 122 [] --> nad_e
		0	1000.0	;	# 123 ncam_e --> []
		0	1000.0	;	# 124 [] --> ncam_e
		0	1000.0	;	# 125 nh4_e --> []
		0	1000.0	;	# 126 [] --> nh4_e
		0	1000.0	;	# 127 no_e --> []
		0	1000.0	;	# 128 [] --> no_e
		0	1000.0	;	# 129 nrpphrsf_e --> []
		0	1000.0	;	# 130 [] --> nrpphrsf_e
		0	1000.0	;	# 131 o2_e --> []
		0	1000.0	;	# 132 [] --> o2_e
		0	1000.0	;	# 133 o2s_e --> []
		0	1000.0	;	# 134 [] --> o2s_e
		0	1000.0	;	# 135 ocdca_e --> []
		0	1000.0	;	# 136 [] --> ocdca_e
		0	1000.0	;	# 137 ocdcea_e --> []
		0	1000.0	;	# 138 [] --> ocdcea_e
		0	1000.0	;	# 139 orn_e --> []
		0	1000.0	;	# 140 [] --> orn_e
		0	1000.0	;	# 141 phe_L_e --> []
		0	1000.0	;	# 142 [] --> phe_L_e
		0	1000.0	;	# 143 pheacgln_e --> []
		0	1000.0	;	# 144 [] --> pheacgln_e
		0	1000.0	;	# 145 pheme_e --> []
		0	1000.0	;	# 146 [] --> pheme_e
		0	1000.0	;	# 147 pi_e --> []
		0	1000.0	;	# 148 [] --> pi_e
		0	1000.0	;	# 149 pro_L_e --> []
		0	1000.0	;	# 150 [] --> pro_L_e
		0	1000.0	;	# 151 prostgd2_e --> []
		0	1000.0	;	# 152 [] --> prostgd2_e
		0	1000.0	;	# 153 pyr_e --> []
		0	1000.0	;	# 154 [] --> pyr_e
		0	1000.0	;	# 155 ser_L_e --> []
		0	1000.0	;	# 156 [] --> ser_L_e
		0	1000.0	;	# 157 so4_e --> []
		0	1000.0	;	# 158 [] --> so4_e
		0	1000.0	;	# 159 spc_hs_e --> []
		0	1000.0	;	# 160 [] --> spc_hs_e
		0	1000.0	;	# 161 sphs1p_e --> []
		0	1000.0	;	# 162 [] --> sphs1p_e
		0	1000.0	;	# 163 srtn_e --> []
		0	1000.0	;	# 164 [] --> srtn_e
		0	1000.0	;	# 165 succ_e --> []
		0	1000.0	;	# 166 [] --> succ_e
		0	1000.0	;	# 167 tcynt_e --> []
		0	1000.0	;	# 168 [] --> tcynt_e
		0	1000.0	;	# 169 thym_e --> []
		0	1000.0	;	# 170 [] --> thym_e
		0	1000.0	;	# 171 thymd_e --> []
		0	1000.0	;	# 172 [] --> thymd_e
		0	1000.0	;	# 173 trp_L_e --> []
		0	1000.0	;	# 174 [] --> trp_L_e
		0	1000.0	;	# 175 tsul_e --> []
		0	1000.0	;	# 176 [] --> tsul_e
		0	1000.0	;	# 177 txa2_e --> []
		0	1000.0	;	# 178 [] --> txa2_e
		0	1000.0	;	# 179 tymsf_e --> []
		0	1000.0	;	# 180 [] --> tymsf_e
		0	1000.0	;	# 181 tyr_L_e --> []
		0	1000.0	;	# 182 [] --> tyr_L_e
		0	1000.0	;	# 183 ura_e --> []
		0	1000.0	;	# 184 [] --> ura_e
		0	1000.0	;	# 185 urate_e --> []
		0	1000.0	;	# 186 [] --> urate_e
		0	1000.0	;	# 187 urea_e --> []
		0	1000.0	;	# 188 [] --> urea_e
		0	1000.0	;	# 189 uri_e --> []
		0	1000.0	;	# 190 [] --> uri_e
		0	1000.0	;	# 191 val_L_e --> []
		0	1000.0	;	# 192 [] --> val_L_e
		0	1000.0	;	# 193 12harachd_c --> []
		0	1000.0	;	# 194 [] --> 12harachd_c
		0	1000.0	;	# 195 15HPET_c --> []
		0	1000.0	;	# 196 [] --> 15HPET_c
		0	1000.0	;	# 197 4mop_c --> []
		0	1000.0	;	# 198 [] --> 4mop_c
		0	1000.0	;	# 199 5moxact_c --> []
		0	1000.0	;	# 200 [] --> 5moxact_c
		0	1000.0	;	# 201 ca2_c --> ca2_e
		0	1000.0	;	# 202 ca2_e --> ca2_c
		0	1000.0	;	# 203 homoval_c --> []
		0	1000.0	;	# 204 [] --> homoval_c
		0	1000.0	;	# 205 ind3ac_c --> []
		0	1000.0	;	# 206 [] --> ind3ac_c
		0	1000.0	;	# 207 mal_L_c --> []
		0	1000.0	;	# 208 [] --> mal_L_c
		0	1000.0	;	# 209 na1_c --> []
		0	1000.0	;	# 210 [] --> na1_c
		0	1000.0	;	# 211 txb2_c --> []
		0	1000.0	;	# 212 [] --> txb2_c
		0	1000.0	;	# 213 10fthf6glu_m --> 10fthf6glu_c
		0	1000.0	;	# 214 10fthf7glu_c --> 10fthf7glu_l
		0	1000.0	;	# 215 10fthf7glu_m --> 10fthf7glu_c
		0	1000.0	;	# 216 10fthf_c --> 10fthf_l
		0	1000.0	;	# 217 10fthf_l --> 10fthf_c
		0	1000.0	;	# 218 L2aadp_c+akg_m --> L2aadp_m+akg_c
		0	1000.0	;	# 219 L2aadp_m+akg_c --> L2aadp_c+akg_m
		0	1000.0	;	# 220 h2o_c+2dr1p_c --> drib_c+pi_c
		0	1000.0	;	# 221 coa_m+nad_m+2oxoadp_m --> nadh_m+co2_m+glutcoa_m
		0	1000.0	;	# 222 akg_m+2oxoadp_c --> akg_c+2oxoadp_m
		0	1000.0	;	# 223 akg_c+2oxoadp_m --> akg_m+2oxoadp_c
		0	1000.0	;	# 224 amet_c+34dhpha_c --> homoval_c+h_c+ahcys_c
		0	1000.0	;	# 225 h2o_c+nad_c+34dhpac_c --> nadh_c+34dhpha_c+2.0*h_c
		0	1000.0	;	# 226 34hpp_c+o2_c --> hgentis_c+co2_c
		0	1000.0	;	# 227 h2o_m+3hibutcoa_m --> coa_m+3hmp_m+h_m
		0	1000.0	;	# 228 34dhphe_c+h_c --> dopa_c+co2_c
		0	1000.0	;	# 229 3mox4hpac_c+h2o_c+nad_c --> homoval_c+nadh_c+2.0*h_c
		0	1000.0	;	# 230 homoval_c+nadh_c+2.0*h_c --> 3mox4hpac_c+h2o_c+nad_c
		0	1000.0	;	# 231 3mob_c+h_c --> 3mob_m+h_m
		0	1000.0	;	# 232 3mop_c+h_c --> h_m+3mop_m
		0	1000.0	;	# 233 o2_c+h2o_c+3moxtyr_c --> 3mox4hpac_c+h2o2_c+nh4_c
		0	1000.0	;	# 234 o2_c+h2o_c+dopa_c --> h2o2_c+nh4_c+34dhpac_c
		0	1000.0	;	# 235 4abut_c --> 4abut_m
		0	1000.0	;	# 236 4abut_m --> 4abut_c
		0	1000.0	;	# 237 h2o_c+nadp_c+4hoxpacd_c --> 4hphac_c+2.0*h_c+nadph_c
		0	1000.0	;	# 238 4hphac_c+2.0*h_c+nadph_c --> h2o_c+nadp_c+4hoxpacd_c
		0	1000.0	;	# 239 4mop_c+h_c --> 4mop_m+h_m
		0	1000.0	;	# 240 4nphsf_e --> 4nphsf_c
		0	1000.0	;	# 241 4nphsf_c --> 4nphsf_e
		0	1000.0	;	# 242 paps_c+4nph_c --> pap_c+4nphsf_c+h_c
		0	1000.0	;	# 243 4nph_e --> 4nph_c
		0	1000.0	;	# 244 4nph_c --> 4nph_e
		0	1000.0	;	# 245 5aop_c --> 5aop_m
		0	1000.0	;	# 246 5aop_m --> 5aop_c
		0	1000.0	;	# 247 5htrp_c+h_c --> srtn_c+co2_c
		0	1000.0	;	# 248 5hoxindact_c+h2o_c+nad_c --> nadh_c+2.0*h_c+5hoxindoa_c
		0	1000.0	;	# 249 o2_c+h2o_c+srtn_c --> 5hoxindact_c+h2o2_c+nh4_c
		0	1000.0	;	# 250 5mthf_e --> 5mthf_c
		0	1000.0	;	# 251 5mthf_c --> 5mthf_e
		0	1000.0	;	# 252 oh1_c+5mthf_e --> oh1_e+5mthf_c
		0	1000.0	;	# 253 oh1_e+5mthf_c --> oh1_c+5mthf_e
		0	1000.0	;	# 254 coa_c+atp_c+acac_c --> ppi_c+amp_c+aacoa_c
		0	1000.0	;	# 255 ppi_c+amp_c+aacoa_c --> coa_c+atp_c+acac_c
		0	1000.0	;	# 256 L2aadp6sa_m+h2o_m+nad_m --> L2aadp_m+nadh_m+2.0*h_m
		0	1000.0	;	# 257 L2aadp_c+akg_c --> glu_L_c+2oxoadp_c
		0	1000.0	;	# 258 4abut_m+akg_m --> glu_L_m+sucsal_m
		0	1000.0	;	# 259 glu_L_m+sucsal_m --> 4abut_m+akg_m
		0	1000.0	;	# 260 2.0*accoa_c --> coa_c+aacoa_c
		0	1000.0	;	# 261 coa_c+aacoa_c --> 2.0*accoa_c
		0	1000.0	;	# 262 coa_m+2maacoa_m --> accoa_m+ppcoa_m
		0	1000.0	;	# 263 accoa_m+ppcoa_m --> coa_m+2maacoa_m
		0	1000.0	;	# 264 2.0*accoa_c --> coa_c+aacoa_c
		0	1000.0	;	# 265 coa_c+aacoa_c --> 2.0*accoa_c
		0	1000.0	;	# 266 2.0*accoa_m --> coa_m+aacoa_m
		0	1000.0	;	# 267 coa_m+aacoa_m --> 2.0*accoa_m
		0	1000.0	;	# 268 atp_c+accoa_c+hco3_c --> malcoa_c+pi_c+h_c+adp_c
		0	1000.0	;	# 269 coa_c+atp_c+cit_c --> oaa_c+pi_c+accoa_c+adp_c
		0	1000.0	;	# 270 fad_m+2mbcoa_m --> 2mb2coa_m+fadh2_m
		0	1000.0	;	# 271 fad_m+ivcoa_m --> fadh2_m+3mb2coa_m
		0	1000.0	;	# 272 fad_m+ibcoa_m --> fadh2_m+2mp2coa_m
		0	1000.0	;	# 273 cit_c --> icit_c
		0	1000.0	;	# 274 icit_c --> cit_c
		0	1000.0	;	# 275 cit_m --> icit_m
		0	1000.0	;	# 276 icit_m --> cit_m
		0	1000.0	;	# 277 ac_c+coa_c+atp_c --> ppi_c+accoa_c+amp_c
		0	1000.0	;	# 278 amet_c+5hoxindoa_c --> 5moxact_c+h_c+ahcys_c
		0	1000.0	;	# 279 ac_e+h_e --> ac_c+h_c
		0	1000.0	;	# 280 ac_c+h_c --> ac_e+h_e
		0	1000.0	;	# 281 adn_c+h2o_c+h_c --> ins_c+nh4_c
		0	1000.0	;	# 282 h2o_e+adn_e+h_e --> ins_e+nh4_e
		0	1000.0	;	# 283 ade_e --> ade_c
		0	1000.0	;	# 284 ade_c --> ade_e
		0	1000.0	;	# 285 atp_c+amp_c --> 2.0*adp_c
		0	1000.0	;	# 286 2.0*adp_c --> atp_c+amp_c
		0	1000.0	;	# 287 atp_m+amp_m --> 2.0*adp_m
		0	1000.0	;	# 288 2.0*adp_m --> atp_m+amp_m
		0	1000.0	;	# 289 gtp_m+amp_m --> gdp_m+adp_m
		0	1000.0	;	# 290 gdp_m+adp_m --> gtp_m+amp_m
		0	1000.0	;	# 291 atp_c --> camp_c+ppi_c
		0	1000.0	;	# 292 adn_c+atp_c --> h_c+adp_c+amp_c
		0	1000.0	;	# 293 adn_e --> adn_c
		0	1000.0	;	# 294 adn_c --> adn_e
		0	1000.0	;	# 295 adprib_c+h2o_c --> 2.0*h_c+amp_c+r5p_c
		0	1000.0	;	# 296 prpp_c+ade_c --> ppi_c+amp_c
		0	1000.0	;	# 297 2.0*h2o_c+2.0*atp_c+3.0*adrnl_c --> 3.0*adrnl_e+2.0*pi_c+2.0*h_c+2.0*adp_c
		0	1000.0	;	# 298 atp_c+aps_c --> paps_c+h_c+adp_c
		0	1000.0	;	# 299 dcamp_c --> amp_c+fum_c
		0	1000.0	;	# 300 25aics_c --> fum_c+aicar_c
		0	1000.0	;	# 301 gtp_c+imp_c+asp_L_c --> gdp_c+pi_c+2.0*h_c+dcamp_c
		0	1000.0	;	# 302 h2o_c+ahcys_c --> adn_c+hcys_L_c
		0	1000.0	;	# 303 adn_c+hcys_L_c --> h2o_c+ahcys_c
		0	1000.0	;	# 304 10fthf_c+aicar_c --> thf_c+fprica_c
		0	1000.0	;	# 305 thf_c+fprica_c --> 10fthf_c+aicar_c
		0	1000.0	;	# 306 co2_c+air_c --> 5aizc_c+h_c
		0	1000.0	;	# 307 5aizc_c+h_c --> co2_c+air_c
		0	1000.0	;	# 308 coa_m+nad_m+akg_m --> nadh_m+succoa_m+co2_m
		0	1000.0	;	# 309 gln_L_c+ala_L_e --> gln_L_e+ala_L_c
		0	1000.0	;	# 310 gln_L_e+ala_L_c --> gln_L_c+ala_L_e
		0	1000.0	;	# 311 gly_m+succoa_m+h_m --> coa_m+5aop_m+co2_m
		0	1000.0	;	# 312 ala_L_c+akg_c --> pyr_c+glu_L_c
		0	1000.0	;	# 313 pyr_c+glu_L_c --> ala_L_c+akg_c
		0	1000.0	;	# 314 nad_c+meoh_c --> fald_c+nadh_c+h_c
		0	1000.0	;	# 315 fald_c+nadh_c+h_c --> nad_c+meoh_c
		0	1000.0	;	# 316 nad_c+12ppd_R_c --> lald_D_c+nadh_c+h_c
		0	1000.0	;	# 317 lald_D_c+nadh_c+h_c --> nad_c+12ppd_R_c
		0	1000.0	;	# 318 12ppd_S_c+nad_c --> lald_L_c+nadh_c+h_c
		0	1000.0	;	# 319 h2o_c+nad_c+pacald_c --> pac_c+nadh_c+2.0*h_c
		0	1000.0	;	# 320 h2o_c+nadp_c+pacald_c --> pac_c+2.0*h_c+nadph_c
		0	1000.0	;	# 321 h2o_c+nad_c+id3acald_c --> ind3ac_c+nadh_c+2.0*h_c
		0	1000.0	;	# 322 h2o_c+acald_c+nad_c --> ac_c+nadh_c+2.0*h_c
		0	1000.0	;	# 323 h2o_c+nadp_c+acald_c --> ac_c+2.0*h_c+nadph_c
		0	1000.0	;	# 324 o2_c+arachd_c --> 12HPET_c
		0	1000.0	;	# 325 o2_c+arachd_c --> 15HPET_c
		0	1000.0	;	# 326 o2_c+arachd_c --> 5HPET_c
		0	1000.0	;	# 327 5HPET_c --> h2o_c+leuktrA4_c
		0	1000.0	;	# 328 h2o_c+nadp_c+mthgxl_c --> pyr_c+2.0*h_c+nadph_c
		0	1000.0	;	# 329 h_c+mthgxl_c+nadph_c --> nadp_c+acetol_c
		0	1000.0	;	# 330 acetol_c+h_c+nadph_c --> 12ppd_S_c+nadp_c
		0	1000.0	;	# 331 h2o_c+h_c+amp_c --> nh4_c+imp_c
		0	1000.0	;	# 332 h2o_e+cgly_e --> cys_L_e+gly_e
		0	1000.0	;	# 333 ala_B_m+akg_m --> glu_L_m+msa_m
		0	1000.0	;	# 334 glu_L_m+msa_m --> ala_B_m+akg_m
		0	1000.0	;	# 335 arachd_e --> arachd_c
		0	1000.0	;	# 336 arachd_c --> arachd_e
		0	1000.0	;	# 337 arachd_c --> arachd_r
		0	1000.0	;	# 338 arachd_r --> arachd_c
		0	1000.0	;	# 339 h2o_c+arg_L_c --> urea_c+orn_c
		0	1000.0	;	# 340 argsuc_c --> fum_c+arg_L_c
		0	1000.0	;	# 341 fum_c+arg_L_c --> argsuc_c
		0	1000.0	;	# 342 atp_c+citr_L_c+asp_L_c --> ppi_c+h_c+amp_c+argsuc_c
		0	1000.0	;	# 343 arg_L_e --> arg_L_c
		0	1000.0	;	# 344 arg_L_c --> arg_L_e
		0	1000.0	;	# 345 ascb_L_e --> ascb_L_c
		0	1000.0	;	# 346 ascb_L_c --> ascb_L_e
		0	1000.0	;	# 347 na1_e+ascb_L_e --> na1_c+ascb_L_c
		0	1000.0	;	# 348 na1_c+ascb_L_c --> na1_e+ascb_L_e
		0	1000.0	;	# 349 na1_e+ala_L_c+asn_L_e --> na1_c+asn_L_c+ala_L_e
		0	1000.0	;	# 350 asn_L_m+h2o_m --> nh4_m+asp_L_m
		0	1000.0	;	# 351 na1_e+ser_L_c+asn_L_e --> na1_c+asn_L_c+ser_L_e
		0	1000.0	;	# 352 asn_L_c --> asn_L_m
		0	1000.0	;	# 353 asp_L_c+akg_c --> oaa_c+glu_L_c
		0	1000.0	;	# 354 oaa_c+glu_L_c --> asp_L_c+akg_c
		0	1000.0	;	# 355 asp_L_m+akg_m --> glu_L_m+oaa_m
		0	1000.0	;	# 356 glu_L_m+oaa_m --> asp_L_m+akg_m
		0	1000.0	;	# 357 3.0*na1_e+h_e+asp_L_e+k_c --> 3.0*na1_c+h_c+asp_L_c+k_e
		0	1000.0	;	# 358 3.0*na1_c+h_c+asp_L_c+k_e --> 3.0*na1_e+h_e+asp_L_e+k_c
		0	1000.0	;	# 359 h2o_e+adp_e --> pi_e+h_e+amp_e
		0	1000.0	;	# 360 pi_m+4.0*h_c+adp_m --> atp_m+h2o_m+3.0*h_m
		0	1000.0	;	# 361 ala_B_c --> ala_B_m
		0	1000.0	;	# 362 ala_B_m --> ala_B_c
		0	1000.0	;	# 363 hcys_L_c+glyb_c --> dmgly_c+met_L_c
		0	1000.0	;	# 364 biliverd_c+h_c+nadph_c --> bilirub_c+nadp_c
		0	1000.0	;	# 365 bilirub_e+hco3_c --> bilirub_c+hco3_e
		0	1000.0	;	# 366 bilirub_c+hco3_e --> bilirub_e+hco3_c
		0	1000.0	;	# 367 pap_c+h2o_c --> pi_c+amp_c
		0	1000.0	;	# 368 pmtcoa_c+crn_c --> pmtcrn_c+coa_c
		0	1000.0	;	# 369 pmtcrn_m+coa_m --> pmtcoa_m+crn_m
		0	1000.0	;	# 370 pmtcrn_c --> pmtcrn_m
		0	1000.0	;	# 371 stcoa_c+crn_c --> coa_c+stcrn_c
		0	1000.0	;	# 372 stcrn_m+coa_m --> stcoa_m+crn_m
		0	1000.0	;	# 373 stcrn_c --> stcrn_m
		0	1000.0	;	# 374 odecoa_c+crn_c --> coa_c+odecrn_c
		0	1000.0	;	# 375 coa_m+odecrn_m --> odecoa_m+crn_m
		0	1000.0	;	# 376 odecrn_c --> odecrn_m
		0	1000.0	;	# 377 arachdcoa_c+crn_c --> coa_c+arachdcrn_c
		0	1000.0	;	# 378 arachdcrn_m+coa_m --> arachdcoa_m+crn_m
		0	1000.0	;	# 379 arachdcrn_c --> arachdcrn_m
		0	1000.0	;	# 380 h2o_c+atp_c+2.0*ca2_c --> 2.0*ca2_e+pi_c+h_e+adp_c
		0	1000.0	;	# 381 2.0*h2o2_m --> o2_m+2.0*h2o_m
		0	1000.0	;	# 382 2.0*h2o2_x --> o2_x+2.0*h2o_x
		0	1000.0	;	# 383 2.0*atp_m+nh4_m+hco3_m --> cbp_m+pi_m+2.0*h_m+2.0*adp_m
		0	1000.0	;	# 384 35cgmp_c+h2o_c+atp_c --> 35cgmp_e+pi_c+h_c+adp_c
		0	1000.0	;	# 385 cholp_c+ctp_c+h_c --> ppi_c+cdpchol_c
		0	1000.0	;	# 386 na1_e+chol_e --> na1_c+chol_c
		0	1000.0	;	# 387 na1_c+chol_c --> na1_e+chol_e
		0	1000.0	;	# 388 chol_e --> chol_c
		0	1000.0	;	# 389 chol_c --> chol_e
		0	1000.0	;	# 390 citr_L_m --> citr_L_c
		0	1000.0	;	# 391 citr_L_c --> citr_L_m
		0	1000.0	;	# 392 2.0*na1_e+cit_e --> 2.0*na1_c+cit_c
		0	1000.0	;	# 393 2.0*na1_c+cit_c --> 2.0*na1_e+cit_e
		0	1000.0	;	# 394 4.0*na1_e+cit_e --> 4.0*na1_c+cit_c
		0	1000.0	;	# 395 4.0*na1_c+cit_c --> 4.0*na1_e+cit_e
		0	1000.0	;	# 396 oh1_c+2.0*cl_e --> 2.0*cl_c+oh1_e
		0	1000.0	;	# 397 2.0*cl_c+oh1_e --> oh1_c+2.0*cl_e
		0	1000.0	;	# 398 co2_e --> co2_c
		0	1000.0	;	# 399 co2_c --> co2_e
		0	1000.0	;	# 400 co_c --> co_e
		0	1000.0	;	# 401 co_e --> co_c
		0	1000.0	;	# 402 o2_c+2.0*h_c+cpppg3_c --> 2.0*h2o_c+pppg9_c+2.0*co2_c
		0	1000.0	;	# 403 2.0*na1_e+creat_e --> 2.0*na1_c+creat_c
		0	1000.0	;	# 404 2.0*na1_c+creat_c --> 2.0*na1_e+creat_e
		0	1000.0	;	# 405 crn_e --> crn_c
		0	1000.0	;	# 406 crn_c --> crn_e
		0	1000.0	;	# 407 crn_m --> crn_c
		0	1000.0	;	# 408 crn_e --> crn_c
		0	1000.0	;	# 409 crn_c --> crn_e
		0	1000.0	;	# 410 na1_e+crn_e --> na1_c+crn_c
		0	1000.0	;	# 411 na1_c+crn_c --> na1_e+crn_e
		0	1000.0	;	# 412 accoa_c+crn_c --> coa_c+acrn_c
		0	1000.0	;	# 413 coa_c+acrn_c --> accoa_c+crn_c
		0	1000.0	;	# 414 h2o_m+oaa_m+accoa_m --> coa_m+h_m+cit_m
		0	1000.0	;	# 415 cyan_m+tsul_m --> tcynt_m+h_m+so3_m
		0	1000.0	;	# 416 cyan_e --> cyan_c
		0	1000.0	;	# 417 cyan_c --> cyan_e
		0	1000.0	;	# 418 cyan_c --> cyan_m
		0	1000.0	;	# 419 cyan_m --> cyan_c
		0	1000.0	;	# 420 o2_m+4.0*focytC_m+8.0*h_m --> 2.0*h2o_m+4.0*h_c+4.0*ficytC_m
		0	1000.0	;	# 421 2.0*h_m+q10h2_m+2.0*ficytC_m --> 2.0*focytC_m+4.0*h_c+q10_m
		0	1000.0	;	# 422 Lcystin_c+2.0*gthrd_c --> 2.0*cys_L_c+gthox_c
		0	1000.0	;	# 423 2.0*cys_L_c+gthox_c --> Lcystin_c+2.0*gthrd_c
		0	1000.0	;	# 424 cys_L_c+akg_c --> mercppyr_c+glu_L_c
		0	1000.0	;	# 425 mercppyr_c+glu_L_c --> cys_L_c+akg_c
		0	1000.0	;	# 426 Lcystin_e+glu_L_c --> glu_L_e+Lcystin_c
		0	1000.0	;	# 427 cytd_e --> cytd_c
		0	1000.0	;	# 428 cytd_c --> cytd_e
		0	1000.0	;	# 429 cmp_c+atp_c --> cdp_c+adp_c
		0	1000.0	;	# 430 cdp_c+adp_c --> cmp_c+atp_c
		0	1000.0	;	# 431 cmp_c+ctp_c --> 2.0*cdp_c
		0	1000.0	;	# 432 2.0*cdp_c --> cmp_c+ctp_c
		0	1000.0	;	# 433 utp_c+cmp_c --> cdp_c+udp_c
		0	1000.0	;	# 434 cdp_c+udp_c --> utp_c+cmp_c
		0	1000.0	;	# 435 h2o_c+dad_2_c+h_c --> nh4_c+din_c
		0	1000.0	;	# 436 h_c+3dhguln_c --> co2_c+xylu_L_c
		0	1000.0	;	# 437 co2_c+xylu_L_c --> h_c+3dhguln_c
		0	1000.0	;	# 438 dhdascb_e --> dhdascb_c
		0	1000.0	;	# 439 dhdascb_c --> dhdascb_e
		0	1000.0	;	# 440 h2o_c+56dura_c --> h_c+cala_c
		0	1000.0	;	# 441 dhbpt_c+5mthf_c --> mlthf_c+thbpt_c+h_c
		0	1000.0	;	# 442 fad_m+h2o_m+dmgly_m --> fald_m+sarcs_m+fadh2_m
		0	1000.0	;	# 443 dmgly_c --> dmgly_m
		0	1000.0	;	# 444 dmgly_m --> dmgly_c
		0	1000.0	;	# 445 o2_c+dopa_c+ascb_L_c --> h2o_c+nrpphr_c+dhdascb_c
		0	1000.0	;	# 446 amet_c+dopa_c --> 3moxtyr_c+h_c+ahcys_c
		0	1000.0	;	# 447 dopasf_c --> dopasf_e
		0	1000.0	;	# 448 dopa_c+paps_c --> pap_c+dopasf_c+h_c
		0	1000.0	;	# 449 2.0*h2o_c+3.0*dopa_c+2.0*atp_c --> 3.0*dopa_e+2.0*pi_c+2.0*h_c+2.0*adp_c
		0	1000.0	;	# 450 13dpg_c --> 23dpg_c+h_c
		0	1000.0	;	# 451 23dpg_c+h_c --> 13dpg_c
		0	1000.0	;	# 452 h2o_c+23dpg_c --> pi_c+3pg_c
		0	1000.0	;	# 453 atp_c+drib_c --> 2dr5p_c+h_c+adp_c
		0	1000.0	;	# 454 2dr5p_c --> acald_c+g3p_c
		0	1000.0	;	# 455 56dura_c+nadp_c --> ura_c+h_c+nadph_c
		0	1000.0	;	# 456 ura_c+h_c+nadph_c --> 56dura_c+nadp_c
		0	1000.0	;	# 457 h2o_m+2mp2coa_m --> 3hibutcoa_m
		0	1000.0	;	# 458 3hibutcoa_m --> h2o_m+2mp2coa_m
		0	1000.0	;	# 459 3hbcoa_m --> h2o_m+b2coa_m
		0	1000.0	;	# 460 h2o_m+b2coa_m --> 3hbcoa_m
		0	1000.0	;	# 461 h2o_m+2mb2coa_m --> 3hmbcoa_m
		0	1000.0	;	# 462 3hmbcoa_m --> h2o_m+2mb2coa_m
		0	1000.0	;	# 463 2pg_c --> pep_c+h2o_c
		0	1000.0	;	# 464 pep_c+h2o_c --> 2pg_c
		0	1000.0	;	# 465 paps_c+estrone_c --> pap_c+h_c+estrones_c
		0	1000.0	;	# 466 etfox_m+fadh2_m --> fad_m+etfrd_m
		0	1000.0	;	# 467 etfrd_m+q10_m --> etfox_m+q10h2_m
		0	1000.0	;	# 468 coa_c+hdca_c+atp_c --> ppi_c+pmtcoa_c+amp_c
		0	1000.0	;	# 469 coa_c+atp_c+ocdca_c --> ppi_c+amp_c+stcoa_c
		0	1000.0	;	# 470 ocdcea_c+coa_c+atp_c --> ppi_c+amp_c+odecoa_c
		0	1000.0	;	# 471 coa_c+lnlc_c+atp_c --> ppi_c+amp_c+lnlccoa_c
		0	1000.0	;	# 472 ppi_c+amp_c+lnlccoa_c --> coa_c+lnlc_c+atp_c
		0	1000.0	;	# 473 coa_c+atp_c+arachd_c --> ppi_c+arachdcoa_c+amp_c
		0	1000.0	;	# 474 fald_c+nad_c+gthrd_c --> nadh_c+Sfglutth_c+h_c
		0	1000.0	;	# 475 nadh_c+Sfglutth_c+h_c --> fald_c+nad_c+gthrd_c
		0	1000.0	;	# 476 fald_m --> fald_c
		0	1000.0	;	# 477 fald_c --> fald_m
		0	1000.0	;	# 478 7.0*fad_m+7.0*h2o_m+7.0*coa_m+7.0*nad_m+pmtcoa_m --> 7.0*nadh_m+8.0*accoa_m+7.0*fadh2_m+7.0*h_m
		0	1000.0	;	# 479 4.0*fad_m+4.0*h2o_m+4.0*coa_m+4.0*nad_m+pmtcoa_m --> 4.0*nadh_m+4.0*accoa_m+4.0*fadh2_m+4.0*h_m+occoa_m
		0	1000.0	;	# 480 fad_m+h2o_m+coa_m+nad_m+stcoa_m --> nadh_m+pmtcoa_m+accoa_m+fadh2_m+h_m
		0	1000.0	;	# 481 4.0*fad_m+5.0*h2o_m+5.0*coa_m+5.0*nad_m+odecoa_m --> 5.0*nadh_m+5.0*accoa_m+4.0*fadh2_m+5.0*h_m+occoa_m
		0	1000.0	;	# 482 3.0*fad_m+5.0*h2o_m+5.0*coa_m+5.0*nad_m+lnlccoa_m --> 5.0*nadh_m+5.0*accoa_m+3.0*fadh2_m+5.0*h_m+occoa_m
		0	1000.0	;	# 483 5.0*fad_m+9.0*h2o_m+arachdcoa_m+9.0*coa_m+9.0*nad_m --> 9.0*nadh_m+10.0*accoa_m+5.0*fadh2_m+9.0*h_m
		0	1000.0	;	# 484 3.0*fad_m+3.0*h2o_m+3.0*coa_m+3.0*nad_m+occoa_m --> 3.0*nadh_m+4.0*accoa_m+3.0*fadh2_m+3.0*h_m
		0	1000.0	;	# 485 malcoa_c+3.0*h_c+occoa_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+dcacoa_c+co2_c
		0	1000.0	;	# 486 malcoa_c+3.0*h_c+dcacoa_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+ddcacoa_c+co2_c
		0	1000.0	;	# 487 malcoa_c+ddcacoa_c+3.0*h_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+tdcoa_c+co2_c
		0	1000.0	;	# 488 malcoa_c+tdcoa_c+3.0*h_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+pmtcoa_c+co2_c
		0	1000.0	;	# 489 malcoa_c+pmtcoa_c+3.0*h_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+stcoa_c+co2_c
		0	1000.0	;	# 490 3.0*malcoa_c+accoa_c+9.0*h_c+6.0*nadph_c --> 3.0*h2o_c+6.0*nadp_c+3.0*coa_c+occoa_c+3.0*co2_c
		0	1000.0	;	# 491 na1_c+hdca_c --> na1_e+hdca_e
		0	1000.0	;	# 492 na1_e+hdca_e --> na1_c+hdca_c
		0	1000.0	;	# 493 na1_c+ocdcea_c --> na1_e+ocdcea_e
		0	1000.0	;	# 494 na1_e+ocdcea_e --> na1_c+ocdcea_c
		0	1000.0	;	# 495 na1_c+ocdca_c --> na1_e+ocdca_e
		0	1000.0	;	# 496 na1_e+ocdca_e --> na1_c+ocdca_c
		0	1000.0	;	# 497 na1_c+arachd_c --> na1_e+arachd_e
		0	1000.0	;	# 498 na1_e+arachd_e --> na1_c+arachd_c
		0	1000.0	;	# 499 fdp_c --> dhap_c+g3p_c
		0	1000.0	;	# 500 dhap_c+g3p_c --> fdp_c
		0	1000.0	;	# 501 f1p_c --> dhap_c+glyald_c
		0	1000.0	;	# 502 dhap_c+glyald_c --> f1p_c
		0	1000.0	;	# 503 h2o_c+fdp_c --> f6p_c+pi_c
		0	1000.0	;	# 504 h2o_c+f26bp_c --> f6p_c+pi_c
		0	1000.0	;	# 505 fe2_m+ppp9_m --> 2.0*h_m+pheme_m
		0	1000.0	;	# 506 fe2_e --> fe2_c
		0	1000.0	;	# 507 fe2_c+h_c --> fe2_m+h_m
		0	1000.0	;	# 508 4.0*atp_m+10fthf_m+4.0*glu_L_m --> 10fthf5glu_m+4.0*pi_m+4.0*h_m+4.0*adp_m
		0	1000.0	;	# 509 atp_m+10fthf5glu_m+glu_L_m --> 10fthf6glu_m+pi_m+h_m+adp_m
		0	1000.0	;	# 510 10fthf6glu_c+atp_c+glu_L_c --> pi_c+h_c+adp_c+10fthf7glu_c
		0	1000.0	;	# 511 atp_m+glu_L_m+10fthf6glu_m --> pi_m+h_m+adp_m+10fthf7glu_m
		0	1000.0	;	# 512 fru_e --> fru_c
		0	1000.0	;	# 513 fru_c --> fru_e
		0	1000.0	;	# 514 na1_e+fru_e --> na1_c+fru_c
		0	1000.0	;	# 515 na1_c+fru_c --> na1_e+fru_e
		0	1000.0	;	# 516 for_c+thf_c+atp_c --> 10fthf_c+pi_c+adp_c
		0	1000.0	;	# 517 10fthf_c+pi_c+adp_c --> for_c+thf_c+atp_c
		0	1000.0	;	# 518 h2o_c+4fumacac_c --> h_c+fum_c+acac_c
		0	1000.0	;	# 519 fum_c+so3_m --> so3_c+fum_m
		0	1000.0	;	# 520 so3_c+fum_m --> fum_c+so3_m
		0	1000.0	;	# 521 fum_c+tsul_m --> fum_m+tsul_c
		0	1000.0	;	# 522 fum_m+tsul_c --> fum_c+tsul_m
		0	1000.0	;	# 523 h2o_m+fum_m --> mal_L_m
		0	1000.0	;	# 524 mal_L_m --> h2o_m+fum_m
		0	1000.0	;	# 525 pi_m+fum_c --> pi_c+fum_m
		0	1000.0	;	# 526 pi_c+fum_m --> pi_m+fum_c
		0	1000.0	;	# 527 glyc3p_c+nad_c --> nadh_c+dhap_c+h_c
		0	1000.0	;	# 528 nadh_c+dhap_c+h_c --> glyc3p_c+nad_c
		0	1000.0	;	# 529 fad_m+glyc3p_c --> fadh2_m+dhap_c
		0	1000.0	;	# 530 glu5sa_m --> h2o_m+1pyr5c_m+h_m
		0	1000.0	;	# 531 h2o_m+1pyr5c_m+h_m --> glu5sa_m
		0	1000.0	;	# 532 nadp_c+g6p_c --> 6pgl_c+h_c+nadph_c
		0	1000.0	;	# 533 6pgl_c+h_c+nadph_c --> nadp_c+g6p_c
		0	1000.0	;	# 534 h2o_r+g6p_r --> pi_r+glc_D_r
		0	1000.0	;	# 535 g6p_c --> g6p_r
		0	1000.0	;	# 536 g6p_r --> g6p_c
		0	1000.0	;	# 537 amet_c+gudac_c --> h_c+creat_c+ahcys_c
		0	1000.0	;	# 538 h_c+creat_c+ahcys_c --> amet_c+gudac_c
		0	1000.0	;	# 539 atp_c+gal_c --> gal1p_c+h_c+adp_c
		0	1000.0	;	# 540 utp_c+gal1p_c+h_c --> udpgal_c+ppi_c
		0	1000.0	;	# 541 udpgal_c+ppi_c --> utp_c+gal1p_c+h_c
		0	1000.0	;	# 542 utp_c+h_c+g1p_c --> ppi_c+udpg_c
		0	1000.0	;	# 543 ppi_c+udpg_c --> utp_c+h_c+g1p_c
		0	1000.0	;	# 544 gal_e --> gal_c
		0	1000.0	;	# 545 gal_c --> gal_e
		0	1000.0	;	# 546 nad_c+pi_c+g3p_c --> nadh_c+13dpg_c+h_c
		0	1000.0	;	# 547 nadh_c+13dpg_c+h_c --> nad_c+pi_c+g3p_c
		0	1000.0	;	# 548 10fthf_c+gar_c --> thf_c+fgam_c+h_c
		0	1000.0	;	# 549 thf_c+fgam_c+h_c --> 10fthf_c+gar_c
		0	1000.0	;	# 550 4.0*h2o_l+10fthf5glu_l --> 10fthf_l+4.0*glu_L_l
		0	1000.0	;	# 551 h2o_l+10fthf6glu_l --> 10fthf5glu_l+glu_L_l
		0	1000.0	;	# 552 h2o_l+10fthf7glu_l --> glu_L_l+10fthf6glu_l
		0	1000.0	;	# 553 gluala_e --> 5oxpro_c+ala_L_c
		0	1000.0	;	# 554 Tyr_ggn_c+8.0*udpg_c --> 8.0*udp_c+8.0*h_c+ggn_c
		0	1000.0	;	# 555 h2o_r+leuktrC4_r --> glu_L_r+leuktrD4_r
		0	1000.0	;	# 556 glu_L_r+leuktrD4_r --> h2o_r+leuktrC4_r
		0	1000.0	;	# 557 glu_L_c+leuktrE4_c --> leuktrF4_c+h2o_c
		0	1000.0	;	# 558 leuktrF4_c+h2o_c --> glu_L_c+leuktrE4_c
		0	1000.0	;	# 559 ser_L_c+thf_c --> mlthf_c+h2o_c+gly_c
		0	1000.0	;	# 560 mlthf_c+h2o_c+gly_c --> ser_L_c+thf_c
		0	1000.0	;	# 561 atp_c+gmp_c --> gdp_c+adp_c
		0	1000.0	;	# 562 gdp_c+adp_c --> atp_c+gmp_c
		0	1000.0	;	# 563 glygn1_c --> glygn2_c
		0	1000.0	;	# 564 glcur_c --> glcur_r
		0	1000.0	;	# 565 glc_D_e --> glc_D_c
		0	1000.0	;	# 566 glc_D_c --> glc_D_e
		0	1000.0	;	# 567 glc_D_c --> glc_D_r
		0	1000.0	;	# 568 glc_D_r --> glc_D_c
		0	1000.0	;	# 569 h2o_c+dxtrn_c --> glc_D_c+glygn3_c
		0	1000.0	;	# 570 ggn_c+3.0*udpg_c --> 3.0*udp_c+3.0*h_c+glygn1_c
		0	1000.0	;	# 571 nh4_c+atp_c+glu_L_c --> gln_L_c+pi_c+h_c+adp_c
		0	1000.0	;	# 572 gln_L_c --> gln_L_m
		0	1000.0	;	# 573 glygn2_c+3.0*pi_c --> dxtrn_c+3.0*g1p_c
		0	1000.0	;	# 574 7.0*h2o_c+glygn3_c --> Tyr_ggn_c+7.0*glc_D_c
		0	1000.0	;	# 575 cys_L_c+atp_c+glu_L_c --> glucys_c+pi_c+h_c+adp_c
		0	1000.0	;	# 576 h_c+glu_L_c --> 4abut_c+co2_c
		0	1000.0	;	# 577 h2o_m+glu_L_m+nad_m --> nadh_m+nh4_m+h_m+akg_m
		0	1000.0	;	# 578 nadh_m+nh4_m+h_m+akg_m --> h2o_m+glu_L_m+nad_m
		0	1000.0	;	# 579 h2o_m+gln_L_m --> glu_L_m+nh4_m
		0	1000.0	;	# 580 gln_L_c+h2o_c+prpp_c --> ppi_c+pram_c+glu_L_c
		0	1000.0	;	# 581 fad_m+h_m+glutcoa_m --> b2coa_m+fadh2_m+co2_m
		0	1000.0	;	# 582 3.0*na1_e+glu_L_e+h_e+k_c --> 3.0*na1_c+h_c+glu_L_c+k_e
		0	1000.0	;	# 583 glu_L_l --> glu_L_c
		0	1000.0	;	# 584 glu_L_c --> glu_L_r
		0	1000.0	;	# 585 glu_L_r --> glu_L_c
		0	1000.0	;	# 586 gly_c+arg_L_c --> gudac_c+orn_c
		0	1000.0	;	# 587 gudac_c+orn_c --> gly_c+arg_L_c
		0	1000.0	;	# 588 2.0*na1_e+glyb_e --> 2.0*na1_c+glyb_c
		0	1000.0	;	# 589 2.0*na1_c+glyb_c --> 2.0*na1_e+glyb_e
		0	1000.0	;	# 590 glyc_c+atp_c --> glyc3p_c+h_c+adp_c
		0	1000.0	;	# 591 h2o_c+lgt_S_c --> lac_D_c+h_c+gthrd_c
		0	1000.0	;	# 592 2.0*h_c+gmp_c+nadph_c --> nadp_c+nh4_c+imp_c
		0	1000.0	;	# 593 nadp_c+6pgc_c --> co2_c+nadph_c+ru5p_D_c
		0	1000.0	;	# 594 h2o_c+g3pc_c --> chol_c+glyc3p_c+h_c
		0	1000.0	;	# 595 gsn_e --> gsn_c
		0	1000.0	;	# 596 gsn_c --> gsn_e
		0	1000.0	;	# 597 h_c+gthox_c+nadph_c --> nadp_c+2.0*gthrd_c
		0	1000.0	;	# 598 h_m+gthox_m+nadph_m --> nadp_m+2.0*gthrd_m
		0	1000.0	;	# 599 h2o2_c+2.0*gthrd_c --> 2.0*h2o_c+gthox_c
		0	1000.0	;	# 600 2.0*h2o_c+gthox_c --> h2o2_c+2.0*gthrd_c
		0	1000.0	;	# 601 h2o2_e+2.0*gthrd_e --> 2.0*h2o_e+gthox_e
		0	1000.0	;	# 602 2.0*h2o_e+gthox_e --> h2o2_e+2.0*gthrd_e
		0	1000.0	;	# 603 h2o2_m+2.0*gthrd_m --> 2.0*h2o_m+gthox_m
		0	1000.0	;	# 604 2.0*h2o_m+gthox_m --> h2o2_m+2.0*gthrd_m
		0	1000.0	;	# 605 gthrd_c --> gthrd_r
		0	1000.0	;	# 606 gthrd_r --> gthrd_c
		0	1000.0	;	# 607 atp_c+glucys_c+gly_c --> pi_c+h_c+adp_c+gthrd_c
		0	1000.0	;	# 608 ala_L_c+gthrd_c --> cgly_e+gluala_e
		0	1000.0	;	# 609 gtp_c --> 35cgmp_c+ppi_c
		0	1000.0	;	# 610 prpp_c+gua_c --> ppi_c+gmp_c
		0	1000.0	;	# 611 guln_c+nad_c --> nadh_c+h_c+3dhguln_c
		0	1000.0	;	# 612 nadh_c+h_c+3dhguln_c --> guln_c+nad_c
		0	1000.0	;	# 613 glcur_r+h_r+nadph_r --> nadp_r+guln_r
		0	1000.0	;	# 614 nadp_r+guln_r --> glcur_r+h_r+nadph_r
		0	1000.0	;	# 615 guln_r --> guln_c
		0	1000.0	;	# 616 h2o_c+co2_c --> h2co3_c
		0	1000.0	;	# 617 h2co3_c --> h2o_c+co2_c
		0	1000.0	;	# 618 hco3_c+h_c --> h2co3_c
		0	1000.0	;	# 619 h2co3_c --> hco3_c+h_c
		0	1000.0	;	# 620 h2o2_e --> h2o2_c
		0	1000.0	;	# 621 h2o2_c --> h2o2_e
		0	1000.0	;	# 622 h2o2_c --> h2o2_m
		0	1000.0	;	# 623 h2o2_m --> h2o2_c
		0	1000.0	;	# 624 h2o_c --> h2o_l
		0	1000.0	;	# 625 h2o_l --> h2o_c
		0	1000.0	;	# 626 h2o_c --> h2o_x
		0	1000.0	;	# 627 h2o_x --> h2o_c
		0	1000.0	;	# 628 nadh_m+h_m+aacoa_m --> nad_m+3hbcoa_m
		0	1000.0	;	# 629 nad_m+3hbcoa_m --> nadh_m+h_m+aacoa_m
		0	1000.0	;	# 630 nad_m+3hmbcoa_m --> nadh_m+h_m+2maacoa_m
		0	1000.0	;	# 631 nadh_m+h_m+2maacoa_m --> nad_m+3hmbcoa_m
		0	1000.0	;	# 632 h2o_m+co2_m --> hco3_m+h_m
		0	1000.0	;	# 633 hco3_m+h_m --> h2o_m+co2_m
		0	1000.0	;	# 634 cl_c+hco3_e --> hco3_c+cl_e
		0	1000.0	;	# 635 hco3_c+cl_e --> cl_c+hco3_e
		0	1000.0	;	# 636 na1_e+hco3_e --> na1_c+hco3_c
		0	1000.0	;	# 637 na1_c+hco3_c --> na1_e+hco3_e
		0	1000.0	;	# 638 atp_c+glc_D_c --> h_c+adp_c+g6p_c
		0	1000.0	;	# 639 atp_c+fru_c --> f6p_c+h_c+adp_c
		0	1000.0	;	# 640 o2_c+hgentis_c --> h_c+4mlacac_c
		0	1000.0	;	# 641 3hmp_m+nad_m --> nadh_m+h_m+2mop_m
		0	1000.0	;	# 642 nadh_m+h_m+2mop_m --> 3hmp_m+nad_m
		0	1000.0	;	# 643 h_c+his_L_c --> hista_c+co2_c
		0	1000.0	;	# 644 2.0*h2o_c+2.0*atp_c+3.0*hista_c --> 2.0*pi_c+2.0*h_c+2.0*adp_c+3.0*hista_e
		0	1000.0	;	# 645 na1_e+his_L_e --> na1_c+his_L_c
		0	1000.0	;	# 646 his_L_e --> his_L_c
		0	1000.0	;	# 647 h2o_c+4.0*ppbng_c --> 4.0*nh4_c+hmbil_c
		0	1000.0	;	# 648 hmgcoa_m --> acac_m+accoa_m
		0	1000.0	;	# 649 3.0*o2_c+5.0*h_c+pheme_c+3.0*nadph_c --> biliverd_c+3.0*h2o_c+3.0*nadp_c+fe2_c+co_c
		0	1000.0	;	# 650 4hphac_c --> 4hphac_e
		0	1000.0	;	# 651 4hphac_e --> 4hphac_c
		0	1000.0	;	# 652 12HPET_c+2.0*gthrd_c --> h2o_c+12harachd_c+gthox_c
		0	1000.0	;	# 653 h2o_c+12harachd_c+gthox_c --> 12HPET_c+2.0*gthrd_c
		0	1000.0	;	# 654 hxan_c+prpp_c --> ppi_c+imp_c
		0	1000.0	;	# 655 hxan_e --> hxan_c
		0	1000.0	;	# 656 hxan_c --> hxan_e
		0	1000.0	;	# 657 h_c --> h_r
		0	1000.0	;	# 658 h_r --> h_c
		0	1000.0	;	# 659 h_c --> h_x
		0	1000.0	;	# 660 h_x --> h_c
		0	1000.0	;	# 661 nad_m+icit_m --> nadh_m+co2_m+akg_m
		0	1000.0	;	# 662 nadh_m+co2_m+akg_m --> nad_m+icit_m
		0	1000.0	;	# 663 nadp_c+icit_c --> co2_c+akg_c+nadph_c
		0	1000.0	;	# 664 nadp_m+icit_m --> co2_m+akg_m+nadph_m
		0	1000.0	;	# 665 co2_m+akg_m+nadph_m --> nadp_m+icit_m
		0	1000.0	;	# 666 ile_L_c+akg_c --> 3mop_c+glu_L_c
		0	1000.0	;	# 667 3mop_c+glu_L_c --> ile_L_c+akg_c
		0	1000.0	;	# 668 na1_e+ile_L_e --> na1_c+ile_L_c
		0	1000.0	;	# 669 na1_c+ile_L_c --> na1_e+ile_L_e
		0	1000.0	;	# 670 ile_L_e --> ile_L_c
		0	1000.0	;	# 671 ile_L_c --> ile_L_e
		0	1000.0	;	# 672 h2o_c+imp_c --> fprica_c
		0	1000.0	;	# 673 fprica_c --> h2o_c+imp_c
		0	1000.0	;	# 674 h2o_c+nad_c+imp_c --> xmp_c+nadh_c+h_c
		0	1000.0	;	# 675 o2_c+inost_c --> glcur_c+h2o_c+h_c
		0	1000.0	;	# 676 na1_e+inost_e --> na1_c+inost_c
		0	1000.0	;	# 677 na1_c+inost_c --> na1_e+inost_e
		0	1000.0	;	# 678 2.0*na1_e+inost_e --> 2.0*na1_c+inost_c
		0	1000.0	;	# 679 2.0*na1_c+inost_c --> 2.0*na1_e+inost_e
		0	1000.0	;	# 680 7.0*malcoa_c+accoa_c+20.0*h_c+14.0*nadph_c --> 6.0*h2o_c+14.0*nadp_c+8.0*coa_c+hdca_c+7.0*co2_c
		0	1000.0	;	# 681 atp_c+fru_c --> f1p_c+h_c+adp_c
		0	1000.0	;	# 682 lac_L_e+h_e --> lac_L_c+h_c
		0	1000.0	;	# 683 lac_L_c+h_c --> lac_L_e+h_e
		0	1000.0	;	# 684 h_c+mthgxl_c+nadph_c --> lald_D_c+nadp_c
		0	1000.0	;	# 685 nadh_c+h_c+mthgxl_c --> lald_D_c+nad_c
		0	1000.0	;	# 686 h2o_c+lald_L_c+nad_c --> nadh_c+lac_L_c+2.0*h_c
		0	1000.0	;	# 687 h2o_c+lald_D_c+nad_c --> nadh_c+lac_D_c+2.0*h_c
		0	1000.0	;	# 688 nad_c+lac_D_c --> pyr_c+nadh_c+h_c
		0	1000.0	;	# 689 pyr_c+nadh_c+h_c --> nad_c+lac_D_c
		0	1000.0	;	# 690 nad_c+lac_L_c --> pyr_c+nadh_c+h_c
		0	1000.0	;	# 691 pyr_c+nadh_c+h_c --> nad_c+lac_L_c
		0	1000.0	;	# 692 leuktrA4_c --> leuktrA4_r
		0	1000.0	;	# 693 leuktrA4_r --> leuktrA4_c
		0	1000.0	;	# 694 leuktrD4_c --> leuktrD4_r
		0	1000.0	;	# 695 leuktrD4_r --> leuktrD4_c
		0	1000.0	;	# 696 leuktrF4_e --> leuktrF4_c
		0	1000.0	;	# 697 leuktrF4_c --> leuktrF4_e
		0	1000.0	;	# 698 na1_e+leu_L_e --> na1_c+leu_L_c
		0	1000.0	;	# 699 na1_c+leu_L_c --> na1_e+leu_L_e
		0	1000.0	;	# 700 mthgxl_c+gthrd_c --> lgt_S_c
		0	1000.0	;	# 701 crn_c+lnlccoa_c --> coa_c+lnlccrn_c
		0	1000.0	;	# 702 coa_m+lnlccrn_m --> crn_m+lnlccoa_m
		0	1000.0	;	# 703 lnlccrn_c --> lnlccrn_m
		0	1000.0	;	# 704 lnlc_e --> lnlc_c
		0	1000.0	;	# 705 lnlc_c --> lnlc_e
		0	1000.0	;	# 706 o2_m+focytC_m --> o2s_m+ficytC_m
		0	1000.0	;	# 707 leuktrA4_r+gthrd_r --> leuktrC4_r
		0	1000.0	;	# 708 h2o_c+leuktrD4_c --> gly_c+leuktrE4_c
		0	1000.0	;	# 709 gly_c+leuktrE4_c --> h2o_c+leuktrD4_c
		0	1000.0	;	# 710 trp_L_c+h_c --> co2_c+trypta_c
		0	1000.0	;	# 711 na1_e+lys_L_e --> na1_c+lys_L_c
		0	1000.0	;	# 712 lys_L_e --> lys_L_c
		0	1000.0	;	# 713 lys_L_c+h_m --> lys_L_m+h_c
		0	1000.0	;	# 714 lys_L_m+h_c --> lys_L_c+h_m
		0	1000.0	;	# 715 4mlacac_c --> 4fumacac_c
		0	1000.0	;	# 716 mal_L_c+so3_m --> mal_L_m+so3_c
		0	1000.0	;	# 717 mal_L_m+so3_c --> mal_L_c+so3_m
		0	1000.0	;	# 718 mal_L_c+tsul_m --> mal_L_m+tsul_c
		0	1000.0	;	# 719 mal_L_m+tsul_c --> mal_L_c+tsul_m
		0	1000.0	;	# 720 mal_L_c+pi_m --> mal_L_m+pi_c
		0	1000.0	;	# 721 mal_L_m+pi_c --> mal_L_c+pi_m
		0	1000.0	;	# 722 atp_m+hco3_m+3mb2coa_m --> 3mgcoa_m+pi_m+h_m+adp_m
		0	1000.0	;	# 723 3mgcoa_m+pi_m+h_m+adp_m --> atp_m+hco3_m+3mb2coa_m
		0	1000.0	;	# 724 cyan_c+mercppyr_c --> pyr_c+tcynt_c+h_c
		0	1000.0	;	# 725 mal_L_c+nad_c --> nadh_c+oaa_c+h_c
		0	1000.0	;	# 726 nadh_c+oaa_c+h_c --> mal_L_c+nad_c
		0	1000.0	;	# 727 mal_L_m+nad_m --> nadh_m+oaa_m+h_m
		0	1000.0	;	# 728 nadh_m+oaa_m+h_m --> mal_L_m+nad_m
		0	1000.0	;	# 729 mal_L_m+nad_m --> nadh_m+pyr_m+co2_m
		0	1000.0	;	# 730 mal_L_m+nadp_m --> pyr_m+co2_m+nadph_m
		0	1000.0	;	# 731 h2o_c+atp_c+met_L_c --> amet_c+ppi_c+pi_c
		0	1000.0	;	# 732 leu_L_c+met_L_e --> leu_L_e+met_L_c
		0	1000.0	;	# 733 leu_L_e+met_L_c --> leu_L_c+met_L_e
		0	1000.0	;	# 734 na1_e+met_L_e --> na1_c+met_L_c
		0	1000.0	;	# 735 na1_c+met_L_c --> na1_e+met_L_e
		0	1000.0	;	# 736 met_L_e --> met_L_c
		0	1000.0	;	# 737 met_L_c --> met_L_e
		0	1000.0	;	# 738 h2o_m+3mgcoa_m --> hmgcoa_m
		0	1000.0	;	# 739 hmgcoa_m --> h2o_m+3mgcoa_m
		0	1000.0	;	# 740 dhap_c --> pi_c+mthgxl_c
		0	1000.0	;	# 741 g3p_c --> pi_c+mthgxl_c
		0	1000.0	;	# 742 h2o_c+mi145p_c --> pi_c+mi14p_c
		0	1000.0	;	# 743 h2o_c+mi14p_c --> mi4p_D_c+pi_c
		0	1000.0	;	# 744 mi1p_D_c+h2o_c --> inost_c+pi_c
		0	1000.0	;	# 745 h2o_c+mi4p_D_c --> inost_c+pi_c
		0	1000.0	;	# 746 mmcoa_R_m --> mmcoa_S_m
		0	1000.0	;	# 747 mmcoa_S_m --> mmcoa_R_m
		0	1000.0	;	# 748 mmcoa_R_m --> succoa_m
		0	1000.0	;	# 749 succoa_m --> mmcoa_R_m
		0	1000.0	;	# 750 coa_m+nad_m+msa_m --> nadh_m+accoa_m+co2_m
		0	1000.0	;	# 751 coa_m+nad_m+2mop_m --> nadh_m+mmcoa_R_m+h_m
		0	1000.0	;	# 752 h2o_c+methf_c --> 10fthf_c+h_c
		0	1000.0	;	# 753 10fthf_c+h_c --> h2o_c+methf_c
		0	1000.0	;	# 754 h2o_m+methf_m --> 10fthf_m+h_m
		0	1000.0	;	# 755 10fthf_m+h_m --> h2o_m+methf_m
		0	1000.0	;	# 756 mlthf_c+nadp_c --> methf_c+nadph_c
		0	1000.0	;	# 757 methf_c+nadph_c --> mlthf_c+nadp_c
		0	1000.0	;	# 758 nad_m+mlthf_m --> nadh_m+methf_m
		0	1000.0	;	# 759 nadh_m+methf_m --> nad_m+mlthf_m
		0	1000.0	;	# 760 nadp_m+mlthf_m --> methf_m+nadph_m
		0	1000.0	;	# 761 methf_m+nadph_m --> nadp_m+mlthf_m
		0	1000.0	;	# 762 mlthf_c+2.0*h_c+nadph_c --> nadp_c+5mthf_c
		0	1000.0	;	# 763 nadh_m+5.0*h_m+q10_m --> nad_m+4.0*h_c+q10h2_m
		0	1000.0	;	# 764 h2o_c+nad_c --> adprib_c+ncam_c+h_c
		0	1000.0	;	# 765 h2o_e+nad_e --> adprib_e+ncam_e+h_e
		0	1000.0	;	# 766 nadph_c --> nadph_r
		0	1000.0	;	# 767 nadp_r --> nadp_c
		0	1000.0	;	# 768 h2o_e+gdp_e --> pi_e+h_e+gmp_e
		0	1000.0	;	# 769 gdp_c+atp_c --> gtp_c+adp_c
		0	1000.0	;	# 770 gtp_c+adp_c --> gdp_c+atp_c
		0	1000.0	;	# 771 atp_m+gdp_m --> gtp_m+adp_m
		0	1000.0	;	# 772 gtp_m+adp_m --> atp_m+gdp_m
		0	1000.0	;	# 773 atp_c+udp_c --> utp_c+adp_c
		0	1000.0	;	# 774 utp_c+adp_c --> atp_c+udp_c
		0	1000.0	;	# 775 atp_c+cdp_c --> ctp_c+adp_c
		0	1000.0	;	# 776 ctp_c+adp_c --> atp_c+cdp_c
		0	1000.0	;	# 777 nmn_c+atp_c+h_c --> ppi_c+nad_c
		0	1000.0	;	# 778 ppi_c+nad_c --> nmn_c+atp_c+h_c
		0	1000.0	;	# 779 amet_c+nrpphr_c --> h_c+adrnl_c+ahcys_c
		0	1000.0	;	# 780 o2_c+h_c+arg_L_c+nadph_c --> h2o_c+nwharg_c+nadp_c
		0	1000.0	;	# 781 2.0*o2_c+2.0*nwharg_c+nadph_c --> 2.0*h2o_c+nadp_c+2.0*no_c+2.0*citr_L_c+h_c
		0	1000.0	;	# 782 no_e --> no_c
		0	1000.0	;	# 783 no_c --> no_e
		0	1000.0	;	# 784 nrpphrsf_c --> nrpphrsf_e
		0	1000.0	;	# 785 nrpphr_c+paps_c --> pap_c+nrpphrsf_c+h_c
		0	1000.0	;	# 786 h2o_c+xmp_c --> xtsn_c+pi_c
		0	1000.0	;	# 787 h2o_c+imp_c --> ins_c+pi_c
		0	1000.0	;	# 788 ump_c+h2o_c --> uri_c+pi_c
		0	1000.0	;	# 789 cmp_c+h2o_c --> pi_c+cytd_c
		0	1000.0	;	# 790 h2o_e+amp_e --> pi_e+adn_e
		0	1000.0	;	# 791 h2o_e+gmp_e --> gsn_e+pi_e
		0	1000.0	;	# 792 3.0*na1_c+h2o_c+atp_c+2.0*k_e --> 3.0*na1_e+pi_c+h_c+adp_c+2.0*k_c
		0	1000.0	;	# 793 o2s_c --> o2s_e
		0	1000.0	;	# 794 o2s_e --> o2s_c
		0	1000.0	;	# 795 o2s_c --> o2s_m
		0	1000.0	;	# 796 o2s_m --> o2s_c
		0	1000.0	;	# 797 o2s_c --> o2s_x
		0	1000.0	;	# 798 o2s_x --> o2s_c
		0	1000.0	;	# 799 o2_e --> o2_c
		0	1000.0	;	# 800 o2_c --> o2_e
		0	1000.0	;	# 801 o2_c --> o2_r
		0	1000.0	;	# 802 o2_r --> o2_c
		0	1000.0	;	# 803 o2_c --> o2_m
		0	1000.0	;	# 804 o2_m --> o2_c
		0	1000.0	;	# 805 cbp_m+orn_m --> pi_m+citr_L_m+h_m
		0	1000.0	;	# 806 ocdca_e --> ocdca_c
		0	1000.0	;	# 807 ocdca_c --> ocdca_e
		0	1000.0	;	# 808 ocdcea_e --> ocdcea_c
		0	1000.0	;	# 809 ocdcea_c --> ocdcea_e
		0	1000.0	;	# 810 acac_m+succoa_m --> succ_m+aacoa_m
		0	1000.0	;	# 811 succ_m+aacoa_m --> acac_m+succoa_m
		0	1000.0	;	# 812 4mop_m+coa_m+nad_m --> nadh_m+ivcoa_m+co2_m
		0	1000.0	;	# 813 coa_m+nad_m+3mob_m --> nadh_m+ibcoa_m+co2_m
		0	1000.0	;	# 814 coa_m+nad_m+3mop_m --> nadh_m+co2_m+2mbcoa_m
		0	1000.0	;	# 815 2.0*h2o_c+5oxpro_c+atp_c --> pi_c+h_c+glu_L_c+adp_c
		0	1000.0	;	# 816 akg_m+orn_m --> glu_L_m+glu5sa_m
		0	1000.0	;	# 817 glu_L_m+glu5sa_m --> akg_m+orn_m
		0	1000.0	;	# 818 h_c+orn_m --> h_m+orn_c
		0	1000.0	;	# 819 h_m+orn_c --> h_c+orn_m
		0	1000.0	;	# 820 citr_L_c+h_c+orn_m --> citr_L_m+h_m+orn_c
		0	1000.0	;	# 821 citr_L_m+h_m+orn_c --> citr_L_c+h_c+orn_m
		0	1000.0	;	# 822 orn_e --> orn_c
		0	1000.0	;	# 823 1pyr5c_m+2.0*h_m+nadph_m --> pro_L_m+nadp_m
		0	1000.0	;	# 824 nadh_m+1pyr5c_m+2.0*h_m --> pro_L_m+nad_m
		0	1000.0	;	# 825 pac_c+coa_c+atp_c --> phaccoa_c+ppi_c+amp_c
		0	1000.0	;	# 826 h2o_c+camp_c --> h_c+amp_c
		0	1000.0	;	# 827 35cgmp_c+h2o_c --> h_c+gmp_c
		0	1000.0	;	# 828 coa_m+nad_m+pyr_m --> nadh_m+accoa_m+co2_m
		0	1000.0	;	# 829 o2_c+h2o_c+peamn_c --> h2o2_c+nh4_c+pacald_c
		0	1000.0	;	# 830 f6p_c+atp_c --> h_c+adp_c+fdp_c
		0	1000.0	;	# 831 f6p_c+atp_c --> h_c+adp_c+f26bp_c
		0	1000.0	;	# 832 prostgh2_c --> prostgd2_c
		0	1000.0	;	# 833 prostgd2_c --> prostgh2_c
		0	1000.0	;	# 834 g6p_c --> f6p_c
		0	1000.0	;	# 835 f6p_c --> g6p_c
		0	1000.0	;	# 836 atp_c+3pg_c --> 13dpg_c+adp_c
		0	1000.0	;	# 837 13dpg_c+adp_c --> atp_c+3pg_c
		0	1000.0	;	# 838 h2o_c+6pgl_c --> 6pgc_c+h_c
		0	1000.0	;	# 839 2pg_c --> 3pg_c
		0	1000.0	;	# 840 3pg_c --> 2pg_c
		0	1000.0	;	# 841 g1p_c --> g6p_c
		0	1000.0	;	# 842 g6p_c --> g1p_c
		0	1000.0	;	# 843 2.0*o2_c+h_c+arachd_c+nadph_c --> h2o_c+prostgh2_c+nadp_c
		0	1000.0	;	# 844 2.0*o2_c+h_c+arachd_c --> prostgg2_c
		0	1000.0	;	# 845 prostgg2_c+nadph_c --> h2o_c+prostgh2_c+nadp_c
		0	1000.0	;	# 846 2.0*o2_r+h_r+arachd_r+nadph_r --> h2o_r+nadp_r+prostgh2_r
		0	1000.0	;	# 847 gln_L_c+phaccoa_c --> coa_c+pheacgln_c
		0	1000.0	;	# 848 pheacgln_c --> pheacgln_e
		0	1000.0	;	# 849 pheacgln_e --> pheacgln_c
		0	1000.0	;	# 850 pheme_e --> pheme_c
		0	1000.0	;	# 851 pheme_c --> pheme_e
		0	1000.0	;	# 852 pheme_m --> pheme_c
		0	1000.0	;	# 853 pheme_c --> pheme_m
		0	1000.0	;	# 854 na1_e+phe_L_e --> na1_c+phe_L_c
		0	1000.0	;	# 855 na1_c+phe_L_c --> na1_e+phe_L_e
		0	1000.0	;	# 856 phe_L_e --> phe_L_c
		0	1000.0	;	# 857 phe_L_c --> phe_L_e
		0	1000.0	;	# 858 phe_L_c+h_c --> peamn_c+co2_c
		0	1000.0	;	# 859 pi_c+2.0*h_c --> pi_m+2.0*h_m
		0	1000.0	;	# 860 pi_m+2.0*h_m --> pi_c+2.0*h_c
		0	1000.0	;	# 861 pi_r --> pi_c
		0	1000.0	;	# 862 pi_c --> pi_r
		0	1000.0	;	# 863 rnam_c+pi_c --> ncam_c+r1p_c+h_c
		0	1000.0	;	# 864 ncam_c+r1p_c+h_c --> rnam_c+pi_c
		0	1000.0	;	# 865 h2o_c+ppi_c --> 2.0*pi_c+h_c
		0	1000.0	;	# 866 2.0*5aop_c --> 2.0*h2o_c+ppbng_c+h_c
		0	1000.0	;	# 867 atp_m+hco3_m+ppcoa_m --> pi_m+h_m+adp_m+mmcoa_S_m
		0	1000.0	;	# 868 lald_D_c+nadh_c+h_c --> nad_c+12ppd_R_c
		0	1000.0	;	# 869 nad_c+12ppd_R_c --> lald_D_c+nadh_c+h_c
		0	1000.0	;	# 870 lald_D_c+h_c+nadph_c --> nadp_c+12ppd_R_c
		0	1000.0	;	# 871 r1p_c --> r5p_c
		0	1000.0	;	# 872 r5p_c --> r1p_c
		0	1000.0	;	# 873 pppg9_c --> pppg9_m
		0	1000.0	;	# 874 pppg9_m --> pppg9_c
		0	1000.0	;	# 875 3.0*o2_m+2.0*pppg9_m --> 6.0*h2o_m+2.0*ppp9_m
		0	1000.0	;	# 876 pram_c+atp_c+gly_c --> pi_c+gar_c+h_c+adp_c
		0	1000.0	;	# 877 pi_c+gar_c+h_c+adp_c --> pram_c+atp_c+gly_c
		0	1000.0	;	# 878 atp_c+fpram_c --> pi_c+2.0*h_c+adp_c+air_c
		0	1000.0	;	# 879 5aizc_c+atp_c+asp_L_c --> pi_c+h_c+adp_c+25aics_c
		0	1000.0	;	# 880 pi_c+h_c+adp_c+25aics_c --> 5aizc_c+atp_c+asp_L_c
		0	1000.0	;	# 881 h2o2_c+meoh_c --> fald_c+2.0*h2o_c
		0	1000.0	;	# 882 gln_L_c+h2o_c+fgam_c+atp_c --> pi_c+h_c+glu_L_c+adp_c+fpram_c
		0	1000.0	;	# 883 hco3_c+prostgd2_e --> hco3_e+prostgd2_c
		0	1000.0	;	# 884 hco3_e+prostgd2_c --> hco3_c+prostgd2_e
		0	1000.0	;	# 885 2.0*na1_e+pro_L_e --> 2.0*na1_c+pro_L_c
		0	1000.0	;	# 886 2.0*na1_c+pro_L_c --> 2.0*na1_e+pro_L_e
		0	1000.0	;	# 887 pro_L_c --> pro_L_m
		0	1000.0	;	# 888 pro_L_m --> pro_L_c
		0	1000.0	;	# 889 atp_c+r5p_c --> prpp_c+h_c+amp_c
		0	1000.0	;	# 890 prpp_c+h_c+amp_c --> atp_c+r5p_c
		0	1000.0	;	# 891 adn_c+pi_c --> r1p_c+ade_c
		0	1000.0	;	# 892 r1p_c+ade_c --> adn_c+pi_c
		0	1000.0	;	# 893 dad_2_c+pi_c --> 2dr1p_c+ade_c
		0	1000.0	;	# 894 2dr1p_c+ade_c --> dad_2_c+pi_c
		0	1000.0	;	# 895 pi_c+gsn_c --> gua_c+r1p_c
		0	1000.0	;	# 896 gua_c+r1p_c --> pi_c+gsn_c
		0	1000.0	;	# 897 ins_c+pi_c --> hxan_c+r1p_c
		0	1000.0	;	# 898 hxan_c+r1p_c --> ins_c+pi_c
		0	1000.0	;	# 899 pi_c+din_c --> hxan_c+2dr1p_c
		0	1000.0	;	# 900 hxan_c+2dr1p_c --> pi_c+din_c
		0	1000.0	;	# 901 xtsn_c+pi_c --> r1p_c+xan_c
		0	1000.0	;	# 902 r1p_c+xan_c --> xtsn_c+pi_c
		0	1000.0	;	# 903 pep_c+h_c+adp_c --> pyr_c+atp_c
		0	1000.0	;	# 904 uri_c+pi_c --> ura_c+r1p_c
		0	1000.0	;	# 905 ura_c+r1p_c --> uri_c+pi_c
		0	1000.0	;	# 906 pyr_e+h_e --> pyr_c+h_c
		0	1000.0	;	# 907 pyr_c+h_c --> pyr_e+h_e
		0	1000.0	;	# 908 rnam_c+atp_c --> nmn_c+h_c+adp_c
		0	1000.0	;	# 909 r5p_c --> ru5p_D_c
		0	1000.0	;	# 910 ru5p_D_c --> r5p_c
		0	1000.0	;	# 911 lys_L_m+h_m+akg_m+nadph_m --> h2o_m+nadp_m+saccrp_L_m
		0	1000.0	;	# 912 h2o_m+nadp_m+saccrp_L_m --> L2aadp6sa_m+glu_L_m+h_m+nadph_m
		0	1000.0	;	# 913 so4_c+atp_c+h_c --> ppi_c+aps_c
		0	1000.0	;	# 914 fad_m+sarcs_m+thf_m --> mlthf_m+gly_m+fadh2_m
		0	1000.0	;	# 915 nad_c+sbt_D_c --> nadh_c+fru_c+h_c
		0	1000.0	;	# 916 glc_D_c+h_c+nadph_c --> nadp_c+sbt_D_c
		0	1000.0	;	# 917 gln_L_c+ser_L_e --> gln_L_e+ser_L_c
		0	1000.0	;	# 918 gln_L_e+ser_L_c --> gln_L_c+ser_L_e
		0	1000.0	;	# 919 h2o_c+Sfglutth_c --> for_c+h_c+gthrd_c
		0	1000.0	;	# 920 for_c+h_c+gthrd_c --> h2o_c+Sfglutth_c
		0	1000.0	;	# 921 h2o_c+spc_hs_c --> sphings_c+cholp_c+h_c
		0	1000.0	;	# 922 2.0*so4_e+cl_c --> 2.0*so4_c+cl_e
		0	1000.0	;	# 923 2.0*so4_c+cl_e --> 2.0*so4_e+cl_c
		0	1000.0	;	# 924 so4_e+2.0*hco3_c --> so4_c+2.0*hco3_e
		0	1000.0	;	# 925 so4_c+2.0*hco3_e --> so4_e+2.0*hco3_c
		0	1000.0	;	# 926 2.0*na1_e+so4_e --> 2.0*na1_c+so4_c
		0	1000.0	;	# 927 2.0*na1_c+so4_c --> 2.0*na1_e+so4_e
		0	1000.0	;	# 928 3.0*na1_e+so4_e --> 3.0*na1_c+so4_c
		0	1000.0	;	# 929 3.0*na1_c+so4_c --> 3.0*na1_e+so4_e
		0	1000.0	;	# 930 spc_hs_c --> spc_hs_e
		0	1000.0	;	# 931 spc_hs_e --> spc_hs_c
		0	1000.0	;	# 932 sphings_c+atp_c --> h_c+adp_c+sphs1p_c
		0	1000.0	;	# 933 sphs1p_c --> sphs1p_e
		0	1000.0	;	# 934 sphs1p_e --> sphs1p_c
		0	1000.0	;	# 935 2.0*o2s_c+2.0*h_c --> o2_c+h2o2_c
		0	1000.0	;	# 936 2.0*o2s_m+2.0*h_m --> o2_m+h2o2_m
		0	1000.0	;	# 937 2.0*o2s_x+2.0*h_x --> o2_x+h2o2_x
		0	1000.0	;	# 938 2.0*na1_e+srtn_e+2.0*k_c --> 2.0*na1_c+srtn_c+2.0*k_e
		0	1000.0	;	# 939 2.0*na1_c+srtn_c+2.0*k_e --> 2.0*na1_e+srtn_e+2.0*k_c
		0	1000.0	;	# 940 h2o_m+nad_m+sucsal_m --> nadh_m+2.0*h_m+succ_m
		0	1000.0	;	# 941 h2o_c+estrones_c --> so4_c+estrone_c+h_c
		0	1000.0	;	# 942 pi_m+succ_c --> pi_c+succ_m
		0	1000.0	;	# 943 pi_c+succ_m --> pi_m+succ_c
		0	1000.0	;	# 944 2.0*na1_e+succ_e --> 2.0*na1_c+succ_c
		0	1000.0	;	# 945 2.0*na1_c+succ_c --> 2.0*na1_e+succ_e
		0	1000.0	;	# 946 3.0*na1_e+succ_e --> 3.0*na1_c+succ_c
		0	1000.0	;	# 947 3.0*na1_c+succ_c --> 3.0*na1_e+succ_e
		0	1000.0	;	# 948 fad_m+succ_m --> fadh2_m+fum_m
		0	1000.0	;	# 949 fadh2_m+fum_m --> fad_m+succ_m
		0	1000.0	;	# 950 gtp_m+coa_m+succ_m --> gdp_m+pi_m+succoa_m
		0	1000.0	;	# 951 gdp_m+pi_m+succoa_m --> gtp_m+coa_m+succ_m
		0	1000.0	;	# 952 h2o_c+so3_c+2.0*ficytC_m --> so4_c+2.0*focytC_m+2.0*h_c
		0	1000.0	;	# 953 s7p_c+g3p_c --> f6p_c+e4p_c
		0	1000.0	;	# 954 f6p_c+e4p_c --> s7p_c+g3p_c
		0	1000.0	;	# 955 tcynt_c --> tcynt_e
		0	1000.0	;	# 956 tcynt_m --> tcynt_c
		0	1000.0	;	# 957 thbpt4acam_c --> h2o_c+dhbpt_c
		0	1000.0	;	# 958 thf_c --> thf_m
		0	1000.0	;	# 959 thf_m --> thf_c
		0	1000.0	;	# 960 na1_e+thymd_e --> na1_c+thymd_c
		0	1000.0	;	# 961 2.0*na1_e+thymd_e --> 2.0*na1_c+thymd_c
		0	1000.0	;	# 962 thymd_e --> thymd_c
		0	1000.0	;	# 963 thym_e --> thym_c
		0	1000.0	;	# 964 thym_c --> thym_e
		0	1000.0	;	# 965 xu5p_D_c+r5p_c --> s7p_c+g3p_c
		0	1000.0	;	# 966 s7p_c+g3p_c --> xu5p_D_c+r5p_c
		0	1000.0	;	# 967 xu5p_D_c+e4p_c --> f6p_c+g3p_c
		0	1000.0	;	# 968 f6p_c+g3p_c --> xu5p_D_c+e4p_c
		0	1000.0	;	# 969 thymd_c+pi_c --> 2dr1p_c+thym_c
		0	1000.0	;	# 970 2dr1p_c+thym_c --> thymd_c+pi_c
		0	1000.0	;	# 971 dhap_c --> g3p_c
		0	1000.0	;	# 972 g3p_c --> dhap_c
		0	1000.0	;	# 973 atp_c+glyald_c --> h_c+adp_c+g3p_c
		0	1000.0	;	# 974 trp_L_c+o2_c+thbpt_c --> 5htrp_c+thbpt4acam_c
		0	1000.0	;	# 975 trp_L_e --> trp_L_c
		0	1000.0	;	# 976 trp_L_c --> trp_L_e
		0	1000.0	;	# 977 trp_L_e+na1_e --> trp_L_c+na1_c
		0	1000.0	;	# 978 trp_L_c+na1_c --> trp_L_e+na1_e
		0	1000.0	;	# 979 o2_c+h2o_c+trypta_c --> h2o2_c+nh4_c+id3acald_c
		0	1000.0	;	# 980 3.0*na1_e+tsul_e --> 3.0*na1_c+tsul_c
		0	1000.0	;	# 981 3.0*na1_c+tsul_c --> 3.0*na1_e+tsul_e
		0	1000.0	;	# 982 txa2_e --> txa2_c
		0	1000.0	;	# 983 txa2_c --> txa2_e
		0	1000.0	;	# 984 txa2_c --> txa2_r
		0	1000.0	;	# 985 txa2_r --> txa2_c
		0	1000.0	;	# 986 prostgh2_r --> txa2_r
		0	1000.0	;	# 987 txa2_c+h2o_c+h_c --> txb2_c
		0	1000.0	;	# 988 tymsf_c --> tymsf_e
		0	1000.0	;	# 989 paps_c+tym_c --> pap_c+tymsf_c+h_c
		0	1000.0	;	# 990 o2_c+thbpt_c+tyr_L_c --> thbpt4acam_c+34dhphe_c
		0	1000.0	;	# 991 tyr_L_c+h_c --> tym_c+co2_c
		0	1000.0	;	# 992 o2_c+2.0*tyr_L_c --> 2.0*34dhphe_c
		0	1000.0	;	# 993 o2_c+h2o_c+tym_c --> h2o2_c+nh4_c+4hoxpacd_c
		0	1000.0	;	# 994 tyr_L_c+akg_c --> 34hpp_c+glu_L_c
		0	1000.0	;	# 995 34hpp_c+glu_L_c --> tyr_L_c+akg_c
		0	1000.0	;	# 996 tyr_L_e --> tyr_L_c
		0	1000.0	;	# 997 tyr_L_c --> tyr_L_e
		0	1000.0	;	# 998 na1_e+tyr_L_e --> na1_c+tyr_L_c
		0	1000.0	;	# 999 na1_c+tyr_L_c --> na1_e+tyr_L_e
		0	1000.0	;	# 1000 udpg_c --> udpgal_c
		0	1000.0	;	# 1001 udpgal_c --> udpg_c
		0	1000.0	;	# 1002 gal1p_c+udpg_c --> udpgal_c+g1p_c
		0	1000.0	;	# 1003 udpgal_c+g1p_c --> gal1p_c+udpg_c
		0	1000.0	;	# 1004 ump_c+atp_c --> udp_c+adp_c
		0	1000.0	;	# 1005 udp_c+adp_c --> ump_c+atp_c
		0	1000.0	;	# 1006 ump_c+ctp_c --> cdp_c+udp_c
		0	1000.0	;	# 1007 cdp_c+udp_c --> ump_c+ctp_c
		0	1000.0	;	# 1008 ump_c+utp_c --> 2.0*udp_c
		0	1000.0	;	# 1009 2.0*udp_c --> ump_c+utp_c
		0	1000.0	;	# 1010 ump_c+gtp_c --> gdp_c+udp_c
		0	1000.0	;	# 1011 gdp_c+udp_c --> ump_c+gtp_c
		0	1000.0	;	# 1012 hmbil_c --> h2o_c+uppg3_c
		0	1000.0	;	# 1013 uppg3_c+4.0*h_c --> 4.0*co2_c+cpppg3_c
		0	1000.0	;	# 1014 h2o_c+2.0*h_c+cala_c --> ala_B_c+nh4_c+co2_c
		0	1000.0	;	# 1015 urate_c --> urate_e
		0	1000.0	;	# 1016 urate_e --> urate_c
		0	1000.0	;	# 1017 urate_x --> urate_c
		0	1000.0	;	# 1018 urate_c --> urate_x
		0	1000.0	;	# 1019 ura_e --> ura_c
		0	1000.0	;	# 1020 ura_c --> ura_e
		0	1000.0	;	# 1021 urea_e --> urea_c
		0	1000.0	;	# 1022 urea_c --> urea_e
		0	1000.0	;	# 1023 urea_e+h2o_e --> urea_c+h2o_c
		0	1000.0	;	# 1024 urea_c+h2o_c --> urea_e+h2o_e
		0	1000.0	;	# 1025 uri_c+atp_c --> ump_c+h_c+adp_c
		0	1000.0	;	# 1026 uri_e --> uri_c
		0	1000.0	;	# 1027 uri_c --> uri_e
		0	1000.0	;	# 1028 uri_e+na1_e --> uri_c+na1_c
		0	1000.0	;	# 1029 uri_c+na1_c --> uri_e+na1_e
		0	1000.0	;	# 1030 uri_e+2.0*na1_e --> uri_c+2.0*na1_c
		0	1000.0	;	# 1031 uri_c+2.0*na1_c --> uri_e+2.0*na1_e
		0	1000.0	;	# 1032 val_L_c+akg_c --> 3mob_c+glu_L_c
		0	1000.0	;	# 1033 3mob_c+glu_L_c --> val_L_c+akg_c
		0	1000.0	;	# 1034 val_L_e+na1_e --> val_L_c+na1_c
		0	1000.0	;	# 1035 val_L_c+na1_c --> val_L_e+na1_e
		0	1000.0	;	# 1036 val_L_e --> val_L_c
		0	1000.0	;	# 1037 val_L_c --> val_L_e
		0	1000.0	;	# 1038 xan_c --> xan_x
		0	1000.0	;	# 1039 xan_x --> xan_c
		0	1000.0	;	# 1040 o2_x+h2o_x+xan_x --> h2o2_x+urate_x
		0	1000.0	;	# 1041 h2o2_x+urate_x --> o2_x+h2o_x+xan_x
		0	1000.0	;	# 1042 atp_c+xylu_D_c --> xu5p_D_c+h_c+adp_c
		0	1000.0	;	# 1043 xylt_c+nad_c --> nadh_c+h_c+xylu_D_c
		0	1000.0	;	# 1044 nadh_c+h_c+xylu_D_c --> xylt_c+nad_c
		0	1000.0	;	# 1045 h_c+nadph_c+xylu_L_c --> nadp_c+xylt_c
		0	1000.0	;	# 1046 nadp_c+xylt_c --> h_c+nadph_c+xylu_L_c
		0	1000.0	;	# 1047 etha_c --> []
		0	1000.0	;	# 1048 [] --> etha_c
		0	1000.0	;	# 1049 3mob_c --> []
		0	1000.0	;	# 1050 [] --> 3mob_c
		0	1000.0	;	# 1051 5oxpro_c --> []
		0	1000.0	;	# 1052 [] --> 5oxpro_c
		0	1000.0	;	# 1053 acrn_c --> []
		0	1000.0	;	# 1054 [] --> acrn_c
		0	1000.0	;	# 1055 ahcys_c --> []
		0	1000.0	;	# 1056 [] --> ahcys_c
		0	1000.0	;	# 1057 cdpea_c --> []
		0	1000.0	;	# 1058 [] --> cdpea_c
		0	1000.0	;	# 1059 cholp_c --> []
		0	1000.0	;	# 1060 [] --> cholp_c
		0	1000.0	;	# 1061 citr_L_c --> []
		0	1000.0	;	# 1062 [] --> citr_L_c
		0	1000.0	;	# 1063 fum_c --> []
		0	1000.0	;	# 1064 [] --> fum_c
		0	1000.0	;	# 1065 pmtcrn_c --> []
		0	1000.0	;	# 1066 [] --> pmtcrn_c
		0	1000.0	;	# 1067 glyc3p_c+pmtcoa_c --> coa_c+alpha_hs_16_0_c
		0	1000.0	;	# 1068 h2o_c+mag_hs_16_0_c --> glyc_c+hdca_c+h_c
		0	1000.0	;	# 1069 h2o_c+lpchol_hs_16_0_c --> hdca_c+h_c+g3pc_c
		0	1000.0	;	# 1070 glyc3p_c+stcoa_c --> coa_c+alpha_hs_18_0_c
		0	1000.0	;	# 1071 h2o_c+mag_hs_18_0_c --> glyc_c+h_c+ocdca_c
		0	1000.0	;	# 1072 h2o_c+lpchol_hs_18_0_c --> h_c+ocdca_c+g3pc_c
		0	1000.0	;	# 1073 glyc3p_c+odecoa_c --> coa_c+alpha_hs_18_1_c
		0	1000.0	;	# 1074 h2o_c+mag_hs_18_1_c --> ocdcea_c+glyc_c+h_c
		0	1000.0	;	# 1075 h2o_c+lpchol_hs_18_1_c --> ocdcea_c+h_c+g3pc_c
		0	1000.0	;	# 1076 glyc3p_c+lnlccoa_c --> coa_c+alpha_hs_18_2_c
		0	1000.0	;	# 1077 h2o_c+mag_hs_18_2_c --> glyc_c+lnlc_c+h_c
		0	1000.0	;	# 1078 h2o_c+lpchol_hs_18_2_c --> lnlc_c+h_c+g3pc_c
		0	1000.0	;	# 1079 glyc3p_c+arachdcoa_c --> coa_c+alpha_hs_20_4_c
		0	1000.0	;	# 1080 h2o_c+mag_hs_20_4_c --> glyc_c+h_c+arachd_c
		0	1000.0	;	# 1081 h2o_c+lpchol_hs_20_4_c --> h_c+arachd_c+g3pc_c
		0	1000.0	;	# 1082 pmtcoa_c+alpha_hs_16_0_c --> coa_c+pa_hs_16_0_16_0_c
		0	1000.0	;	# 1083 h2o_c+pa_hs_16_0_16_0_c --> dag_hs_16_0_16_0_c+pi_c
		0	1000.0	;	# 1084 dag_hs_16_0_16_0_c+cdpea_c --> cmp_c+pe_hs_16_0_16_0_c+h_c
		0	1000.0	;	# 1085 ser_L_c+pe_hs_16_0_16_0_c --> ps_hs_16_0_16_0_c+etha_c
		0	1000.0	;	# 1086 ps_hs_16_0_16_0_c+etha_c --> ser_L_c+pe_hs_16_0_16_0_c
		0	1000.0	;	# 1087 chol_c+ps_hs_16_0_16_0_c --> ser_L_c+pchol_hs_16_0_16_0_c
		0	1000.0	;	# 1088 ser_L_c+pchol_hs_16_0_16_0_c --> chol_c+ps_hs_16_0_16_0_c
		0	1000.0	;	# 1089 dag_hs_16_0_16_0_c+cdpchol_c --> cmp_c+h_c+pchol_hs_16_0_16_0_c
		0	1000.0	;	# 1090 h2o_c+pchol_hs_16_0_16_0_c --> lpchol_hs_16_0_c+hdca_c+h_c
		0	1000.0	;	# 1091 pa_hs_16_0_16_0_c+h_c+adp_c --> dag_hs_16_0_16_0_c+atp_c
		0	1000.0	;	# 1092 dag_hs_16_0_16_0_c+atp_c --> pa_hs_16_0_16_0_c+h_c+adp_c
		0	1000.0	;	# 1093 h2o_c+dag_hs_16_0_16_0_c --> hdca_c+mag_hs_16_0_c+h_c
		0	1000.0	;	# 1094 ctp_c+pa_hs_16_0_16_0_c+h_c --> ppi_c+cdpdag_hs_16_0_16_0_c
		0	1000.0	;	# 1095 inost_c+cdpdag_hs_16_0_16_0_c --> cmp_c+h_c+pail_hs_16_0_16_0_c
		0	1000.0	;	# 1096 h2o_c+pail_hs_16_0_16_0_c --> mi1p_D_c+dag_hs_16_0_16_0_c+h_c
		0	1000.0	;	# 1097 atp_c+pail_hs_16_0_16_0_c --> pail4p_hs_16_0_16_0_c+h_c+adp_c
		0	1000.0	;	# 1098 pail4p_hs_16_0_16_0_c+h2o_c --> dag_hs_16_0_16_0_c+h_c+mi14p_c
		0	1000.0	;	# 1099 pail4p_hs_16_0_16_0_c+atp_c --> h_c+adp_c+pail34p_hs_16_0_16_0_c
		0	1000.0	;	# 1100 atp_c+pail34p_hs_16_0_16_0_c --> pail345p_hs_16_0_16_0_c+h_c+adp_c
		0	1000.0	;	# 1101 pail45p_hs_16_0_16_0_c+atp_c --> pail345p_hs_16_0_16_0_c+h_c+adp_c
		0	1000.0	;	# 1102 h2o_c+pail345p_hs_16_0_16_0_c --> pail45p_hs_16_0_16_0_c+pi_c
		0	1000.0	;	# 1103 pail45p_hs_16_0_16_0_c+h2o_c --> dag_hs_16_0_16_0_c+h_c+mi145p_c
		0	1000.0	;	# 1104 stcoa_c+alpha_hs_16_0_c --> pa_hs_16_0_18_0_c+coa_c
		0	1000.0	;	# 1105 h2o_c+pa_hs_16_0_18_0_c --> pi_c+dag_hs_16_0_18_0_c
		0	1000.0	;	# 1106 cdpea_c+dag_hs_16_0_18_0_c --> pe_hs_16_0_18_0_c+cmp_c+h_c
		0	1000.0	;	# 1107 pe_hs_16_0_18_0_c+ser_L_c --> etha_c+ps_hs_16_0_18_0_c
		0	1000.0	;	# 1108 etha_c+ps_hs_16_0_18_0_c --> pe_hs_16_0_18_0_c+ser_L_c
		0	1000.0	;	# 1109 chol_c+ps_hs_16_0_18_0_c --> ser_L_c+pchol_hs_16_0_18_0_c
		0	1000.0	;	# 1110 ser_L_c+pchol_hs_16_0_18_0_c --> chol_c+ps_hs_16_0_18_0_c
		0	1000.0	;	# 1111 dag_hs_16_0_18_0_c+cdpchol_c --> cmp_c+pchol_hs_16_0_18_0_c+h_c
		0	1000.0	;	# 1112 h2o_c+pchol_hs_16_0_18_0_c --> lpchol_hs_16_0_c+h_c+ocdca_c
		0	1000.0	;	# 1113 pa_hs_16_0_18_0_c+h_c+adp_c --> atp_c+dag_hs_16_0_18_0_c
		0	1000.0	;	# 1114 atp_c+dag_hs_16_0_18_0_c --> pa_hs_16_0_18_0_c+h_c+adp_c
		0	1000.0	;	# 1115 h2o_c+dag_hs_16_0_18_0_c --> mag_hs_16_0_c+h_c+ocdca_c
		0	1000.0	;	# 1116 pa_hs_16_0_18_0_c+ctp_c+h_c --> ppi_c+cdpdag_hs_16_0_18_0_c
		0	1000.0	;	# 1117 inost_c+cdpdag_hs_16_0_18_0_c --> cmp_c+pail_hs_16_0_18_0_c+h_c
		0	1000.0	;	# 1118 h2o_c+pail_hs_16_0_18_0_c --> mi1p_D_c+h_c+dag_hs_16_0_18_0_c
		0	1000.0	;	# 1119 atp_c+pail_hs_16_0_18_0_c --> h_c+adp_c+pail4p_hs_16_0_18_0_c
		0	1000.0	;	# 1120 h2o_c+pail4p_hs_16_0_18_0_c --> h_c+dag_hs_16_0_18_0_c+mi14p_c
		0	1000.0	;	# 1121 atp_c+pail4p_hs_16_0_18_0_c --> h_c+pail34p_hs_16_0_18_0_c+adp_c
		0	1000.0	;	# 1122 atp_c+pail34p_hs_16_0_18_0_c --> pail345p_hs_16_0_18_0_c+h_c+adp_c
		0	1000.0	;	# 1123 atp_c+pail45p_hs_16_0_18_0_c --> pail345p_hs_16_0_18_0_c+h_c+adp_c
		0	1000.0	;	# 1124 pail345p_hs_16_0_18_0_c+h2o_c --> pi_c+pail45p_hs_16_0_18_0_c
		0	1000.0	;	# 1125 h2o_c+pail45p_hs_16_0_18_0_c --> h_c+dag_hs_16_0_18_0_c+mi145p_c
		0	1000.0	;	# 1126 odecoa_c+alpha_hs_16_0_c --> pa_hs_16_0_18_1_c+coa_c
		0	1000.0	;	# 1127 pa_hs_16_0_18_1_c+h2o_c --> pi_c+dag_hs_16_0_18_1_c
		0	1000.0	;	# 1128 cdpea_c+dag_hs_16_0_18_1_c --> cmp_c+pe_hs_16_0_18_1_c+h_c
		0	1000.0	;	# 1129 pe_hs_16_0_18_1_c+ser_L_c --> etha_c+ps_hs_16_0_18_1_c
		0	1000.0	;	# 1130 etha_c+ps_hs_16_0_18_1_c --> pe_hs_16_0_18_1_c+ser_L_c
		0	1000.0	;	# 1131 chol_c+ps_hs_16_0_18_1_c --> ser_L_c+pchol_hs_16_0_18_1_c
		0	1000.0	;	# 1132 ser_L_c+pchol_hs_16_0_18_1_c --> chol_c+ps_hs_16_0_18_1_c
		0	1000.0	;	# 1133 cdpchol_c+dag_hs_16_0_18_1_c --> cmp_c+h_c+pchol_hs_16_0_18_1_c
		0	1000.0	;	# 1134 h2o_c+pchol_hs_16_0_18_1_c --> ocdcea_c+lpchol_hs_16_0_c+h_c
		0	1000.0	;	# 1135 pa_hs_16_0_18_1_c+h_c+adp_c --> atp_c+dag_hs_16_0_18_1_c
		0	1000.0	;	# 1136 atp_c+dag_hs_16_0_18_1_c --> pa_hs_16_0_18_1_c+h_c+adp_c
		0	1000.0	;	# 1137 h2o_c+dag_hs_16_0_18_1_c --> ocdcea_c+mag_hs_16_0_c+h_c
		0	1000.0	;	# 1138 pa_hs_16_0_18_1_c+ctp_c+h_c --> ppi_c+cdpdag_hs_16_0_18_1_c
		0	1000.0	;	# 1139 inost_c+cdpdag_hs_16_0_18_1_c --> cmp_c+h_c+pail_hs_16_0_18_1_c
		0	1000.0	;	# 1140 h2o_c+pail_hs_16_0_18_1_c --> mi1p_D_c+h_c+dag_hs_16_0_18_1_c
		0	1000.0	;	# 1141 atp_c+pail_hs_16_0_18_1_c --> pail4p_hs_16_0_18_1_c+h_c+adp_c
		0	1000.0	;	# 1142 h2o_c+pail4p_hs_16_0_18_1_c --> h_c+mi14p_c+dag_hs_16_0_18_1_c
		0	1000.0	;	# 1143 atp_c+pail4p_hs_16_0_18_1_c --> pail34p_hs_16_0_18_1_c+h_c+adp_c
		0	1000.0	;	# 1144 atp_c+pail34p_hs_16_0_18_1_c --> h_c+adp_c+pail345p_hs_16_0_18_1_c
		0	1000.0	;	# 1145 pail45p_hs_16_0_18_1_c+atp_c --> h_c+adp_c+pail345p_hs_16_0_18_1_c
		0	1000.0	;	# 1146 h2o_c+pail345p_hs_16_0_18_1_c --> pail45p_hs_16_0_18_1_c+pi_c
		0	1000.0	;	# 1147 pail45p_hs_16_0_18_1_c+h2o_c --> h_c+mi145p_c+dag_hs_16_0_18_1_c
		0	1000.0	;	# 1148 lnlccoa_c+alpha_hs_16_0_c --> coa_c+pa_hs_16_0_18_2_c
		0	1000.0	;	# 1149 h2o_c+pa_hs_16_0_18_2_c --> pi_c+dag_hs_16_0_18_2_c
		0	1000.0	;	# 1150 cdpea_c+dag_hs_16_0_18_2_c --> pe_hs_16_0_18_2_c+cmp_c+h_c
		0	1000.0	;	# 1151 pe_hs_16_0_18_2_c+ser_L_c --> etha_c+ps_hs_16_0_18_2_c
		0	1000.0	;	# 1152 etha_c+ps_hs_16_0_18_2_c --> pe_hs_16_0_18_2_c+ser_L_c
		0	1000.0	;	# 1153 chol_c+ps_hs_16_0_18_2_c --> ser_L_c+pchol_hs_16_0_18_2_c
		0	1000.0	;	# 1154 ser_L_c+pchol_hs_16_0_18_2_c --> chol_c+ps_hs_16_0_18_2_c
		0	1000.0	;	# 1155 dag_hs_16_0_18_2_c+cdpchol_c --> cmp_c+h_c+pchol_hs_16_0_18_2_c
		0	1000.0	;	# 1156 h2o_c+pchol_hs_16_0_18_2_c --> lpchol_hs_16_0_c+lnlc_c+h_c
		0	1000.0	;	# 1157 h_c+adp_c+pa_hs_16_0_18_2_c --> atp_c+dag_hs_16_0_18_2_c
		0	1000.0	;	# 1158 atp_c+dag_hs_16_0_18_2_c --> h_c+adp_c+pa_hs_16_0_18_2_c
		0	1000.0	;	# 1159 h2o_c+dag_hs_16_0_18_2_c --> lnlc_c+mag_hs_16_0_c+h_c
		0	1000.0	;	# 1160 ctp_c+h_c+pa_hs_16_0_18_2_c --> ppi_c+cdpdag_hs_16_0_18_2_c
		0	1000.0	;	# 1161 inost_c+cdpdag_hs_16_0_18_2_c --> cmp_c+pail_hs_16_0_18_2_c+h_c
		0	1000.0	;	# 1162 h2o_c+pail_hs_16_0_18_2_c --> mi1p_D_c+h_c+dag_hs_16_0_18_2_c
		0	1000.0	;	# 1163 atp_c+pail_hs_16_0_18_2_c --> h_c+adp_c+pail4p_hs_16_0_18_2_c
		0	1000.0	;	# 1164 h2o_c+pail4p_hs_16_0_18_2_c --> h_c+dag_hs_16_0_18_2_c+mi14p_c
		0	1000.0	;	# 1165 atp_c+pail4p_hs_16_0_18_2_c --> h_c+pail34p_hs_16_0_18_2_c+adp_c
		0	1000.0	;	# 1166 atp_c+pail34p_hs_16_0_18_2_c --> pail345p_hs_16_0_18_2_c+h_c+adp_c
		0	1000.0	;	# 1167 atp_c+pail45p_hs_16_0_18_2_c --> pail345p_hs_16_0_18_2_c+h_c+adp_c
		0	1000.0	;	# 1168 pail345p_hs_16_0_18_2_c+h2o_c --> pi_c+pail45p_hs_16_0_18_2_c
		0	1000.0	;	# 1169 h2o_c+pail45p_hs_16_0_18_2_c --> h_c+dag_hs_16_0_18_2_c+mi145p_c
		0	1000.0	;	# 1170 arachdcoa_c+alpha_hs_16_0_c --> pa_hs_16_0_20_4_c+coa_c
		0	1000.0	;	# 1171 pa_hs_16_0_20_4_c+h2o_c --> dag_hs_16_0_20_4_c+pi_c
		0	1000.0	;	# 1172 cdpea_c+dag_hs_16_0_20_4_c --> cmp_c+h_c+pe_hs_16_0_20_4_c
		0	1000.0	;	# 1173 ser_L_c+pe_hs_16_0_20_4_c --> ps_hs_16_0_20_4_c+etha_c
		0	1000.0	;	# 1174 ps_hs_16_0_20_4_c+etha_c --> ser_L_c+pe_hs_16_0_20_4_c
		0	1000.0	;	# 1175 ps_hs_16_0_20_4_c+chol_c --> pchol_hs_16_0_20_4_c+ser_L_c
		0	1000.0	;	# 1176 pchol_hs_16_0_20_4_c+ser_L_c --> ps_hs_16_0_20_4_c+chol_c
		0	1000.0	;	# 1177 dag_hs_16_0_20_4_c+cdpchol_c --> cmp_c+pchol_hs_16_0_20_4_c+h_c
		0	1000.0	;	# 1178 h2o_c+pchol_hs_16_0_20_4_c --> lpchol_hs_16_0_c+h_c+arachd_c
		0	1000.0	;	# 1179 pa_hs_16_0_20_4_c+h_c+adp_c --> atp_c+dag_hs_16_0_20_4_c
		0	1000.0	;	# 1180 atp_c+dag_hs_16_0_20_4_c --> pa_hs_16_0_20_4_c+h_c+adp_c
		0	1000.0	;	# 1181 h2o_c+dag_hs_16_0_20_4_c --> mag_hs_16_0_c+h_c+arachd_c
		0	1000.0	;	# 1182 pa_hs_16_0_20_4_c+ctp_c+h_c --> ppi_c+cdpdag_hs_16_0_20_4_c
		0	1000.0	;	# 1183 inost_c+cdpdag_hs_16_0_20_4_c --> pail_hs_16_0_20_4_c+cmp_c+h_c
		0	1000.0	;	# 1184 pail_hs_16_0_20_4_c+h2o_c --> mi1p_D_c+dag_hs_16_0_20_4_c+h_c
		0	1000.0	;	# 1185 pail_hs_16_0_20_4_c+atp_c --> h_c+adp_c+pail4p_hs_16_0_20_4_c
		0	1000.0	;	# 1186 h2o_c+pail4p_hs_16_0_20_4_c --> dag_hs_16_0_20_4_c+h_c+mi14p_c
		0	1000.0	;	# 1187 atp_c+pail4p_hs_16_0_20_4_c --> pail34p_hs_16_0_20_4_c+h_c+adp_c
		0	1000.0	;	# 1188 pail34p_hs_16_0_20_4_c+atp_c --> pail345p_hs_16_0_20_4_c+h_c+adp_c
		0	1000.0	;	# 1189 atp_c+pail45p_hs_16_0_20_4_c --> pail345p_hs_16_0_20_4_c+h_c+adp_c
		0	1000.0	;	# 1190 h2o_c+pail345p_hs_16_0_20_4_c --> pi_c+pail45p_hs_16_0_20_4_c
		0	1000.0	;	# 1191 h2o_c+pail45p_hs_16_0_20_4_c --> dag_hs_16_0_20_4_c+h_c+mi145p_c
		0	1000.0	;	# 1192 alpha_hs_18_0_c+stcoa_c --> coa_c+pa_hs_18_0_18_0_c
		0	1000.0	;	# 1193 h2o_c+pa_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+pi_c
		0	1000.0	;	# 1194 dag_hs_18_0_18_0_c+cdpea_c --> cmp_c+h_c+pe_hs_18_0_18_0_c
		0	1000.0	;	# 1195 ser_L_c+pe_hs_18_0_18_0_c --> ps_hs_18_0_18_0_c+etha_c
		0	1000.0	;	# 1196 ps_hs_18_0_18_0_c+etha_c --> ser_L_c+pe_hs_18_0_18_0_c
		0	1000.0	;	# 1197 chol_c+ps_hs_18_0_18_0_c --> ser_L_c+pchol_hs_18_0_18_0_c
		0	1000.0	;	# 1198 ser_L_c+pchol_hs_18_0_18_0_c --> chol_c+ps_hs_18_0_18_0_c
		0	1000.0	;	# 1199 dag_hs_18_0_18_0_c+cdpchol_c --> cmp_c+pchol_hs_18_0_18_0_c+h_c
		0	1000.0	;	# 1200 h2o_c+pchol_hs_18_0_18_0_c --> h_c+lpchol_hs_18_0_c+ocdca_c
		0	1000.0	;	# 1201 h_c+adp_c+pa_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+atp_c
		0	1000.0	;	# 1202 dag_hs_18_0_18_0_c+atp_c --> h_c+adp_c+pa_hs_18_0_18_0_c
		0	1000.0	;	# 1203 dag_hs_18_0_18_0_c+h2o_c --> h_c+ocdca_c+mag_hs_18_0_c
		0	1000.0	;	# 1204 ctp_c+h_c+pa_hs_18_0_18_0_c --> ppi_c+cdpdag_hs_18_0_18_0_c
		0	1000.0	;	# 1205 inost_c+cdpdag_hs_18_0_18_0_c --> cmp_c+pail_hs_18_0_18_0_c+h_c
		0	1000.0	;	# 1206 h2o_c+pail_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+mi1p_D_c+h_c
		0	1000.0	;	# 1207 pail_hs_18_0_18_0_c+atp_c --> pail4p_hs_18_0_18_0_c+h_c+adp_c
		0	1000.0	;	# 1208 h2o_c+pail4p_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+h_c+mi14p_c
		0	1000.0	;	# 1209 pail4p_hs_18_0_18_0_c+atp_c --> pail34p_hs_18_0_18_0_c+h_c+adp_c
		0	1000.0	;	# 1210 pail34p_hs_18_0_18_0_c+atp_c --> pail345p_hs_18_0_18_0_c+h_c+adp_c
		0	1000.0	;	# 1211 atp_c+pail45p_hs_18_0_18_0_c --> pail345p_hs_18_0_18_0_c+h_c+adp_c
		0	1000.0	;	# 1212 h2o_c+pail345p_hs_18_0_18_0_c --> pi_c+pail45p_hs_18_0_18_0_c
		0	1000.0	;	# 1213 h2o_c+pail45p_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+h_c+mi145p_c
		0	1000.0	;	# 1214 alpha_hs_18_0_c+odecoa_c --> coa_c+pa_hs_18_0_18_1_c
		0	1000.0	;	# 1215 h2o_c+pa_hs_18_0_18_1_c --> dag_hs_18_0_18_1_c+pi_c
		0	1000.0	;	# 1216 dag_hs_18_0_18_1_c+cdpea_c --> cmp_c+h_c+pe_hs_18_0_18_1_c
		0	1000.0	;	# 1217 ser_L_c+pe_hs_18_0_18_1_c --> ps_hs_18_0_18_1_c+etha_c
		0	1000.0	;	# 1218 ps_hs_18_0_18_1_c+etha_c --> ser_L_c+pe_hs_18_0_18_1_c
		0	1000.0	;	# 1219 chol_c+ps_hs_18_0_18_1_c --> ser_L_c+pchol_hs_18_0_18_1_c
		0	1000.0	;	# 1220 ser_L_c+pchol_hs_18_0_18_1_c --> chol_c+ps_hs_18_0_18_1_c
		0	1000.0	;	# 1221 dag_hs_18_0_18_1_c+cdpchol_c --> cmp_c+h_c+pchol_hs_18_0_18_1_c
		0	1000.0	;	# 1222 h2o_c+pchol_hs_18_0_18_1_c --> ocdcea_c+h_c+lpchol_hs_18_0_c
		0	1000.0	;	# 1223 h_c+adp_c+pa_hs_18_0_18_1_c --> dag_hs_18_0_18_1_c+atp_c
		0	1000.0	;	# 1224 dag_hs_18_0_18_1_c+atp_c --> h_c+adp_c+pa_hs_18_0_18_1_c
		0	1000.0	;	# 1225 dag_hs_18_0_18_1_c+h2o_c --> ocdcea_c+h_c+mag_hs_18_0_c
		0	1000.0	;	# 1226 ctp_c+h_c+pa_hs_18_0_18_1_c --> ppi_c+cdpdag_hs_18_0_18_1_c
		0	1000.0	;	# 1227 inost_c+cdpdag_hs_18_0_18_1_c --> pail_hs_18_0_18_1_c+cmp_c+h_c
		0	1000.0	;	# 1228 pail_hs_18_0_18_1_c+h2o_c --> mi1p_D_c+dag_hs_18_0_18_1_c+h_c
		0	1000.0	;	# 1229 pail_hs_18_0_18_1_c+atp_c --> pail4p_hs_18_0_18_1_c+h_c+adp_c
		0	1000.0	;	# 1230 h2o_c+pail4p_hs_18_0_18_1_c --> dag_hs_18_0_18_1_c+h_c+mi14p_c
		0	1000.0	;	# 1231 pail4p_hs_18_0_18_1_c+atp_c --> pail34p_hs_18_0_18_1_c+h_c+adp_c
		0	1000.0	;	# 1232 pail34p_hs_18_0_18_1_c+atp_c --> h_c+pail345p_hs_18_0_18_1_c+adp_c
		0	1000.0	;	# 1233 atp_c+pail45p_hs_18_0_18_1_c --> h_c+pail345p_hs_18_0_18_1_c+adp_c
		0	1000.0	;	# 1234 h2o_c+pail345p_hs_18_0_18_1_c --> pi_c+pail45p_hs_18_0_18_1_c
		0	1000.0	;	# 1235 h2o_c+pail45p_hs_18_0_18_1_c --> dag_hs_18_0_18_1_c+h_c+mi145p_c
		0	1000.0	;	# 1236 alpha_hs_18_0_c+lnlccoa_c --> coa_c+pa_hs_18_0_18_2_c
		0	1000.0	;	# 1237 h2o_c+pa_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+pi_c
		0	1000.0	;	# 1238 dag_hs_18_0_18_2_c+cdpea_c --> pe_hs_18_0_18_2_c+cmp_c+h_c
		0	1000.0	;	# 1239 pe_hs_18_0_18_2_c+ser_L_c --> ps_hs_18_0_18_2_c+etha_c
		0	1000.0	;	# 1240 ps_hs_18_0_18_2_c+etha_c --> pe_hs_18_0_18_2_c+ser_L_c
		0	1000.0	;	# 1241 chol_c+ps_hs_18_0_18_2_c --> ser_L_c+pchol_hs_18_0_18_2_c
		0	1000.0	;	# 1242 ser_L_c+pchol_hs_18_0_18_2_c --> chol_c+ps_hs_18_0_18_2_c
		0	1000.0	;	# 1243 dag_hs_18_0_18_2_c+cdpchol_c --> cmp_c+h_c+pchol_hs_18_0_18_2_c
		0	1000.0	;	# 1244 h2o_c+pchol_hs_18_0_18_2_c --> lnlc_c+h_c+lpchol_hs_18_0_c
		0	1000.0	;	# 1245 h_c+adp_c+pa_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+atp_c
		0	1000.0	;	# 1246 dag_hs_18_0_18_2_c+atp_c --> h_c+adp_c+pa_hs_18_0_18_2_c
		0	1000.0	;	# 1247 dag_hs_18_0_18_2_c+h2o_c --> lnlc_c+h_c+mag_hs_18_0_c
		0	1000.0	;	# 1248 ctp_c+h_c+pa_hs_18_0_18_2_c --> ppi_c+cdpdag_hs_18_0_18_2_c
		0	1000.0	;	# 1249 inost_c+cdpdag_hs_18_0_18_2_c --> cmp_c+pail_hs_18_0_18_2_c+h_c
		0	1000.0	;	# 1250 h2o_c+pail_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+mi1p_D_c+h_c
		0	1000.0	;	# 1251 pail_hs_18_0_18_2_c+atp_c --> pail4p_hs_18_0_18_2_c+h_c+adp_c
		0	1000.0	;	# 1252 h2o_c+pail4p_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+h_c+mi14p_c
		0	1000.0	;	# 1253 pail4p_hs_18_0_18_2_c+atp_c --> pail34p_hs_18_0_18_2_c+h_c+adp_c
		0	1000.0	;	# 1254 pail34p_hs_18_0_18_2_c+atp_c --> pail345p_hs_18_0_18_2_c+h_c+adp_c
		0	1000.0	;	# 1255 atp_c+pail45p_hs_18_0_18_2_c --> pail345p_hs_18_0_18_2_c+h_c+adp_c
		0	1000.0	;	# 1256 h2o_c+pail345p_hs_18_0_18_2_c --> pi_c+pail45p_hs_18_0_18_2_c
		0	1000.0	;	# 1257 h2o_c+pail45p_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+h_c+mi145p_c
		0	1000.0	;	# 1258 arachdcoa_c+alpha_hs_18_0_c --> coa_c+pa_hs_18_0_20_4_c
		0	1000.0	;	# 1259 h2o_c+pa_hs_18_0_20_4_c --> pi_c+dag_hs_18_0_20_4_c
		0	1000.0	;	# 1260 cdpea_c+dag_hs_18_0_20_4_c --> cmp_c+pe_hs_18_0_20_4_c+h_c
		0	1000.0	;	# 1261 ser_L_c+pe_hs_18_0_20_4_c --> ps_hs_18_0_20_4_c+etha_c
		0	1000.0	;	# 1262 ps_hs_18_0_20_4_c+etha_c --> ser_L_c+pe_hs_18_0_20_4_c
		0	1000.0	;	# 1263 chol_c+ps_hs_18_0_20_4_c --> ser_L_c+pchol_hs_18_0_20_4_c
		0	1000.0	;	# 1264 ser_L_c+pchol_hs_18_0_20_4_c --> chol_c+ps_hs_18_0_20_4_c
		0	1000.0	;	# 1265 cdpchol_c+dag_hs_18_0_20_4_c --> cmp_c+pchol_hs_18_0_20_4_c+h_c
		0	1000.0	;	# 1266 h2o_c+pchol_hs_18_0_20_4_c --> h_c+lpchol_hs_18_0_c+arachd_c
		0	1000.0	;	# 1267 h_c+adp_c+pa_hs_18_0_20_4_c --> atp_c+dag_hs_18_0_20_4_c
		0	1000.0	;	# 1268 atp_c+dag_hs_18_0_20_4_c --> h_c+adp_c+pa_hs_18_0_20_4_c
		0	1000.0	;	# 1269 h2o_c+dag_hs_18_0_20_4_c --> h_c+arachd_c+mag_hs_18_0_c
		0	1000.0	;	# 1270 ctp_c+h_c+pa_hs_18_0_20_4_c --> cdpdag_hs_18_0_20_4_c+ppi_c
		0	1000.0	;	# 1271 cdpdag_hs_18_0_20_4_c+inost_c --> cmp_c+pail_hs_18_0_20_4_c+h_c
		0	1000.0	;	# 1272 h2o_c+pail_hs_18_0_20_4_c --> mi1p_D_c+h_c+dag_hs_18_0_20_4_c
		0	1000.0	;	# 1273 pail_hs_18_0_20_4_c+atp_c --> pail4p_hs_18_0_20_4_c+h_c+adp_c
		0	1000.0	;	# 1274 h2o_c+pail4p_hs_18_0_20_4_c --> h_c+dag_hs_18_0_20_4_c+mi14p_c
		0	1000.0	;	# 1275 pail4p_hs_18_0_20_4_c+atp_c --> pail34p_hs_18_0_20_4_c+h_c+adp_c
		0	1000.0	;	# 1276 pail34p_hs_18_0_20_4_c+atp_c --> pail345p_hs_18_0_20_4_c+h_c+adp_c
		0	1000.0	;	# 1277 pail45p_hs_18_0_20_4_c+atp_c --> pail345p_hs_18_0_20_4_c+h_c+adp_c
		0	1000.0	;	# 1278 h2o_c+pail345p_hs_18_0_20_4_c --> pail45p_hs_18_0_20_4_c+pi_c
		0	1000.0	;	# 1279 pail45p_hs_18_0_20_4_c+h2o_c --> h_c+mi145p_c+dag_hs_18_0_20_4_c
		0	1000.0	;	# 1280 alpha_hs_18_1_c+odecoa_c --> pa_hs_18_1_18_1_c+coa_c
		0	1000.0	;	# 1281 h2o_c+pa_hs_18_1_18_1_c --> dag_hs_18_1_18_1_c+pi_c
		0	1000.0	;	# 1282 cdpea_c+dag_hs_18_1_18_1_c --> cmp_c+h_c+pe_hs_18_1_18_1_c
		0	1000.0	;	# 1283 ser_L_c+pe_hs_18_1_18_1_c --> ps_hs_18_1_18_1_c+etha_c
		0	1000.0	;	# 1284 ps_hs_18_1_18_1_c+etha_c --> ser_L_c+pe_hs_18_1_18_1_c
		0	1000.0	;	# 1285 chol_c+ps_hs_18_1_18_1_c --> ser_L_c+pchol_hs_18_1_18_1_c
		0	1000.0	;	# 1286 ser_L_c+pchol_hs_18_1_18_1_c --> chol_c+ps_hs_18_1_18_1_c
		0	1000.0	;	# 1287 dag_hs_18_1_18_1_c+cdpchol_c --> cmp_c+pchol_hs_18_1_18_1_c+h_c
		0	1000.0	;	# 1288 h2o_c+pchol_hs_18_1_18_1_c --> ocdcea_c+h_c+lpchol_hs_18_1_c
		0	1000.0	;	# 1289 pa_hs_18_1_18_1_c+h_c+adp_c --> dag_hs_18_1_18_1_c+atp_c
		0	1000.0	;	# 1290 dag_hs_18_1_18_1_c+atp_c --> pa_hs_18_1_18_1_c+h_c+adp_c
		0	1000.0	;	# 1291 h2o_c+dag_hs_18_1_18_1_c --> ocdcea_c+mag_hs_18_1_c+h_c
		0	1000.0	;	# 1292 pa_hs_18_1_18_1_c+ctp_c+h_c --> cdpdag_hs_18_1_18_1_c+ppi_c
		0	1000.0	;	# 1293 cdpdag_hs_18_1_18_1_c+inost_c --> cmp_c+pail_hs_18_1_18_1_c+h_c
		0	1000.0	;	# 1294 pail_hs_18_1_18_1_c+h2o_c --> mi1p_D_c+dag_hs_18_1_18_1_c+h_c
		0	1000.0	;	# 1295 pail_hs_18_1_18_1_c+atp_c --> pail4p_hs_18_1_18_1_c+h_c+adp_c
		0	1000.0	;	# 1296 h2o_c+pail4p_hs_18_1_18_1_c --> dag_hs_18_1_18_1_c+h_c+mi14p_c
		0	1000.0	;	# 1297 pail4p_hs_18_1_18_1_c+atp_c --> pail34p_hs_18_1_18_1_c+h_c+adp_c
		0	1000.0	;	# 1298 atp_c+pail34p_hs_18_1_18_1_c --> pail345p_hs_18_1_18_1_c+h_c+adp_c
		0	1000.0	;	# 1299 atp_c+pail45p_hs_18_1_18_1_c --> pail345p_hs_18_1_18_1_c+h_c+adp_c
		0	1000.0	;	# 1300 h2o_c+pail345p_hs_18_1_18_1_c --> pi_c+pail45p_hs_18_1_18_1_c
		0	1000.0	;	# 1301 h2o_c+pail45p_hs_18_1_18_1_c --> dag_hs_18_1_18_1_c+h_c+mi145p_c
		0	1000.0	;	# 1302 alpha_hs_18_1_c+lnlccoa_c --> coa_c+pa_hs_18_1_18_2_c
		0	1000.0	;	# 1303 h2o_c+pa_hs_18_1_18_2_c --> pi_c+dag_hs_18_1_18_2_c
		0	1000.0	;	# 1304 cdpea_c+dag_hs_18_1_18_2_c --> cmp_c+pe_hs_18_1_18_2_c+h_c
		0	1000.0	;	# 1305 pe_hs_18_1_18_2_c+ser_L_c --> ps_hs_18_1_18_2_c+etha_c
		0	1000.0	;	# 1306 ps_hs_18_1_18_2_c+etha_c --> pe_hs_18_1_18_2_c+ser_L_c
		0	1000.0	;	# 1307 chol_c+ps_hs_18_1_18_2_c --> ser_L_c+pchol_hs_18_1_18_2_c
		0	1000.0	;	# 1308 ser_L_c+pchol_hs_18_1_18_2_c --> chol_c+ps_hs_18_1_18_2_c
		0	1000.0	;	# 1309 dag_hs_18_1_18_2_c+cdpchol_c --> cmp_c+pchol_hs_18_1_18_2_c+h_c
		0	1000.0	;	# 1310 h2o_c+pchol_hs_18_1_18_2_c --> lnlc_c+h_c+lpchol_hs_18_1_c
		0	1000.0	;	# 1311 pa_hs_18_1_18_2_c+h_c+adp_c --> atp_c+dag_hs_18_1_18_2_c
		0	1000.0	;	# 1312 atp_c+dag_hs_18_1_18_2_c --> pa_hs_18_1_18_2_c+h_c+adp_c
		0	1000.0	;	# 1313 h2o_c+dag_hs_18_1_18_2_c --> lnlc_c+mag_hs_18_1_c+h_c
		0	1000.0	;	# 1314 pa_hs_18_1_18_2_c+ctp_c+h_c --> ppi_c+cdpdag_hs_18_1_18_2_c
		0	1000.0	;	# 1315 inost_c+cdpdag_hs_18_1_18_2_c --> cmp_c+h_c+pail_hs_18_1_18_2_c
		0	1000.0	;	# 1316 h2o_c+pail_hs_18_1_18_2_c --> mi1p_D_c+dag_hs_18_1_18_2_c+h_c
		0	1000.0	;	# 1317 atp_c+pail_hs_18_1_18_2_c --> pail4p_hs_18_1_18_2_c+h_c+adp_c
		0	1000.0	;	# 1318 h2o_c+pail4p_hs_18_1_18_2_c --> dag_hs_18_1_18_2_c+h_c+mi14p_c
		0	1000.0	;	# 1319 atp_c+pail4p_hs_18_1_18_2_c --> h_c+adp_c+pail34p_hs_18_1_18_2_c
		0	1000.0	;	# 1320 atp_c+pail34p_hs_18_1_18_2_c --> h_c+adp_c+pail345p_hs_18_1_18_2_c
		0	1000.0	;	# 1321 atp_c+pail45p_hs_18_1_18_2_c --> h_c+adp_c+pail345p_hs_18_1_18_2_c
		0	1000.0	;	# 1322 h2o_c+pail345p_hs_18_1_18_2_c --> pi_c+pail45p_hs_18_1_18_2_c
		0	1000.0	;	# 1323 h2o_c+pail45p_hs_18_1_18_2_c --> dag_hs_18_1_18_2_c+h_c+mi145p_c
		0	1000.0	;	# 1324 alpha_hs_18_1_c+arachdcoa_c --> coa_c+pa_hs_18_1_20_4_c
		0	1000.0	;	# 1325 h2o_c+pa_hs_18_1_20_4_c --> pi_c+dag_hs_18_1_20_4_c
		0	1000.0	;	# 1326 cdpea_c+dag_hs_18_1_20_4_c --> cmp_c+h_c+pe_hs_18_1_20_4_c
		0	1000.0	;	# 1327 ser_L_c+pe_hs_18_1_20_4_c --> ps_hs_18_1_20_4_c+etha_c
		0	1000.0	;	# 1328 ps_hs_18_1_20_4_c+etha_c --> ser_L_c+pe_hs_18_1_20_4_c
		0	1000.0	;	# 1329 chol_c+ps_hs_18_1_20_4_c --> ser_L_c+pchol_hs_18_1_20_4_c
		0	1000.0	;	# 1330 ser_L_c+pchol_hs_18_1_20_4_c --> chol_c+ps_hs_18_1_20_4_c
		0	1000.0	;	# 1331 cdpchol_c+dag_hs_18_1_20_4_c --> cmp_c+h_c+pchol_hs_18_1_20_4_c
		0	1000.0	;	# 1332 h2o_c+pchol_hs_18_1_20_4_c --> h_c+arachd_c+lpchol_hs_18_1_c
		0	1000.0	;	# 1333 pa_hs_18_1_20_4_c+h_c+adp_c --> atp_c+dag_hs_18_1_20_4_c
		0	1000.0	;	# 1334 atp_c+dag_hs_18_1_20_4_c --> pa_hs_18_1_20_4_c+h_c+adp_c
		0	1000.0	;	# 1335 h2o_c+dag_hs_18_1_20_4_c --> mag_hs_18_1_c+h_c+arachd_c
		0	1000.0	;	# 1336 pa_hs_18_1_20_4_c+ctp_c+h_c --> ppi_c+cdpdag_hs_18_1_20_4_c
		0	1000.0	;	# 1337 inost_c+cdpdag_hs_18_1_20_4_c --> cmp_c+h_c+pail_hs_18_1_20_4_c
		0	1000.0	;	# 1338 h2o_c+pail_hs_18_1_20_4_c --> mi1p_D_c+h_c+dag_hs_18_1_20_4_c
		0	1000.0	;	# 1339 atp_c+pail_hs_18_1_20_4_c --> h_c+adp_c+pail4p_hs_18_1_20_4_c
		0	1000.0	;	# 1340 h2o_c+pail4p_hs_18_1_20_4_c --> h_c+mi14p_c+dag_hs_18_1_20_4_c
		0	1000.0	;	# 1341 atp_c+pail4p_hs_18_1_20_4_c --> h_c+adp_c+pail34p_hs_18_1_20_4_c
		0	1000.0	;	# 1342 atp_c+pail34p_hs_18_1_20_4_c --> pail345p_hs_18_1_20_4_c+h_c+adp_c
		0	1000.0	;	# 1343 pail45p_hs_18_1_20_4_c+atp_c --> pail345p_hs_18_1_20_4_c+h_c+adp_c
		0	1000.0	;	# 1344 h2o_c+pail345p_hs_18_1_20_4_c --> pail45p_hs_18_1_20_4_c+pi_c
		0	1000.0	;	# 1345 h2o_c+pail45p_hs_18_1_20_4_c --> h_c+mi145p_c+dag_hs_18_1_20_4_c
		0	1000.0	;	# 1346 alpha_hs_18_2_c+lnlccoa_c --> pa_hs_18_2_18_2_c+coa_c
		0	1000.0	;	# 1347 pa_hs_18_2_18_2_c+h2o_c --> pi_c+dag_hs_18_2_18_2_c
		0	1000.0	;	# 1348 cdpea_c+dag_hs_18_2_18_2_c --> cmp_c+pe_hs_18_2_18_2_c+h_c
		0	1000.0	;	# 1349 ser_L_c+pe_hs_18_2_18_2_c --> ps_hs_18_2_18_2_c+etha_c
		0	1000.0	;	# 1350 ps_hs_18_2_18_2_c+etha_c --> ser_L_c+pe_hs_18_2_18_2_c
		0	1000.0	;	# 1351 chol_c+ps_hs_18_2_18_2_c --> pchol_hs_18_2_18_2_c+ser_L_c
		0	1000.0	;	# 1352 pchol_hs_18_2_18_2_c+ser_L_c --> chol_c+ps_hs_18_2_18_2_c
		0	1000.0	;	# 1353 cdpchol_c+dag_hs_18_2_18_2_c --> pchol_hs_18_2_18_2_c+cmp_c+h_c
		0	1000.0	;	# 1354 pchol_hs_18_2_18_2_c+h2o_c --> lnlc_c+h_c+lpchol_hs_18_2_c
		0	1000.0	;	# 1355 pa_hs_18_2_18_2_c+h_c+adp_c --> atp_c+dag_hs_18_2_18_2_c
		0	1000.0	;	# 1356 atp_c+dag_hs_18_2_18_2_c --> pa_hs_18_2_18_2_c+h_c+adp_c
		0	1000.0	;	# 1357 h2o_c+dag_hs_18_2_18_2_c --> lnlc_c+h_c+mag_hs_18_2_c
		0	1000.0	;	# 1358 pa_hs_18_2_18_2_c+ctp_c+h_c --> cdpdag_hs_18_2_18_2_c+ppi_c
		0	1000.0	;	# 1359 cdpdag_hs_18_2_18_2_c+inost_c --> cmp_c+pail_hs_18_2_18_2_c+h_c
		0	1000.0	;	# 1360 h2o_c+pail_hs_18_2_18_2_c --> mi1p_D_c+h_c+dag_hs_18_2_18_2_c
		0	1000.0	;	# 1361 pail_hs_18_2_18_2_c+atp_c --> h_c+adp_c+pail4p_hs_18_2_18_2_c
		0	1000.0	;	# 1362 h2o_c+pail4p_hs_18_2_18_2_c --> h_c+mi14p_c+dag_hs_18_2_18_2_c
		0	1000.0	;	# 1363 atp_c+pail4p_hs_18_2_18_2_c --> pail34p_hs_18_2_18_2_c+h_c+adp_c
		0	1000.0	;	# 1364 pail34p_hs_18_2_18_2_c+atp_c --> pail345p_hs_18_2_18_2_c+h_c+adp_c
		0	1000.0	;	# 1365 pail45p_hs_18_2_18_2_c+atp_c --> pail345p_hs_18_2_18_2_c+h_c+adp_c
		0	1000.0	;	# 1366 pail345p_hs_18_2_18_2_c+h2o_c --> pail45p_hs_18_2_18_2_c+pi_c
		0	1000.0	;	# 1367 h2o_c+pail45p_hs_18_2_18_2_c --> h_c+mi145p_c+dag_hs_18_2_18_2_c
		0	1000.0	;	# 1368 arachdcoa_c+alpha_hs_18_2_c --> coa_c+pa_hs_18_2_20_4_c
		0	1000.0	;	# 1369 h2o_c+pa_hs_18_2_20_4_c --> pi_c+dag_hs_18_2_20_4_c
		0	1000.0	;	# 1370 cdpea_c+dag_hs_18_2_20_4_c --> cmp_c+pe_hs_18_2_20_4_c+h_c
		0	1000.0	;	# 1371 pe_hs_18_2_20_4_c+ser_L_c --> etha_c+ps_hs_18_2_20_4_c
		0	1000.0	;	# 1372 etha_c+ps_hs_18_2_20_4_c --> pe_hs_18_2_20_4_c+ser_L_c
		0	1000.0	;	# 1373 chol_c+ps_hs_18_2_20_4_c --> ser_L_c+pchol_hs_18_2_20_4_c
		0	1000.0	;	# 1374 ser_L_c+pchol_hs_18_2_20_4_c --> chol_c+ps_hs_18_2_20_4_c
		0	1000.0	;	# 1375 cdpchol_c+dag_hs_18_2_20_4_c --> cmp_c+h_c+pchol_hs_18_2_20_4_c
		0	1000.0	;	# 1376 h2o_c+pchol_hs_18_2_20_4_c --> h_c+lpchol_hs_18_2_c+arachd_c
		0	1000.0	;	# 1377 pa_hs_18_2_20_4_c+h_c+adp_c --> atp_c+dag_hs_18_2_20_4_c
		0	1000.0	;	# 1378 atp_c+dag_hs_18_2_20_4_c --> pa_hs_18_2_20_4_c+h_c+adp_c
		0	1000.0	;	# 1379 h2o_c+dag_hs_18_2_20_4_c --> h_c+arachd_c+mag_hs_18_2_c
		0	1000.0	;	# 1380 ctp_c+pa_hs_18_2_20_4_c+h_c --> ppi_c+cdpdag_hs_18_2_20_4_c
		0	1000.0	;	# 1381 inost_c+cdpdag_hs_18_2_20_4_c --> cmp_c+pail_hs_18_2_20_4_c+h_c
		0	1000.0	;	# 1382 h2o_c+pail_hs_18_2_20_4_c --> mi1p_D_c+h_c+dag_hs_18_2_20_4_c
		0	1000.0	;	# 1383 pail_hs_18_2_20_4_c+atp_c --> pail4p_hs_18_2_20_4_c+h_c+adp_c
		0	1000.0	;	# 1384 h2o_c+pail4p_hs_18_2_20_4_c --> h_c+dag_hs_18_2_20_4_c+mi14p_c
		0	1000.0	;	# 1385 atp_c+pail4p_hs_18_2_20_4_c --> pail34p_hs_18_2_20_4_c+h_c+adp_c
		0	1000.0	;	# 1386 pail34p_hs_18_2_20_4_c+atp_c --> pail345p_hs_18_2_20_4_c+h_c+adp_c
		0	1000.0	;	# 1387 atp_c+pail45p_hs_18_2_20_4_c --> pail345p_hs_18_2_20_4_c+h_c+adp_c
		0	1000.0	;	# 1388 h2o_c+pail345p_hs_18_2_20_4_c --> pi_c+pail45p_hs_18_2_20_4_c
		0	1000.0	;	# 1389 h2o_c+pail45p_hs_18_2_20_4_c --> h_c+mi145p_c+dag_hs_18_2_20_4_c
		0	1000.0	;	# 1390 alpha_hs_20_4_c+arachdcoa_c --> pa_hs_20_4_20_4_c+coa_c
		0	1000.0	;	# 1391 h2o_c+pa_hs_20_4_20_4_c --> dag_hs_20_4_20_4_c+pi_c
		0	1000.0	;	# 1392 dag_hs_20_4_20_4_c+cdpea_c --> pe_hs_20_4_20_4_c+cmp_c+h_c
		0	1000.0	;	# 1393 pe_hs_20_4_20_4_c+ser_L_c --> ps_hs_20_4_20_4_c+etha_c
		0	1000.0	;	# 1394 ps_hs_20_4_20_4_c+etha_c --> pe_hs_20_4_20_4_c+ser_L_c
		0	1000.0	;	# 1395 chol_c+ps_hs_20_4_20_4_c --> ser_L_c+pchol_hs_20_4_20_4_c
		0	1000.0	;	# 1396 ser_L_c+pchol_hs_20_4_20_4_c --> chol_c+ps_hs_20_4_20_4_c
		0	1000.0	;	# 1397 dag_hs_20_4_20_4_c+cdpchol_c --> cmp_c+h_c+pchol_hs_20_4_20_4_c
		0	1000.0	;	# 1398 h2o_c+pchol_hs_20_4_20_4_c --> h_c+lpchol_hs_20_4_c+arachd_c
		0	1000.0	;	# 1399 pa_hs_20_4_20_4_c+h_c+adp_c --> dag_hs_20_4_20_4_c+atp_c
		0	1000.0	;	# 1400 dag_hs_20_4_20_4_c+atp_c --> pa_hs_20_4_20_4_c+h_c+adp_c
		0	1000.0	;	# 1401 dag_hs_20_4_20_4_c+h2o_c --> mag_hs_20_4_c+h_c+arachd_c
		0	1000.0	;	# 1402 pa_hs_20_4_20_4_c+ctp_c+h_c --> ppi_c+cdpdag_hs_20_4_20_4_c
		0	1000.0	;	# 1403 inost_c+cdpdag_hs_20_4_20_4_c --> cmp_c+pail_hs_20_4_20_4_c+h_c
		0	1000.0	;	# 1404 h2o_c+pail_hs_20_4_20_4_c --> dag_hs_20_4_20_4_c+mi1p_D_c+h_c
		0	1000.0	;	# 1405 pail_hs_20_4_20_4_c+atp_c --> h_c+adp_c+pail4p_hs_20_4_20_4_c
		0	1000.0	;	# 1406 h2o_c+pail4p_hs_20_4_20_4_c --> dag_hs_20_4_20_4_c+h_c+mi14p_c
		0	1000.0	;	# 1407 atp_c+pail4p_hs_20_4_20_4_c --> h_c+pail34p_hs_20_4_20_4_c+adp_c
		0	1000.0	;	# 1408 atp_c+pail34p_hs_20_4_20_4_c --> pail345p_hs_20_4_20_4_c+h_c+adp_c
		0	1000.0	;	# 1409 pail45p_hs_20_4_20_4_c+atp_c --> pail345p_hs_20_4_20_4_c+h_c+adp_c
		0	1000.0	;	# 1410 h2o_c+pail345p_hs_20_4_20_4_c --> pail45p_hs_20_4_20_4_c+pi_c
		0	1000.0	;	# 1411 h2o_c+pail45p_hs_20_4_20_4_c --> dag_hs_20_4_20_4_c+h_c+mi145p_c
		0	1000.0	;	# 1412 h2o_c+paf_hs_c --> ac_c+h_c+ak2lgchol_hs_c
		0	1000.0	;	# 1413 accoa_c+ak2lgchol_hs_c --> coa_c+paf_hs_c
		0	1000.0	;	# 1414 pyr_c+h_c --> h_m+pyr_m
		0	1000.0	;	# 1415 h_m+pyr_m --> pyr_c+h_c
		0	1000.0	;	# 1416 Tyr_ggn_c --> []
		0	1000.0	;	# 1417 [] --> Tyr_ggn_c
		0	1000.0	;	# 1418 paf_hs_e --> []
		0	1000.0	;	# 1419 [] --> paf_hs_e
		0	1000.0	;	# 1420 paf_hs_e --> paf_hs_c
		0	1000.0	;	# 1421 paf_hs_c --> paf_hs_e
		0	1000.0	;	# 1422 paf_hs_c --> []
		0	1000.0	;	# 1423 [] --> paf_hs_c
		0	1000.0	;	# 1424 gly_e+h_e --> gly_c+h_c
		0	1000.0	;	# 1425 gly_c+h_c --> gly_e+h_e
		0	1000.0	;	# 1426 fad_m+pro_L_m --> 1pyr5c_m+fadh2_m+h_m
		0	1000.0	;	# 1427 1pyr5c_m+fadh2_m+h_m --> fad_m+pro_L_m
		0	1000.0	;	# 1428 hxan_c --> hxan_x
		0	1000.0	;	# 1429 hxan_x --> hxan_c
		0	1000.0	;	# 1430 hxan_x+o2_x+h2o_x --> h2o2_x+xan_x
		0	1000.0	;	# 1431 h2o2_x+xan_x --> hxan_x+o2_x+h2o_x
		0	1000.0	;	# 1432 glygn3_c --> []
		0	1000.0	;	# 1433 [] --> glygn3_c
		0	1000.0	;	# 1434 adp_c --> []
		0	1000.0	;	# 1435 [] --> adp_c
		0	1000.0	;	# 1436 h2o_c+atp_c --> pi_c+h_c+adp_c
		0	1000.0	;	# 1437 pi_c+h_c+adp_c --> h2o_c+atp_c
		0	1000.0	;	# 1438 accoa_c --> accoa_m
		0	1000.0	;	# 1439 amp_e --> amp_c
		0	1000.0	;	# 1440 amp_c --> amp_e
		0	1000.0	;	# 1441 atp_m+adp_c --> atp_c+adp_m
		0	1000.0	;	# 1442 h2o_c --> h2o_m
		0	1000.0	;	# 1443 h2o_m --> h2o_c
		0	1000.0	;	# 1444 h2o_e --> h2o_c
		0	1000.0	;	# 1445 h2o_c --> h2o_e
		0	1000.0	;	# 1446 2.0*na1_e+pi_e --> 2.0*na1_c+pi_c
		0	1000.0	;	# 1447 2.0*na1_c+pi_c --> 2.0*na1_e+pi_e
		0	1000.0	;	# 1448 atp_m+coa_m+succ_m --> pi_m+succoa_m+adp_m
		0	1000.0	;	# 1449 pi_m+succoa_m+adp_m --> atp_m+coa_m+succ_m
		0	1000.0	;	# 1450 co2_c --> co2_m
		0	1000.0	;	# 1451 co2_m --> co2_c
		0	1000.0	;	# 1452 coa_c --> coa_m
		0	1000.0	;	# 1453 coa_m --> coa_c
		0	1000.0	;	# 1454 nh4_c+h_e --> nh4_e+h_c
		0	1000.0	;	# 1455 nh4_e+h_c --> nh4_c+h_e
		0	1000.0	;	# 1456 h_e --> h_c
		0	1000.0	;	# 1457 h_c --> h_e
		0	1000.0	;	# 1458 gln_L_e --> gln_L_c
		0	1000.0	;	# 1459 gln_L_c --> gln_L_e
	];

	# Setup default species bounds array - 
	species_bounds_array = [
		0.0	0.0	;	# 1 10fthf5glu_l
		0.0	0.0	;	# 2 10fthf5glu_m
		0.0	0.0	;	# 3 10fthf6glu_c
		0.0	0.0	;	# 4 10fthf6glu_l
		0.0	0.0	;	# 5 10fthf6glu_m
		0.0	0.0	;	# 6 10fthf7glu_c
		0.0	0.0	;	# 7 10fthf7glu_l
		0.0	0.0	;	# 8 10fthf7glu_m
		0.0	0.0	;	# 9 10fthf_c
		0.0	0.0	;	# 10 10fthf_l
		0.0	0.0	;	# 11 10fthf_m
		0.0	0.0	;	# 12 12HPET_c
		0.0	0.0	;	# 13 12harachd_c
		0.0	0.0	;	# 14 12ppd_R_c
		0.0	0.0	;	# 15 12ppd_S_c
		0.0	0.0	;	# 16 13dpg_c
		0.0	0.0	;	# 17 15HPET_c
		0.0	0.0	;	# 18 1pyr5c_m
		0.0	0.0	;	# 19 23dpg_c
		0.0	0.0	;	# 20 25aics_c
		0.0	0.0	;	# 21 2dr1p_c
		0.0	0.0	;	# 22 2dr5p_c
		0.0	0.0	;	# 23 2maacoa_m
		0.0	0.0	;	# 24 2mb2coa_m
		0.0	0.0	;	# 25 2mbcoa_m
		0.0	0.0	;	# 26 2mop_m
		0.0	0.0	;	# 27 2mp2coa_m
		0.0	0.0	;	# 28 2oxoadp_c
		0.0	0.0	;	# 29 2oxoadp_m
		0.0	0.0	;	# 30 2pg_c
		0.0	0.0	;	# 31 34dhpac_c
		0.0	0.0	;	# 32 34dhpha_c
		0.0	0.0	;	# 33 34dhphe_c
		0.0	0.0	;	# 34 34hpp_c
		0.0	0.0	;	# 35 35cgmp_c
		0.0	0.0	;	# 36 35cgmp_e
		0.0	0.0	;	# 37 3dhguln_c
		0.0	0.0	;	# 38 3hbcoa_m
		0.0	0.0	;	# 39 3hibutcoa_m
		0.0	0.0	;	# 40 3hmbcoa_m
		0.0	0.0	;	# 41 3hmp_m
		0.0	0.0	;	# 42 3mb2coa_m
		0.0	0.0	;	# 43 3mgcoa_m
		0.0	0.0	;	# 44 3mob_c
		0.0	0.0	;	# 45 3mob_m
		0.0	0.0	;	# 46 3mop_c
		0.0	0.0	;	# 47 3mop_m
		0.0	0.0	;	# 48 3mox4hpac_c
		0.0	0.0	;	# 49 3moxtyr_c
		0.0	0.0	;	# 50 3pg_c
		0.0	0.0	;	# 51 4abut_c
		0.0	0.0	;	# 52 4abut_m
		0.0	0.0	;	# 53 4fumacac_c
		0.0	0.0	;	# 54 4hoxpacd_c
		0.0	0.0	;	# 55 4hphac_c
		0.0	0.0	;	# 56 4hphac_e
		0.0	0.0	;	# 57 4mlacac_c
		0.0	0.0	;	# 58 4mop_c
		0.0	0.0	;	# 59 4mop_m
		0.0	0.0	;	# 60 4nph_c
		0.0	0.0	;	# 61 4nph_e
		0.0	0.0	;	# 62 4nphsf_c
		0.0	0.0	;	# 63 4nphsf_e
		0.0	0.0	;	# 64 56dura_c
		0.0	0.0	;	# 65 5HPET_c
		0.0	0.0	;	# 66 5aizc_c
		0.0	0.0	;	# 67 5aop_c
		0.0	0.0	;	# 68 5aop_m
		0.0	0.0	;	# 69 5hoxindact_c
		0.0	0.0	;	# 70 5hoxindoa_c
		0.0	0.0	;	# 71 5htrp_c
		0.0	0.0	;	# 72 5moxact_c
		0.0	0.0	;	# 73 5mthf_c
		0.0	0.0	;	# 74 5mthf_e
		0.0	0.0	;	# 75 5oxpro_c
		0.0	0.0	;	# 76 6pgc_c
		0.0	0.0	;	# 77 6pgl_c
		0.0	0.0	;	# 78 L2aadp6sa_m
		0.0	0.0	;	# 79 L2aadp_c
		0.0	0.0	;	# 80 L2aadp_m
		0.0	0.0	;	# 81 Lcystin_c
		0.0	0.0	;	# 82 Lcystin_e
		0.0	0.0	;	# 83 Sfglutth_c
		0.0	0.0	;	# 84 Tyr_ggn_c
		0.0	0.0	;	# 85 aacoa_c
		0.0	0.0	;	# 86 aacoa_m
		0.0	0.0	;	# 87 ac_c
		0.0	0.0	;	# 88 ac_e
		0.0	0.0	;	# 89 acac_c
		0.0	0.0	;	# 90 acac_m
		0.0	0.0	;	# 91 acald_c
		0.0	0.0	;	# 92 accoa_c
		0.0	0.0	;	# 93 accoa_m
		0.0	0.0	;	# 94 acetol_c
		0.0	0.0	;	# 95 acrn_c
		0.0	0.0	;	# 96 ade_c
		0.0	0.0	;	# 97 ade_e
		0.0	0.0	;	# 98 adn_c
		0.0	0.0	;	# 99 adn_e
		0.0	0.0	;	# 100 adp_c
		0.0	0.0	;	# 101 adp_e
		0.0	0.0	;	# 102 adp_m
		0.0	0.0	;	# 103 adprib_c
		0.0	0.0	;	# 104 adprib_e
		0.0	0.0	;	# 105 adrnl_c
		0.0	0.0	;	# 106 adrnl_e
		0.0	0.0	;	# 107 ahcys_c
		0.0	0.0	;	# 108 aicar_c
		0.0	0.0	;	# 109 air_c
		0.0	0.0	;	# 110 ak2lgchol_hs_c
		0.0	0.0	;	# 111 akg_c
		0.0	0.0	;	# 112 akg_m
		0.0	0.0	;	# 113 ala_B_c
		0.0	0.0	;	# 114 ala_B_m
		0.0	0.0	;	# 115 ala_L_c
		0.0	0.0	;	# 116 ala_L_e
		0.0	0.0	;	# 117 alpha_hs_16_0_c
		0.0	0.0	;	# 118 alpha_hs_18_0_c
		0.0	0.0	;	# 119 alpha_hs_18_1_c
		0.0	0.0	;	# 120 alpha_hs_18_2_c
		0.0	0.0	;	# 121 alpha_hs_20_4_c
		0.0	0.0	;	# 122 amet_c
		0.0	0.0	;	# 123 amp_c
		0.0	0.0	;	# 124 amp_e
		0.0	0.0	;	# 125 amp_m
		0.0	0.0	;	# 126 aps_c
		0.0	0.0	;	# 127 arachd_c
		0.0	0.0	;	# 128 arachd_e
		0.0	0.0	;	# 129 arachd_r
		0.0	0.0	;	# 130 arachdcoa_c
		0.0	0.0	;	# 131 arachdcoa_m
		0.0	0.0	;	# 132 arachdcrn_c
		0.0	0.0	;	# 133 arachdcrn_m
		0.0	0.0	;	# 134 arg_L_c
		0.0	0.0	;	# 135 arg_L_e
		0.0	0.0	;	# 136 argsuc_c
		0.0	0.0	;	# 137 ascb_L_c
		0.0	0.0	;	# 138 ascb_L_e
		0.0	0.0	;	# 139 asn_L_c
		0.0	0.0	;	# 140 asn_L_e
		0.0	0.0	;	# 141 asn_L_m
		0.0	0.0	;	# 142 asp_L_c
		0.0	0.0	;	# 143 asp_L_e
		0.0	0.0	;	# 144 asp_L_m
		0.0	0.0	;	# 145 atp_c
		0.0	0.0	;	# 146 atp_m
		0.0	0.0	;	# 147 b2coa_m
		0.0	0.0	;	# 148 bilirub_c
		0.0	0.0	;	# 149 bilirub_e
		0.0	0.0	;	# 150 biliverd_c
		0.0	0.0	;	# 151 ca2_c
		0.0	0.0	;	# 152 ca2_e
		0.0	0.0	;	# 153 cala_c
		0.0	0.0	;	# 154 camp_c
		0.0	0.0	;	# 155 cbp_m
		0.0	0.0	;	# 156 cdp_c
		0.0	0.0	;	# 157 cdpchol_c
		0.0	0.0	;	# 158 cdpdag_hs_16_0_16_0_c
		0.0	0.0	;	# 159 cdpdag_hs_16_0_18_0_c
		0.0	0.0	;	# 160 cdpdag_hs_16_0_18_1_c
		0.0	0.0	;	# 161 cdpdag_hs_16_0_18_2_c
		0.0	0.0	;	# 162 cdpdag_hs_16_0_20_4_c
		0.0	0.0	;	# 163 cdpdag_hs_18_0_18_0_c
		0.0	0.0	;	# 164 cdpdag_hs_18_0_18_1_c
		0.0	0.0	;	# 165 cdpdag_hs_18_0_18_2_c
		0.0	0.0	;	# 166 cdpdag_hs_18_0_20_4_c
		0.0	0.0	;	# 167 cdpdag_hs_18_1_18_1_c
		0.0	0.0	;	# 168 cdpdag_hs_18_1_18_2_c
		0.0	0.0	;	# 169 cdpdag_hs_18_1_20_4_c
		0.0	0.0	;	# 170 cdpdag_hs_18_2_18_2_c
		0.0	0.0	;	# 171 cdpdag_hs_18_2_20_4_c
		0.0	0.0	;	# 172 cdpdag_hs_20_4_20_4_c
		0.0	0.0	;	# 173 cdpea_c
		0.0	0.0	;	# 174 cgly_e
		0.0	0.0	;	# 175 chol_c
		0.0	0.0	;	# 176 chol_e
		0.0	0.0	;	# 177 cholp_c
		0.0	0.0	;	# 178 cit_c
		0.0	0.0	;	# 179 cit_e
		0.0	0.0	;	# 180 cit_m
		0.0	0.0	;	# 181 citr_L_c
		0.0	0.0	;	# 182 citr_L_m
		0.0	0.0	;	# 183 cl_c
		0.0	0.0	;	# 184 cl_e
		0.0	0.0	;	# 185 cmp_c
		0.0	0.0	;	# 186 co2_c
		0.0	0.0	;	# 187 co2_e
		0.0	0.0	;	# 188 co2_m
		0.0	0.0	;	# 189 co_c
		0.0	0.0	;	# 190 co_e
		0.0	0.0	;	# 191 coa_c
		0.0	0.0	;	# 192 coa_m
		0.0	0.0	;	# 193 cpppg3_c
		0.0	0.0	;	# 194 creat_c
		0.0	0.0	;	# 195 creat_e
		0.0	0.0	;	# 196 crn_c
		0.0	0.0	;	# 197 crn_e
		0.0	0.0	;	# 198 crn_m
		0.0	0.0	;	# 199 ctp_c
		0.0	0.0	;	# 200 cyan_c
		0.0	0.0	;	# 201 cyan_e
		0.0	0.0	;	# 202 cyan_m
		0.0	0.0	;	# 203 cys_L_c
		0.0	0.0	;	# 204 cys_L_e
		0.0	0.0	;	# 205 cytd_c
		0.0	0.0	;	# 206 cytd_e
		0.0	0.0	;	# 207 dad_2_c
		0.0	0.0	;	# 208 dag_hs_16_0_16_0_c
		0.0	0.0	;	# 209 dag_hs_16_0_18_0_c
		0.0	0.0	;	# 210 dag_hs_16_0_18_1_c
		0.0	0.0	;	# 211 dag_hs_16_0_18_2_c
		0.0	0.0	;	# 212 dag_hs_16_0_20_4_c
		0.0	0.0	;	# 213 dag_hs_18_0_18_0_c
		0.0	0.0	;	# 214 dag_hs_18_0_18_1_c
		0.0	0.0	;	# 215 dag_hs_18_0_18_2_c
		0.0	0.0	;	# 216 dag_hs_18_0_20_4_c
		0.0	0.0	;	# 217 dag_hs_18_1_18_1_c
		0.0	0.0	;	# 218 dag_hs_18_1_18_2_c
		0.0	0.0	;	# 219 dag_hs_18_1_20_4_c
		0.0	0.0	;	# 220 dag_hs_18_2_18_2_c
		0.0	0.0	;	# 221 dag_hs_18_2_20_4_c
		0.0	0.0	;	# 222 dag_hs_20_4_20_4_c
		0.0	0.0	;	# 223 dcacoa_c
		0.0	0.0	;	# 224 dcamp_c
		0.0	0.0	;	# 225 ddcacoa_c
		0.0	0.0	;	# 226 dhap_c
		0.0	0.0	;	# 227 dhbpt_c
		0.0	0.0	;	# 228 dhdascb_c
		0.0	0.0	;	# 229 dhdascb_e
		0.0	0.0	;	# 230 din_c
		0.0	0.0	;	# 231 dmgly_c
		0.0	0.0	;	# 232 dmgly_m
		0.0	0.0	;	# 233 dopa_c
		0.0	0.0	;	# 234 dopa_e
		0.0	0.0	;	# 235 dopasf_c
		0.0	0.0	;	# 236 dopasf_e
		0.0	0.0	;	# 237 drib_c
		0.0	0.0	;	# 238 dxtrn_c
		0.0	0.0	;	# 239 e4p_c
		0.0	0.0	;	# 240 estrone_c
		0.0	0.0	;	# 241 estrones_c
		0.0	0.0	;	# 242 etfox_m
		0.0	0.0	;	# 243 etfrd_m
		0.0	0.0	;	# 244 etha_c
		0.0	0.0	;	# 245 f1p_c
		0.0	0.0	;	# 246 f26bp_c
		0.0	0.0	;	# 247 f6p_c
		0.0	0.0	;	# 248 fad_m
		0.0	0.0	;	# 249 fadh2_m
		0.0	0.0	;	# 250 fald_c
		0.0	0.0	;	# 251 fald_m
		0.0	0.0	;	# 252 fdp_c
		0.0	0.0	;	# 253 fe2_c
		0.0	0.0	;	# 254 fe2_e
		0.0	0.0	;	# 255 fe2_m
		0.0	0.0	;	# 256 fgam_c
		0.0	0.0	;	# 257 ficytC_m
		0.0	0.0	;	# 258 focytC_m
		0.0	0.0	;	# 259 for_c
		0.0	0.0	;	# 260 fpram_c
		0.0	0.0	;	# 261 fprica_c
		0.0	0.0	;	# 262 fru_c
		0.0	0.0	;	# 263 fru_e
		0.0	0.0	;	# 264 fum_c
		0.0	0.0	;	# 265 fum_m
		0.0	0.0	;	# 266 g1p_c
		0.0	0.0	;	# 267 g3p_c
		0.0	0.0	;	# 268 g3pc_c
		0.0	0.0	;	# 269 g6p_c
		0.0	0.0	;	# 270 g6p_r
		0.0	0.0	;	# 271 gal1p_c
		0.0	0.0	;	# 272 gal_c
		0.0	0.0	;	# 273 gal_e
		0.0	0.0	;	# 274 gar_c
		0.0	0.0	;	# 275 gdp_c
		0.0	0.0	;	# 276 gdp_e
		0.0	0.0	;	# 277 gdp_m
		0.0	0.0	;	# 278 ggn_c
		0.0	0.0	;	# 279 glc_D_c
		0.0	0.0	;	# 280 glc_D_e
		0.0	0.0	;	# 281 glc_D_r
		0.0	0.0	;	# 282 glcur_c
		0.0	0.0	;	# 283 glcur_r
		0.0	0.0	;	# 284 gln_L_c
		0.0	0.0	;	# 285 gln_L_e
		0.0	0.0	;	# 286 gln_L_m
		0.0	0.0	;	# 287 glu5sa_m
		0.0	0.0	;	# 288 glu_L_c
		0.0	0.0	;	# 289 glu_L_e
		0.0	0.0	;	# 290 glu_L_l
		0.0	0.0	;	# 291 glu_L_m
		0.0	0.0	;	# 292 glu_L_r
		0.0	0.0	;	# 293 gluala_e
		0.0	0.0	;	# 294 glucys_c
		0.0	0.0	;	# 295 glutcoa_m
		0.0	0.0	;	# 296 gly_c
		0.0	0.0	;	# 297 gly_e
		0.0	0.0	;	# 298 gly_m
		0.0	0.0	;	# 299 glyald_c
		0.0	0.0	;	# 300 glyb_c
		0.0	0.0	;	# 301 glyb_e
		0.0	0.0	;	# 302 glyc3p_c
		0.0	0.0	;	# 303 glyc_c
		0.0	0.0	;	# 304 glygn1_c
		0.0	0.0	;	# 305 glygn2_c
		0.0	0.0	;	# 306 glygn3_c
		0.0	0.0	;	# 307 gmp_c
		0.0	0.0	;	# 308 gmp_e
		0.0	0.0	;	# 309 gsn_c
		0.0	0.0	;	# 310 gsn_e
		0.0	0.0	;	# 311 gthox_c
		0.0	0.0	;	# 312 gthox_e
		0.0	0.0	;	# 313 gthox_m
		0.0	0.0	;	# 314 gthrd_c
		0.0	0.0	;	# 315 gthrd_e
		0.0	0.0	;	# 316 gthrd_m
		0.0	0.0	;	# 317 gthrd_r
		0.0	0.0	;	# 318 gtp_c
		0.0	0.0	;	# 319 gtp_m
		0.0	0.0	;	# 320 gua_c
		0.0	0.0	;	# 321 gudac_c
		0.0	0.0	;	# 322 guln_c
		0.0	0.0	;	# 323 guln_r
		0.0	0.0	;	# 324 h2co3_c
		0.0	0.0	;	# 325 h2o2_c
		0.0	0.0	;	# 326 h2o2_e
		0.0	0.0	;	# 327 h2o2_m
		0.0	0.0	;	# 328 h2o2_x
		0.0	0.0	;	# 329 h2o_c
		0.0	0.0	;	# 330 h2o_e
		0.0	0.0	;	# 331 h2o_l
		0.0	0.0	;	# 332 h2o_m
		0.0	0.0	;	# 333 h2o_r
		0.0	0.0	;	# 334 h2o_x
		0.0	0.0	;	# 335 h_c
		0.0	0.0	;	# 336 h_e
		0.0	0.0	;	# 337 h_m
		0.0	0.0	;	# 338 h_r
		0.0	0.0	;	# 339 h_x
		0.0	0.0	;	# 340 hco3_c
		0.0	0.0	;	# 341 hco3_e
		0.0	0.0	;	# 342 hco3_m
		0.0	0.0	;	# 343 hcys_L_c
		0.0	0.0	;	# 344 hdca_c
		0.0	0.0	;	# 345 hdca_e
		0.0	0.0	;	# 346 hgentis_c
		0.0	0.0	;	# 347 his_L_c
		0.0	0.0	;	# 348 his_L_e
		0.0	0.0	;	# 349 hista_c
		0.0	0.0	;	# 350 hista_e
		0.0	0.0	;	# 351 hmbil_c
		0.0	0.0	;	# 352 hmgcoa_m
		0.0	0.0	;	# 353 homoval_c
		0.0	0.0	;	# 354 hxan_c
		0.0	0.0	;	# 355 hxan_e
		0.0	0.0	;	# 356 hxan_x
		0.0	0.0	;	# 357 ibcoa_m
		0.0	0.0	;	# 358 icit_c
		0.0	0.0	;	# 359 icit_m
		0.0	0.0	;	# 360 id3acald_c
		0.0	0.0	;	# 361 ile_L_c
		0.0	0.0	;	# 362 ile_L_e
		0.0	0.0	;	# 363 imp_c
		0.0	0.0	;	# 364 ind3ac_c
		0.0	0.0	;	# 365 inost_c
		0.0	0.0	;	# 366 inost_e
		0.0	0.0	;	# 367 ins_c
		0.0	0.0	;	# 368 ins_e
		0.0	0.0	;	# 369 ivcoa_m
		0.0	0.0	;	# 370 k_c
		0.0	0.0	;	# 371 k_e
		0.0	0.0	;	# 372 lac_D_c
		0.0	0.0	;	# 373 lac_L_c
		0.0	0.0	;	# 374 lac_L_e
		0.0	0.0	;	# 375 lald_D_c
		0.0	0.0	;	# 376 lald_L_c
		0.0	0.0	;	# 377 leu_L_c
		0.0	0.0	;	# 378 leu_L_e
		0.0	0.0	;	# 379 leuktrA4_c
		0.0	0.0	;	# 380 leuktrA4_r
		0.0	0.0	;	# 381 leuktrC4_r
		0.0	0.0	;	# 382 leuktrD4_c
		0.0	0.0	;	# 383 leuktrD4_r
		0.0	0.0	;	# 384 leuktrE4_c
		0.0	0.0	;	# 385 leuktrF4_c
		0.0	0.0	;	# 386 leuktrF4_e
		0.0	0.0	;	# 387 lgt_S_c
		0.0	0.0	;	# 388 lnlc_c
		0.0	0.0	;	# 389 lnlc_e
		0.0	0.0	;	# 390 lnlccoa_c
		0.0	0.0	;	# 391 lnlccoa_m
		0.0	0.0	;	# 392 lnlccrn_c
		0.0	0.0	;	# 393 lnlccrn_m
		0.0	0.0	;	# 394 lpchol_hs_16_0_c
		0.0	0.0	;	# 395 lpchol_hs_18_0_c
		0.0	0.0	;	# 396 lpchol_hs_18_1_c
		0.0	0.0	;	# 397 lpchol_hs_18_2_c
		0.0	0.0	;	# 398 lpchol_hs_20_4_c
		0.0	0.0	;	# 399 lys_L_c
		0.0	0.0	;	# 400 lys_L_e
		0.0	0.0	;	# 401 lys_L_m
		0.0	0.0	;	# 402 mag_hs_16_0_c
		0.0	0.0	;	# 403 mag_hs_18_0_c
		0.0	0.0	;	# 404 mag_hs_18_1_c
		0.0	0.0	;	# 405 mag_hs_18_2_c
		0.0	0.0	;	# 406 mag_hs_20_4_c
		0.0	0.0	;	# 407 mal_L_c
		0.0	0.0	;	# 408 mal_L_m
		0.0	0.0	;	# 409 malcoa_c
		0.0	0.0	;	# 410 meoh_c
		0.0	0.0	;	# 411 mercppyr_c
		0.0	0.0	;	# 412 met_L_c
		0.0	0.0	;	# 413 met_L_e
		0.0	0.0	;	# 414 methf_c
		0.0	0.0	;	# 415 methf_m
		0.0	0.0	;	# 416 mi145p_c
		0.0	0.0	;	# 417 mi14p_c
		0.0	0.0	;	# 418 mi1p_D_c
		0.0	0.0	;	# 419 mi4p_D_c
		0.0	0.0	;	# 420 mlthf_c
		0.0	0.0	;	# 421 mlthf_m
		0.0	0.0	;	# 422 mmcoa_R_m
		0.0	0.0	;	# 423 mmcoa_S_m
		0.0	0.0	;	# 424 msa_m
		0.0	0.0	;	# 425 mthgxl_c
		0.0	0.0	;	# 426 na1_c
		0.0	0.0	;	# 427 na1_e
		0.0	0.0	;	# 428 nad_c
		0.0	0.0	;	# 429 nad_e
		0.0	0.0	;	# 430 nad_m
		0.0	0.0	;	# 431 nadh_c
		0.0	0.0	;	# 432 nadh_m
		0.0	0.0	;	# 433 nadp_c
		0.0	0.0	;	# 434 nadp_m
		0.0	0.0	;	# 435 nadp_r
		0.0	0.0	;	# 436 nadph_c
		0.0	0.0	;	# 437 nadph_m
		0.0	0.0	;	# 438 nadph_r
		0.0	0.0	;	# 439 ncam_c
		0.0	0.0	;	# 440 ncam_e
		0.0	0.0	;	# 441 nh4_c
		0.0	0.0	;	# 442 nh4_e
		0.0	0.0	;	# 443 nh4_m
		0.0	0.0	;	# 444 nmn_c
		0.0	0.0	;	# 445 no_c
		0.0	0.0	;	# 446 no_e
		0.0	0.0	;	# 447 nrpphr_c
		0.0	0.0	;	# 448 nrpphrsf_c
		0.0	0.0	;	# 449 nrpphrsf_e
		0.0	0.0	;	# 450 nwharg_c
		0.0	0.0	;	# 451 o2_c
		0.0	0.0	;	# 452 o2_e
		0.0	0.0	;	# 453 o2_m
		0.0	0.0	;	# 454 o2_r
		0.0	0.0	;	# 455 o2_x
		0.0	0.0	;	# 456 o2s_c
		0.0	0.0	;	# 457 o2s_e
		0.0	0.0	;	# 458 o2s_m
		0.0	0.0	;	# 459 o2s_x
		0.0	0.0	;	# 460 oaa_c
		0.0	0.0	;	# 461 oaa_m
		0.0	0.0	;	# 462 occoa_c
		0.0	0.0	;	# 463 occoa_m
		0.0	0.0	;	# 464 ocdca_c
		0.0	0.0	;	# 465 ocdca_e
		0.0	0.0	;	# 466 ocdcea_c
		0.0	0.0	;	# 467 ocdcea_e
		0.0	0.0	;	# 468 odecoa_c
		0.0	0.0	;	# 469 odecoa_m
		0.0	0.0	;	# 470 odecrn_c
		0.0	0.0	;	# 471 odecrn_m
		0.0	0.0	;	# 472 oh1_c
		0.0	0.0	;	# 473 oh1_e
		0.0	0.0	;	# 474 orn_c
		0.0	0.0	;	# 475 orn_e
		0.0	0.0	;	# 476 orn_m
		0.0	0.0	;	# 477 pa_hs_16_0_16_0_c
		0.0	0.0	;	# 478 pa_hs_16_0_18_0_c
		0.0	0.0	;	# 479 pa_hs_16_0_18_1_c
		0.0	0.0	;	# 480 pa_hs_16_0_18_2_c
		0.0	0.0	;	# 481 pa_hs_16_0_20_4_c
		0.0	0.0	;	# 482 pa_hs_18_0_18_0_c
		0.0	0.0	;	# 483 pa_hs_18_0_18_1_c
		0.0	0.0	;	# 484 pa_hs_18_0_18_2_c
		0.0	0.0	;	# 485 pa_hs_18_0_20_4_c
		0.0	0.0	;	# 486 pa_hs_18_1_18_1_c
		0.0	0.0	;	# 487 pa_hs_18_1_18_2_c
		0.0	0.0	;	# 488 pa_hs_18_1_20_4_c
		0.0	0.0	;	# 489 pa_hs_18_2_18_2_c
		0.0	0.0	;	# 490 pa_hs_18_2_20_4_c
		0.0	0.0	;	# 491 pa_hs_20_4_20_4_c
		0.0	0.0	;	# 492 pac_c
		0.0	0.0	;	# 493 pacald_c
		0.0	0.0	;	# 494 paf_hs_c
		0.0	0.0	;	# 495 paf_hs_e
		0.0	0.0	;	# 496 pail345p_hs_16_0_16_0_c
		0.0	0.0	;	# 497 pail345p_hs_16_0_18_0_c
		0.0	0.0	;	# 498 pail345p_hs_16_0_18_1_c
		0.0	0.0	;	# 499 pail345p_hs_16_0_18_2_c
		0.0	0.0	;	# 500 pail345p_hs_16_0_20_4_c
		0.0	0.0	;	# 501 pail345p_hs_18_0_18_0_c
		0.0	0.0	;	# 502 pail345p_hs_18_0_18_1_c
		0.0	0.0	;	# 503 pail345p_hs_18_0_18_2_c
		0.0	0.0	;	# 504 pail345p_hs_18_0_20_4_c
		0.0	0.0	;	# 505 pail345p_hs_18_1_18_1_c
		0.0	0.0	;	# 506 pail345p_hs_18_1_18_2_c
		0.0	0.0	;	# 507 pail345p_hs_18_1_20_4_c
		0.0	0.0	;	# 508 pail345p_hs_18_2_18_2_c
		0.0	0.0	;	# 509 pail345p_hs_18_2_20_4_c
		0.0	0.0	;	# 510 pail345p_hs_20_4_20_4_c
		0.0	0.0	;	# 511 pail34p_hs_16_0_16_0_c
		0.0	0.0	;	# 512 pail34p_hs_16_0_18_0_c
		0.0	0.0	;	# 513 pail34p_hs_16_0_18_1_c
		0.0	0.0	;	# 514 pail34p_hs_16_0_18_2_c
		0.0	0.0	;	# 515 pail34p_hs_16_0_20_4_c
		0.0	0.0	;	# 516 pail34p_hs_18_0_18_0_c
		0.0	0.0	;	# 517 pail34p_hs_18_0_18_1_c
		0.0	0.0	;	# 518 pail34p_hs_18_0_18_2_c
		0.0	0.0	;	# 519 pail34p_hs_18_0_20_4_c
		0.0	0.0	;	# 520 pail34p_hs_18_1_18_1_c
		0.0	0.0	;	# 521 pail34p_hs_18_1_18_2_c
		0.0	0.0	;	# 522 pail34p_hs_18_1_20_4_c
		0.0	0.0	;	# 523 pail34p_hs_18_2_18_2_c
		0.0	0.0	;	# 524 pail34p_hs_18_2_20_4_c
		0.0	0.0	;	# 525 pail34p_hs_20_4_20_4_c
		0.0	0.0	;	# 526 pail45p_hs_16_0_16_0_c
		0.0	0.0	;	# 527 pail45p_hs_16_0_18_0_c
		0.0	0.0	;	# 528 pail45p_hs_16_0_18_1_c
		0.0	0.0	;	# 529 pail45p_hs_16_0_18_2_c
		0.0	0.0	;	# 530 pail45p_hs_16_0_20_4_c
		0.0	0.0	;	# 531 pail45p_hs_18_0_18_0_c
		0.0	0.0	;	# 532 pail45p_hs_18_0_18_1_c
		0.0	0.0	;	# 533 pail45p_hs_18_0_18_2_c
		0.0	0.0	;	# 534 pail45p_hs_18_0_20_4_c
		0.0	0.0	;	# 535 pail45p_hs_18_1_18_1_c
		0.0	0.0	;	# 536 pail45p_hs_18_1_18_2_c
		0.0	0.0	;	# 537 pail45p_hs_18_1_20_4_c
		0.0	0.0	;	# 538 pail45p_hs_18_2_18_2_c
		0.0	0.0	;	# 539 pail45p_hs_18_2_20_4_c
		0.0	0.0	;	# 540 pail45p_hs_20_4_20_4_c
		0.0	0.0	;	# 541 pail4p_hs_16_0_16_0_c
		0.0	0.0	;	# 542 pail4p_hs_16_0_18_0_c
		0.0	0.0	;	# 543 pail4p_hs_16_0_18_1_c
		0.0	0.0	;	# 544 pail4p_hs_16_0_18_2_c
		0.0	0.0	;	# 545 pail4p_hs_16_0_20_4_c
		0.0	0.0	;	# 546 pail4p_hs_18_0_18_0_c
		0.0	0.0	;	# 547 pail4p_hs_18_0_18_1_c
		0.0	0.0	;	# 548 pail4p_hs_18_0_18_2_c
		0.0	0.0	;	# 549 pail4p_hs_18_0_20_4_c
		0.0	0.0	;	# 550 pail4p_hs_18_1_18_1_c
		0.0	0.0	;	# 551 pail4p_hs_18_1_18_2_c
		0.0	0.0	;	# 552 pail4p_hs_18_1_20_4_c
		0.0	0.0	;	# 553 pail4p_hs_18_2_18_2_c
		0.0	0.0	;	# 554 pail4p_hs_18_2_20_4_c
		0.0	0.0	;	# 555 pail4p_hs_20_4_20_4_c
		0.0	0.0	;	# 556 pail_hs_16_0_16_0_c
		0.0	0.0	;	# 557 pail_hs_16_0_18_0_c
		0.0	0.0	;	# 558 pail_hs_16_0_18_1_c
		0.0	0.0	;	# 559 pail_hs_16_0_18_2_c
		0.0	0.0	;	# 560 pail_hs_16_0_20_4_c
		0.0	0.0	;	# 561 pail_hs_18_0_18_0_c
		0.0	0.0	;	# 562 pail_hs_18_0_18_1_c
		0.0	0.0	;	# 563 pail_hs_18_0_18_2_c
		0.0	0.0	;	# 564 pail_hs_18_0_20_4_c
		0.0	0.0	;	# 565 pail_hs_18_1_18_1_c
		0.0	0.0	;	# 566 pail_hs_18_1_18_2_c
		0.0	0.0	;	# 567 pail_hs_18_1_20_4_c
		0.0	0.0	;	# 568 pail_hs_18_2_18_2_c
		0.0	0.0	;	# 569 pail_hs_18_2_20_4_c
		0.0	0.0	;	# 570 pail_hs_20_4_20_4_c
		0.0	0.0	;	# 571 pap_c
		0.0	0.0	;	# 572 paps_c
		0.0	0.0	;	# 573 pchol_hs_16_0_16_0_c
		0.0	0.0	;	# 574 pchol_hs_16_0_18_0_c
		0.0	0.0	;	# 575 pchol_hs_16_0_18_1_c
		0.0	0.0	;	# 576 pchol_hs_16_0_18_2_c
		0.0	0.0	;	# 577 pchol_hs_16_0_20_4_c
		0.0	0.0	;	# 578 pchol_hs_18_0_18_0_c
		0.0	0.0	;	# 579 pchol_hs_18_0_18_1_c
		0.0	0.0	;	# 580 pchol_hs_18_0_18_2_c
		0.0	0.0	;	# 581 pchol_hs_18_0_20_4_c
		0.0	0.0	;	# 582 pchol_hs_18_1_18_1_c
		0.0	0.0	;	# 583 pchol_hs_18_1_18_2_c
		0.0	0.0	;	# 584 pchol_hs_18_1_20_4_c
		0.0	0.0	;	# 585 pchol_hs_18_2_18_2_c
		0.0	0.0	;	# 586 pchol_hs_18_2_20_4_c
		0.0	0.0	;	# 587 pchol_hs_20_4_20_4_c
		0.0	0.0	;	# 588 pe_hs_16_0_16_0_c
		0.0	0.0	;	# 589 pe_hs_16_0_18_0_c
		0.0	0.0	;	# 590 pe_hs_16_0_18_1_c
		0.0	0.0	;	# 591 pe_hs_16_0_18_2_c
		0.0	0.0	;	# 592 pe_hs_16_0_20_4_c
		0.0	0.0	;	# 593 pe_hs_18_0_18_0_c
		0.0	0.0	;	# 594 pe_hs_18_0_18_1_c
		0.0	0.0	;	# 595 pe_hs_18_0_18_2_c
		0.0	0.0	;	# 596 pe_hs_18_0_20_4_c
		0.0	0.0	;	# 597 pe_hs_18_1_18_1_c
		0.0	0.0	;	# 598 pe_hs_18_1_18_2_c
		0.0	0.0	;	# 599 pe_hs_18_1_20_4_c
		0.0	0.0	;	# 600 pe_hs_18_2_18_2_c
		0.0	0.0	;	# 601 pe_hs_18_2_20_4_c
		0.0	0.0	;	# 602 pe_hs_20_4_20_4_c
		0.0	0.0	;	# 603 peamn_c
		0.0	0.0	;	# 604 pep_c
		0.0	0.0	;	# 605 phaccoa_c
		0.0	0.0	;	# 606 phe_L_c
		0.0	0.0	;	# 607 phe_L_e
		0.0	0.0	;	# 608 pheacgln_c
		0.0	0.0	;	# 609 pheacgln_e
		0.0	0.0	;	# 610 pheme_c
		0.0	0.0	;	# 611 pheme_e
		0.0	0.0	;	# 612 pheme_m
		0.0	0.0	;	# 613 pi_c
		0.0	0.0	;	# 614 pi_e
		0.0	0.0	;	# 615 pi_m
		0.0	0.0	;	# 616 pi_r
		0.0	0.0	;	# 617 pmtcoa_c
		0.0	0.0	;	# 618 pmtcoa_m
		0.0	0.0	;	# 619 pmtcrn_c
		0.0	0.0	;	# 620 pmtcrn_m
		0.0	0.0	;	# 621 ppbng_c
		0.0	0.0	;	# 622 ppcoa_m
		0.0	0.0	;	# 623 ppi_c
		0.0	0.0	;	# 624 ppp9_m
		0.0	0.0	;	# 625 pppg9_c
		0.0	0.0	;	# 626 pppg9_m
		0.0	0.0	;	# 627 pram_c
		0.0	0.0	;	# 628 pro_L_c
		0.0	0.0	;	# 629 pro_L_e
		0.0	0.0	;	# 630 pro_L_m
		0.0	0.0	;	# 631 prostgd2_c
		0.0	0.0	;	# 632 prostgd2_e
		0.0	0.0	;	# 633 prostgg2_c
		0.0	0.0	;	# 634 prostgh2_c
		0.0	0.0	;	# 635 prostgh2_r
		0.0	0.0	;	# 636 prpp_c
		0.0	0.0	;	# 637 ps_hs_16_0_16_0_c
		0.0	0.0	;	# 638 ps_hs_16_0_18_0_c
		0.0	0.0	;	# 639 ps_hs_16_0_18_1_c
		0.0	0.0	;	# 640 ps_hs_16_0_18_2_c
		0.0	0.0	;	# 641 ps_hs_16_0_20_4_c
		0.0	0.0	;	# 642 ps_hs_18_0_18_0_c
		0.0	0.0	;	# 643 ps_hs_18_0_18_1_c
		0.0	0.0	;	# 644 ps_hs_18_0_18_2_c
		0.0	0.0	;	# 645 ps_hs_18_0_20_4_c
		0.0	0.0	;	# 646 ps_hs_18_1_18_1_c
		0.0	0.0	;	# 647 ps_hs_18_1_18_2_c
		0.0	0.0	;	# 648 ps_hs_18_1_20_4_c
		0.0	0.0	;	# 649 ps_hs_18_2_18_2_c
		0.0	0.0	;	# 650 ps_hs_18_2_20_4_c
		0.0	0.0	;	# 651 ps_hs_20_4_20_4_c
		0.0	0.0	;	# 652 pyr_c
		0.0	0.0	;	# 653 pyr_e
		0.0	0.0	;	# 654 pyr_m
		0.0	0.0	;	# 655 q10_m
		0.0	0.0	;	# 656 q10h2_m
		0.0	0.0	;	# 657 r1p_c
		0.0	0.0	;	# 658 r5p_c
		0.0	0.0	;	# 659 rnam_c
		0.0	0.0	;	# 660 ru5p_D_c
		0.0	0.0	;	# 661 s7p_c
		0.0	0.0	;	# 662 saccrp_L_m
		0.0	0.0	;	# 663 sarcs_m
		0.0	0.0	;	# 664 sbt_D_c
		0.0	0.0	;	# 665 ser_L_c
		0.0	0.0	;	# 666 ser_L_e
		0.0	0.0	;	# 667 so3_c
		0.0	0.0	;	# 668 so3_m
		0.0	0.0	;	# 669 so4_c
		0.0	0.0	;	# 670 so4_e
		0.0	0.0	;	# 671 spc_hs_c
		0.0	0.0	;	# 672 spc_hs_e
		0.0	0.0	;	# 673 sphings_c
		0.0	0.0	;	# 674 sphs1p_c
		0.0	0.0	;	# 675 sphs1p_e
		0.0	0.0	;	# 676 srtn_c
		0.0	0.0	;	# 677 srtn_e
		0.0	0.0	;	# 678 stcoa_c
		0.0	0.0	;	# 679 stcoa_m
		0.0	0.0	;	# 680 stcrn_c
		0.0	0.0	;	# 681 stcrn_m
		0.0	0.0	;	# 682 succ_c
		0.0	0.0	;	# 683 succ_e
		0.0	0.0	;	# 684 succ_m
		0.0	0.0	;	# 685 succoa_m
		0.0	0.0	;	# 686 sucsal_m
		0.0	0.0	;	# 687 tcynt_c
		0.0	0.0	;	# 688 tcynt_e
		0.0	0.0	;	# 689 tcynt_m
		0.0	0.0	;	# 690 tdcoa_c
		0.0	0.0	;	# 691 thbpt4acam_c
		0.0	0.0	;	# 692 thbpt_c
		0.0	0.0	;	# 693 thf_c
		0.0	0.0	;	# 694 thf_m
		0.0	0.0	;	# 695 thym_c
		0.0	0.0	;	# 696 thym_e
		0.0	0.0	;	# 697 thymd_c
		0.0	0.0	;	# 698 thymd_e
		0.0	0.0	;	# 699 trp_L_c
		0.0	0.0	;	# 700 trp_L_e
		0.0	0.0	;	# 701 trypta_c
		0.0	0.0	;	# 702 tsul_c
		0.0	0.0	;	# 703 tsul_e
		0.0	0.0	;	# 704 tsul_m
		0.0	0.0	;	# 705 txa2_c
		0.0	0.0	;	# 706 txa2_e
		0.0	0.0	;	# 707 txa2_r
		0.0	0.0	;	# 708 txb2_c
		0.0	0.0	;	# 709 tym_c
		0.0	0.0	;	# 710 tymsf_c
		0.0	0.0	;	# 711 tymsf_e
		0.0	0.0	;	# 712 tyr_L_c
		0.0	0.0	;	# 713 tyr_L_e
		0.0	0.0	;	# 714 udp_c
		0.0	0.0	;	# 715 udpg_c
		0.0	0.0	;	# 716 udpgal_c
		0.0	0.0	;	# 717 ump_c
		0.0	0.0	;	# 718 uppg3_c
		0.0	0.0	;	# 719 ura_c
		0.0	0.0	;	# 720 ura_e
		0.0	0.0	;	# 721 urate_c
		0.0	0.0	;	# 722 urate_e
		0.0	0.0	;	# 723 urate_x
		0.0	0.0	;	# 724 urea_c
		0.0	0.0	;	# 725 urea_e
		0.0	0.0	;	# 726 uri_c
		0.0	0.0	;	# 727 uri_e
		0.0	0.0	;	# 728 utp_c
		0.0	0.0	;	# 729 val_L_c
		0.0	0.0	;	# 730 val_L_e
		0.0	0.0	;	# 731 xan_c
		0.0	0.0	;	# 732 xan_x
		0.0	0.0	;	# 733 xmp_c
		0.0	0.0	;	# 734 xtsn_c
		0.0	0.0	;	# 735 xu5p_D_c
		0.0	0.0	;	# 736 xylt_c
		0.0	0.0	;	# 737 xylu_D_c
		0.0	0.0	;	# 738 xylu_L_c
	];

	# Setup the objective coefficient array - 
	objective_coefficient_array = [
		0.0	;	# 1 sink_xan_c|Intracellular Constraint::xan_c --> []
		0.0	;	# 2 sink_xan_c|Intracellular Constraint_reverse::[] --> xan_c
		0.0	;	# 3 EX_35cgmp_e|Extracellular exchange::35cgmp_e --> []
		0.0	;	# 4 EX_35cgmp_e|Extracellular exchange_reverse::[] --> 35cgmp_e
		0.0	;	# 5 EX_4hphac_e|Extracellular exchange::4hphac_e --> []
		0.0	;	# 6 EX_4hphac_e|Extracellular exchange_reverse::[] --> 4hphac_e
		0.0	;	# 7 EX_4nph_e|Extracellular exchange::4nph_e --> []
		0.0	;	# 8 EX_4nph_e|Extracellular exchange_reverse::[] --> 4nph_e
		0.0	;	# 9 EX_4nphsf_e|Extracellular exchange::4nphsf_e --> []
		0.0	;	# 10 EX_4nphsf_e|Extracellular exchange_reverse::[] --> 4nphsf_e
		0.0	;	# 11 EX_Lcystin_e|Extracellular exchange::Lcystin_e --> []
		0.0	;	# 12 EX_Lcystin_e|Extracellular exchange_reverse::[] --> Lcystin_e
		0.0	;	# 13 EX_ac_e|Extracellular exchange::ac_e --> []
		0.0	;	# 14 EX_ac_e|Extracellular exchange_reverse::[] --> ac_e
		0.0	;	# 15 EX_ade_e|Extracellular exchange::ade_e --> []
		0.0	;	# 16 EX_ade_e|Extracellular exchange_reverse::[] --> ade_e
		0.0	;	# 17 EX_adn_e|Extracellular exchange::adn_e --> []
		0.0	;	# 18 EX_adn_e|Extracellular exchange_reverse::[] --> adn_e
		0.0	;	# 19 EX_adp_e|Extracellular exchange::adp_e --> []
		0.0	;	# 20 EX_adp_e|Extracellular exchange_reverse::[] --> adp_e
		0.0	;	# 21 EX_adprib_e|Extracellular exchange::adprib_e --> []
		0.0	;	# 22 EX_adprib_e|Extracellular exchange_reverse::[] --> adprib_e
		0.0	;	# 23 EX_adrnl_e|Extracellular exchange::adrnl_e --> []
		0.0	;	# 24 EX_adrnl_e|Extracellular exchange_reverse::[] --> adrnl_e
		0.0	;	# 25 EX_ala_L_e|Extracellular exchange::ala_L_e --> []
		0.0	;	# 26 EX_ala_L_e|Extracellular exchange_reverse::[] --> ala_L_e
		0.0	;	# 27 EX_amp_e|Extracellular exchange::amp_e --> []
		0.0	;	# 28 EX_amp_e|Extracellular exchange_reverse::[] --> amp_e
		0.0	;	# 29 EX_arachd_e|Extracellular exchange::arachd_e --> []
		0.0	;	# 30 EX_arachd_e|Extracellular exchange_reverse::[] --> arachd_e
		0.0	;	# 31 EX_arg_L_e|Extracellular exchange::arg_L_e --> []
		0.0	;	# 32 EX_arg_L_e|Extracellular exchange_reverse::[] --> arg_L_e
		0.0	;	# 33 EX_ascb_L_e|Extracellular exchange::ascb_L_e --> []
		0.0	;	# 34 EX_ascb_L_e|Extracellular exchange_reverse::[] --> ascb_L_e
		0.0	;	# 35 EX_asn_L_e|Extracellular exchange::asn_L_e --> []
		0.0	;	# 36 EX_asn_L_e|Extracellular exchange_reverse::[] --> asn_L_e
		0.0	;	# 37 EX_asp_L_e|Extracellular exchange::asp_L_e --> []
		0.0	;	# 38 EX_asp_L_e|Extracellular exchange_reverse::[] --> asp_L_e
		0.0	;	# 39 EX_bilirub_e|Extracellular exchange::bilirub_e --> []
		0.0	;	# 40 EX_bilirub_e|Extracellular exchange_reverse::[] --> bilirub_e
		0.0	;	# 41 EX_ca2_e|Extracellular exchange::ca2_e --> []
		0.0	;	# 42 EX_ca2_e|Extracellular exchange_reverse::[] --> ca2_e
		0.0	;	# 43 EX_chol_e|Extracellular exchange::chol_e --> []
		0.0	;	# 44 EX_chol_e|Extracellular exchange_reverse::[] --> chol_e
		0.0	;	# 45 EX_cit_e|Extracellular exchange::cit_e --> []
		0.0	;	# 46 EX_cit_e|Extracellular exchange_reverse::[] --> cit_e
		0.0	;	# 47 EX_co_e|Extracellular exchange::co_e --> []
		0.0	;	# 48 EX_co_e|Extracellular exchange_reverse::[] --> co_e
		0.0	;	# 49 EX_co2_e|Extracellular exchange::co2_e --> []
		0.0	;	# 50 EX_co2_e|Extracellular exchange_reverse::[] --> co2_e
		0.0	;	# 51 EX_creat_e|Extracellular exchange::creat_e --> []
		0.0	;	# 52 EX_creat_e|Extracellular exchange_reverse::[] --> creat_e
		0.0	;	# 53 EX_cyan_e|Extracellular exchange::cyan_e --> []
		0.0	;	# 54 EX_cyan_e|Extracellular exchange_reverse::[] --> cyan_e
		0.0	;	# 55 EX_cys_L_e|Extracellular exchange::cys_L_e --> []
		0.0	;	# 56 EX_cys_L_e|Extracellular exchange_reverse::[] --> cys_L_e
		0.0	;	# 57 EX_cytd_e|Extracellular exchange::cytd_e --> []
		0.0	;	# 58 EX_cytd_e|Extracellular exchange_reverse::[] --> cytd_e
		0.0	;	# 59 EX_dhdascb_e|Extracellular exchange::dhdascb_e --> []
		0.0	;	# 60 EX_dhdascb_e|Extracellular exchange_reverse::[] --> dhdascb_e
		0.0	;	# 61 EX_dopa_e|Extracellular exchange::dopa_e --> []
		0.0	;	# 62 EX_dopa_e|Extracellular exchange_reverse::[] --> dopa_e
		0.0	;	# 63 EX_dopasf_e|Extracellular exchange::dopasf_e --> []
		0.0	;	# 64 EX_dopasf_e|Extracellular exchange_reverse::[] --> dopasf_e
		0.0	;	# 65 EX_fe2_e|Extracellular exchange::fe2_e --> []
		0.0	;	# 66 EX_fe2_e|Extracellular exchange_reverse::[] --> fe2_e
		0.0	;	# 67 EX_fru_e|Extracellular exchange::fru_e --> []
		0.0	;	# 68 EX_fru_e|Extracellular exchange_reverse::[] --> fru_e
		0.0	;	# 69 EX_gal_e|Extracellular exchange::gal_e --> []
		0.0	;	# 70 EX_gal_e|Extracellular exchange_reverse::[] --> gal_e
		0.0	;	# 71 EX_gdp_e|Extracellular exchange::gdp_e --> []
		0.0	;	# 72 EX_gdp_e|Extracellular exchange_reverse::[] --> gdp_e
		0.0	;	# 73 EX_glc_e|Extracellular exchange::glc_D_e --> []
		0.0	;	# 74 EX_glc_e|Extracellular exchange_reverse::[] --> glc_D_e
		0.0	;	# 75 EX_gln_L_e|Extracellular exchange::gln_L_e --> []
		0.0	;	# 76 EX_gln_L_e|Extracellular exchange_reverse::[] --> gln_L_e
		0.0	;	# 77 EX_glu_L_e|Extracellular exchange::glu_L_e --> []
		0.0	;	# 78 EX_glu_L_e|Extracellular exchange_reverse::[] --> glu_L_e
		0.0	;	# 79 EX_gly_e|Extracellular exchange::gly_e --> []
		0.0	;	# 80 EX_gly_e|Extracellular exchange_reverse::[] --> gly_e
		0.0	;	# 81 EX_glyb_e|Extracellular exchange::glyb_e --> []
		0.0	;	# 82 EX_glyb_e|Extracellular exchange_reverse::[] --> glyb_e
		0.0	;	# 83 EX_gthox_e|Extracellular exchange::gthox_e --> []
		0.0	;	# 84 EX_gthox_e|Extracellular exchange_reverse::[] --> gthox_e
		0.0	;	# 85 EX_gthrd_e|Extracellular exchange::gthrd_e --> []
		0.0	;	# 86 EX_gthrd_e|Extracellular exchange_reverse::[] --> gthrd_e
		0.0	;	# 87 EX_h_e|Extracellular exchange::h_e --> []
		0.0	;	# 88 EX_h_e|Extracellular exchange_reverse::[] --> h_e
		0.0	;	# 89 EX_h2o_e|Extracellular exchange::h2o_e --> []
		0.0	;	# 90 EX_h2o_e|Extracellular exchange_reverse::[] --> h2o_e
		0.0	;	# 91 EX_h2o2_e|Extracellular exchange::h2o2_e --> []
		0.0	;	# 92 EX_h2o2_e|Extracellular exchange_reverse::[] --> h2o2_e
		0.0	;	# 93 EX_hco3_e|Extracellular exchange::hco3_e --> []
		0.0	;	# 94 EX_hco3_e|Extracellular exchange_reverse::[] --> hco3_e
		0.0	;	# 95 EX_hdca_e|Extracellular exchange::hdca_e --> []
		0.0	;	# 96 EX_hdca_e|Extracellular exchange_reverse::[] --> hdca_e
		0.0	;	# 97 EX_his_L_e|Extracellular exchange::his_L_e --> []
		0.0	;	# 98 EX_his_L_e|Extracellular exchange_reverse::[] --> his_L_e
		0.0	;	# 99 EX_hista_e|Extracellular exchange::hista_e --> []
		0.0	;	# 100 EX_hista_e|Extracellular exchange_reverse::[] --> hista_e
		0.0	;	# 101 EX_hxan_e|Extracellular exchange::hxan_e --> []
		0.0	;	# 102 EX_hxan_e|Extracellular exchange_reverse::[] --> hxan_e
		0.0	;	# 103 EX_ile_L_e|Extracellular exchange::ile_L_e --> []
		0.0	;	# 104 EX_ile_L_e|Extracellular exchange_reverse::[] --> ile_L_e
		0.0	;	# 105 EX_inost_e|Extracellular exchange::inost_e --> []
		0.0	;	# 106 EX_inost_e|Extracellular exchange_reverse::[] --> inost_e
		0.0	;	# 107 EX_ins_e|Extracellular exchange::ins_e --> []
		0.0	;	# 108 EX_ins_e|Extracellular exchange_reverse::[] --> ins_e
		0.0	;	# 109 EX_lac_L_e|Extracellular exchange::lac_L_e --> []
		0.0	;	# 110 EX_lac_L_e|Extracellular exchange_reverse::[] --> lac_L_e
		0.0	;	# 111 EX_leuktrF4_e|Extracellular exchange::leuktrF4_e --> []
		0.0	;	# 112 EX_leuktrF4_e|Extracellular exchange_reverse::[] --> leuktrF4_e
		0.0	;	# 113 EX_lnlc_e|Extracellular exchange::lnlc_e --> []
		0.0	;	# 114 EX_lnlc_e|Extracellular exchange_reverse::[] --> lnlc_e
		0.0	;	# 115 EX_lys_L_e|Extracellular exchange::lys_L_e --> []
		0.0	;	# 116 EX_lys_L_e|Extracellular exchange_reverse::[] --> lys_L_e
		0.0	;	# 117 EX_met_L_e|Extracellular exchange::met_L_e --> []
		0.0	;	# 118 EX_met_L_e|Extracellular exchange_reverse::[] --> met_L_e
		0.0	;	# 119 EX_na1_e|Extracellular exchange::na1_e --> []
		0.0	;	# 120 EX_na1_e|Extracellular exchange_reverse::[] --> na1_e
		0.0	;	# 121 EX_nad_e|Extracellular exchange::nad_e --> []
		0.0	;	# 122 EX_nad_e|Extracellular exchange_reverse::[] --> nad_e
		0.0	;	# 123 EX_ncam_e|Extracellular exchange::ncam_e --> []
		0.0	;	# 124 EX_ncam_e|Extracellular exchange_reverse::[] --> ncam_e
		0.0	;	# 125 EX_nh4_e|Extracellular exchange::nh4_e --> []
		0.0	;	# 126 EX_nh4_e|Extracellular exchange_reverse::[] --> nh4_e
		0.0	;	# 127 EX_no_e|Extracellular exchange::no_e --> []
		0.0	;	# 128 EX_no_e|Extracellular exchange_reverse::[] --> no_e
		0.0	;	# 129 EX_nrpphrsf_e|Extracellular exchange::nrpphrsf_e --> []
		0.0	;	# 130 EX_nrpphrsf_e|Extracellular exchange_reverse::[] --> nrpphrsf_e
		0.0	;	# 131 EX_o2_e|Extracellular exchange::o2_e --> []
		0.0	;	# 132 EX_o2_e|Extracellular exchange_reverse::[] --> o2_e
		0.0	;	# 133 EX_o2s_e|Extracellular exchange::o2s_e --> []
		0.0	;	# 134 EX_o2s_e|Extracellular exchange_reverse::[] --> o2s_e
		0.0	;	# 135 EX_ocdca_e|Extracellular exchange::ocdca_e --> []
		0.0	;	# 136 EX_ocdca_e|Extracellular exchange_reverse::[] --> ocdca_e
		0.0	;	# 137 EX_ocdcea_e|Extracellular exchange::ocdcea_e --> []
		0.0	;	# 138 EX_ocdcea_e|Extracellular exchange_reverse::[] --> ocdcea_e
		0.0	;	# 139 EX_orn_e|Extracellular exchange::orn_e --> []
		0.0	;	# 140 EX_orn_e|Extracellular exchange_reverse::[] --> orn_e
		0.0	;	# 141 EX_phe_L_e|Extracellular exchange::phe_L_e --> []
		0.0	;	# 142 EX_phe_L_e|Extracellular exchange_reverse::[] --> phe_L_e
		0.0	;	# 143 EX_pheacgln_e|Extracellular exchange::pheacgln_e --> []
		0.0	;	# 144 EX_pheacgln_e|Extracellular exchange_reverse::[] --> pheacgln_e
		0.0	;	# 145 EX_pheme_e|Extracellular exchange::pheme_e --> []
		0.0	;	# 146 EX_pheme_e|Extracellular exchange_reverse::[] --> pheme_e
		0.0	;	# 147 EX_pi_e|Extracellular exchange::pi_e --> []
		0.0	;	# 148 EX_pi_e|Extracellular exchange_reverse::[] --> pi_e
		0.0	;	# 149 EX_pro_L_e|Extracellular exchange::pro_L_e --> []
		0.0	;	# 150 EX_pro_L_e|Extracellular exchange_reverse::[] --> pro_L_e
		0.0	;	# 151 EX_prostgd2_e|Extracellular exchange::prostgd2_e --> []
		0.0	;	# 152 EX_prostgd2_e|Extracellular exchange_reverse::[] --> prostgd2_e
		0.0	;	# 153 EX_pyr_e|Extracellular exchange::pyr_e --> []
		0.0	;	# 154 EX_pyr_e|Extracellular exchange_reverse::[] --> pyr_e
		0.0	;	# 155 EX_ser_L_e|Extracellular exchange::ser_L_e --> []
		0.0	;	# 156 EX_ser_L_e|Extracellular exchange_reverse::[] --> ser_L_e
		0.0	;	# 157 EX_so4_e|Extracellular exchange::so4_e --> []
		0.0	;	# 158 EX_so4_e|Extracellular exchange_reverse::[] --> so4_e
		0.0	;	# 159 EX_spc_hs_e|Extracellular exchange::spc_hs_e --> []
		0.0	;	# 160 EX_spc_hs_e|Extracellular exchange_reverse::[] --> spc_hs_e
		0.0	;	# 161 EX_sphs1p_e|Extracellular exchange::sphs1p_e --> []
		0.0	;	# 162 EX_sphs1p_e|Extracellular exchange_reverse::[] --> sphs1p_e
		0.0	;	# 163 EX_srtn_e|Extracellular exchange::srtn_e --> []
		0.0	;	# 164 EX_srtn_e|Extracellular exchange_reverse::[] --> srtn_e
		0.0	;	# 165 EX_succ_e|Extracellular exchange::succ_e --> []
		0.0	;	# 166 EX_succ_e|Extracellular exchange_reverse::[] --> succ_e
		0.0	;	# 167 EX_tcynt_e|Extracellular exchange::tcynt_e --> []
		0.0	;	# 168 EX_tcynt_e|Extracellular exchange_reverse::[] --> tcynt_e
		0.0	;	# 169 EX_thym_e|Extracellular exchange::thym_e --> []
		0.0	;	# 170 EX_thym_e|Extracellular exchange_reverse::[] --> thym_e
		0.0	;	# 171 EX_thymd_e|Extracellular exchange::thymd_e --> []
		0.0	;	# 172 EX_thymd_e|Extracellular exchange_reverse::[] --> thymd_e
		0.0	;	# 173 EX_trp_L_e|Extracellular exchange::trp_L_e --> []
		0.0	;	# 174 EX_trp_L_e|Extracellular exchange_reverse::[] --> trp_L_e
		0.0	;	# 175 EX_tsul_e|Extracellular exchange::tsul_e --> []
		0.0	;	# 176 EX_tsul_e|Extracellular exchange_reverse::[] --> tsul_e
		0.0	;	# 177 EX_txa2_e|Extracellular exchange::txa2_e --> []
		0.0	;	# 178 EX_txa2_e|Extracellular exchange_reverse::[] --> txa2_e
		0.0	;	# 179 EX_tymsf_e|Extracellular exchange::tymsf_e --> []
		0.0	;	# 180 EX_tymsf_e|Extracellular exchange_reverse::[] --> tymsf_e
		0.0	;	# 181 EX_tyr_L_e|Extracellular exchange::tyr_L_e --> []
		0.0	;	# 182 EX_tyr_L_e|Extracellular exchange_reverse::[] --> tyr_L_e
		0.0	;	# 183 EX_ura_e|Extracellular exchange::ura_e --> []
		0.0	;	# 184 EX_ura_e|Extracellular exchange_reverse::[] --> ura_e
		0.0	;	# 185 EX_urate_e|Extracellular exchange::urate_e --> []
		0.0	;	# 186 EX_urate_e|Extracellular exchange_reverse::[] --> urate_e
		0.0	;	# 187 EX_urea_e|Extracellular exchange::urea_e --> []
		0.0	;	# 188 EX_urea_e|Extracellular exchange_reverse::[] --> urea_e
		0.0	;	# 189 EX_uri_e|Extracellular exchange::uri_e --> []
		0.0	;	# 190 EX_uri_e|Extracellular exchange_reverse::[] --> uri_e
		0.0	;	# 191 EX_val_L_e|Extracellular exchange::val_L_e --> []
		0.0	;	# 192 EX_val_L_e|Extracellular exchange_reverse::[] --> val_L_e
		0.0	;	# 193 sink_12harachd_c|Intracellular Constraint::12harachd_c --> []
		0.0	;	# 194 sink_12harachd_c|Intracellular Constraint_reverse::[] --> 12harachd_c
		0.0	;	# 195 sink_15HPET_c|Intracellular Constraint::15HPET_c --> []
		0.0	;	# 196 sink_15HPET_c|Intracellular Constraint_reverse::[] --> 15HPET_c
		0.0	;	# 197 sink_4mop|Intracellular Constraint::4mop_c --> []
		0.0	;	# 198 sink_4mop|Intracellular Constraint_reverse::[] --> 4mop_c
		0.0	;	# 199 sink_5moxact_c|Intracellular Constraint::5moxact_c --> []
		0.0	;	# 200 sink_5moxact_c|Intracellular Constraint_reverse::[] --> 5moxact_c
		0.0	;	# 201 EX_ca2_c_ca2_e|Intracellular Constraint::ca2_c --> ca2_e
		0.0	;	# 202 EX_ca2_c_ca2_e|Intracellular Constraint_reverse::ca2_e --> ca2_c
		0.0	;	# 203 sink_homoval_c|Intracellular Constraint::homoval_c --> []
		0.0	;	# 204 sink_homoval_c|Intracellular Constraint_reverse::[] --> homoval_c
		0.0	;	# 205 sink_ind3ac_c|Intracellular Constraint::ind3ac_c --> []
		0.0	;	# 206 sink_ind3ac_c|Intracellular Constraint_reverse::[] --> ind3ac_c
		0.0	;	# 207 sink_mal_c|Intracellular Constraint::mal_L_c --> []
		0.0	;	# 208 sink_mal_c|Intracellular Constraint_reverse::[] --> mal_L_c
		0.0	;	# 209 sink_na1|Intracellular Constraint::na1_c --> []
		0.0	;	# 210 sink_na1|Intracellular Constraint_reverse::[] --> na1_c
		0.0	;	# 211 sink_txb_c|Intracellular Constraint::txb2_c --> []
		0.0	;	# 212 sink_txb_c|Intracellular Constraint_reverse::[] --> txb2_c
		0.0	;	# 213 10FTHF6GLUtm|Transport_ Mitochondrial::10fthf6glu_m --> 10fthf6glu_c
		0.0	;	# 214 10FTHF7GLUtl|Transport_ Lysosomal::10fthf7glu_c --> 10fthf7glu_l
		0.0	;	# 215 10FTHF7GLUtm|Transport_ Mitochondrial::10fthf7glu_m --> 10fthf7glu_c
		0.0	;	# 216 10FTHFtl|Transport_ Lysosomal::10fthf_c --> 10fthf_l
		0.0	;	# 217 10FTHFtl|Transport_ Lysosomal_reverse::10fthf_l --> 10fthf_c
		0.0	;	# 218 2AMADPTm|Lysine Metabolism::L2aadp_c+akg_m --> L2aadp_m+akg_c
		0.0	;	# 219 2AMADPTm|Lysine Metabolism_reverse::L2aadp_m+akg_c --> L2aadp_c+akg_m
		0.0	;	# 220 2DR1PP|Pyrimidine Catabolism::h2o_c+2dr1p_c --> drib_c+pi_c
		0.0	;	# 221 2OXOADOXm|Lysine Metabolism::coa_m+nad_m+2oxoadp_m --> nadh_m+co2_m+glutcoa_m
		0.0	;	# 222 2OXOADPTm|Tryptophan metabolism::akg_m+2oxoadp_c --> akg_c+2oxoadp_m
		0.0	;	# 223 2OXOADPTm|Tryptophan metabolism_reverse::akg_c+2oxoadp_m --> akg_m+2oxoadp_c
		0.0	;	# 224 34DHPHAMT|Tyrosine metabolism::amet_c+34dhpha_c --> homoval_c+h_c+ahcys_c
		0.0	;	# 225 34DHPLACOX|Tyrosine metabolism::h2o_c+nad_c+34dhpac_c --> nadh_c+34dhpha_c+2.0*h_c
		0.0	;	# 226 34HPPOR|Tyrosine metabolism::34hpp_c+o2_c --> hgentis_c+co2_c
		0.0	;	# 227 3HBCOAHLm|Valine_ Leucine_ and Isoleucine Metabolism::h2o_m+3hibutcoa_m --> coa_m+3hmp_m+h_m
		0.0	;	# 228 3HLYTCL|Tyrosine metabolism::34dhphe_c+h_c --> dopa_c+co2_c
		0.0	;	# 229 3M4HDXPAC|Tyrosine metabolism::3mox4hpac_c+h2o_c+nad_c --> homoval_c+nadh_c+2.0*h_c
		0.0	;	# 230 3M4HDXPAC|Tyrosine metabolism_reverse::homoval_c+nadh_c+2.0*h_c --> 3mox4hpac_c+h2o_c+nad_c
		0.0	;	# 231 3MOBt2im|Transport_ Mitochondrial::3mob_c+h_c --> 3mob_m+h_m
		0.0	;	# 232 3MOPt2im|Transport_ Mitochondrial::3mop_c+h_c --> h_m+3mop_m
		0.0	;	# 233 3MOXTYROX|Tyrosine metabolism::o2_c+h2o_c+3moxtyr_c --> 3mox4hpac_c+h2o2_c+nh4_c
		0.0	;	# 234 42A12BOOX|Tyrosine metabolism::o2_c+h2o_c+dopa_c --> h2o2_c+nh4_c+34dhpac_c
		0.0	;	# 235 4ABUTtm|Transport_ Mitochondrial::4abut_c --> 4abut_m
		0.0	;	# 236 4ABUTtm|Transport_ Mitochondrial_reverse::4abut_m --> 4abut_c
		0.0	;	# 237 4HOXPACDOX_NADP|Tyrosine metabolism::h2o_c+nadp_c+4hoxpacd_c --> 4hphac_c+2.0*h_c+nadph_c
		0.0	;	# 238 4HOXPACDOX_NADP|Tyrosine metabolism_reverse::4hphac_c+2.0*h_c+nadph_c --> h2o_c+nadp_c+4hoxpacd_c
		0.0	;	# 239 4MOPt2im|Transport_ Mitochondrial::4mop_c+h_c --> 4mop_m+h_m
		0.0	;	# 240 4NPHSFte|Transport_ Extracellular::4nphsf_e --> 4nphsf_c
		0.0	;	# 241 4NPHSFte|Transport_ Extracellular_reverse::4nphsf_c --> 4nphsf_e
		0.0	;	# 242 4NPHSULT|CYP Metabolism::paps_c+4nph_c --> pap_c+4nphsf_c+h_c
		0.0	;	# 243 4NPHte|Transport_ Extracellular::4nph_e --> 4nph_c
		0.0	;	# 244 4NPHte|Transport_ Extracellular_reverse::4nph_c --> 4nph_e
		0.0	;	# 245 5AOPtm|Heme Biosynthesis::5aop_c --> 5aop_m
		0.0	;	# 246 5AOPtm|Heme Biosynthesis_reverse::5aop_m --> 5aop_c
		0.0	;	# 247 5HLTDL|Tryptophan metabolism::5htrp_c+h_c --> srtn_c+co2_c
		0.0	;	# 248 5HOXINDACTOX|Tryptophan metabolism::5hoxindact_c+h2o_c+nad_c --> nadh_c+2.0*h_c+5hoxindoa_c
		0.0	;	# 249 5HOXINOXDA|Tryptophan metabolism::o2_c+h2o_c+srtn_c --> 5hoxindact_c+h2o2_c+nh4_c
		0.0	;	# 250 5MTHFt|Transport_ Extracellular::5mthf_e --> 5mthf_c
		0.0	;	# 251 5MTHFt|Transport_ Extracellular_reverse::5mthf_c --> 5mthf_e
		0.0	;	# 252 5MTHFt2|Transport_ Extracellular::oh1_c+5mthf_e --> oh1_e+5mthf_c
		0.0	;	# 253 5MTHFt2|Transport_ Extracellular_reverse::oh1_e+5mthf_c --> oh1_c+5mthf_e
		0.0	;	# 254 AACOAT|Propanoate Metabolism::coa_c+atp_c+acac_c --> ppi_c+amp_c+aacoa_c
		0.0	;	# 255 AACOAT|Propanoate Metabolism_reverse::ppi_c+amp_c+aacoa_c --> coa_c+atp_c+acac_c
		0.0	;	# 256 AASAD3m|Lysine Metabolism::L2aadp6sa_m+h2o_m+nad_m --> L2aadp_m+nadh_m+2.0*h_m
		0.0	;	# 257 AATAi|Lysine Metabolism::L2aadp_c+akg_c --> glu_L_c+2oxoadp_c
		0.0	;	# 258 ABTArm|Glutamate metabolism::4abut_m+akg_m --> glu_L_m+sucsal_m
		0.0	;	# 259 ABTArm|Glutamate metabolism_reverse::glu_L_m+sucsal_m --> 4abut_m+akg_m
		0.0	;	# 260 ACACT1|Cholesterol Metabolism::2.0*accoa_c --> coa_c+aacoa_c
		0.0	;	# 261 ACACT1|Cholesterol Metabolism_reverse::coa_c+aacoa_c --> 2.0*accoa_c
		0.0	;	# 262 ACACT10m|Valine_ Leucine_ and Isoleucine Metabolism::coa_m+2maacoa_m --> accoa_m+ppcoa_m
		0.0	;	# 263 ACACT10m|Valine_ Leucine_ and Isoleucine Metabolism_reverse::accoa_m+ppcoa_m --> coa_m+2maacoa_m
		0.0	;	# 264 ACACT1r|Tryptophan metabolism::2.0*accoa_c --> coa_c+aacoa_c
		0.0	;	# 265 ACACT1r|Tryptophan metabolism_reverse::coa_c+aacoa_c --> 2.0*accoa_c
		0.0	;	# 266 ACACT1rm|Tryptophan metabolism::2.0*accoa_m --> coa_m+aacoa_m
		0.0	;	# 267 ACACT1rm|Tryptophan metabolism_reverse::coa_m+aacoa_m --> 2.0*accoa_m
		0.0	;	# 268 ACCOAC|Fatty Acid Metabolism::atp_c+accoa_c+hco3_c --> malcoa_c+pi_c+h_c+adp_c
		0.0	;	# 269 ACITL|Citric Acid Cycle::coa_c+atp_c+cit_c --> oaa_c+pi_c+accoa_c+adp_c
		0.0	;	# 270 ACOAD10m|Valine_ Leucine_ and Isoleucine Metabolism::fad_m+2mbcoa_m --> 2mb2coa_m+fadh2_m
		0.0	;	# 271 ACOAD8m|Valine_ Leucine_ and Isoleucine Metabolism::fad_m+ivcoa_m --> fadh2_m+3mb2coa_m
		0.0	;	# 272 ACOAD9m|Valine_ Leucine_ and Isoleucine Metabolism::fad_m+ibcoa_m --> fadh2_m+2mp2coa_m
		0.0	;	# 273 ACONT|Citric Acid Cycle::cit_c --> icit_c
		0.0	;	# 274 ACONT|Citric Acid Cycle_reverse::icit_c --> cit_c
		0.0	;	# 275 ACONTm|Citric Acid Cycle::cit_m --> icit_m
		0.0	;	# 276 ACONTm|Citric Acid Cycle_reverse::icit_m --> cit_m
		0.0	;	# 277 ACS|Glycolysis/Gluconeogenesis::ac_c+coa_c+atp_c --> ppi_c+accoa_c+amp_c
		0.0	;	# 278 ACSOMT|Tryptophan metabolism::amet_c+5hoxindoa_c --> 5moxact_c+h_c+ahcys_c
		0.0	;	# 279 ACt2r|Transport_ Extracellular::ac_e+h_e --> ac_c+h_c
		0.0	;	# 280 ACt2r|Transport_ Extracellular_reverse::ac_c+h_c --> ac_e+h_e
		0.0	;	# 281 ADA|Purine Catabolism::adn_c+h2o_c+h_c --> ins_c+nh4_c
		0.0	;	# 282 ADAe|Nucleotides::h2o_e+adn_e+h_e --> ins_e+nh4_e
		0.0	;	# 283 ADEt|Transport_ Extracellular::ade_e --> ade_c
		0.0	;	# 284 ADEt|Transport_ Extracellular_reverse::ade_c --> ade_e
		0.0	;	# 285 ADK1|Nucleotides::atp_c+amp_c --> 2.0*adp_c
		0.0	;	# 286 ADK1|Nucleotides_reverse::2.0*adp_c --> atp_c+amp_c
		0.0	;	# 287 ADK1m|Nucleotides::atp_m+amp_m --> 2.0*adp_m
		0.0	;	# 288 ADK1m|Nucleotides_reverse::2.0*adp_m --> atp_m+amp_m
		0.0	;	# 289 ADK3m|Nucleotides::gtp_m+amp_m --> gdp_m+adp_m
		0.0	;	# 290 ADK3m|Nucleotides_reverse::gdp_m+adp_m --> gtp_m+amp_m
		0.0	;	# 291 ADNCYC|Nucleotides::atp_c --> camp_c+ppi_c
		0.0	;	# 292 ADNK1|Nucleotides::adn_c+atp_c --> h_c+adp_c+amp_c
		0.0	;	# 293 ADNt|Transport_ Extracellular::adn_e --> adn_c
		0.0	;	# 294 ADNt|Transport_ Extracellular_reverse::adn_c --> adn_e
		0.0	;	# 295 ADPRDP|Nucleotides::adprib_c+h2o_c --> 2.0*h_c+amp_c+r5p_c
		0.0	;	# 296 ADPT|Salvage Pathway::prpp_c+ade_c --> ppi_c+amp_c
		0.0	;	# 297 ADRNLPVESSEC|Transport_ Extracellular::2.0*h2o_c+2.0*atp_c+3.0*adrnl_c --> 3.0*adrnl_e+2.0*pi_c+2.0*h_c+2.0*adp_c
		0.0	;	# 298 ADSK|Nucleotides::atp_c+aps_c --> paps_c+h_c+adp_c
		0.0	;	# 299 ADSL1|Nucleotides::dcamp_c --> amp_c+fum_c
		0.0	;	# 300 ADSL2|IMP Biosynthesis::25aics_c --> fum_c+aicar_c
		0.0	;	# 301 ADSS|Nucleotides::gtp_c+imp_c+asp_L_c --> gdp_c+pi_c+2.0*h_c+dcamp_c
		0.0	;	# 302 AHC|Methionine Metabolism::h2o_c+ahcys_c --> adn_c+hcys_L_c
		0.0	;	# 303 AHC|Methionine Metabolism_reverse::adn_c+hcys_L_c --> h2o_c+ahcys_c
		0.0	;	# 304 AICART|IMP Biosynthesis::10fthf_c+aicar_c --> thf_c+fprica_c
		0.0	;	# 305 AICART|IMP Biosynthesis_reverse::thf_c+fprica_c --> 10fthf_c+aicar_c
		0.0	;	# 306 AIRCr|IMP Biosynthesis::co2_c+air_c --> 5aizc_c+h_c
		0.0	;	# 307 AIRCr|IMP Biosynthesis_reverse::5aizc_c+h_c --> co2_c+air_c
		0.0	;	# 308 AKGDm|Citric Acid Cycle::coa_m+nad_m+akg_m --> nadh_m+succoa_m+co2_m
		0.0	;	# 309 ALAGLNexR|Transport_ Extracellular::gln_L_c+ala_L_e --> gln_L_e+ala_L_c
		0.0	;	# 310 ALAGLNexR|Transport_ Extracellular_reverse::gln_L_e+ala_L_c --> gln_L_c+ala_L_e
		0.0	;	# 311 ALASm|Glycine_ Serine_ and Threonine Metabolism::gly_m+succoa_m+h_m --> coa_m+5aop_m+co2_m
		0.0	;	# 312 ALATA_L|Glutamate metabolism::ala_L_c+akg_c --> pyr_c+glu_L_c
		0.0	;	# 313 ALATA_L|Glutamate metabolism_reverse::pyr_c+glu_L_c --> ala_L_c+akg_c
		0.0	;	# 314 ALCD1|Miscellaneous::nad_c+meoh_c --> fald_c+nadh_c+h_c
		0.0	;	# 315 ALCD1|Miscellaneous_reverse::fald_c+nadh_c+h_c --> nad_c+meoh_c
		0.0	;	# 316 ALCD21_D|Pyruvate Metabolism::nad_c+12ppd_R_c --> lald_D_c+nadh_c+h_c
		0.0	;	# 317 ALCD21_D|Pyruvate Metabolism_reverse::lald_D_c+nadh_c+h_c --> nad_c+12ppd_R_c
		0.0	;	# 318 ALCD21_L|Pyruvate Metabolism::12ppd_S_c+nad_c --> lald_L_c+nadh_c+h_c
		0.0	;	# 319 ALDD19x|Phenylalanine metabolism::h2o_c+nad_c+pacald_c --> pac_c+nadh_c+2.0*h_c
		0.0	;	# 320 ALDD19x_P|Phenylalanine metabolism::h2o_c+nadp_c+pacald_c --> pac_c+2.0*h_c+nadph_c
		0.0	;	# 321 ALDD20x|Tryptophan metabolism::h2o_c+nad_c+id3acald_c --> ind3ac_c+nadh_c+2.0*h_c
		0.0	;	# 322 ALDD2x|Glycolysis/Gluconeogenesis::h2o_c+acald_c+nad_c --> ac_c+nadh_c+2.0*h_c
		0.0	;	# 323 ALDD2y|Glycolysis/Gluconeogenesis::h2o_c+nadp_c+acald_c --> ac_c+2.0*h_c+nadph_c
		0.0	;	# 324 ALOX12|Eicosanoid Metabolism::o2_c+arachd_c --> 12HPET_c
		0.0	;	# 325 ALOX15|Eicosanoid Metabolism::o2_c+arachd_c --> 15HPET_c
		0.0	;	# 326 ALOX5|Eicosanoid Metabolism::o2_c+arachd_c --> 5HPET_c
		0.0	;	# 327 ALOX52|Eicosanoid Metabolism::5HPET_c --> h2o_c+leuktrA4_c
		0.0	;	# 328 ALR|Glycine_ Serine_ and Threonine Metabolism::h2o_c+nadp_c+mthgxl_c --> pyr_c+2.0*h_c+nadph_c
		0.0	;	# 329 ALR2|Pyruvate Metabolism::h_c+mthgxl_c+nadph_c --> nadp_c+acetol_c
		0.0	;	# 330 ALR3|Pyruvate Metabolism::acetol_c+h_c+nadph_c --> 12ppd_S_c+nadp_c
		0.0	;	# 331 AMPDA|Nucleotides::h2o_c+h_c+amp_c --> nh4_c+imp_c
		0.0	;	# 332 AMPTASECGe|Glutathione Metabolism::h2o_e+cgly_e --> cys_L_e+gly_e
		0.0	;	# 333 APAT2rm|beta-Alanine metabolism::ala_B_m+akg_m --> glu_L_m+msa_m
		0.0	;	# 334 APAT2rm|beta-Alanine metabolism_reverse::glu_L_m+msa_m --> ala_B_m+akg_m
		0.0	;	# 335 ARACHDt2|Transport_ Extracellular::arachd_e --> arachd_c
		0.0	;	# 336 ARACHDt2|Transport_ Extracellular_reverse::arachd_c --> arachd_e
		0.0	;	# 337 ARACHDtr|Transport_ Endoplasmic Reticular::arachd_c --> arachd_r
		0.0	;	# 338 ARACHDtr|Transport_ Endoplasmic Reticular_reverse::arachd_r --> arachd_c
		0.0	;	# 339 ARGN|Urea cycle/amino group metabolism::h2o_c+arg_L_c --> urea_c+orn_c
		0.0	;	# 340 ARGSL|Alanine and Aspartate Metabolism::argsuc_c --> fum_c+arg_L_c
		0.0	;	# 341 ARGSL|Alanine and Aspartate Metabolism_reverse::fum_c+arg_L_c --> argsuc_c
		0.0	;	# 342 ARGSS|Alanine and Aspartate Metabolism::atp_c+citr_L_c+asp_L_c --> ppi_c+h_c+amp_c+argsuc_c
		0.0	;	# 343 ARGtiDF|Transport_ Extracellular::arg_L_e --> arg_L_c
		0.0	;	# 344 ARGtiDF|Transport_ Extracellular_reverse::arg_L_c --> arg_L_e
		0.0	;	# 345 ASCBt|Transport_ Extracellular::ascb_L_e --> ascb_L_c
		0.0	;	# 346 ASCBt|Transport_ Extracellular_reverse::ascb_L_c --> ascb_L_e
		0.0	;	# 347 ASCBt4|Transport_ Extracellular::na1_e+ascb_L_e --> na1_c+ascb_L_c
		0.0	;	# 348 ASCBt4|Transport_ Extracellular_reverse::na1_c+ascb_L_c --> na1_e+ascb_L_e
		0.0	;	# 349 ASNALANaEx|Transport_ Extracellular::na1_e+ala_L_c+asn_L_e --> na1_c+asn_L_c+ala_L_e
		0.0	;	# 350 ASNNm|Alanine and Aspartate Metabolism::asn_L_m+h2o_m --> nh4_m+asp_L_m
		0.0	;	# 351 ASNSERNaEx|Transport_ Extracellular::na1_e+ser_L_c+asn_L_e --> na1_c+asn_L_c+ser_L_e
		0.0	;	# 352 ASNtm|Transport_ Mitochondrial::asn_L_c --> asn_L_m
		0.0	;	# 353 ASPTA|Alanine and Aspartate Metabolism::asp_L_c+akg_c --> oaa_c+glu_L_c
		0.0	;	# 354 ASPTA|Alanine and Aspartate Metabolism_reverse::oaa_c+glu_L_c --> asp_L_c+akg_c
		0.0	;	# 355 ASPTAm|Alanine and Aspartate Metabolism::asp_L_m+akg_m --> glu_L_m+oaa_m
		0.0	;	# 356 ASPTAm|Alanine and Aspartate Metabolism_reverse::glu_L_m+oaa_m --> asp_L_m+akg_m
		0.0	;	# 357 ASPt6|Transport_ Extracellular::3.0*na1_e+h_e+asp_L_e+k_c --> 3.0*na1_c+h_c+asp_L_c+k_e
		0.0	;	# 358 ASPt6|Transport_ Extracellular_reverse::3.0*na1_c+h_c+asp_L_c+k_e --> 3.0*na1_e+h_e+asp_L_e+k_c
		0.0	;	# 359 ATPH2e|Nucleotides::h2o_e+adp_e --> pi_e+h_e+amp_e
		0.0	;	# 360 ATPS4m|Oxidative Phosphorylation::pi_m+4.0*h_c+adp_m --> atp_m+h2o_m+3.0*h_m
		0.0	;	# 361 BALAtmr|Transport_ Mitochondrial::ala_B_c --> ala_B_m
		0.0	;	# 362 BALAtmr|Transport_ Mitochondrial_reverse::ala_B_m --> ala_B_c
		0.0	;	# 363 BHMT|Glycine_ Serine_ and Threonine Metabolism::hcys_L_c+glyb_c --> dmgly_c+met_L_c
		0.0	;	# 364 BILIRED|Heme Degradation::biliverd_c+h_c+nadph_c --> bilirub_c+nadp_c
		0.0	;	# 365 BILIRUBt2|Transport_ Extracellular::bilirub_e+hco3_c --> bilirub_c+hco3_e
		0.0	;	# 366 BILIRUBt2|Transport_ Extracellular_reverse::bilirub_c+hco3_e --> bilirub_e+hco3_c
		0.0	;	# 367 BPNT|Nucleotides::pap_c+h2o_c --> pi_c+amp_c
		0.0	;	# 368 C160CPT1|Carnitine shuttle::pmtcoa_c+crn_c --> pmtcrn_c+coa_c
		0.0	;	# 369 C160CPT2|Carnitine shuttle::pmtcrn_m+coa_m --> pmtcoa_m+crn_m
		0.0	;	# 370 C160CRNt|Carnitine shuttle::pmtcrn_c --> pmtcrn_m
		0.0	;	# 371 C180CPT1|Carnitine shuttle::stcoa_c+crn_c --> coa_c+stcrn_c
		0.0	;	# 372 C180CPT2|Carnitine shuttle::stcrn_m+coa_m --> stcoa_m+crn_m
		0.0	;	# 373 C180CRNt|Carnitine shuttle::stcrn_c --> stcrn_m
		0.0	;	# 374 C181CPT1|Carnitine shuttle::odecoa_c+crn_c --> coa_c+odecrn_c
		0.0	;	# 375 C181CPT2|Carnitine shuttle::coa_m+odecrn_m --> odecoa_m+crn_m
		0.0	;	# 376 C181CRNt|Carnitine shuttle::odecrn_c --> odecrn_m
		0.0	;	# 377 C204CPT1|Carnitine shuttle::arachdcoa_c+crn_c --> coa_c+arachdcrn_c
		0.0	;	# 378 C204CPT2|Carnitine shuttle::arachdcrn_m+coa_m --> arachdcoa_m+crn_m
		0.0	;	# 379 C204CRNt|Carnitine shuttle::arachdcrn_c --> arachdcrn_m
		0.0	;	# 380 CAATPS|Transport_ Extracellular::h2o_c+atp_c+2.0*ca2_c --> 2.0*ca2_e+pi_c+h_e+adp_c
		0.0	;	# 381 CATm|ROS Detoxification::2.0*h2o2_m --> o2_m+2.0*h2o_m
		0.0	;	# 382 CATp|Miscellaneous::2.0*h2o2_x --> o2_x+2.0*h2o_x
		0.0	;	# 383 CBPSam|Glutamate metabolism::2.0*atp_m+nh4_m+hco3_m --> cbp_m+pi_m+2.0*h_m+2.0*adp_m
		0.0	;	# 384 CGMPt|Transport_ Extracellular::35cgmp_c+h2o_c+atp_c --> 35cgmp_e+pi_c+h_c+adp_c
		0.0	;	# 385 CHLPCTD|Glycerophospholipid Metabolism::cholp_c+ctp_c+h_c --> ppi_c+cdpchol_c
		0.0	;	# 386 CHOLt4|Transport_ Extracellular::na1_e+chol_e --> na1_c+chol_c
		0.0	;	# 387 CHOLt4|Transport_ Extracellular_reverse::na1_c+chol_c --> na1_e+chol_e
		0.0	;	# 388 CHOLtu|Transport_ Extracellular::chol_e --> chol_c
		0.0	;	# 389 CHOLtu|Transport_ Extracellular_reverse::chol_c --> chol_e
		0.0	;	# 390 CITRtm|Transport_ Mitochondrial::citr_L_m --> citr_L_c
		0.0	;	# 391 CITRtm|Transport_ Mitochondrial_reverse::citr_L_c --> citr_L_m
		0.0	;	# 392 CITt4_2|Transport_ Extracellular::2.0*na1_e+cit_e --> 2.0*na1_c+cit_c
		0.0	;	# 393 CITt4_2|Transport_ Extracellular_reverse::2.0*na1_c+cit_c --> 2.0*na1_e+cit_e
		0.0	;	# 394 CITt4_4|Transport_ Extracellular::4.0*na1_e+cit_e --> 4.0*na1_c+cit_c
		0.0	;	# 395 CITt4_4|Transport_ Extracellular_reverse::4.0*na1_c+cit_c --> 4.0*na1_e+cit_e
		0.0	;	# 396 CLOHtex2|Transport_ Extracellular::oh1_c+2.0*cl_e --> 2.0*cl_c+oh1_e
		0.0	;	# 397 CLOHtex2|Transport_ Extracellular_reverse::2.0*cl_c+oh1_e --> oh1_c+2.0*cl_e
		0.0	;	# 398 CO2t|Transport_ Extracellular::co2_e --> co2_c
		0.0	;	# 399 CO2t|Transport_ Extracellular_reverse::co2_c --> co2_e
		0.0	;	# 400 COt|Transport_ Extracellular::co_c --> co_e
		0.0	;	# 401 COt|Transport_ Extracellular_reverse::co_e --> co_c
		0.0	;	# 402 CPPPGO|Heme Biosynthesis::o2_c+2.0*h_c+cpppg3_c --> 2.0*h2o_c+pppg9_c+2.0*co2_c
		0.0	;	# 403 CREATt4_2r|Transport_ Extracellular::2.0*na1_e+creat_e --> 2.0*na1_c+creat_c
		0.0	;	# 404 CREATt4_2r|Transport_ Extracellular_reverse::2.0*na1_c+creat_c --> 2.0*na1_e+creat_e
		0.0	;	# 405 CRNt|Transport_ Extracellular::crn_e --> crn_c
		0.0	;	# 406 CRNt|Transport_ Extracellular_reverse::crn_c --> crn_e
		0.0	;	# 407 CRNtim|Transport_ Mitochondrial::crn_m --> crn_c
		0.0	;	# 408 CRNtuIR|Transport_ Extracellular::crn_e --> crn_c
		0.0	;	# 409 CRNtuIR|Transport_ Extracellular_reverse::crn_c --> crn_e
		0.0	;	# 410 CRNtuNa|Transport_ Extracellular::na1_e+crn_e --> na1_c+crn_c
		0.0	;	# 411 CRNtuNa|Transport_ Extracellular_reverse::na1_c+crn_c --> na1_e+crn_e
		0.0	;	# 412 CSNATr|Carnitine shuttle::accoa_c+crn_c --> coa_c+acrn_c
		0.0	;	# 413 CSNATr|Carnitine shuttle_reverse::coa_c+acrn_c --> accoa_c+crn_c
		0.0	;	# 414 CSm|Citric Acid Cycle::h2o_m+oaa_m+accoa_m --> coa_m+h_m+cit_m
		0.0	;	# 415 CYANSTm|Cysteine Metabolism::cyan_m+tsul_m --> tcynt_m+h_m+so3_m
		0.0	;	# 416 CYANt|Transport_ Extracellular::cyan_e --> cyan_c
		0.0	;	# 417 CYANt|Transport_ Extracellular_reverse::cyan_c --> cyan_e
		0.0	;	# 418 CYANtm|Transport_ Mitochondrial::cyan_c --> cyan_m
		0.0	;	# 419 CYANtm|Transport_ Mitochondrial_reverse::cyan_m --> cyan_c
		0.0	;	# 420 CYOOm2|Oxidative Phosphorylation::o2_m+4.0*focytC_m+8.0*h_m --> 2.0*h2o_m+4.0*h_c+4.0*ficytC_m
		0.0	;	# 421 CYOR_u10m|Oxidative Phosphorylation::2.0*h_m+q10h2_m+2.0*ficytC_m --> 2.0*focytC_m+4.0*h_c+q10_m
		0.0	;	# 422 CYSGLTH|Cysteine Metabolism::Lcystin_c+2.0*gthrd_c --> 2.0*cys_L_c+gthox_c
		0.0	;	# 423 CYSGLTH|Cysteine Metabolism_reverse::2.0*cys_L_c+gthox_c --> Lcystin_c+2.0*gthrd_c
		0.0	;	# 424 CYSTA|Cysteine Metabolism::cys_L_c+akg_c --> mercppyr_c+glu_L_c
		0.0	;	# 425 CYSTA|Cysteine Metabolism_reverse::mercppyr_c+glu_L_c --> cys_L_c+akg_c
		0.0	;	# 426 CYSTGLUex|Transport_ Extracellular::Lcystin_e+glu_L_c --> glu_L_e+Lcystin_c
		0.0	;	# 427 CYTDt|Transport_ Extracellular::cytd_e --> cytd_c
		0.0	;	# 428 CYTDt|Transport_ Extracellular_reverse::cytd_c --> cytd_e
		0.0	;	# 429 CYTK1|Nucleotides::cmp_c+atp_c --> cdp_c+adp_c
		0.0	;	# 430 CYTK1|Nucleotides_reverse::cdp_c+adp_c --> cmp_c+atp_c
		0.0	;	# 431 CYTK6|Nucleotides::cmp_c+ctp_c --> 2.0*cdp_c
		0.0	;	# 432 CYTK6|Nucleotides_reverse::2.0*cdp_c --> cmp_c+ctp_c
		0.0	;	# 433 CYTK7|Nucleotides::utp_c+cmp_c --> cdp_c+udp_c
		0.0	;	# 434 CYTK7|Nucleotides_reverse::cdp_c+udp_c --> utp_c+cmp_c
		0.0	;	# 435 DADA|Nucleotides::h2o_c+dad_2_c+h_c --> nh4_c+din_c
		0.0	;	# 436 DGULND|Pentose and Glucuronate Interconversions::h_c+3dhguln_c --> co2_c+xylu_L_c
		0.0	;	# 437 DGULND|Pentose and Glucuronate Interconversions_reverse::co2_c+xylu_L_c --> h_c+3dhguln_c
		0.0	;	# 438 DHAAt1r|Transport_ Extracellular::dhdascb_e --> dhdascb_c
		0.0	;	# 439 DHAAt1r|Transport_ Extracellular_reverse::dhdascb_c --> dhdascb_e
		0.0	;	# 440 DHPM1|Pyrimidine Catabolism::h2o_c+56dura_c --> h_c+cala_c
		0.0	;	# 441 DHPR2|Tetrahydrobiopterin::dhbpt_c+5mthf_c --> mlthf_c+thbpt_c+h_c
		0.0	;	# 442 DMGDHm|Glycine_ Serine_ and Threonine Metabolism::fad_m+h2o_m+dmgly_m --> fald_m+sarcs_m+fadh2_m
		0.0	;	# 443 DMGtm|Transport_ Mitochondrial::dmgly_c --> dmgly_m
		0.0	;	# 444 DMGtm|Transport_ Mitochondrial_reverse::dmgly_m --> dmgly_c
		0.0	;	# 445 DOPABMO|Tyrosine metabolism::o2_c+dopa_c+ascb_L_c --> h2o_c+nrpphr_c+dhdascb_c
		0.0	;	# 446 DOPAMT|Tyrosine metabolism::amet_c+dopa_c --> 3moxtyr_c+h_c+ahcys_c
		0.0	;	# 447 DOPASFt|Transport_ Extracellular::dopasf_c --> dopasf_e
		0.0	;	# 448 DOPASULT|Tyrosine metabolism::dopa_c+paps_c --> pap_c+dopasf_c+h_c
		0.0	;	# 449 DOPAVESSEC|Transport_ Extracellular::2.0*h2o_c+3.0*dopa_c+2.0*atp_c --> 3.0*dopa_e+2.0*pi_c+2.0*h_c+2.0*adp_c
		0.0	;	# 450 DPGM|Glycolysis/Gluconeogenesis::13dpg_c --> 23dpg_c+h_c
		0.0	;	# 451 DPGM|Glycolysis/Gluconeogenesis_reverse::23dpg_c+h_c --> 13dpg_c
		0.0	;	# 452 DPGase|Glycolysis/Gluconeogenesis::h2o_c+23dpg_c --> pi_c+3pg_c
		0.0	;	# 453 DRBK|Pentose Phosphate Pathway::atp_c+drib_c --> 2dr5p_c+h_c+adp_c
		0.0	;	# 454 DRPA|Pentose Phosphate Pathway::2dr5p_c --> acald_c+g3p_c
		0.0	;	# 455 DURAD|Pyrimidine Catabolism::56dura_c+nadp_c --> ura_c+h_c+nadph_c
		0.0	;	# 456 DURAD|Pyrimidine Catabolism_reverse::ura_c+h_c+nadph_c --> 56dura_c+nadp_c
		0.0	;	# 457 ECOAH12m|Valine_ Leucine_ and Isoleucine Metabolism::h2o_m+2mp2coa_m --> 3hibutcoa_m
		0.0	;	# 458 ECOAH12m|Valine_ Leucine_ and Isoleucine Metabolism_reverse::3hibutcoa_m --> h2o_m+2mp2coa_m
		0.0	;	# 459 ECOAH1m|Tryptophan metabolism::3hbcoa_m --> h2o_m+b2coa_m
		0.0	;	# 460 ECOAH1m|Tryptophan metabolism_reverse::h2o_m+b2coa_m --> 3hbcoa_m
		0.0	;	# 461 ECOAH9m|Valine_ Leucine_ and Isoleucine Metabolism::h2o_m+2mb2coa_m --> 3hmbcoa_m
		0.0	;	# 462 ECOAH9m|Valine_ Leucine_ and Isoleucine Metabolism_reverse::3hmbcoa_m --> h2o_m+2mb2coa_m
		0.0	;	# 463 ENO|Glycolysis/Gluconeogenesis::2pg_c --> pep_c+h2o_c
		0.0	;	# 464 ENO|Glycolysis/Gluconeogenesis_reverse::pep_c+h2o_c --> 2pg_c
		0.0	;	# 465 ESTSULT|Steroid Metabolism::paps_c+estrone_c --> pap_c+h_c+estrones_c
		0.0	;	# 466 ETF|Fatty acid oxidation::etfox_m+fadh2_m --> fad_m+etfrd_m
		0.0	;	# 467 ETFQO|Fatty acid oxidation::etfrd_m+q10_m --> etfox_m+q10h2_m
		0.0	;	# 468 FACOAL160i|Fatty acid activation::coa_c+hdca_c+atp_c --> ppi_c+pmtcoa_c+amp_c
		0.0	;	# 469 FACOAL180i|Fatty acid activation::coa_c+atp_c+ocdca_c --> ppi_c+amp_c+stcoa_c
		0.0	;	# 470 FACOAL181i|Fatty acid activation::ocdcea_c+coa_c+atp_c --> ppi_c+amp_c+odecoa_c
		0.0	;	# 471 FACOAL1821|Fatty acid activation::coa_c+lnlc_c+atp_c --> ppi_c+amp_c+lnlccoa_c
		0.0	;	# 472 FACOAL1821|Fatty acid activation_reverse::ppi_c+amp_c+lnlccoa_c --> coa_c+lnlc_c+atp_c
		0.0	;	# 473 FACOAL204i|Fatty acid activation::coa_c+atp_c+arachd_c --> ppi_c+arachdcoa_c+amp_c
		0.0	;	# 474 FALDH|Tyrosine metabolism::fald_c+nad_c+gthrd_c --> nadh_c+Sfglutth_c+h_c
		0.0	;	# 475 FALDH|Tyrosine metabolism_reverse::nadh_c+Sfglutth_c+h_c --> fald_c+nad_c+gthrd_c
		0.0	;	# 476 FALDtm|Transport_ Mitochondrial::fald_m --> fald_c
		0.0	;	# 477 FALDtm|Transport_ Mitochondrial_reverse::fald_c --> fald_m
		0.0	;	# 478 FAOXC160|Fatty acid oxidation::7.0*fad_m+7.0*h2o_m+7.0*coa_m+7.0*nad_m+pmtcoa_m --> 7.0*nadh_m+8.0*accoa_m+7.0*fadh2_m+7.0*h_m
		0.0	;	# 479 FAOXC16080m|Fatty acid oxidation::4.0*fad_m+4.0*h2o_m+4.0*coa_m+4.0*nad_m+pmtcoa_m --> 4.0*nadh_m+4.0*accoa_m+4.0*fadh2_m+4.0*h_m+occoa_m
		0.0	;	# 480 FAOXC180|Fatty acid oxidation::fad_m+h2o_m+coa_m+nad_m+stcoa_m --> nadh_m+pmtcoa_m+accoa_m+fadh2_m+h_m
		0.0	;	# 481 FAOXC1811603m|Fatty acid oxidation::4.0*fad_m+5.0*h2o_m+5.0*coa_m+5.0*nad_m+odecoa_m --> 5.0*nadh_m+5.0*accoa_m+4.0*fadh2_m+5.0*h_m+occoa_m
		0.0	;	# 482 FAOXC182806m|Fatty acid oxidation::3.0*fad_m+5.0*h2o_m+5.0*coa_m+5.0*nad_m+lnlccoa_m --> 5.0*nadh_m+5.0*accoa_m+3.0*fadh2_m+5.0*h_m+occoa_m
		0.0	;	# 483 FAOXC204|Fatty acid oxidation::5.0*fad_m+9.0*h2o_m+arachdcoa_m+9.0*coa_m+9.0*nad_m --> 9.0*nadh_m+10.0*accoa_m+5.0*fadh2_m+9.0*h_m
		0.0	;	# 484 FAOXC80|Fatty acid oxidation::3.0*fad_m+3.0*h2o_m+3.0*coa_m+3.0*nad_m+occoa_m --> 3.0*nadh_m+4.0*accoa_m+3.0*fadh2_m+3.0*h_m
		0.0	;	# 485 FAS100COA|Fatty acid elongation::malcoa_c+3.0*h_c+occoa_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+dcacoa_c+co2_c
		0.0	;	# 486 FAS120COA|Fatty acid elongation::malcoa_c+3.0*h_c+dcacoa_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+ddcacoa_c+co2_c
		0.0	;	# 487 FAS140COA|Fatty acid elongation::malcoa_c+ddcacoa_c+3.0*h_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+tdcoa_c+co2_c
		0.0	;	# 488 FAS160COA|Fatty acid elongation::malcoa_c+tdcoa_c+3.0*h_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+pmtcoa_c+co2_c
		0.0	;	# 489 FAS180COA|Fatty acid elongation::malcoa_c+pmtcoa_c+3.0*h_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+stcoa_c+co2_c
		0.0	;	# 490 FAS80COA_L|Fatty acid elongation::3.0*malcoa_c+accoa_c+9.0*h_c+6.0*nadph_c --> 3.0*h2o_c+6.0*nadp_c+3.0*coa_c+occoa_c+3.0*co2_c
		0.0	;	# 491 FATP1t|Transport_ Extracellular::na1_c+hdca_c --> na1_e+hdca_e
		0.0	;	# 492 FATP1t|Transport_ Extracellular_reverse::na1_e+hdca_e --> na1_c+hdca_c
		0.0	;	# 493 FATP2t|Transport_ Extracellular::na1_c+ocdcea_c --> na1_e+ocdcea_e
		0.0	;	# 494 FATP2t|Transport_ Extracellular_reverse::na1_e+ocdcea_e --> na1_c+ocdcea_c
		0.0	;	# 495 FATP3t|Transport_ Extracellular::na1_c+ocdca_c --> na1_e+ocdca_e
		0.0	;	# 496 FATP3t|Transport_ Extracellular_reverse::na1_e+ocdca_e --> na1_c+ocdca_c
		0.0	;	# 497 FATP5t|Transport_ Extracellular::na1_c+arachd_c --> na1_e+arachd_e
		0.0	;	# 498 FATP5t|Transport_ Extracellular_reverse::na1_e+arachd_e --> na1_c+arachd_c
		0.0	;	# 499 FBA|Glycolysis/Gluconeogenesis::fdp_c --> dhap_c+g3p_c
		0.0	;	# 500 FBA|Glycolysis/Gluconeogenesis_reverse::dhap_c+g3p_c --> fdp_c
		0.0	;	# 501 FBA2|Fructose and Mannose Metabolism::f1p_c --> dhap_c+glyald_c
		0.0	;	# 502 FBA2|Fructose and Mannose Metabolism_reverse::dhap_c+glyald_c --> f1p_c
		0.0	;	# 503 FBP|Glycolysis/Gluconeogenesis::h2o_c+fdp_c --> f6p_c+pi_c
		0.0	;	# 504 FBP26|Fructose and Mannose Metabolism::h2o_c+f26bp_c --> f6p_c+pi_c
		0.0	;	# 505 FCLTm|Heme Biosynthesis::fe2_m+ppp9_m --> 2.0*h_m+pheme_m
		0.0	;	# 506 FE2t|Transport_ Extracellular::fe2_e --> fe2_c
		0.0	;	# 507 FE2tm|Transport_ Mitochondrial::fe2_c+h_c --> fe2_m+h_m
		0.0	;	# 508 FPGS7m|Folate Metabolism::4.0*atp_m+10fthf_m+4.0*glu_L_m --> 10fthf5glu_m+4.0*pi_m+4.0*h_m+4.0*adp_m
		0.0	;	# 509 FPGS8m|Folate Metabolism::atp_m+10fthf5glu_m+glu_L_m --> 10fthf6glu_m+pi_m+h_m+adp_m
		0.0	;	# 510 FPGS9|Folate Metabolism::10fthf6glu_c+atp_c+glu_L_c --> pi_c+h_c+adp_c+10fthf7glu_c
		0.0	;	# 511 FPGS9m|Folate Metabolism::atp_m+glu_L_m+10fthf6glu_m --> pi_m+h_m+adp_m+10fthf7glu_m
		0.0	;	# 512 FRUt1r|Transport_ Extracellular::fru_e --> fru_c
		0.0	;	# 513 FRUt1r|Transport_ Extracellular_reverse::fru_c --> fru_e
		0.0	;	# 514 FRUt4|Transport_ Extracellular::na1_e+fru_e --> na1_c+fru_c
		0.0	;	# 515 FRUt4|Transport_ Extracellular_reverse::na1_c+fru_c --> na1_e+fru_e
		0.0	;	# 516 FTHFL|Folate Metabolism::for_c+thf_c+atp_c --> 10fthf_c+pi_c+adp_c
		0.0	;	# 517 FTHFL|Folate Metabolism_reverse::10fthf_c+pi_c+adp_c --> for_c+thf_c+atp_c
		0.0	;	# 518 FUMAC|Tyrosine metabolism::h2o_c+4fumacac_c --> h_c+fum_c+acac_c
		0.0	;	# 519 FUMSO3tm|Transport_ Mitochondrial::fum_c+so3_m --> so3_c+fum_m
		0.0	;	# 520 FUMSO3tm|Transport_ Mitochondrial_reverse::so3_c+fum_m --> fum_c+so3_m
		0.0	;	# 521 FUMTSULtm|Transport_ Mitochondrial::fum_c+tsul_m --> fum_m+tsul_c
		0.0	;	# 522 FUMTSULtm|Transport_ Mitochondrial_reverse::fum_m+tsul_c --> fum_c+tsul_m
		0.0	;	# 523 FUMm|Citric Acid Cycle::h2o_m+fum_m --> mal_L_m
		0.0	;	# 524 FUMm|Citric Acid Cycle_reverse::mal_L_m --> h2o_m+fum_m
		0.0	;	# 525 FUMtm|Transport_ Mitochondrial::pi_m+fum_c --> pi_c+fum_m
		0.0	;	# 526 FUMtm|Transport_ Mitochondrial_reverse::pi_c+fum_m --> pi_m+fum_c
		0.0	;	# 527 G3PD1|Glycerophospholipid Metabolism::glyc3p_c+nad_c --> nadh_c+dhap_c+h_c
		0.0	;	# 528 G3PD1|Glycerophospholipid Metabolism_reverse::nadh_c+dhap_c+h_c --> glyc3p_c+nad_c
		0.0	;	# 529 G3PD2m|Glycolysis/Gluconeogenesis::fad_m+glyc3p_c --> fadh2_m+dhap_c
		0.0	;	# 530 G5SADrm|Proline Metabolism::glu5sa_m --> h2o_m+1pyr5c_m+h_m
		0.0	;	# 531 G5SADrm|Proline Metabolism_reverse::h2o_m+1pyr5c_m+h_m --> glu5sa_m
		0.0	;	# 532 G6PDH2r|Pentose Phosphate Pathway::nadp_c+g6p_c --> 6pgl_c+h_c+nadph_c
		0.0	;	# 533 G6PDH2r|Pentose Phosphate Pathway_reverse::6pgl_c+h_c+nadph_c --> nadp_c+g6p_c
		0.0	;	# 534 G6PPer|Glycolysis/Gluconeogenesis::h2o_r+g6p_r --> pi_r+glc_D_r
		0.0	;	# 535 G6Pter|Transport_ Endoplasmic Reticular::g6p_c --> g6p_r
		0.0	;	# 536 G6Pter|Transport_ Endoplasmic Reticular_reverse::g6p_r --> g6p_c
		0.0	;	# 537 GACMTRc|Urea cycle/amino group metabolism::amet_c+gudac_c --> h_c+creat_c+ahcys_c
		0.0	;	# 538 GACMTRc|Urea cycle/amino group metabolism_reverse::h_c+creat_c+ahcys_c --> amet_c+gudac_c
		0.0	;	# 539 GALK|Galactose metabolism::atp_c+gal_c --> gal1p_c+h_c+adp_c
		0.0	;	# 540 GALT|Galactose metabolism::utp_c+gal1p_c+h_c --> udpgal_c+ppi_c
		0.0	;	# 541 GALT|Galactose metabolism_reverse::udpgal_c+ppi_c --> utp_c+gal1p_c+h_c
		0.0	;	# 542 GALU|Galactose metabolism::utp_c+h_c+g1p_c --> ppi_c+udpg_c
		0.0	;	# 543 GALU|Galactose metabolism_reverse::ppi_c+udpg_c --> utp_c+h_c+g1p_c
		0.0	;	# 544 GALt1r|Transport_ Extracellular::gal_e --> gal_c
		0.0	;	# 545 GALt1r|Transport_ Extracellular_reverse::gal_c --> gal_e
		0.0	;	# 546 GAPD|Glycolysis/Gluconeogenesis::nad_c+pi_c+g3p_c --> nadh_c+13dpg_c+h_c
		0.0	;	# 547 GAPD|Glycolysis/Gluconeogenesis_reverse::nadh_c+13dpg_c+h_c --> nad_c+pi_c+g3p_c
		0.0	;	# 548 GARFT|IMP Biosynthesis::10fthf_c+gar_c --> thf_c+fgam_c+h_c
		0.0	;	# 549 GARFT|IMP Biosynthesis_reverse::thf_c+fgam_c+h_c --> 10fthf_c+gar_c
		0.0	;	# 550 GGH_10FTHF5GLUl|Folate Metabolism::4.0*h2o_l+10fthf5glu_l --> 10fthf_l+4.0*glu_L_l
		0.0	;	# 551 GGH_10FTHF6GLUl|Folate Metabolism::h2o_l+10fthf6glu_l --> 10fthf5glu_l+glu_L_l
		0.0	;	# 552 GGH_10FTHF7GLUl|Folate Metabolism::h2o_l+10fthf7glu_l --> glu_L_l+10fthf6glu_l
		0.0	;	# 553 GGLUCT|Glutathione Metabolism::gluala_e --> 5oxpro_c+ala_L_c
		0.0	;	# 554 GGNG|Starch and Sucrose Metabolism::Tyr_ggn_c+8.0*udpg_c --> 8.0*udp_c+8.0*h_c+ggn_c
		0.0	;	# 555 GGT5r|Eicosanoid Metabolism::h2o_r+leuktrC4_r --> glu_L_r+leuktrD4_r
		0.0	;	# 556 GGT5r|Eicosanoid Metabolism_reverse::glu_L_r+leuktrD4_r --> h2o_r+leuktrC4_r
		0.0	;	# 557 GGT6|Eicosanoid Metabolism::glu_L_c+leuktrE4_c --> leuktrF4_c+h2o_c
		0.0	;	# 558 GGT6|Eicosanoid Metabolism_reverse::leuktrF4_c+h2o_c --> glu_L_c+leuktrE4_c
		0.0	;	# 559 GHMT2r|Glycine_ Serine_ and Threonine Metabolism::ser_L_c+thf_c --> mlthf_c+h2o_c+gly_c
		0.0	;	# 560 GHMT2r|Glycine_ Serine_ and Threonine Metabolism_reverse::mlthf_c+h2o_c+gly_c --> ser_L_c+thf_c
		0.0	;	# 561 GK1|Nucleotides::atp_c+gmp_c --> gdp_c+adp_c
		0.0	;	# 562 GK1|Nucleotides_reverse::gdp_c+adp_c --> atp_c+gmp_c
		0.0	;	# 563 GLBRAN|Starch and Sucrose Metabolism::glygn1_c --> glygn2_c
		0.0	;	# 564 GLCURter|Transport_ Endoplasmic Reticular::glcur_c --> glcur_r
		0.0	;	# 565 GLCt1r|Transport_ Extracellular::glc_D_e --> glc_D_c
		0.0	;	# 566 GLCt1r|Transport_ Extracellular_reverse::glc_D_c --> glc_D_e
		0.0	;	# 567 GLCter|Transport_ Endoplasmic Reticular::glc_D_c --> glc_D_r
		0.0	;	# 568 GLCter|Transport_ Endoplasmic Reticular_reverse::glc_D_r --> glc_D_c
		0.0	;	# 569 GLDBRAN|Starch and Sucrose Metabolism::h2o_c+dxtrn_c --> glc_D_c+glygn3_c
		0.0	;	# 570 GLGNS1|Starch and Sucrose Metabolism::ggn_c+3.0*udpg_c --> 3.0*udp_c+3.0*h_c+glygn1_c
		0.0	;	# 571 GLNS|Glutamate metabolism::nh4_c+atp_c+glu_L_c --> gln_L_c+pi_c+h_c+adp_c
		0.0	;	# 572 GLNtm|Transport_ Mitochondrial::gln_L_c --> gln_L_m
		0.0	;	# 573 GLPASE1|Starch and Sucrose Metabolism::glygn2_c+3.0*pi_c --> dxtrn_c+3.0*g1p_c
		0.0	;	# 574 GLPASE2|Starch and Sucrose Metabolism::7.0*h2o_c+glygn3_c --> Tyr_ggn_c+7.0*glc_D_c
		0.0	;	# 575 GLUCYS|Glutathione Metabolism::cys_L_c+atp_c+glu_L_c --> glucys_c+pi_c+h_c+adp_c
		0.0	;	# 576 GLUDC|Glutamate metabolism::h_c+glu_L_c --> 4abut_c+co2_c
		0.0	;	# 577 GLUDxm|Glutamate metabolism::h2o_m+glu_L_m+nad_m --> nadh_m+nh4_m+h_m+akg_m
		0.0	;	# 578 GLUDxm|Glutamate metabolism_reverse::nadh_m+nh4_m+h_m+akg_m --> h2o_m+glu_L_m+nad_m
		0.0	;	# 579 GLUNm|Glutamate metabolism::h2o_m+gln_L_m --> glu_L_m+nh4_m
		0.0	;	# 580 GLUPRT|IMP Biosynthesis::gln_L_c+h2o_c+prpp_c --> ppi_c+pram_c+glu_L_c
		0.0	;	# 581 GLUTCOADHm|Tryptophan metabolism::fad_m+h_m+glutcoa_m --> b2coa_m+fadh2_m+co2_m
		0.0	;	# 582 GLUt6|Transport_ Extracellular::3.0*na1_e+glu_L_e+h_e+k_c --> 3.0*na1_c+h_c+glu_L_c+k_e
		0.0	;	# 583 GLUt7l|Transport_ Lysosomal::glu_L_l --> glu_L_c
		0.0	;	# 584 GLUtr|Transport_ Endoplasmic Reticular::glu_L_c --> glu_L_r
		0.0	;	# 585 GLUtr|Transport_ Endoplasmic Reticular_reverse::glu_L_r --> glu_L_c
		0.0	;	# 586 GLYAMDTRc|Urea cycle/amino group metabolism::gly_c+arg_L_c --> gudac_c+orn_c
		0.0	;	# 587 GLYAMDTRc|Urea cycle/amino group metabolism_reverse::gudac_c+orn_c --> gly_c+arg_L_c
		0.0	;	# 588 GLYBt4_2r|Transport_ Extracellular::2.0*na1_e+glyb_e --> 2.0*na1_c+glyb_c
		0.0	;	# 589 GLYBt4_2r|Transport_ Extracellular_reverse::2.0*na1_c+glyb_c --> 2.0*na1_e+glyb_e
		0.0	;	# 590 GLYK|Glycerophospholipid Metabolism::glyc_c+atp_c --> glyc3p_c+h_c+adp_c
		0.0	;	# 591 GLYOX|Pyruvate Metabolism::h2o_c+lgt_S_c --> lac_D_c+h_c+gthrd_c
		0.0	;	# 592 GMPR|Nucleotides::2.0*h_c+gmp_c+nadph_c --> nadp_c+nh4_c+imp_c
		0.0	;	# 593 GND|Pentose Phosphate Pathway::nadp_c+6pgc_c --> co2_c+nadph_c+ru5p_D_c
		0.0	;	# 594 GPDDA1|Glycerophospholipid Metabolism::h2o_c+g3pc_c --> chol_c+glyc3p_c+h_c
		0.0	;	# 595 GSNt|Transport_ Extracellular::gsn_e --> gsn_c
		0.0	;	# 596 GSNt|Transport_ Extracellular_reverse::gsn_c --> gsn_e
		0.0	;	# 597 GTHO|Glutamate metabolism::h_c+gthox_c+nadph_c --> nadp_c+2.0*gthrd_c
		0.0	;	# 598 GTHOm|Glutamate metabolism::h_m+gthox_m+nadph_m --> nadp_m+2.0*gthrd_m
		0.0	;	# 599 GTHP|Glutathione Metabolism::h2o2_c+2.0*gthrd_c --> 2.0*h2o_c+gthox_c
		0.0	;	# 600 GTHP|Glutathione Metabolism_reverse::2.0*h2o_c+gthox_c --> h2o2_c+2.0*gthrd_c
		0.0	;	# 601 GTHPe|Glutathione Metabolism::h2o2_e+2.0*gthrd_e --> 2.0*h2o_e+gthox_e
		0.0	;	# 602 GTHPe|Glutathione Metabolism_reverse::2.0*h2o_e+gthox_e --> h2o2_e+2.0*gthrd_e
		0.0	;	# 603 GTHPm|Glutathione Metabolism::h2o2_m+2.0*gthrd_m --> 2.0*h2o_m+gthox_m
		0.0	;	# 604 GTHPm|Glutathione Metabolism_reverse::2.0*h2o_m+gthox_m --> h2o2_m+2.0*gthrd_m
		0.0	;	# 605 GTHRDtr|Transport_ Endoplasmic Reticular::gthrd_c --> gthrd_r
		0.0	;	# 606 GTHRDtr|Transport_ Endoplasmic Reticular_reverse::gthrd_r --> gthrd_c
		0.0	;	# 607 GTHS|Glutathione Metabolism::atp_c+glucys_c+gly_c --> pi_c+h_c+adp_c+gthrd_c
		0.0	;	# 608 GTMLTe|Glutathione Metabolism::ala_L_c+gthrd_c --> cgly_e+gluala_e
		0.0	;	# 609 GUACYC|Nucleotides::gtp_c --> 35cgmp_c+ppi_c
		0.0	;	# 610 GUAPRT|Salvage Pathway::prpp_c+gua_c --> ppi_c+gmp_c
		0.0	;	# 611 GULN3D|Pentose and Glucuronate Interconversions::guln_c+nad_c --> nadh_c+h_c+3dhguln_c
		0.0	;	# 612 GULN3D|Pentose and Glucuronate Interconversions_reverse::nadh_c+h_c+3dhguln_c --> guln_c+nad_c
		0.0	;	# 613 GULNDer|Pentose and Glucuronate Interconversions::glcur_r+h_r+nadph_r --> nadp_r+guln_r
		0.0	;	# 614 GULNDer|Pentose and Glucuronate Interconversions_reverse::nadp_r+guln_r --> glcur_r+h_r+nadph_r
		0.0	;	# 615 GULNter|Transport_ Endoplasmic Reticular::guln_r --> guln_c
		0.0	;	# 616 H2CO3D|Miscellaneous::h2o_c+co2_c --> h2co3_c
		0.0	;	# 617 H2CO3D|Miscellaneous_reverse::h2co3_c --> h2o_c+co2_c
		0.0	;	# 618 H2CO3D2|Miscellaneous::hco3_c+h_c --> h2co3_c
		0.0	;	# 619 H2CO3D2|Miscellaneous_reverse::h2co3_c --> hco3_c+h_c
		0.0	;	# 620 H2O2t|Transport_ Extracellular::h2o2_e --> h2o2_c
		0.0	;	# 621 H2O2t|Transport_ Extracellular_reverse::h2o2_c --> h2o2_e
		0.0	;	# 622 H2O2tm|Transport_ Mitochondrial::h2o2_c --> h2o2_m
		0.0	;	# 623 H2O2tm|Transport_ Mitochondrial_reverse::h2o2_m --> h2o2_c
		0.0	;	# 624 H2Otly|Transport_ Lysosomal::h2o_c --> h2o_l
		0.0	;	# 625 H2Otly|Transport_ Lysosomal_reverse::h2o_l --> h2o_c
		0.0	;	# 626 H2Otp|Transport_ Peroxisomal::h2o_c --> h2o_x
		0.0	;	# 627 H2Otp|Transport_ Peroxisomal_reverse::h2o_x --> h2o_c
		0.0	;	# 628 HACD1m|Tryptophan metabolism::nadh_m+h_m+aacoa_m --> nad_m+3hbcoa_m
		0.0	;	# 629 HACD1m|Tryptophan metabolism_reverse::nad_m+3hbcoa_m --> nadh_m+h_m+aacoa_m
		0.0	;	# 630 HACD9m|Valine_ Leucine_ and Isoleucine Metabolism::nad_m+3hmbcoa_m --> nadh_m+h_m+2maacoa_m
		0.0	;	# 631 HACD9m|Valine_ Leucine_ and Isoleucine Metabolism_reverse::nadh_m+h_m+2maacoa_m --> nad_m+3hmbcoa_m
		0.0	;	# 632 HCO3Em|Urea cycle/amino group metabolism::h2o_m+co2_m --> hco3_m+h_m
		0.0	;	# 633 HCO3Em|Urea cycle/amino group metabolism_reverse::hco3_m+h_m --> h2o_m+co2_m
		0.0	;	# 634 HCO3_CLt|Transport_ Extracellular::cl_c+hco3_e --> hco3_c+cl_e
		0.0	;	# 635 HCO3_CLt|Transport_ Extracellular_reverse::hco3_c+cl_e --> cl_c+hco3_e
		0.0	;	# 636 HCO3_NAt|Transport_ Extracellular::na1_e+hco3_e --> na1_c+hco3_c
		0.0	;	# 637 HCO3_NAt|Transport_ Extracellular_reverse::na1_c+hco3_c --> na1_e+hco3_e
		0.0	;	# 638 HEX1|Glycolysis/Gluconeogenesis::atp_c+glc_D_c --> h_c+adp_c+g6p_c
		0.0	;	# 639 HEX7|Fructose and Mannose Metabolism::atp_c+fru_c --> f6p_c+h_c+adp_c
		0.0	;	# 640 HGNTOR|Tyrosine metabolism::o2_c+hgentis_c --> h_c+4mlacac_c
		0.0	;	# 641 HIBDm|Valine_ Leucine_ and Isoleucine Metabolism::3hmp_m+nad_m --> nadh_m+h_m+2mop_m
		0.0	;	# 642 HIBDm|Valine_ Leucine_ and Isoleucine Metabolism_reverse::nadh_m+h_m+2mop_m --> 3hmp_m+nad_m
		0.0	;	# 643 HISDC|Histidine Metabolism::h_c+his_L_c --> hista_c+co2_c
		0.0	;	# 644 HISTAVESSEC|Transport_ Extracellular::2.0*h2o_c+2.0*atp_c+3.0*hista_c --> 2.0*pi_c+2.0*h_c+2.0*adp_c+3.0*hista_e
		0.0	;	# 645 HISt4|Transport_ Extracellular::na1_e+his_L_e --> na1_c+his_L_c
		0.0	;	# 646 HIStiDF|Transport_ Extracellular::his_L_e --> his_L_c
		0.0	;	# 647 HMBS|Heme Biosynthesis::h2o_c+4.0*ppbng_c --> 4.0*nh4_c+hmbil_c
		0.0	;	# 648 HMGLm|Cholesterol Metabolism::hmgcoa_m --> acac_m+accoa_m
		0.0	;	# 649 HOXG|Heme Degradation::3.0*o2_c+5.0*h_c+pheme_c+3.0*nadph_c --> biliverd_c+3.0*h2o_c+3.0*nadp_c+fe2_c+co_c
		0.0	;	# 650 HPACtr|Transport_ Extracellular::4hphac_c --> 4hphac_e
		0.0	;	# 651 HPACtr|Transport_ Extracellular_reverse::4hphac_e --> 4hphac_c
		0.0	;	# 652 HPETOX|ROS Detoxification::12HPET_c+2.0*gthrd_c --> h2o_c+12harachd_c+gthox_c
		0.0	;	# 653 HPETOX|ROS Detoxification_reverse::h2o_c+12harachd_c+gthox_c --> 12HPET_c+2.0*gthrd_c
		0.0	;	# 654 HXPRT|Salvage Pathway::hxan_c+prpp_c --> ppi_c+imp_c
		0.0	;	# 655 HYXNt|Transport_ Extracellular::hxan_e --> hxan_c
		0.0	;	# 656 HYXNt|Transport_ Extracellular_reverse::hxan_c --> hxan_e
		0.0	;	# 657 Htr|Transport_ Endoplasmic Reticular::h_c --> h_r
		0.0	;	# 658 Htr|Transport_ Endoplasmic Reticular_reverse::h_r --> h_c
		0.0	;	# 659 Htx|Transport_ Peroxisomal::h_c --> h_x
		0.0	;	# 660 Htx|Transport_ Peroxisomal_reverse::h_x --> h_c
		0.0	;	# 661 ICDHxm|Citric Acid Cycle::nad_m+icit_m --> nadh_m+co2_m+akg_m
		0.0	;	# 662 ICDHxm|Citric Acid Cycle_reverse::nadh_m+co2_m+akg_m --> nad_m+icit_m
		0.0	;	# 663 ICDHy|Citric Acid Cycle::nadp_c+icit_c --> co2_c+akg_c+nadph_c
		0.0	;	# 664 ICDHyrm|Citric Acid Cycle::nadp_m+icit_m --> co2_m+akg_m+nadph_m
		0.0	;	# 665 ICDHyrm|Citric Acid Cycle_reverse::co2_m+akg_m+nadph_m --> nadp_m+icit_m
		0.0	;	# 666 ILETA|Valine_ Leucine_ and Isoleucine Metabolism::ile_L_c+akg_c --> 3mop_c+glu_L_c
		0.0	;	# 667 ILETA|Valine_ Leucine_ and Isoleucine Metabolism_reverse::3mop_c+glu_L_c --> ile_L_c+akg_c
		0.0	;	# 668 ILEt4|Transport_ Extracellular::na1_e+ile_L_e --> na1_c+ile_L_c
		0.0	;	# 669 ILEt4|Transport_ Extracellular_reverse::na1_c+ile_L_c --> na1_e+ile_L_e
		0.0	;	# 670 ILEtec|Transport_ Extracellular::ile_L_e --> ile_L_c
		0.0	;	# 671 ILEtec|Transport_ Extracellular_reverse::ile_L_c --> ile_L_e
		0.0	;	# 672 IMPC|IMP Biosynthesis::h2o_c+imp_c --> fprica_c
		0.0	;	# 673 IMPC|IMP Biosynthesis_reverse::fprica_c --> h2o_c+imp_c
		0.0	;	# 674 IMPD|Nucleotides::h2o_c+nad_c+imp_c --> xmp_c+nadh_c+h_c
		0.0	;	# 675 INOSTO|Inositol Phosphate Metabolism::o2_c+inost_c --> glcur_c+h2o_c+h_c
		0.0	;	# 676 INSTt4|Transport_ Extracellular::na1_e+inost_e --> na1_c+inost_c
		0.0	;	# 677 INSTt4|Transport_ Extracellular_reverse::na1_c+inost_c --> na1_e+inost_e
		0.0	;	# 678 INSTt4_2|Transport_ Extracellular::2.0*na1_e+inost_e --> 2.0*na1_c+inost_c
		0.0	;	# 679 INSTt4_2|Transport_ Extracellular_reverse::2.0*na1_c+inost_c --> 2.0*na1_e+inost_e
		0.0	;	# 680 KAS8|Fatty acid elongation::7.0*malcoa_c+accoa_c+20.0*h_c+14.0*nadph_c --> 6.0*h2o_c+14.0*nadp_c+8.0*coa_c+hdca_c+7.0*co2_c
		0.0	;	# 681 KHK|Fructose and Mannose Metabolism::atp_c+fru_c --> f1p_c+h_c+adp_c
		0.0	;	# 682 L_LACt2r|Transport_ Extracellular::lac_L_e+h_e --> lac_L_c+h_c
		0.0	;	# 683 L_LACt2r|Transport_ Extracellular_reverse::lac_L_c+h_c --> lac_L_e+h_e
		0.0	;	# 684 LALDO2|Pyruvate Metabolism::h_c+mthgxl_c+nadph_c --> lald_D_c+nadp_c
		0.0	;	# 685 LALDO2x|Pyruvate Metabolism::nadh_c+h_c+mthgxl_c --> lald_D_c+nad_c
		0.0	;	# 686 LCADi|Pyruvate Metabolism::h2o_c+lald_L_c+nad_c --> nadh_c+lac_L_c+2.0*h_c
		0.0	;	# 687 LCADi_D|Pyruvate Metabolism::h2o_c+lald_D_c+nad_c --> nadh_c+lac_D_c+2.0*h_c
		0.0	;	# 688 LDH_D|Pyruvate Metabolism::nad_c+lac_D_c --> pyr_c+nadh_c+h_c
		0.0	;	# 689 LDH_D|Pyruvate Metabolism_reverse::pyr_c+nadh_c+h_c --> nad_c+lac_D_c
		0.0	;	# 690 LDH_L|Glycolysis/Gluconeogenesis::nad_c+lac_L_c --> pyr_c+nadh_c+h_c
		0.0	;	# 691 LDH_L|Glycolysis/Gluconeogenesis_reverse::pyr_c+nadh_c+h_c --> nad_c+lac_L_c
		0.0	;	# 692 LEUKTRA4tr|Transport_ Endoplasmic Reticular::leuktrA4_c --> leuktrA4_r
		0.0	;	# 693 LEUKTRA4tr|Transport_ Endoplasmic Reticular_reverse::leuktrA4_r --> leuktrA4_c
		0.0	;	# 694 LEUKTRD4tr|Transport_ Endoplasmic Reticular::leuktrD4_c --> leuktrD4_r
		0.0	;	# 695 LEUKTRD4tr|Transport_ Endoplasmic Reticular_reverse::leuktrD4_r --> leuktrD4_c
		0.0	;	# 696 LEUKTRF4t|Transport_ Extracellular::leuktrF4_e --> leuktrF4_c
		0.0	;	# 697 LEUKTRF4t|Transport_ Extracellular_reverse::leuktrF4_c --> leuktrF4_e
		0.0	;	# 698 LEUt4|Transport_ Extracellular::na1_e+leu_L_e --> na1_c+leu_L_c
		0.0	;	# 699 LEUt4|Transport_ Extracellular_reverse::na1_c+leu_L_c --> na1_e+leu_L_e
		0.0	;	# 700 LGTHL|Pyruvate Metabolism::mthgxl_c+gthrd_c --> lgt_S_c
		0.0	;	# 701 LNLCCPT1|Carnitine shuttle::crn_c+lnlccoa_c --> coa_c+lnlccrn_c
		0.0	;	# 702 LNLCCPT2|Carnitine shuttle::coa_m+lnlccrn_m --> crn_m+lnlccoa_m
		0.0	;	# 703 LNLCCRNt|Carnitine shuttle::lnlccrn_c --> lnlccrn_m
		0.0	;	# 704 LNLCt|Transport_ Extracellular::lnlc_e --> lnlc_c
		0.0	;	# 705 LNLCt|Transport_ Extracellular_reverse::lnlc_c --> lnlc_e
		0.0	;	# 706 LSOProd|ROS Detoxification::o2_m+focytC_m --> o2s_m+ficytC_m
		0.0	;	# 707 LTC4Sr|Eicosanoid Metabolism::leuktrA4_r+gthrd_r --> leuktrC4_r
		0.0	;	# 708 LTD4DP|Eicosanoid Metabolism::h2o_c+leuktrD4_c --> gly_c+leuktrE4_c
		0.0	;	# 709 LTD4DP|Eicosanoid Metabolism_reverse::gly_c+leuktrE4_c --> h2o_c+leuktrD4_c
		0.0	;	# 710 LTDCL|Tryptophan metabolism::trp_L_c+h_c --> co2_c+trypta_c
		0.0	;	# 711 LYSt4|Transport_ Extracellular::na1_e+lys_L_e --> na1_c+lys_L_c
		0.0	;	# 712 LYStiDF|Transport_ Extracellular::lys_L_e --> lys_L_c
		0.0	;	# 713 LYStm|Transport_ Mitochondrial::lys_L_c+h_m --> lys_L_m+h_c
		0.0	;	# 714 LYStm|Transport_ Mitochondrial_reverse::lys_L_m+h_c --> lys_L_c+h_m
		0.0	;	# 715 MACACI|Tyrosine metabolism::4mlacac_c --> 4fumacac_c
		0.0	;	# 716 MALSO3tm|Transport_ Mitochondrial::mal_L_c+so3_m --> mal_L_m+so3_c
		0.0	;	# 717 MALSO3tm|Transport_ Mitochondrial_reverse::mal_L_m+so3_c --> mal_L_c+so3_m
		0.0	;	# 718 MALTSULtm|Transport_ Mitochondrial::mal_L_c+tsul_m --> mal_L_m+tsul_c
		0.0	;	# 719 MALTSULtm|Transport_ Mitochondrial_reverse::mal_L_m+tsul_c --> mal_L_c+tsul_m
		0.0	;	# 720 MALtm|Transport_ Mitochondrial::mal_L_c+pi_m --> mal_L_m+pi_c
		0.0	;	# 721 MALtm|Transport_ Mitochondrial_reverse::mal_L_m+pi_c --> mal_L_c+pi_m
		0.0	;	# 722 MCCCrm|Valine_ Leucine_ and Isoleucine Metabolism::atp_m+hco3_m+3mb2coa_m --> 3mgcoa_m+pi_m+h_m+adp_m
		0.0	;	# 723 MCCCrm|Valine_ Leucine_ and Isoleucine Metabolism_reverse::3mgcoa_m+pi_m+h_m+adp_m --> atp_m+hco3_m+3mb2coa_m
		0.0	;	# 724 MCPST|Cysteine Metabolism::cyan_c+mercppyr_c --> pyr_c+tcynt_c+h_c
		0.0	;	# 725 MDH|Citric Acid Cycle::mal_L_c+nad_c --> nadh_c+oaa_c+h_c
		0.0	;	# 726 MDH|Citric Acid Cycle_reverse::nadh_c+oaa_c+h_c --> mal_L_c+nad_c
		0.0	;	# 727 MDHm|Citric Acid Cycle::mal_L_m+nad_m --> nadh_m+oaa_m+h_m
		0.0	;	# 728 MDHm|Citric Acid Cycle_reverse::nadh_m+oaa_m+h_m --> mal_L_m+nad_m
		0.0	;	# 729 ME1m|Pyruvate Metabolism::mal_L_m+nad_m --> nadh_m+pyr_m+co2_m
		0.0	;	# 730 ME2m|Pyruvate Metabolism::mal_L_m+nadp_m --> pyr_m+co2_m+nadph_m
		0.0	;	# 731 METAT|Methionine Metabolism::h2o_c+atp_c+met_L_c --> amet_c+ppi_c+pi_c
		0.0	;	# 732 METLEUex|Transport_ Extracellular::leu_L_c+met_L_e --> leu_L_e+met_L_c
		0.0	;	# 733 METLEUex|Transport_ Extracellular_reverse::leu_L_e+met_L_c --> leu_L_c+met_L_e
		0.0	;	# 734 METt4|Transport_ Extracellular::na1_e+met_L_e --> na1_c+met_L_c
		0.0	;	# 735 METt4|Transport_ Extracellular_reverse::na1_c+met_L_c --> na1_e+met_L_e
		0.0	;	# 736 METtec|Transport_ Extracellular::met_L_e --> met_L_c
		0.0	;	# 737 METtec|Transport_ Extracellular_reverse::met_L_c --> met_L_e
		0.0	;	# 738 MGCHrm|Valine_ Leucine_ and Isoleucine Metabolism::h2o_m+3mgcoa_m --> hmgcoa_m
		0.0	;	# 739 MGCHrm|Valine_ Leucine_ and Isoleucine Metabolism_reverse::hmgcoa_m --> h2o_m+3mgcoa_m
		0.0	;	# 740 MGSA|Pyruvate Metabolism::dhap_c --> pi_c+mthgxl_c
		0.0	;	# 741 MGSA2|Pyruvate Metabolism::g3p_c --> pi_c+mthgxl_c
		0.0	;	# 742 MI145PP|Inositol Phosphate Metabolism::h2o_c+mi145p_c --> pi_c+mi14p_c
		0.0	;	# 743 MI14PP|Inositol Phosphate Metabolism::h2o_c+mi14p_c --> mi4p_D_c+pi_c
		0.0	;	# 744 MI1PP|Inositol Phosphate Metabolism::mi1p_D_c+h2o_c --> inost_c+pi_c
		0.0	;	# 745 MI4PP|Inositol Phosphate Metabolism::h2o_c+mi4p_D_c --> inost_c+pi_c
		0.0	;	# 746 MMEm|Valine_ Leucine_ and Isoleucine Metabolism::mmcoa_R_m --> mmcoa_S_m
		0.0	;	# 747 MMEm|Valine_ Leucine_ and Isoleucine Metabolism_reverse::mmcoa_S_m --> mmcoa_R_m
		0.0	;	# 748 MMMm|Valine_ Leucine_ and Isoleucine Metabolism::mmcoa_R_m --> succoa_m
		0.0	;	# 749 MMMm|Valine_ Leucine_ and Isoleucine Metabolism_reverse::succoa_m --> mmcoa_R_m
		0.0	;	# 750 MMSAD3m|Propanoate Metabolism::coa_m+nad_m+msa_m --> nadh_m+accoa_m+co2_m
		0.0	;	# 751 MMTSADm|Valine_ Leucine_ and Isoleucine Metabolism::coa_m+nad_m+2mop_m --> nadh_m+mmcoa_R_m+h_m
		0.0	;	# 752 MTHFC|Folate Metabolism::h2o_c+methf_c --> 10fthf_c+h_c
		0.0	;	# 753 MTHFC|Folate Metabolism_reverse::10fthf_c+h_c --> h2o_c+methf_c
		0.0	;	# 754 MTHFCm|Folate Metabolism::h2o_m+methf_m --> 10fthf_m+h_m
		0.0	;	# 755 MTHFCm|Folate Metabolism_reverse::10fthf_m+h_m --> h2o_m+methf_m
		0.0	;	# 756 MTHFD|Folate Metabolism::mlthf_c+nadp_c --> methf_c+nadph_c
		0.0	;	# 757 MTHFD|Folate Metabolism_reverse::methf_c+nadph_c --> mlthf_c+nadp_c
		0.0	;	# 758 MTHFD2m|Folate Metabolism::nad_m+mlthf_m --> nadh_m+methf_m
		0.0	;	# 759 MTHFD2m|Folate Metabolism_reverse::nadh_m+methf_m --> nad_m+mlthf_m
		0.0	;	# 760 MTHFDm|Folate Metabolism::nadp_m+mlthf_m --> methf_m+nadph_m
		0.0	;	# 761 MTHFDm|Folate Metabolism_reverse::methf_m+nadph_m --> nadp_m+mlthf_m
		0.0	;	# 762 MTHFR3|Folate Metabolism::mlthf_c+2.0*h_c+nadph_c --> nadp_c+5mthf_c
		0.0	;	# 763 NADH2_u10m|Oxidative Phosphorylation::nadh_m+5.0*h_m+q10_m --> nad_m+4.0*h_c+q10h2_m
		0.0	;	# 764 NADN|NAD Metabolism::h2o_c+nad_c --> adprib_c+ncam_c+h_c
		0.0	;	# 765 NADNe|NAD Metabolism::h2o_e+nad_e --> adprib_e+ncam_e+h_e
		0.0	;	# 766 NADPHtru|Transport_ Endoplasmic Reticular::nadph_c --> nadph_r
		0.0	;	# 767 NADPtru|Transport_ Endoplasmic Reticular::nadp_r --> nadp_c
		0.0	;	# 768 NDP3ex|Nucleotides::h2o_e+gdp_e --> pi_e+h_e+gmp_e
		0.0	;	# 769 NDPK1|Nucleotides::gdp_c+atp_c --> gtp_c+adp_c
		0.0	;	# 770 NDPK1|Nucleotides_reverse::gtp_c+adp_c --> gdp_c+atp_c
		0.0	;	# 771 NDPK1m|Nucleotides::atp_m+gdp_m --> gtp_m+adp_m
		0.0	;	# 772 NDPK1m|Nucleotides_reverse::gtp_m+adp_m --> atp_m+gdp_m
		0.0	;	# 773 NDPK2|Nucleotides::atp_c+udp_c --> utp_c+adp_c
		0.0	;	# 774 NDPK2|Nucleotides_reverse::utp_c+adp_c --> atp_c+udp_c
		0.0	;	# 775 NDPK3|Nucleotides::atp_c+cdp_c --> ctp_c+adp_c
		0.0	;	# 776 NDPK3|Nucleotides_reverse::ctp_c+adp_c --> atp_c+cdp_c
		0.0	;	# 777 NMNATr|NAD Metabolism::nmn_c+atp_c+h_c --> ppi_c+nad_c
		0.0	;	# 778 NMNATr|NAD Metabolism_reverse::ppi_c+nad_c --> nmn_c+atp_c+h_c
		0.0	;	# 779 NORANMT|Tyrosine metabolism::amet_c+nrpphr_c --> h_c+adrnl_c+ahcys_c
		0.0	;	# 780 NOS1|Proline Metabolism::o2_c+h_c+arg_L_c+nadph_c --> h2o_c+nwharg_c+nadp_c
		0.0	;	# 781 NOS2|Proline Metabolism::2.0*o2_c+2.0*nwharg_c+nadph_c --> 2.0*h2o_c+nadp_c+2.0*no_c+2.0*citr_L_c+h_c
		0.0	;	# 782 NOt|Transport_ Extracellular::no_e --> no_c
		0.0	;	# 783 NOt|Transport_ Extracellular_reverse::no_c --> no_e
		0.0	;	# 784 NRPPHRSFt|Transport_ Extracellular::nrpphrsf_c --> nrpphrsf_e
		0.0	;	# 785 NRPPHRSULT|Tyrosine metabolism::nrpphr_c+paps_c --> pap_c+nrpphrsf_c+h_c
		0.0	;	# 786 NTD10|Nucleotides::h2o_c+xmp_c --> xtsn_c+pi_c
		0.0	;	# 787 NTD11|Purine Catabolism::h2o_c+imp_c --> ins_c+pi_c
		0.0	;	# 788 NTD2|Pyrimidine Catabolism::ump_c+h2o_c --> uri_c+pi_c
		0.0	;	# 789 NTD4|Pyrimidine Catabolism::cmp_c+h2o_c --> pi_c+cytd_c
		0.0	;	# 790 NTD7e|Nucleotides::h2o_e+amp_e --> pi_e+adn_e
		0.0	;	# 791 NTD9e|Nucleotides::h2o_e+gmp_e --> gsn_e+pi_e
		0.0	;	# 792 NaKt|Transport_ Extracellular::3.0*na1_c+h2o_c+atp_c+2.0*k_e --> 3.0*na1_e+pi_c+h_c+adp_c+2.0*k_c
		0.0	;	# 793 O2St|Transport_ Extracellular::o2s_c --> o2s_e
		0.0	;	# 794 O2St|Transport_ Extracellular_reverse::o2s_e --> o2s_c
		0.0	;	# 795 O2Stm|Transport_ Mitochondrial::o2s_c --> o2s_m
		0.0	;	# 796 O2Stm|Transport_ Mitochondrial_reverse::o2s_m --> o2s_c
		0.0	;	# 797 O2Stx|Transport_ Peroxisomal::o2s_c --> o2s_x
		0.0	;	# 798 O2Stx|Transport_ Peroxisomal_reverse::o2s_x --> o2s_c
		0.0	;	# 799 O2t|Transport_ Extracellular::o2_e --> o2_c
		0.0	;	# 800 O2t|Transport_ Extracellular_reverse::o2_c --> o2_e
		0.0	;	# 801 O2ter|Transport_ Endoplasmic Reticular::o2_c --> o2_r
		0.0	;	# 802 O2ter|Transport_ Endoplasmic Reticular_reverse::o2_r --> o2_c
		0.0	;	# 803 O2tm|Transport_ Mitochondrial::o2_c --> o2_m
		0.0	;	# 804 O2tm|Transport_ Mitochondrial_reverse::o2_m --> o2_c
		0.0	;	# 805 OCBTm|Urea cycle/amino group metabolism::cbp_m+orn_m --> pi_m+citr_L_m+h_m
		0.0	;	# 806 OCDCAtr|Transport_ Extracellular::ocdca_e --> ocdca_c
		0.0	;	# 807 OCDCAtr|Transport_ Extracellular_reverse::ocdca_c --> ocdca_e
		0.0	;	# 808 OCDCEAtr|Transport_ Extracellular::ocdcea_e --> ocdcea_c
		0.0	;	# 809 OCDCEAtr|Transport_ Extracellular_reverse::ocdcea_c --> ocdcea_e
		0.0	;	# 810 OCOAT1m|Valine_ Leucine_ and Isoleucine Metabolism::acac_m+succoa_m --> succ_m+aacoa_m
		0.0	;	# 811 OCOAT1m|Valine_ Leucine_ and Isoleucine Metabolism_reverse::succ_m+aacoa_m --> acac_m+succoa_m
		0.0	;	# 812 OIVD1m|Valine_ Leucine_ and Isoleucine Metabolism::4mop_m+coa_m+nad_m --> nadh_m+ivcoa_m+co2_m
		0.0	;	# 813 OIVD2m|Valine_ Leucine_ and Isoleucine Metabolism::coa_m+nad_m+3mob_m --> nadh_m+ibcoa_m+co2_m
		0.0	;	# 814 OIVD3m|Valine_ Leucine_ and Isoleucine Metabolism::coa_m+nad_m+3mop_m --> nadh_m+co2_m+2mbcoa_m
		0.0	;	# 815 OPAHir|Glutathione Metabolism::2.0*h2o_c+5oxpro_c+atp_c --> pi_c+h_c+glu_L_c+adp_c
		0.0	;	# 816 ORNTArm|Urea cycle/amino group metabolism::akg_m+orn_m --> glu_L_m+glu5sa_m
		0.0	;	# 817 ORNTArm|Urea cycle/amino group metabolism_reverse::glu_L_m+glu5sa_m --> akg_m+orn_m
		0.0	;	# 818 ORNt3m|Transport_ Mitochondrial::h_c+orn_m --> h_m+orn_c
		0.0	;	# 819 ORNt3m|Transport_ Mitochondrial_reverse::h_m+orn_c --> h_c+orn_m
		0.0	;	# 820 ORNt4m|Transport_ Mitochondrial::citr_L_c+h_c+orn_m --> citr_L_m+h_m+orn_c
		0.0	;	# 821 ORNt4m|Transport_ Mitochondrial_reverse::citr_L_m+h_m+orn_c --> citr_L_c+h_c+orn_m
		0.0	;	# 822 ORNtiDF|Transport_ Extracellular::orn_e --> orn_c
		0.0	;	# 823 P5CRm|Proline Metabolism::1pyr5c_m+2.0*h_m+nadph_m --> pro_L_m+nadp_m
		0.0	;	# 824 P5CRxm|Proline Metabolism::nadh_m+1pyr5c_m+2.0*h_m --> pro_L_m+nad_m
		0.0	;	# 825 PACCOAL|Phenylalanine metabolism::pac_c+coa_c+atp_c --> phaccoa_c+ppi_c+amp_c
		0.0	;	# 826 PDE1|Nucleotides::h2o_c+camp_c --> h_c+amp_c
		0.0	;	# 827 PDE4|Nucleotides::35cgmp_c+h2o_c --> h_c+gmp_c
		0.0	;	# 828 PDHm|Glycolysis/Gluconeogenesis::coa_m+nad_m+pyr_m --> nadh_m+accoa_m+co2_m
		0.0	;	# 829 PEAMNO|Phenylalanine metabolism::o2_c+h2o_c+peamn_c --> h2o2_c+nh4_c+pacald_c
		0.0	;	# 830 PFK|Glycolysis/Gluconeogenesis::f6p_c+atp_c --> h_c+adp_c+fdp_c
		0.0	;	# 831 PFK26|Fructose and Mannose Metabolism::f6p_c+atp_c --> h_c+adp_c+f26bp_c
		0.0	;	# 832 PGDI|Eicosanoid Metabolism::prostgh2_c --> prostgd2_c
		0.0	;	# 833 PGDI|Eicosanoid Metabolism_reverse::prostgd2_c --> prostgh2_c
		0.0	;	# 834 PGI|Glycolysis/Gluconeogenesis::g6p_c --> f6p_c
		0.0	;	# 835 PGI|Glycolysis/Gluconeogenesis_reverse::f6p_c --> g6p_c
		0.0	;	# 836 PGK|Glycolysis/Gluconeogenesis::atp_c+3pg_c --> 13dpg_c+adp_c
		0.0	;	# 837 PGK|Glycolysis/Gluconeogenesis_reverse::13dpg_c+adp_c --> atp_c+3pg_c
		0.0	;	# 838 PGL|Pentose Phosphate Pathway::h2o_c+6pgl_c --> 6pgc_c+h_c
		0.0	;	# 839 PGM|Glycolysis/Gluconeogenesis::2pg_c --> 3pg_c
		0.0	;	# 840 PGM|Glycolysis/Gluconeogenesis_reverse::3pg_c --> 2pg_c
		0.0	;	# 841 PGMT|Glycolysis/Gluconeogenesis::g1p_c --> g6p_c
		0.0	;	# 842 PGMT|Glycolysis/Gluconeogenesis_reverse::g6p_c --> g1p_c
		0.0	;	# 843 PGS|Eicosanoid Metabolism::2.0*o2_c+h_c+arachd_c+nadph_c --> h2o_c+prostgh2_c+nadp_c
		0.0	;	# 844 PGS_COX|Eicosanoid Metabolism::2.0*o2_c+h_c+arachd_c --> prostgg2_c
		0.0	;	# 845 PGS_PO|Eicosanoid Metabolism::prostgg2_c+nadph_c --> h2o_c+prostgh2_c+nadp_c
		0.0	;	# 846 PGSr|Eicosanoid Metabolism::2.0*o2_r+h_r+arachd_r+nadph_r --> h2o_r+nadp_r+prostgh2_r
		0.0	;	# 847 PHACCOAGLNAC|Phenylalanine metabolism::gln_L_c+phaccoa_c --> coa_c+pheacgln_c
		0.0	;	# 848 PHEACGLNt|Transport_ Extracellular::pheacgln_c --> pheacgln_e
		0.0	;	# 849 PHEACGLNt|Transport_ Extracellular_reverse::pheacgln_e --> pheacgln_c
		0.0	;	# 850 PHEMEt|Transport_ Extracellular::pheme_e --> pheme_c
		0.0	;	# 851 PHEMEt|Transport_ Extracellular_reverse::pheme_c --> pheme_e
		0.0	;	# 852 PHEMEtm|Transport_ Mitochondrial::pheme_m --> pheme_c
		0.0	;	# 853 PHEMEtm|Transport_ Mitochondrial_reverse::pheme_c --> pheme_m
		0.0	;	# 854 PHEt4|Transport_ Extracellular::na1_e+phe_L_e --> na1_c+phe_L_c
		0.0	;	# 855 PHEt4|Transport_ Extracellular_reverse::na1_c+phe_L_c --> na1_e+phe_L_e
		0.0	;	# 856 PHEtec|Transport_ Extracellular::phe_L_e --> phe_L_c
		0.0	;	# 857 PHEtec|Transport_ Extracellular_reverse::phe_L_c --> phe_L_e
		0.0	;	# 858 PHYCBOXL|Phenylalanine metabolism::phe_L_c+h_c --> peamn_c+co2_c
		0.0	;	# 859 PIt2m_2|Transport_ Extracellular::pi_c+2.0*h_c --> pi_m+2.0*h_m
		0.0	;	# 860 PIt2m_2|Transport_ Extracellular_reverse::pi_m+2.0*h_m --> pi_c+2.0*h_c
		0.0	;	# 861 PIter|Transport_ Endoplasmic Reticular::pi_r --> pi_c
		0.0	;	# 862 PIter|Transport_ Endoplasmic Reticular_reverse::pi_c --> pi_r
		0.0	;	# 863 PNP|NAD Metabolism::rnam_c+pi_c --> ncam_c+r1p_c+h_c
		0.0	;	# 864 PNP|NAD Metabolism_reverse::ncam_c+r1p_c+h_c --> rnam_c+pi_c
		0.0	;	# 865 PPA|Oxidative Phosphorylation::h2o_c+ppi_c --> 2.0*pi_c+h_c
		0.0	;	# 866 PPBNGS|Heme Biosynthesis::2.0*5aop_c --> 2.0*h2o_c+ppbng_c+h_c
		0.0	;	# 867 PPCOACm|Valine_ Leucine_ and Isoleucine Metabolism::atp_m+hco3_m+ppcoa_m --> pi_m+h_m+adp_m+mmcoa_S_m
		0.0	;	# 868 PPDOx|Pyruvate Metabolism::lald_D_c+nadh_c+h_c --> nad_c+12ppd_R_c
		0.0	;	# 869 PPDOx|Pyruvate Metabolism_reverse::nad_c+12ppd_R_c --> lald_D_c+nadh_c+h_c
		0.0	;	# 870 PPDOy|Pyruvate Metabolism::lald_D_c+h_c+nadph_c --> nadp_c+12ppd_R_c
		0.0	;	# 871 PPM|Pentose Phosphate Pathway::r1p_c --> r5p_c
		0.0	;	# 872 PPM|Pentose Phosphate Pathway_reverse::r5p_c --> r1p_c
		0.0	;	# 873 PPPG9tm|Heme Biosynthesis::pppg9_c --> pppg9_m
		0.0	;	# 874 PPPG9tm|Heme Biosynthesis_reverse::pppg9_m --> pppg9_c
		0.0	;	# 875 PPPGOm|Heme Biosynthesis::3.0*o2_m+2.0*pppg9_m --> 6.0*h2o_m+2.0*ppp9_m
		0.0	;	# 876 PRAGSr|IMP Biosynthesis::pram_c+atp_c+gly_c --> pi_c+gar_c+h_c+adp_c
		0.0	;	# 877 PRAGSr|IMP Biosynthesis_reverse::pi_c+gar_c+h_c+adp_c --> pram_c+atp_c+gly_c
		0.0	;	# 878 PRAIS|IMP Biosynthesis::atp_c+fpram_c --> pi_c+2.0*h_c+adp_c+air_c
		0.0	;	# 879 PRASCS|IMP Biosynthesis::5aizc_c+atp_c+asp_L_c --> pi_c+h_c+adp_c+25aics_c
		0.0	;	# 880 PRASCS|IMP Biosynthesis_reverse::pi_c+h_c+adp_c+25aics_c --> 5aizc_c+atp_c+asp_L_c
		0.0	;	# 881 PRDX|Miscellaneous::h2o2_c+meoh_c --> fald_c+2.0*h2o_c
		0.0	;	# 882 PRFGS|IMP Biosynthesis::gln_L_c+h2o_c+fgam_c+atp_c --> pi_c+h_c+glu_L_c+adp_c+fpram_c
		0.0	;	# 883 PROSTGD2t|Transport_ Extracellular::hco3_c+prostgd2_e --> hco3_e+prostgd2_c
		0.0	;	# 884 PROSTGD2t|Transport_ Extracellular_reverse::hco3_e+prostgd2_c --> hco3_c+prostgd2_e
		0.0	;	# 885 PROt4_2r|Transport_ Extracellular::2.0*na1_e+pro_L_e --> 2.0*na1_c+pro_L_c
		0.0	;	# 886 PROt4_2r|Transport_ Extracellular_reverse::2.0*na1_c+pro_L_c --> 2.0*na1_e+pro_L_e
		0.0	;	# 887 PROtm|Transport_ Mitochondrial::pro_L_c --> pro_L_m
		0.0	;	# 888 PROtm|Transport_ Mitochondrial_reverse::pro_L_m --> pro_L_c
		0.0	;	# 889 PRPPS|Pentose Phosphate Pathway::atp_c+r5p_c --> prpp_c+h_c+amp_c
		0.0	;	# 890 PRPPS|Pentose Phosphate Pathway_reverse::prpp_c+h_c+amp_c --> atp_c+r5p_c
		0.0	;	# 891 PUNP1|Nucleotides::adn_c+pi_c --> r1p_c+ade_c
		0.0	;	# 892 PUNP1|Nucleotides_reverse::r1p_c+ade_c --> adn_c+pi_c
		0.0	;	# 893 PUNP2|Purine Catabolism::dad_2_c+pi_c --> 2dr1p_c+ade_c
		0.0	;	# 894 PUNP2|Purine Catabolism_reverse::2dr1p_c+ade_c --> dad_2_c+pi_c
		0.0	;	# 895 PUNP3|Purine Catabolism::pi_c+gsn_c --> gua_c+r1p_c
		0.0	;	# 896 PUNP3|Purine Catabolism_reverse::gua_c+r1p_c --> pi_c+gsn_c
		0.0	;	# 897 PUNP5|Purine Catabolism::ins_c+pi_c --> hxan_c+r1p_c
		0.0	;	# 898 PUNP5|Purine Catabolism_reverse::hxan_c+r1p_c --> ins_c+pi_c
		0.0	;	# 899 PUNP6|Purine Catabolism::pi_c+din_c --> hxan_c+2dr1p_c
		0.0	;	# 900 PUNP6|Purine Catabolism_reverse::hxan_c+2dr1p_c --> pi_c+din_c
		0.0	;	# 901 PUNP7|Nucleotides::xtsn_c+pi_c --> r1p_c+xan_c
		0.0	;	# 902 PUNP7|Nucleotides_reverse::r1p_c+xan_c --> xtsn_c+pi_c
		0.0	;	# 903 PYK|Glycolysis/Gluconeogenesis::pep_c+h_c+adp_c --> pyr_c+atp_c
		0.0	;	# 904 PYNP2r|Pyrimidine Catabolism::uri_c+pi_c --> ura_c+r1p_c
		0.0	;	# 905 PYNP2r|Pyrimidine Catabolism_reverse::ura_c+r1p_c --> uri_c+pi_c
		0.0	;	# 906 PYRt2r|Transport_ Extracellular::pyr_e+h_e --> pyr_c+h_c
		0.0	;	# 907 PYRt2r|Transport_ Extracellular_reverse::pyr_c+h_c --> pyr_e+h_e
		0.0	;	# 908 RNMK|NAD Metabolism::rnam_c+atp_c --> nmn_c+h_c+adp_c
		0.0	;	# 909 RPI|Pentose Phosphate Pathway::r5p_c --> ru5p_D_c
		0.0	;	# 910 RPI|Pentose Phosphate Pathway_reverse::ru5p_D_c --> r5p_c
		0.0	;	# 911 SACCD3m|Lysine Metabolism::lys_L_m+h_m+akg_m+nadph_m --> h2o_m+nadp_m+saccrp_L_m
		0.0	;	# 912 SACCD4m|Lysine Metabolism::h2o_m+nadp_m+saccrp_L_m --> L2aadp6sa_m+glu_L_m+h_m+nadph_m
		0.0	;	# 913 SADT|Nucleotides::so4_c+atp_c+h_c --> ppi_c+aps_c
		0.0	;	# 914 SARDHm|Urea cycle/amino group metabolism::fad_m+sarcs_m+thf_m --> mlthf_m+gly_m+fadh2_m
		0.0	;	# 915 SBTD_D2|Fructose and Mannose Metabolism::nad_c+sbt_D_c --> nadh_c+fru_c+h_c
		0.0	;	# 916 SBTR|Fructose and Mannose Metabolism::glc_D_c+h_c+nadph_c --> nadp_c+sbt_D_c
		0.0	;	# 917 SERGLNexR|Transport_ Extracellular::gln_L_c+ser_L_e --> gln_L_e+ser_L_c
		0.0	;	# 918 SERGLNexR|Transport_ Extracellular_reverse::gln_L_e+ser_L_c --> gln_L_c+ser_L_e
		0.0	;	# 919 SFGTH|Tyrosine metabolism::h2o_c+Sfglutth_c --> for_c+h_c+gthrd_c
		0.0	;	# 920 SFGTH|Tyrosine metabolism_reverse::for_c+h_c+gthrd_c --> h2o_c+Sfglutth_c
		0.0	;	# 921 SMPD4|Sphingolipid Metabolism::h2o_c+spc_hs_c --> sphings_c+cholp_c+h_c
		0.0	;	# 922 SO4CLtex2|Transport_ Extracellular::2.0*so4_e+cl_c --> 2.0*so4_c+cl_e
		0.0	;	# 923 SO4CLtex2|Transport_ Extracellular_reverse::2.0*so4_c+cl_e --> 2.0*so4_e+cl_c
		0.0	;	# 924 SO4HCOtex|Transport_ Extracellular::so4_e+2.0*hco3_c --> so4_c+2.0*hco3_e
		0.0	;	# 925 SO4HCOtex|Transport_ Extracellular_reverse::so4_c+2.0*hco3_e --> so4_e+2.0*hco3_c
		0.0	;	# 926 SO4t4_2|Transport_ Extracellular::2.0*na1_e+so4_e --> 2.0*na1_c+so4_c
		0.0	;	# 927 SO4t4_2|Transport_ Extracellular_reverse::2.0*na1_c+so4_c --> 2.0*na1_e+so4_e
		0.0	;	# 928 SO4t4_3|Transport_ Extracellular::3.0*na1_e+so4_e --> 3.0*na1_c+so4_c
		0.0	;	# 929 SO4t4_3|Transport_ Extracellular_reverse::3.0*na1_c+so4_c --> 3.0*na1_e+so4_e
		0.0	;	# 930 SPC_HSt|Transport_ Extracellular::spc_hs_c --> spc_hs_e
		0.0	;	# 931 SPC_HSt|Transport_ Extracellular_reverse::spc_hs_e --> spc_hs_c
		0.0	;	# 932 SPHK21c|Sphingolipid Metabolism::sphings_c+atp_c --> h_c+adp_c+sphs1p_c
		0.0	;	# 933 SPHS1Pte|Transport_ Extracellular::sphs1p_c --> sphs1p_e
		0.0	;	# 934 SPHS1Pte|Transport_ Extracellular_reverse::sphs1p_e --> sphs1p_c
		0.0	;	# 935 SPODM|ROS Detoxification::2.0*o2s_c+2.0*h_c --> o2_c+h2o2_c
		0.0	;	# 936 SPODMm|ROS Detoxification::2.0*o2s_m+2.0*h_m --> o2_m+h2o2_m
		0.0	;	# 937 SPODMx|ROS Detoxification::2.0*o2s_x+2.0*h_x --> o2_x+h2o2_x
		0.0	;	# 938 SRTNt6_2r|Transport_ Extracellular::2.0*na1_e+srtn_e+2.0*k_c --> 2.0*na1_c+srtn_c+2.0*k_e
		0.0	;	# 939 SRTNt6_2r|Transport_ Extracellular_reverse::2.0*na1_c+srtn_c+2.0*k_e --> 2.0*na1_e+srtn_e+2.0*k_c
		0.0	;	# 940 SSALxm|Glutamate metabolism::h2o_m+nad_m+sucsal_m --> nadh_m+2.0*h_m+succ_m
		0.0	;	# 941 STS2|Steroid Metabolism::h2o_c+estrones_c --> so4_c+estrone_c+h_c
		0.0	;	# 942 SUCCt2m|Transport_ Mitochondrial::pi_m+succ_c --> pi_c+succ_m
		0.0	;	# 943 SUCCt2m|Transport_ Mitochondrial_reverse::pi_c+succ_m --> pi_m+succ_c
		0.0	;	# 944 SUCCt4_2|Transport_ Extracellular::2.0*na1_e+succ_e --> 2.0*na1_c+succ_c
		0.0	;	# 945 SUCCt4_2|Transport_ Extracellular_reverse::2.0*na1_c+succ_c --> 2.0*na1_e+succ_e
		0.0	;	# 946 SUCCt4_3|Transport_ Extracellular::3.0*na1_e+succ_e --> 3.0*na1_c+succ_c
		0.0	;	# 947 SUCCt4_3|Transport_ Extracellular_reverse::3.0*na1_c+succ_c --> 3.0*na1_e+succ_e
		0.0	;	# 948 SUCD1m|Citric Acid Cycle::fad_m+succ_m --> fadh2_m+fum_m
		0.0	;	# 949 SUCD1m|Citric Acid Cycle_reverse::fadh2_m+fum_m --> fad_m+succ_m
		0.0	;	# 950 SUCOAS1m|Citric Acid Cycle::gtp_m+coa_m+succ_m --> gdp_m+pi_m+succoa_m
		0.0	;	# 951 SUCOAS1m|Citric Acid Cycle_reverse::gdp_m+pi_m+succoa_m --> gtp_m+coa_m+succ_m
		0.0	;	# 952 SULFOX|Cysteine Metabolism::h2o_c+so3_c+2.0*ficytC_m --> so4_c+2.0*focytC_m+2.0*h_c
		0.0	;	# 953 TALA|Pentose Phosphate Pathway::s7p_c+g3p_c --> f6p_c+e4p_c
		0.0	;	# 954 TALA|Pentose Phosphate Pathway_reverse::f6p_c+e4p_c --> s7p_c+g3p_c
		0.0	;	# 955 TCYNTt|Transport_ Extracellular::tcynt_c --> tcynt_e
		0.0	;	# 956 TCYNTtm|Transport_ Mitochondrial::tcynt_m --> tcynt_c
		0.0	;	# 957 THBPT4ACAMDASE|Tetrahydrobiopterin::thbpt4acam_c --> h2o_c+dhbpt_c
		0.0	;	# 958 THFtm|Transport_ Mitochondrial::thf_c --> thf_m
		0.0	;	# 959 THFtm|Transport_ Mitochondrial_reverse::thf_m --> thf_c
		0.0	;	# 960 THMDt4|Transport_ Extracellular::na1_e+thymd_e --> na1_c+thymd_c
		0.0	;	# 961 THMDt5|Transport_ Extracellular::2.0*na1_e+thymd_e --> 2.0*na1_c+thymd_c
		0.0	;	# 962 THYMDt1|Transport_ Extracellular::thymd_e --> thymd_c
		0.0	;	# 963 THYMt|Transport_ Extracellular::thym_e --> thym_c
		0.0	;	# 964 THYMt|Transport_ Extracellular_reverse::thym_c --> thym_e
		0.0	;	# 965 TKT1|Pentose Phosphate Pathway::xu5p_D_c+r5p_c --> s7p_c+g3p_c
		0.0	;	# 966 TKT1|Pentose Phosphate Pathway_reverse::s7p_c+g3p_c --> xu5p_D_c+r5p_c
		0.0	;	# 967 TKT2|Pentose Phosphate Pathway::xu5p_D_c+e4p_c --> f6p_c+g3p_c
		0.0	;	# 968 TKT2|Pentose Phosphate Pathway_reverse::f6p_c+g3p_c --> xu5p_D_c+e4p_c
		0.0	;	# 969 TMDPP|Pyrimidine Catabolism::thymd_c+pi_c --> 2dr1p_c+thym_c
		0.0	;	# 970 TMDPP|Pyrimidine Catabolism_reverse::2dr1p_c+thym_c --> thymd_c+pi_c
		0.0	;	# 971 TPI|Glycolysis/Gluconeogenesis::dhap_c --> g3p_c
		0.0	;	# 972 TPI|Glycolysis/Gluconeogenesis_reverse::g3p_c --> dhap_c
		0.0	;	# 973 TRIOK|Fructose and Mannose Metabolism::atp_c+glyald_c --> h_c+adp_c+g3p_c
		0.0	;	# 974 TRPHYDRO2|Tryptophan metabolism::trp_L_c+o2_c+thbpt_c --> 5htrp_c+thbpt4acam_c
		0.0	;	# 975 TRPt|Transport_ Extracellular::trp_L_e --> trp_L_c
		0.0	;	# 976 TRPt|Transport_ Extracellular_reverse::trp_L_c --> trp_L_e
		0.0	;	# 977 TRPt4|Transport_ Extracellular::trp_L_e+na1_e --> trp_L_c+na1_c
		0.0	;	# 978 TRPt4|Transport_ Extracellular_reverse::trp_L_c+na1_c --> trp_L_e+na1_e
		0.0	;	# 979 TRYPTAOX|Tryptophan metabolism::o2_c+h2o_c+trypta_c --> h2o2_c+nh4_c+id3acald_c
		0.0	;	# 980 TSULt4_3|Transport_ Extracellular::3.0*na1_e+tsul_e --> 3.0*na1_c+tsul_c
		0.0	;	# 981 TSULt4_3|Transport_ Extracellular_reverse::3.0*na1_c+tsul_c --> 3.0*na1_e+tsul_e
		0.0	;	# 982 TXA2te|Transport_ Extracellular::txa2_e --> txa2_c
		0.0	;	# 983 TXA2te|Transport_ Extracellular_reverse::txa2_c --> txa2_e
		0.0	;	# 984 TXA2tr|Transport_ Endoplasmic Reticular::txa2_c --> txa2_r
		0.0	;	# 985 TXA2tr|Transport_ Endoplasmic Reticular_reverse::txa2_r --> txa2_c
		0.0	;	# 986 TXASr|Eicosanoid Metabolism::prostgh2_r --> txa2_r
		0.0	;	# 987 TXBS|Eicosanoid Metabolism::txa2_c+h2o_c+h_c --> txb2_c
		0.0	;	# 988 TYMSFt|Transport_ Extracellular::tymsf_c --> tymsf_e
		0.0	;	# 989 TYMSULT|Tyrosine metabolism::paps_c+tym_c --> pap_c+tymsf_c+h_c
		0.0	;	# 990 TYR3MO2|Tyrosine metabolism::o2_c+thbpt_c+tyr_L_c --> thbpt4acam_c+34dhphe_c
		0.0	;	# 991 TYRCBOX|Tyrosine metabolism::tyr_L_c+h_c --> tym_c+co2_c
		0.0	;	# 992 TYRDOPO|Tyrosine metabolism::o2_c+2.0*tyr_L_c --> 2.0*34dhphe_c
		0.0	;	# 993 TYROXDAc|Tyrosine metabolism::o2_c+h2o_c+tym_c --> h2o2_c+nh4_c+4hoxpacd_c
		0.0	;	# 994 TYRTA|Tyrosine metabolism::tyr_L_c+akg_c --> 34hpp_c+glu_L_c
		0.0	;	# 995 TYRTA|Tyrosine metabolism_reverse::34hpp_c+glu_L_c --> tyr_L_c+akg_c
		0.0	;	# 996 TYRt|Transport_ Extracellular::tyr_L_e --> tyr_L_c
		0.0	;	# 997 TYRt|Transport_ Extracellular_reverse::tyr_L_c --> tyr_L_e
		0.0	;	# 998 TYRt4|Transport_ Extracellular::na1_e+tyr_L_e --> na1_c+tyr_L_c
		0.0	;	# 999 TYRt4|Transport_ Extracellular_reverse::na1_c+tyr_L_c --> na1_e+tyr_L_e
		0.0	;	# 1000 UDPG4E|Galactose metabolism::udpg_c --> udpgal_c
		0.0	;	# 1001 UDPG4E|Galactose metabolism_reverse::udpgal_c --> udpg_c
		0.0	;	# 1002 UGLT|Galactose metabolism::gal1p_c+udpg_c --> udpgal_c+g1p_c
		0.0	;	# 1003 UGLT|Galactose metabolism_reverse::udpgal_c+g1p_c --> gal1p_c+udpg_c
		0.0	;	# 1004 UMPK|Nucleotides::ump_c+atp_c --> udp_c+adp_c
		0.0	;	# 1005 UMPK|Nucleotides_reverse::udp_c+adp_c --> ump_c+atp_c
		0.0	;	# 1006 UMPK2|Nucleotides::ump_c+ctp_c --> cdp_c+udp_c
		0.0	;	# 1007 UMPK2|Nucleotides_reverse::cdp_c+udp_c --> ump_c+ctp_c
		0.0	;	# 1008 UMPK3|Nucleotides::ump_c+utp_c --> 2.0*udp_c
		0.0	;	# 1009 UMPK3|Nucleotides_reverse::2.0*udp_c --> ump_c+utp_c
		0.0	;	# 1010 UMPK4|Nucleotides::ump_c+gtp_c --> gdp_c+udp_c
		0.0	;	# 1011 UMPK4|Nucleotides_reverse::gdp_c+udp_c --> ump_c+gtp_c
		0.0	;	# 1012 UPP3S|Heme Biosynthesis::hmbil_c --> h2o_c+uppg3_c
		0.0	;	# 1013 UPPDC1|Heme Biosynthesis::uppg3_c+4.0*h_c --> 4.0*co2_c+cpppg3_c
		0.0	;	# 1014 UPPN|Pyrimidine Catabolism::h2o_c+2.0*h_c+cala_c --> ala_B_c+nh4_c+co2_c
		0.0	;	# 1015 URATEt|Transport_ Extracellular::urate_c --> urate_e
		0.0	;	# 1016 URATEt|Transport_ Extracellular_reverse::urate_e --> urate_c
		0.0	;	# 1017 URATEtx|Transport_ Peroxisomal::urate_x --> urate_c
		0.0	;	# 1018 URATEtx|Transport_ Peroxisomal_reverse::urate_c --> urate_x
		0.0	;	# 1019 URAt|Transport_ Extracellular::ura_e --> ura_c
		0.0	;	# 1020 URAt|Transport_ Extracellular_reverse::ura_c --> ura_e
		0.0	;	# 1021 UREAt|Transport_ Extracellular::urea_e --> urea_c
		0.0	;	# 1022 UREAt|Transport_ Extracellular_reverse::urea_c --> urea_e
		0.0	;	# 1023 UREAt5|Transport_ Extracellular::urea_e+h2o_e --> urea_c+h2o_c
		0.0	;	# 1024 UREAt5|Transport_ Extracellular_reverse::urea_c+h2o_c --> urea_e+h2o_e
		0.0	;	# 1025 URIK1|Pyrimidine Biosynthesis::uri_c+atp_c --> ump_c+h_c+adp_c
		0.0	;	# 1026 URIt|Transport_ Extracellular::uri_e --> uri_c
		0.0	;	# 1027 URIt|Transport_ Extracellular_reverse::uri_c --> uri_e
		0.0	;	# 1028 URIt4|Transport_ Extracellular::uri_e+na1_e --> uri_c+na1_c
		0.0	;	# 1029 URIt4|Transport_ Extracellular_reverse::uri_c+na1_c --> uri_e+na1_e
		0.0	;	# 1030 URIt5|Transport_ Extracellular::uri_e+2.0*na1_e --> uri_c+2.0*na1_c
		0.0	;	# 1031 URIt5|Transport_ Extracellular_reverse::uri_c+2.0*na1_c --> uri_e+2.0*na1_e
		0.0	;	# 1032 VALTA|Valine_ Leucine_ and Isoleucine Metabolism::val_L_c+akg_c --> 3mob_c+glu_L_c
		0.0	;	# 1033 VALTA|Valine_ Leucine_ and Isoleucine Metabolism_reverse::3mob_c+glu_L_c --> val_L_c+akg_c
		0.0	;	# 1034 VALt4|Transport_ Extracellular::val_L_e+na1_e --> val_L_c+na1_c
		0.0	;	# 1035 VALt4|Transport_ Extracellular_reverse::val_L_c+na1_c --> val_L_e+na1_e
		0.0	;	# 1036 VALtec|Transport_ Extracellular::val_L_e --> val_L_c
		0.0	;	# 1037 VALtec|Transport_ Extracellular_reverse::val_L_c --> val_L_e
		0.0	;	# 1038 XANtx|Transport_ Peroxisomal::xan_c --> xan_x
		0.0	;	# 1039 XANtx|Transport_ Peroxisomal_reverse::xan_x --> xan_c
		0.0	;	# 1040 XAOx|Purine Catabolism::o2_x+h2o_x+xan_x --> h2o2_x+urate_x
		0.0	;	# 1041 XAOx|Purine Catabolism_reverse::h2o2_x+urate_x --> o2_x+h2o_x+xan_x
		0.0	;	# 1042 XYLK|Pentose and Glucuronate Interconversions::atp_c+xylu_D_c --> xu5p_D_c+h_c+adp_c
		0.0	;	# 1043 XYLTD_Dr|Pentose and Glucuronate Interconversions::xylt_c+nad_c --> nadh_c+h_c+xylu_D_c
		0.0	;	# 1044 XYLTD_Dr|Pentose and Glucuronate Interconversions_reverse::nadh_c+h_c+xylu_D_c --> xylt_c+nad_c
		0.0	;	# 1045 XYLUR|Pentose and Glucuronate Interconversions::h_c+nadph_c+xylu_L_c --> nadp_c+xylt_c
		0.0	;	# 1046 XYLUR|Pentose and Glucuronate Interconversions_reverse::nadp_c+xylt_c --> h_c+nadph_c+xylu_L_c
		0.0	;	# 1047 sink_etha|Intracellular Constraint::etha_c --> []
		0.0	;	# 1048 sink_etha|Intracellular Constraint_reverse::[] --> etha_c
		0.0	;	# 1049 EX_3mob_e|Extracellular exchange::3mob_c --> []
		0.0	;	# 1050 EX_3mob_e|Extracellular exchange_reverse::[] --> 3mob_c
		0.0	;	# 1051 EX_5oxpro_e|Extracellular exchange::5oxpro_c --> []
		0.0	;	# 1052 EX_5oxpro_e|Extracellular exchange_reverse::[] --> 5oxpro_c
		0.0	;	# 1053 EX_acrn_e|Extracellular exchange::acrn_c --> []
		0.0	;	# 1054 EX_acrn_e|Extracellular exchange_reverse::[] --> acrn_c
		0.0	;	# 1055 EX_ahcys_e|Extracellular exchange::ahcys_c --> []
		0.0	;	# 1056 EX_ahcys_e|Extracellular exchange_reverse::[] --> ahcys_c
		0.0	;	# 1057 EX_cdpea_e|Extracellular exchange::cdpea_c --> []
		0.0	;	# 1058 EX_cdpea_e|Extracellular exchange_reverse::[] --> cdpea_c
		0.0	;	# 1059 EX_cholp_e|Extracellular exchange::cholp_c --> []
		0.0	;	# 1060 EX_cholp_e|Extracellular exchange_reverse::[] --> cholp_c
		0.0	;	# 1061 EX_citr_L_e|Extracellular exchange::citr_L_c --> []
		0.0	;	# 1062 EX_citr_L_e|Extracellular exchange_reverse::[] --> citr_L_c
		0.0	;	# 1063 EX_fum_e|Extracellular exchange::fum_c --> []
		0.0	;	# 1064 EX_fum_e|Extracellular exchange_reverse::[] --> fum_c
		0.0	;	# 1065 EX_pmtcrn_e|Extracellular exchange::pmtcrn_c --> []
		0.0	;	# 1066 EX_pmtcrn_e|Extracellular exchange_reverse::[] --> pmtcrn_c
		0.0	;	# 1067 GPAM_hs_16_0|Expanded DAG metabolism::glyc3p_c+pmtcoa_c --> coa_c+alpha_hs_16_0_c
		0.0	;	# 1068 LPS3_hs_16_0|Expanded DAG metabolism::h2o_c+mag_hs_16_0_c --> glyc_c+hdca_c+h_c
		0.0	;	# 1069 LPASE_16_0|Expanded Phospholipid metabolism::h2o_c+lpchol_hs_16_0_c --> hdca_c+h_c+g3pc_c
		0.0	;	# 1070 GPAM_hs_18_0|Expanded DAG metabolism::glyc3p_c+stcoa_c --> coa_c+alpha_hs_18_0_c
		0.0	;	# 1071 LPS3_hs_18_0|Expanded DAG metabolism::h2o_c+mag_hs_18_0_c --> glyc_c+h_c+ocdca_c
		0.0	;	# 1072 LPASE_18_0|Expanded Phospholipid metabolism::h2o_c+lpchol_hs_18_0_c --> h_c+ocdca_c+g3pc_c
		0.0	;	# 1073 GPAM_hs_18_1|Expanded DAG metabolism::glyc3p_c+odecoa_c --> coa_c+alpha_hs_18_1_c
		0.0	;	# 1074 LPS3_hs_18_1|Expanded DAG metabolism::h2o_c+mag_hs_18_1_c --> ocdcea_c+glyc_c+h_c
		0.0	;	# 1075 LPASE_18_1|Expanded Phospholipid metabolism::h2o_c+lpchol_hs_18_1_c --> ocdcea_c+h_c+g3pc_c
		0.0	;	# 1076 GPAM_hs_18_2|Expanded DAG metabolism::glyc3p_c+lnlccoa_c --> coa_c+alpha_hs_18_2_c
		0.0	;	# 1077 LPS3_hs_18_2|Expanded DAG metabolism::h2o_c+mag_hs_18_2_c --> glyc_c+lnlc_c+h_c
		0.0	;	# 1078 LPASE_18_2|Expanded Phospholipid metabolism::h2o_c+lpchol_hs_18_2_c --> lnlc_c+h_c+g3pc_c
		0.0	;	# 1079 GPAM_hs_20_4|Expanded DAG metabolism::glyc3p_c+arachdcoa_c --> coa_c+alpha_hs_20_4_c
		0.0	;	# 1080 LPS3_hs_20_4|Expanded DAG metabolism::h2o_c+mag_hs_20_4_c --> glyc_c+h_c+arachd_c
		0.0	;	# 1081 LPASE_20_4|Expanded Phospholipid metabolism::h2o_c+lpchol_hs_20_4_c --> h_c+arachd_c+g3pc_c
		0.0	;	# 1082 AGPAT1_16_0_16_0|Expanded DAG metabolism::pmtcoa_c+alpha_hs_16_0_c --> coa_c+pa_hs_16_0_16_0_c
		0.0	;	# 1083 PPAP_16_0_16_0|Expanded DAG metabolism::h2o_c+pa_hs_16_0_16_0_c --> dag_hs_16_0_16_0_c+pi_c
		0.0	;	# 1084 CEPTE_16_0_16_0|Expanded Phospholipid metabolism::dag_hs_16_0_16_0_c+cdpea_c --> cmp_c+pe_hs_16_0_16_0_c+h_c
		0.0	;	# 1085 PSSA2_hs_16_0_16_0|Expanded Phospholipid metabolism::ser_L_c+pe_hs_16_0_16_0_c --> ps_hs_16_0_16_0_c+etha_c
		0.0	;	# 1086 PSSA2_hs_16_0_16_0|Expanded Phospholipid metabolism_reverse::ps_hs_16_0_16_0_c+etha_c --> ser_L_c+pe_hs_16_0_16_0_c
		0.0	;	# 1087 PSSA1_hs_16_0_16_0|Expanded Phospholipid metabolism::chol_c+ps_hs_16_0_16_0_c --> ser_L_c+pchol_hs_16_0_16_0_c
		0.0	;	# 1088 PSSA1_hs_16_0_16_0|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_16_0_16_0_c --> chol_c+ps_hs_16_0_16_0_c
		0.0	;	# 1089 CEPTC_16_0_16_0|Expanded Phospholipid metabolism::dag_hs_16_0_16_0_c+cdpchol_c --> cmp_c+h_c+pchol_hs_16_0_16_0_c
		0.0	;	# 1090 PLA2_2_16_0_16_0|Expanded Phospholipid metabolism::h2o_c+pchol_hs_16_0_16_0_c --> lpchol_hs_16_0_c+hdca_c+h_c
		0.0	;	# 1091 DAGK_hs_16_0_16_0|Expanded DAG metabolism::pa_hs_16_0_16_0_c+h_c+adp_c --> dag_hs_16_0_16_0_c+atp_c
		0.0	;	# 1092 DAGK_hs_16_0_16_0|Expanded DAG metabolism_reverse::dag_hs_16_0_16_0_c+atp_c --> pa_hs_16_0_16_0_c+h_c+adp_c
		0.0	;	# 1093 LPS2_16_0_16_0|Expanded DAG metabolism::h2o_c+dag_hs_16_0_16_0_c --> hdca_c+mag_hs_16_0_c+h_c
		0.0	;	# 1094 CDS_16_0_16_0|Expanded Glycerophospholipid metabolism::ctp_c+pa_hs_16_0_16_0_c+h_c --> ppi_c+cdpdag_hs_16_0_16_0_c
		0.0	;	# 1095 CDIPTr_16_0_16_0|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_16_0_16_0_c --> cmp_c+h_c+pail_hs_16_0_16_0_c
		0.0	;	# 1096 PIPLC_16_0_16_0|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_16_0_16_0_c --> mi1p_D_c+dag_hs_16_0_16_0_c+h_c
		0.0	;	# 1097 PIK4_16_0_16_0|Expanded Glycerophospholipid metabolism::atp_c+pail_hs_16_0_16_0_c --> pail4p_hs_16_0_16_0_c+h_c+adp_c
		0.0	;	# 1098 PI4PLC_16_0_16_0|Expanded Glycerophospholipid metabolism::pail4p_hs_16_0_16_0_c+h2o_c --> dag_hs_16_0_16_0_c+h_c+mi14p_c
		0.0	;	# 1099 PI4P3K_16_0_16_0|Expanded Glycerophospholipid metabolism::pail4p_hs_16_0_16_0_c+atp_c --> h_c+adp_c+pail34p_hs_16_0_16_0_c
		0.0	;	# 1100 PI34P5K_16_0_16_0|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_16_0_16_0_c --> pail345p_hs_16_0_16_0_c+h_c+adp_c
		0.0	;	# 1101 PI4P5K_16_0_16_0|Expanded Glycerophospholipid metabolism::pail45p_hs_16_0_16_0_c+atp_c --> pail345p_hs_16_0_16_0_c+h_c+adp_c
		0.0	;	# 1102 PI345P3P_16_0_16_0|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_16_0_16_0_c --> pail45p_hs_16_0_16_0_c+pi_c
		0.0	;	# 1103 PI45PLC_16_0_16_0|Expanded Glycerophospholipid metabolism::pail45p_hs_16_0_16_0_c+h2o_c --> dag_hs_16_0_16_0_c+h_c+mi145p_c
		0.0	;	# 1104 AGPAT1_16_0_18_0|Expanded DAG metabolism::stcoa_c+alpha_hs_16_0_c --> pa_hs_16_0_18_0_c+coa_c
		0.0	;	# 1105 PPAP_16_0_18_0|Expanded DAG metabolism::h2o_c+pa_hs_16_0_18_0_c --> pi_c+dag_hs_16_0_18_0_c
		0.0	;	# 1106 CEPTE_16_0_18_0|Expanded Phospholipid metabolism::cdpea_c+dag_hs_16_0_18_0_c --> pe_hs_16_0_18_0_c+cmp_c+h_c
		0.0	;	# 1107 PSSA2_hs_16_0_18_0|Expanded Phospholipid metabolism::pe_hs_16_0_18_0_c+ser_L_c --> etha_c+ps_hs_16_0_18_0_c
		0.0	;	# 1108 PSSA2_hs_16_0_18_0|Expanded Phospholipid metabolism_reverse::etha_c+ps_hs_16_0_18_0_c --> pe_hs_16_0_18_0_c+ser_L_c
		0.0	;	# 1109 PSSA1_hs_16_0_18_0|Expanded Phospholipid metabolism::chol_c+ps_hs_16_0_18_0_c --> ser_L_c+pchol_hs_16_0_18_0_c
		0.0	;	# 1110 PSSA1_hs_16_0_18_0|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_16_0_18_0_c --> chol_c+ps_hs_16_0_18_0_c
		0.0	;	# 1111 CEPTC_16_0_18_0|Expanded Phospholipid metabolism::dag_hs_16_0_18_0_c+cdpchol_c --> cmp_c+pchol_hs_16_0_18_0_c+h_c
		0.0	;	# 1112 PLA2_2_16_0_18_0|Expanded Phospholipid metabolism::h2o_c+pchol_hs_16_0_18_0_c --> lpchol_hs_16_0_c+h_c+ocdca_c
		0.0	;	# 1113 DAGK_hs_16_0_18_0|Expanded DAG metabolism::pa_hs_16_0_18_0_c+h_c+adp_c --> atp_c+dag_hs_16_0_18_0_c
		0.0	;	# 1114 DAGK_hs_16_0_18_0|Expanded DAG metabolism_reverse::atp_c+dag_hs_16_0_18_0_c --> pa_hs_16_0_18_0_c+h_c+adp_c
		0.0	;	# 1115 LPS2_16_0_18_0|Expanded DAG metabolism::h2o_c+dag_hs_16_0_18_0_c --> mag_hs_16_0_c+h_c+ocdca_c
		0.0	;	# 1116 CDS_16_0_18_0|Expanded Glycerophospholipid metabolism::pa_hs_16_0_18_0_c+ctp_c+h_c --> ppi_c+cdpdag_hs_16_0_18_0_c
		0.0	;	# 1117 CDIPTr_16_0_18_0|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_16_0_18_0_c --> cmp_c+pail_hs_16_0_18_0_c+h_c
		0.0	;	# 1118 PIPLC_16_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_16_0_18_0_c --> mi1p_D_c+h_c+dag_hs_16_0_18_0_c
		0.0	;	# 1119 PIK4_16_0_18_0|Expanded Glycerophospholipid metabolism::atp_c+pail_hs_16_0_18_0_c --> h_c+adp_c+pail4p_hs_16_0_18_0_c
		0.0	;	# 1120 PI4PLC_16_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_16_0_18_0_c --> h_c+dag_hs_16_0_18_0_c+mi14p_c
		0.0	;	# 1121 PI4P3K_16_0_18_0|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_16_0_18_0_c --> h_c+pail34p_hs_16_0_18_0_c+adp_c
		0.0	;	# 1122 PI34P5K_16_0_18_0|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_16_0_18_0_c --> pail345p_hs_16_0_18_0_c+h_c+adp_c
		0.0	;	# 1123 PI4P5K_16_0_18_0|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_16_0_18_0_c --> pail345p_hs_16_0_18_0_c+h_c+adp_c
		0.0	;	# 1124 PI345P3P_16_0_18_0|Expanded Glycerophospholipid metabolism::pail345p_hs_16_0_18_0_c+h2o_c --> pi_c+pail45p_hs_16_0_18_0_c
		0.0	;	# 1125 PI45PLC_16_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_16_0_18_0_c --> h_c+dag_hs_16_0_18_0_c+mi145p_c
		0.0	;	# 1126 AGPAT1_16_0_18_1|Expanded DAG metabolism::odecoa_c+alpha_hs_16_0_c --> pa_hs_16_0_18_1_c+coa_c
		0.0	;	# 1127 PPAP_16_0_18_1|Expanded DAG metabolism::pa_hs_16_0_18_1_c+h2o_c --> pi_c+dag_hs_16_0_18_1_c
		0.0	;	# 1128 CEPTE_16_0_18_1|Expanded Phospholipid metabolism::cdpea_c+dag_hs_16_0_18_1_c --> cmp_c+pe_hs_16_0_18_1_c+h_c
		0.0	;	# 1129 PSSA2_hs_16_0_18_1|Expanded Phospholipid metabolism::pe_hs_16_0_18_1_c+ser_L_c --> etha_c+ps_hs_16_0_18_1_c
		0.0	;	# 1130 PSSA2_hs_16_0_18_1|Expanded Phospholipid metabolism_reverse::etha_c+ps_hs_16_0_18_1_c --> pe_hs_16_0_18_1_c+ser_L_c
		0.0	;	# 1131 PSSA1_hs_16_0_18_1|Expanded Phospholipid metabolism::chol_c+ps_hs_16_0_18_1_c --> ser_L_c+pchol_hs_16_0_18_1_c
		0.0	;	# 1132 PSSA1_hs_16_0_18_1|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_16_0_18_1_c --> chol_c+ps_hs_16_0_18_1_c
		0.0	;	# 1133 CEPTC_16_0_18_1|Expanded Phospholipid metabolism::cdpchol_c+dag_hs_16_0_18_1_c --> cmp_c+h_c+pchol_hs_16_0_18_1_c
		0.0	;	# 1134 PLA2_2_16_0_18_1|Expanded Phospholipid metabolism::h2o_c+pchol_hs_16_0_18_1_c --> ocdcea_c+lpchol_hs_16_0_c+h_c
		0.0	;	# 1135 DAGK_hs_16_0_18_1|Expanded DAG metabolism::pa_hs_16_0_18_1_c+h_c+adp_c --> atp_c+dag_hs_16_0_18_1_c
		0.0	;	# 1136 DAGK_hs_16_0_18_1|Expanded DAG metabolism_reverse::atp_c+dag_hs_16_0_18_1_c --> pa_hs_16_0_18_1_c+h_c+adp_c
		0.0	;	# 1137 LPS2_16_0_18_1|Expanded DAG metabolism::h2o_c+dag_hs_16_0_18_1_c --> ocdcea_c+mag_hs_16_0_c+h_c
		0.0	;	# 1138 CDS_16_0_18_1|Expanded Glycerophospholipid metabolism::pa_hs_16_0_18_1_c+ctp_c+h_c --> ppi_c+cdpdag_hs_16_0_18_1_c
		0.0	;	# 1139 CDIPTr_16_0_18_1|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_16_0_18_1_c --> cmp_c+h_c+pail_hs_16_0_18_1_c
		0.0	;	# 1140 PIPLC_16_0_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_16_0_18_1_c --> mi1p_D_c+h_c+dag_hs_16_0_18_1_c
		0.0	;	# 1141 PIK4_16_0_18_1|Expanded Glycerophospholipid metabolism::atp_c+pail_hs_16_0_18_1_c --> pail4p_hs_16_0_18_1_c+h_c+adp_c
		0.0	;	# 1142 PI4PLC_16_0_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_16_0_18_1_c --> h_c+mi14p_c+dag_hs_16_0_18_1_c
		0.0	;	# 1143 PI4P3K_16_0_18_1|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_16_0_18_1_c --> pail34p_hs_16_0_18_1_c+h_c+adp_c
		0.0	;	# 1144 PI34P5K_16_0_18_1|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_16_0_18_1_c --> h_c+adp_c+pail345p_hs_16_0_18_1_c
		0.0	;	# 1145 PI4P5K_16_0_18_1|Expanded Glycerophospholipid metabolism::pail45p_hs_16_0_18_1_c+atp_c --> h_c+adp_c+pail345p_hs_16_0_18_1_c
		0.0	;	# 1146 PI345P3P_16_0_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_16_0_18_1_c --> pail45p_hs_16_0_18_1_c+pi_c
		0.0	;	# 1147 PI45PLC_16_0_18_1|Expanded Glycerophospholipid metabolism::pail45p_hs_16_0_18_1_c+h2o_c --> h_c+mi145p_c+dag_hs_16_0_18_1_c
		0.0	;	# 1148 AGPAT1_16_0_18_2|Expanded DAG metabolism::lnlccoa_c+alpha_hs_16_0_c --> coa_c+pa_hs_16_0_18_2_c
		0.0	;	# 1149 PPAP_16_0_18_2|Expanded DAG metabolism::h2o_c+pa_hs_16_0_18_2_c --> pi_c+dag_hs_16_0_18_2_c
		0.0	;	# 1150 CEPTE_16_0_18_2|Expanded Phospholipid metabolism::cdpea_c+dag_hs_16_0_18_2_c --> pe_hs_16_0_18_2_c+cmp_c+h_c
		0.0	;	# 1151 PSSA2_hs_16_0_18_2|Expanded Phospholipid metabolism::pe_hs_16_0_18_2_c+ser_L_c --> etha_c+ps_hs_16_0_18_2_c
		0.0	;	# 1152 PSSA2_hs_16_0_18_2|Expanded Phospholipid metabolism_reverse::etha_c+ps_hs_16_0_18_2_c --> pe_hs_16_0_18_2_c+ser_L_c
		0.0	;	# 1153 PSSA1_hs_16_0_18_2|Expanded Phospholipid metabolism::chol_c+ps_hs_16_0_18_2_c --> ser_L_c+pchol_hs_16_0_18_2_c
		0.0	;	# 1154 PSSA1_hs_16_0_18_2|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_16_0_18_2_c --> chol_c+ps_hs_16_0_18_2_c
		0.0	;	# 1155 CEPTC_16_0_18_2|Expanded Phospholipid metabolism::dag_hs_16_0_18_2_c+cdpchol_c --> cmp_c+h_c+pchol_hs_16_0_18_2_c
		0.0	;	# 1156 PLA2_2_16_0_18_2|Expanded Phospholipid metabolism::h2o_c+pchol_hs_16_0_18_2_c --> lpchol_hs_16_0_c+lnlc_c+h_c
		0.0	;	# 1157 DAGK_hs_16_0_18_2|Expanded DAG metabolism::h_c+adp_c+pa_hs_16_0_18_2_c --> atp_c+dag_hs_16_0_18_2_c
		0.0	;	# 1158 DAGK_hs_16_0_18_2|Expanded DAG metabolism_reverse::atp_c+dag_hs_16_0_18_2_c --> h_c+adp_c+pa_hs_16_0_18_2_c
		0.0	;	# 1159 LPS2_16_0_18_2|Expanded DAG metabolism::h2o_c+dag_hs_16_0_18_2_c --> lnlc_c+mag_hs_16_0_c+h_c
		0.0	;	# 1160 CDS_16_0_18_2|Expanded Glycerophospholipid metabolism::ctp_c+h_c+pa_hs_16_0_18_2_c --> ppi_c+cdpdag_hs_16_0_18_2_c
		0.0	;	# 1161 CDIPTr_16_0_18_2|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_16_0_18_2_c --> cmp_c+pail_hs_16_0_18_2_c+h_c
		0.0	;	# 1162 PIPLC_16_0_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_16_0_18_2_c --> mi1p_D_c+h_c+dag_hs_16_0_18_2_c
		0.0	;	# 1163 PIK4_16_0_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail_hs_16_0_18_2_c --> h_c+adp_c+pail4p_hs_16_0_18_2_c
		0.0	;	# 1164 PI4PLC_16_0_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_16_0_18_2_c --> h_c+dag_hs_16_0_18_2_c+mi14p_c
		0.0	;	# 1165 PI4P3K_16_0_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_16_0_18_2_c --> h_c+pail34p_hs_16_0_18_2_c+adp_c
		0.0	;	# 1166 PI34P5K_16_0_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_16_0_18_2_c --> pail345p_hs_16_0_18_2_c+h_c+adp_c
		0.0	;	# 1167 PI4P5K_16_0_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_16_0_18_2_c --> pail345p_hs_16_0_18_2_c+h_c+adp_c
		0.0	;	# 1168 PI345P3P_16_0_18_2|Expanded Glycerophospholipid metabolism::pail345p_hs_16_0_18_2_c+h2o_c --> pi_c+pail45p_hs_16_0_18_2_c
		0.0	;	# 1169 PI45PLC_16_0_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_16_0_18_2_c --> h_c+dag_hs_16_0_18_2_c+mi145p_c
		0.0	;	# 1170 AGPAT1_16_0_20_4|Expanded DAG metabolism::arachdcoa_c+alpha_hs_16_0_c --> pa_hs_16_0_20_4_c+coa_c
		0.0	;	# 1171 PPAP_16_0_20_4|Expanded DAG metabolism::pa_hs_16_0_20_4_c+h2o_c --> dag_hs_16_0_20_4_c+pi_c
		0.0	;	# 1172 CEPTE_16_0_20_4|Expanded Phospholipid metabolism::cdpea_c+dag_hs_16_0_20_4_c --> cmp_c+h_c+pe_hs_16_0_20_4_c
		0.0	;	# 1173 PSSA2_hs_16_0_20_4|Expanded Phospholipid metabolism::ser_L_c+pe_hs_16_0_20_4_c --> ps_hs_16_0_20_4_c+etha_c
		0.0	;	# 1174 PSSA2_hs_16_0_20_4|Expanded Phospholipid metabolism_reverse::ps_hs_16_0_20_4_c+etha_c --> ser_L_c+pe_hs_16_0_20_4_c
		0.0	;	# 1175 PSSA1_hs_16_0_20_4|Expanded Phospholipid metabolism::ps_hs_16_0_20_4_c+chol_c --> pchol_hs_16_0_20_4_c+ser_L_c
		0.0	;	# 1176 PSSA1_hs_16_0_20_4|Expanded Phospholipid metabolism_reverse::pchol_hs_16_0_20_4_c+ser_L_c --> ps_hs_16_0_20_4_c+chol_c
		0.0	;	# 1177 CEPTC_16_0_20_4|Expanded Phospholipid metabolism::dag_hs_16_0_20_4_c+cdpchol_c --> cmp_c+pchol_hs_16_0_20_4_c+h_c
		0.0	;	# 1178 PLA2_2_16_0_20_4|Expanded Phospholipid metabolism::h2o_c+pchol_hs_16_0_20_4_c --> lpchol_hs_16_0_c+h_c+arachd_c
		0.0	;	# 1179 DAGK_hs_16_0_20_4|Expanded DAG metabolism::pa_hs_16_0_20_4_c+h_c+adp_c --> atp_c+dag_hs_16_0_20_4_c
		0.0	;	# 1180 DAGK_hs_16_0_20_4|Expanded DAG metabolism_reverse::atp_c+dag_hs_16_0_20_4_c --> pa_hs_16_0_20_4_c+h_c+adp_c
		0.0	;	# 1181 LPS2_16_0_20_4|Expanded DAG metabolism::h2o_c+dag_hs_16_0_20_4_c --> mag_hs_16_0_c+h_c+arachd_c
		0.0	;	# 1182 CDS_16_0_20_4|Expanded Glycerophospholipid metabolism::pa_hs_16_0_20_4_c+ctp_c+h_c --> ppi_c+cdpdag_hs_16_0_20_4_c
		0.0	;	# 1183 CDIPTr_16_0_20_4|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_16_0_20_4_c --> pail_hs_16_0_20_4_c+cmp_c+h_c
		0.0	;	# 1184 PIPLC_16_0_20_4|Expanded Glycerophospholipid metabolism::pail_hs_16_0_20_4_c+h2o_c --> mi1p_D_c+dag_hs_16_0_20_4_c+h_c
		0.0	;	# 1185 PIK4_16_0_20_4|Expanded Glycerophospholipid metabolism::pail_hs_16_0_20_4_c+atp_c --> h_c+adp_c+pail4p_hs_16_0_20_4_c
		0.0	;	# 1186 PI4PLC_16_0_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_16_0_20_4_c --> dag_hs_16_0_20_4_c+h_c+mi14p_c
		0.0	;	# 1187 PI4P3K_16_0_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_16_0_20_4_c --> pail34p_hs_16_0_20_4_c+h_c+adp_c
		0.0	;	# 1188 PI34P5K_16_0_20_4|Expanded Glycerophospholipid metabolism::pail34p_hs_16_0_20_4_c+atp_c --> pail345p_hs_16_0_20_4_c+h_c+adp_c
		0.0	;	# 1189 PI4P5K_16_0_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_16_0_20_4_c --> pail345p_hs_16_0_20_4_c+h_c+adp_c
		0.0	;	# 1190 PI345P3P_16_0_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_16_0_20_4_c --> pi_c+pail45p_hs_16_0_20_4_c
		0.0	;	# 1191 PI45PLC_16_0_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_16_0_20_4_c --> dag_hs_16_0_20_4_c+h_c+mi145p_c
		0.0	;	# 1192 AGPAT1_18_0_18_0|Expanded DAG metabolism::alpha_hs_18_0_c+stcoa_c --> coa_c+pa_hs_18_0_18_0_c
		0.0	;	# 1193 PPAP_18_0_18_0|Expanded DAG metabolism::h2o_c+pa_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+pi_c
		0.0	;	# 1194 CEPTE_18_0_18_0|Expanded Phospholipid metabolism::dag_hs_18_0_18_0_c+cdpea_c --> cmp_c+h_c+pe_hs_18_0_18_0_c
		0.0	;	# 1195 PSSA2_hs_18_0_18_0|Expanded Phospholipid metabolism::ser_L_c+pe_hs_18_0_18_0_c --> ps_hs_18_0_18_0_c+etha_c
		0.0	;	# 1196 PSSA2_hs_18_0_18_0|Expanded Phospholipid metabolism_reverse::ps_hs_18_0_18_0_c+etha_c --> ser_L_c+pe_hs_18_0_18_0_c
		0.0	;	# 1197 PSSA1_hs_18_0_18_0|Expanded Phospholipid metabolism::chol_c+ps_hs_18_0_18_0_c --> ser_L_c+pchol_hs_18_0_18_0_c
		0.0	;	# 1198 PSSA1_hs_18_0_18_0|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_0_18_0_c --> chol_c+ps_hs_18_0_18_0_c
		0.0	;	# 1199 CEPTC_18_0_18_0|Expanded Phospholipid metabolism::dag_hs_18_0_18_0_c+cdpchol_c --> cmp_c+pchol_hs_18_0_18_0_c+h_c
		0.0	;	# 1200 PLA2_2_18_0_18_0|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_0_18_0_c --> h_c+lpchol_hs_18_0_c+ocdca_c
		0.0	;	# 1201 DAGK_hs_18_0_18_0|Expanded DAG metabolism::h_c+adp_c+pa_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+atp_c
		0.0	;	# 1202 DAGK_hs_18_0_18_0|Expanded DAG metabolism_reverse::dag_hs_18_0_18_0_c+atp_c --> h_c+adp_c+pa_hs_18_0_18_0_c
		0.0	;	# 1203 LPS2_18_0_18_0|Expanded DAG metabolism::dag_hs_18_0_18_0_c+h2o_c --> h_c+ocdca_c+mag_hs_18_0_c
		0.0	;	# 1204 CDS_18_0_18_0|Expanded Glycerophospholipid metabolism::ctp_c+h_c+pa_hs_18_0_18_0_c --> ppi_c+cdpdag_hs_18_0_18_0_c
		0.0	;	# 1205 CDIPTr_18_0_18_0|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_18_0_18_0_c --> cmp_c+pail_hs_18_0_18_0_c+h_c
		0.0	;	# 1206 PIPLC_18_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+mi1p_D_c+h_c
		0.0	;	# 1207 PIK4_18_0_18_0|Expanded Glycerophospholipid metabolism::pail_hs_18_0_18_0_c+atp_c --> pail4p_hs_18_0_18_0_c+h_c+adp_c
		0.0	;	# 1208 PI4PLC_18_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+h_c+mi14p_c
		0.0	;	# 1209 PI4P3K_18_0_18_0|Expanded Glycerophospholipid metabolism::pail4p_hs_18_0_18_0_c+atp_c --> pail34p_hs_18_0_18_0_c+h_c+adp_c
		0.0	;	# 1210 PI34P5K_18_0_18_0|Expanded Glycerophospholipid metabolism::pail34p_hs_18_0_18_0_c+atp_c --> pail345p_hs_18_0_18_0_c+h_c+adp_c
		0.0	;	# 1211 PI4P5K_18_0_18_0|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_18_0_18_0_c --> pail345p_hs_18_0_18_0_c+h_c+adp_c
		0.0	;	# 1212 PI345P3P_18_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_0_18_0_c --> pi_c+pail45p_hs_18_0_18_0_c
		0.0	;	# 1213 PI45PLC_18_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+h_c+mi145p_c
		0.0	;	# 1214 AGPAT1_18_0_18_1|Expanded DAG metabolism::alpha_hs_18_0_c+odecoa_c --> coa_c+pa_hs_18_0_18_1_c
		0.0	;	# 1215 PPAP_18_0_18_1|Expanded DAG metabolism::h2o_c+pa_hs_18_0_18_1_c --> dag_hs_18_0_18_1_c+pi_c
		0.0	;	# 1216 CEPTE_18_0_18_1|Expanded Phospholipid metabolism::dag_hs_18_0_18_1_c+cdpea_c --> cmp_c+h_c+pe_hs_18_0_18_1_c
		0.0	;	# 1217 PSSA2_hs_18_0_18_1|Expanded Phospholipid metabolism::ser_L_c+pe_hs_18_0_18_1_c --> ps_hs_18_0_18_1_c+etha_c
		0.0	;	# 1218 PSSA2_hs_18_0_18_1|Expanded Phospholipid metabolism_reverse::ps_hs_18_0_18_1_c+etha_c --> ser_L_c+pe_hs_18_0_18_1_c
		0.0	;	# 1219 PSSA1_hs_18_0_18_1|Expanded Phospholipid metabolism::chol_c+ps_hs_18_0_18_1_c --> ser_L_c+pchol_hs_18_0_18_1_c
		0.0	;	# 1220 PSSA1_hs_18_0_18_1|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_0_18_1_c --> chol_c+ps_hs_18_0_18_1_c
		0.0	;	# 1221 CEPTC_18_0_18_1|Expanded Phospholipid metabolism::dag_hs_18_0_18_1_c+cdpchol_c --> cmp_c+h_c+pchol_hs_18_0_18_1_c
		0.0	;	# 1222 PLA2_2_18_0_18_1|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_0_18_1_c --> ocdcea_c+h_c+lpchol_hs_18_0_c
		0.0	;	# 1223 DAGK_hs_18_0_18_1|Expanded DAG metabolism::h_c+adp_c+pa_hs_18_0_18_1_c --> dag_hs_18_0_18_1_c+atp_c
		0.0	;	# 1224 DAGK_hs_18_0_18_1|Expanded DAG metabolism_reverse::dag_hs_18_0_18_1_c+atp_c --> h_c+adp_c+pa_hs_18_0_18_1_c
		0.0	;	# 1225 LPS2_18_0_18_1|Expanded DAG metabolism::dag_hs_18_0_18_1_c+h2o_c --> ocdcea_c+h_c+mag_hs_18_0_c
		0.0	;	# 1226 CDS_18_0_18_1|Expanded Glycerophospholipid metabolism::ctp_c+h_c+pa_hs_18_0_18_1_c --> ppi_c+cdpdag_hs_18_0_18_1_c
		0.0	;	# 1227 CDIPTr_18_0_18_1|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_18_0_18_1_c --> pail_hs_18_0_18_1_c+cmp_c+h_c
		0.0	;	# 1228 PIPLC_18_0_18_1|Expanded Glycerophospholipid metabolism::pail_hs_18_0_18_1_c+h2o_c --> mi1p_D_c+dag_hs_18_0_18_1_c+h_c
		0.0	;	# 1229 PIK4_18_0_18_1|Expanded Glycerophospholipid metabolism::pail_hs_18_0_18_1_c+atp_c --> pail4p_hs_18_0_18_1_c+h_c+adp_c
		0.0	;	# 1230 PI4PLC_18_0_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_0_18_1_c --> dag_hs_18_0_18_1_c+h_c+mi14p_c
		0.0	;	# 1231 PI4P3K_18_0_18_1|Expanded Glycerophospholipid metabolism::pail4p_hs_18_0_18_1_c+atp_c --> pail34p_hs_18_0_18_1_c+h_c+adp_c
		0.0	;	# 1232 PI34P5K_18_0_18_1|Expanded Glycerophospholipid metabolism::pail34p_hs_18_0_18_1_c+atp_c --> h_c+pail345p_hs_18_0_18_1_c+adp_c
		0.0	;	# 1233 PI4P5K_18_0_18_1|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_18_0_18_1_c --> h_c+pail345p_hs_18_0_18_1_c+adp_c
		0.0	;	# 1234 PI345P3P_18_0_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_0_18_1_c --> pi_c+pail45p_hs_18_0_18_1_c
		0.0	;	# 1235 PI45PLC_18_0_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_0_18_1_c --> dag_hs_18_0_18_1_c+h_c+mi145p_c
		0.0	;	# 1236 AGPAT1_18_0_18_2|Expanded DAG metabolism::alpha_hs_18_0_c+lnlccoa_c --> coa_c+pa_hs_18_0_18_2_c
		0.0	;	# 1237 PPAP_18_0_18_2|Expanded DAG metabolism::h2o_c+pa_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+pi_c
		0.0	;	# 1238 CEPTE_18_0_18_2|Expanded Phospholipid metabolism::dag_hs_18_0_18_2_c+cdpea_c --> pe_hs_18_0_18_2_c+cmp_c+h_c
		0.0	;	# 1239 PSSA2_hs_18_0_18_2|Expanded Phospholipid metabolism::pe_hs_18_0_18_2_c+ser_L_c --> ps_hs_18_0_18_2_c+etha_c
		0.0	;	# 1240 PSSA2_hs_18_0_18_2|Expanded Phospholipid metabolism_reverse::ps_hs_18_0_18_2_c+etha_c --> pe_hs_18_0_18_2_c+ser_L_c
		0.0	;	# 1241 PSSA1_hs_18_0_18_2|Expanded Phospholipid metabolism::chol_c+ps_hs_18_0_18_2_c --> ser_L_c+pchol_hs_18_0_18_2_c
		0.0	;	# 1242 PSSA1_hs_18_0_18_2|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_0_18_2_c --> chol_c+ps_hs_18_0_18_2_c
		0.0	;	# 1243 CEPTC_18_0_18_2|Expanded Phospholipid metabolism::dag_hs_18_0_18_2_c+cdpchol_c --> cmp_c+h_c+pchol_hs_18_0_18_2_c
		0.0	;	# 1244 PLA2_2_18_0_18_2|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_0_18_2_c --> lnlc_c+h_c+lpchol_hs_18_0_c
		0.0	;	# 1245 DAGK_hs_18_0_18_2|Expanded DAG metabolism::h_c+adp_c+pa_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+atp_c
		0.0	;	# 1246 DAGK_hs_18_0_18_2|Expanded DAG metabolism_reverse::dag_hs_18_0_18_2_c+atp_c --> h_c+adp_c+pa_hs_18_0_18_2_c
		0.0	;	# 1247 LPS2_18_0_18_2|Expanded DAG metabolism::dag_hs_18_0_18_2_c+h2o_c --> lnlc_c+h_c+mag_hs_18_0_c
		0.0	;	# 1248 CDS_18_0_18_2|Expanded Glycerophospholipid metabolism::ctp_c+h_c+pa_hs_18_0_18_2_c --> ppi_c+cdpdag_hs_18_0_18_2_c
		0.0	;	# 1249 CDIPTr_18_0_18_2|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_18_0_18_2_c --> cmp_c+pail_hs_18_0_18_2_c+h_c
		0.0	;	# 1250 PIPLC_18_0_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+mi1p_D_c+h_c
		0.0	;	# 1251 PIK4_18_0_18_2|Expanded Glycerophospholipid metabolism::pail_hs_18_0_18_2_c+atp_c --> pail4p_hs_18_0_18_2_c+h_c+adp_c
		0.0	;	# 1252 PI4PLC_18_0_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+h_c+mi14p_c
		0.0	;	# 1253 PI4P3K_18_0_18_2|Expanded Glycerophospholipid metabolism::pail4p_hs_18_0_18_2_c+atp_c --> pail34p_hs_18_0_18_2_c+h_c+adp_c
		0.0	;	# 1254 PI34P5K_18_0_18_2|Expanded Glycerophospholipid metabolism::pail34p_hs_18_0_18_2_c+atp_c --> pail345p_hs_18_0_18_2_c+h_c+adp_c
		0.0	;	# 1255 PI4P5K_18_0_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_18_0_18_2_c --> pail345p_hs_18_0_18_2_c+h_c+adp_c
		0.0	;	# 1256 PI345P3P_18_0_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_0_18_2_c --> pi_c+pail45p_hs_18_0_18_2_c
		0.0	;	# 1257 PI45PLC_18_0_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+h_c+mi145p_c
		0.0	;	# 1258 AGPAT1_18_0_20_4|Expanded DAG metabolism::arachdcoa_c+alpha_hs_18_0_c --> coa_c+pa_hs_18_0_20_4_c
		0.0	;	# 1259 PPAP_18_0_20_4|Expanded DAG metabolism::h2o_c+pa_hs_18_0_20_4_c --> pi_c+dag_hs_18_0_20_4_c
		0.0	;	# 1260 CEPTE_18_0_20_4|Expanded Phospholipid metabolism::cdpea_c+dag_hs_18_0_20_4_c --> cmp_c+pe_hs_18_0_20_4_c+h_c
		0.0	;	# 1261 PSSA2_hs_18_0_20_4|Expanded Phospholipid metabolism::ser_L_c+pe_hs_18_0_20_4_c --> ps_hs_18_0_20_4_c+etha_c
		0.0	;	# 1262 PSSA2_hs_18_0_20_4|Expanded Phospholipid metabolism_reverse::ps_hs_18_0_20_4_c+etha_c --> ser_L_c+pe_hs_18_0_20_4_c
		0.0	;	# 1263 PSSA1_hs_18_0_20_4|Expanded Phospholipid metabolism::chol_c+ps_hs_18_0_20_4_c --> ser_L_c+pchol_hs_18_0_20_4_c
		0.0	;	# 1264 PSSA1_hs_18_0_20_4|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_0_20_4_c --> chol_c+ps_hs_18_0_20_4_c
		0.0	;	# 1265 CEPTC_18_0_20_4|Expanded Phospholipid metabolism::cdpchol_c+dag_hs_18_0_20_4_c --> cmp_c+pchol_hs_18_0_20_4_c+h_c
		0.0	;	# 1266 PLA2_2_18_0_20_4|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_0_20_4_c --> h_c+lpchol_hs_18_0_c+arachd_c
		0.0	;	# 1267 DAGK_hs_18_0_20_4|Expanded DAG metabolism::h_c+adp_c+pa_hs_18_0_20_4_c --> atp_c+dag_hs_18_0_20_4_c
		0.0	;	# 1268 DAGK_hs_18_0_20_4|Expanded DAG metabolism_reverse::atp_c+dag_hs_18_0_20_4_c --> h_c+adp_c+pa_hs_18_0_20_4_c
		0.0	;	# 1269 LPS2_18_0_20_4|Expanded DAG metabolism::h2o_c+dag_hs_18_0_20_4_c --> h_c+arachd_c+mag_hs_18_0_c
		0.0	;	# 1270 CDS_18_0_20_4|Expanded Glycerophospholipid metabolism::ctp_c+h_c+pa_hs_18_0_20_4_c --> cdpdag_hs_18_0_20_4_c+ppi_c
		0.0	;	# 1271 CDIPTr_18_0_20_4|Expanded Glycerophospholipid metabolism::cdpdag_hs_18_0_20_4_c+inost_c --> cmp_c+pail_hs_18_0_20_4_c+h_c
		0.0	;	# 1272 PIPLC_18_0_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_18_0_20_4_c --> mi1p_D_c+h_c+dag_hs_18_0_20_4_c
		0.0	;	# 1273 PIK4_18_0_20_4|Expanded Glycerophospholipid metabolism::pail_hs_18_0_20_4_c+atp_c --> pail4p_hs_18_0_20_4_c+h_c+adp_c
		0.0	;	# 1274 PI4PLC_18_0_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_0_20_4_c --> h_c+dag_hs_18_0_20_4_c+mi14p_c
		0.0	;	# 1275 PI4P3K_18_0_20_4|Expanded Glycerophospholipid metabolism::pail4p_hs_18_0_20_4_c+atp_c --> pail34p_hs_18_0_20_4_c+h_c+adp_c
		0.0	;	# 1276 PI34P5K_18_0_20_4|Expanded Glycerophospholipid metabolism::pail34p_hs_18_0_20_4_c+atp_c --> pail345p_hs_18_0_20_4_c+h_c+adp_c
		0.0	;	# 1277 PI4P5K_18_0_20_4|Expanded Glycerophospholipid metabolism::pail45p_hs_18_0_20_4_c+atp_c --> pail345p_hs_18_0_20_4_c+h_c+adp_c
		0.0	;	# 1278 PI345P3P_18_0_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_0_20_4_c --> pail45p_hs_18_0_20_4_c+pi_c
		0.0	;	# 1279 PI45PLC_18_0_20_4|Expanded Glycerophospholipid metabolism::pail45p_hs_18_0_20_4_c+h2o_c --> h_c+mi145p_c+dag_hs_18_0_20_4_c
		0.0	;	# 1280 AGPAT1_18_1_18_1|Expanded DAG metabolism::alpha_hs_18_1_c+odecoa_c --> pa_hs_18_1_18_1_c+coa_c
		0.0	;	# 1281 PPAP_18_1_18_1|Expanded DAG metabolism::h2o_c+pa_hs_18_1_18_1_c --> dag_hs_18_1_18_1_c+pi_c
		0.0	;	# 1282 CEPTE_18_1_18_1|Expanded Phospholipid metabolism::cdpea_c+dag_hs_18_1_18_1_c --> cmp_c+h_c+pe_hs_18_1_18_1_c
		0.0	;	# 1283 PSSA2_hs_18_1_18_1|Expanded Phospholipid metabolism::ser_L_c+pe_hs_18_1_18_1_c --> ps_hs_18_1_18_1_c+etha_c
		0.0	;	# 1284 PSSA2_hs_18_1_18_1|Expanded Phospholipid metabolism_reverse::ps_hs_18_1_18_1_c+etha_c --> ser_L_c+pe_hs_18_1_18_1_c
		0.0	;	# 1285 PSSA1_hs_18_1_18_1|Expanded Phospholipid metabolism::chol_c+ps_hs_18_1_18_1_c --> ser_L_c+pchol_hs_18_1_18_1_c
		0.0	;	# 1286 PSSA1_hs_18_1_18_1|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_1_18_1_c --> chol_c+ps_hs_18_1_18_1_c
		0.0	;	# 1287 CEPTC_18_1_18_1|Expanded Phospholipid metabolism::dag_hs_18_1_18_1_c+cdpchol_c --> cmp_c+pchol_hs_18_1_18_1_c+h_c
		0.0	;	# 1288 PLA2_2_18_1_18_1|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_1_18_1_c --> ocdcea_c+h_c+lpchol_hs_18_1_c
		0.0	;	# 1289 DAGK_hs_18_1_18_1|Expanded DAG metabolism::pa_hs_18_1_18_1_c+h_c+adp_c --> dag_hs_18_1_18_1_c+atp_c
		0.0	;	# 1290 DAGK_hs_18_1_18_1|Expanded DAG metabolism_reverse::dag_hs_18_1_18_1_c+atp_c --> pa_hs_18_1_18_1_c+h_c+adp_c
		0.0	;	# 1291 LPS2_18_1_18_1|Expanded DAG metabolism::h2o_c+dag_hs_18_1_18_1_c --> ocdcea_c+mag_hs_18_1_c+h_c
		0.0	;	# 1292 CDS_18_1_18_1|Expanded Glycerophospholipid metabolism::pa_hs_18_1_18_1_c+ctp_c+h_c --> cdpdag_hs_18_1_18_1_c+ppi_c
		0.0	;	# 1293 CDIPTr_18_1_18_1|Expanded Glycerophospholipid metabolism::cdpdag_hs_18_1_18_1_c+inost_c --> cmp_c+pail_hs_18_1_18_1_c+h_c
		0.0	;	# 1294 PIPLC_18_1_18_1|Expanded Glycerophospholipid metabolism::pail_hs_18_1_18_1_c+h2o_c --> mi1p_D_c+dag_hs_18_1_18_1_c+h_c
		0.0	;	# 1295 PIK4_18_1_18_1|Expanded Glycerophospholipid metabolism::pail_hs_18_1_18_1_c+atp_c --> pail4p_hs_18_1_18_1_c+h_c+adp_c
		0.0	;	# 1296 PI4PLC_18_1_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_1_18_1_c --> dag_hs_18_1_18_1_c+h_c+mi14p_c
		0.0	;	# 1297 PI4P3K_18_1_18_1|Expanded Glycerophospholipid metabolism::pail4p_hs_18_1_18_1_c+atp_c --> pail34p_hs_18_1_18_1_c+h_c+adp_c
		0.0	;	# 1298 PI34P5K_18_1_18_1|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_18_1_18_1_c --> pail345p_hs_18_1_18_1_c+h_c+adp_c
		0.0	;	# 1299 PI4P5K_18_1_18_1|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_18_1_18_1_c --> pail345p_hs_18_1_18_1_c+h_c+adp_c
		0.0	;	# 1300 PI345P3P_18_1_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_1_18_1_c --> pi_c+pail45p_hs_18_1_18_1_c
		0.0	;	# 1301 PI45PLC_18_1_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_1_18_1_c --> dag_hs_18_1_18_1_c+h_c+mi145p_c
		0.0	;	# 1302 AGPAT1_18_1_18_2|Expanded DAG metabolism::alpha_hs_18_1_c+lnlccoa_c --> coa_c+pa_hs_18_1_18_2_c
		0.0	;	# 1303 PPAP_18_1_18_2|Expanded DAG metabolism::h2o_c+pa_hs_18_1_18_2_c --> pi_c+dag_hs_18_1_18_2_c
		0.0	;	# 1304 CEPTE_18_1_18_2|Expanded Phospholipid metabolism::cdpea_c+dag_hs_18_1_18_2_c --> cmp_c+pe_hs_18_1_18_2_c+h_c
		0.0	;	# 1305 PSSA2_hs_18_1_18_2|Expanded Phospholipid metabolism::pe_hs_18_1_18_2_c+ser_L_c --> ps_hs_18_1_18_2_c+etha_c
		0.0	;	# 1306 PSSA2_hs_18_1_18_2|Expanded Phospholipid metabolism_reverse::ps_hs_18_1_18_2_c+etha_c --> pe_hs_18_1_18_2_c+ser_L_c
		0.0	;	# 1307 PSSA1_hs_18_1_18_2|Expanded Phospholipid metabolism::chol_c+ps_hs_18_1_18_2_c --> ser_L_c+pchol_hs_18_1_18_2_c
		0.0	;	# 1308 PSSA1_hs_18_1_18_2|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_1_18_2_c --> chol_c+ps_hs_18_1_18_2_c
		0.0	;	# 1309 CEPTC_18_1_18_2|Expanded Phospholipid metabolism::dag_hs_18_1_18_2_c+cdpchol_c --> cmp_c+pchol_hs_18_1_18_2_c+h_c
		0.0	;	# 1310 PLA2_2_18_1_18_2|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_1_18_2_c --> lnlc_c+h_c+lpchol_hs_18_1_c
		0.0	;	# 1311 DAGK_hs_18_1_18_2|Expanded DAG metabolism::pa_hs_18_1_18_2_c+h_c+adp_c --> atp_c+dag_hs_18_1_18_2_c
		0.0	;	# 1312 DAGK_hs_18_1_18_2|Expanded DAG metabolism_reverse::atp_c+dag_hs_18_1_18_2_c --> pa_hs_18_1_18_2_c+h_c+adp_c
		0.0	;	# 1313 LPS2_18_1_18_2|Expanded DAG metabolism::h2o_c+dag_hs_18_1_18_2_c --> lnlc_c+mag_hs_18_1_c+h_c
		0.0	;	# 1314 CDS_18_1_18_2|Expanded Glycerophospholipid metabolism::pa_hs_18_1_18_2_c+ctp_c+h_c --> ppi_c+cdpdag_hs_18_1_18_2_c
		0.0	;	# 1315 CDIPTr_18_1_18_2|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_18_1_18_2_c --> cmp_c+h_c+pail_hs_18_1_18_2_c
		0.0	;	# 1316 PIPLC_18_1_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_18_1_18_2_c --> mi1p_D_c+dag_hs_18_1_18_2_c+h_c
		0.0	;	# 1317 PIK4_18_1_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail_hs_18_1_18_2_c --> pail4p_hs_18_1_18_2_c+h_c+adp_c
		0.0	;	# 1318 PI4PLC_18_1_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_1_18_2_c --> dag_hs_18_1_18_2_c+h_c+mi14p_c
		0.0	;	# 1319 PI4P3K_18_1_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_18_1_18_2_c --> h_c+adp_c+pail34p_hs_18_1_18_2_c
		0.0	;	# 1320 PI34P5K_18_1_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_18_1_18_2_c --> h_c+adp_c+pail345p_hs_18_1_18_2_c
		0.0	;	# 1321 PI4P5K_18_1_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_18_1_18_2_c --> h_c+adp_c+pail345p_hs_18_1_18_2_c
		0.0	;	# 1322 PI345P3P_18_1_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_1_18_2_c --> pi_c+pail45p_hs_18_1_18_2_c
		0.0	;	# 1323 PI45PLC_18_1_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_1_18_2_c --> dag_hs_18_1_18_2_c+h_c+mi145p_c
		0.0	;	# 1324 AGPAT1_18_1_20_4|Expanded DAG metabolism::alpha_hs_18_1_c+arachdcoa_c --> coa_c+pa_hs_18_1_20_4_c
		0.0	;	# 1325 PPAP_18_1_20_4|Expanded DAG metabolism::h2o_c+pa_hs_18_1_20_4_c --> pi_c+dag_hs_18_1_20_4_c
		0.0	;	# 1326 CEPTE_18_1_20_4|Expanded Phospholipid metabolism::cdpea_c+dag_hs_18_1_20_4_c --> cmp_c+h_c+pe_hs_18_1_20_4_c
		0.0	;	# 1327 PSSA2_hs_18_1_20_4|Expanded Phospholipid metabolism::ser_L_c+pe_hs_18_1_20_4_c --> ps_hs_18_1_20_4_c+etha_c
		0.0	;	# 1328 PSSA2_hs_18_1_20_4|Expanded Phospholipid metabolism_reverse::ps_hs_18_1_20_4_c+etha_c --> ser_L_c+pe_hs_18_1_20_4_c
		0.0	;	# 1329 PSSA1_hs_18_1_20_4|Expanded Phospholipid metabolism::chol_c+ps_hs_18_1_20_4_c --> ser_L_c+pchol_hs_18_1_20_4_c
		0.0	;	# 1330 PSSA1_hs_18_1_20_4|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_1_20_4_c --> chol_c+ps_hs_18_1_20_4_c
		0.0	;	# 1331 CEPTC_18_1_20_4|Expanded Phospholipid metabolism::cdpchol_c+dag_hs_18_1_20_4_c --> cmp_c+h_c+pchol_hs_18_1_20_4_c
		0.0	;	# 1332 PLA2_2_18_1_20_4|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_1_20_4_c --> h_c+arachd_c+lpchol_hs_18_1_c
		0.0	;	# 1333 DAGK_hs_18_1_20_4|Expanded DAG metabolism::pa_hs_18_1_20_4_c+h_c+adp_c --> atp_c+dag_hs_18_1_20_4_c
		0.0	;	# 1334 DAGK_hs_18_1_20_4|Expanded DAG metabolism_reverse::atp_c+dag_hs_18_1_20_4_c --> pa_hs_18_1_20_4_c+h_c+adp_c
		0.0	;	# 1335 LPS2_18_1_20_4|Expanded DAG metabolism::h2o_c+dag_hs_18_1_20_4_c --> mag_hs_18_1_c+h_c+arachd_c
		0.0	;	# 1336 CDS_18_1_20_4|Expanded Glycerophospholipid metabolism::pa_hs_18_1_20_4_c+ctp_c+h_c --> ppi_c+cdpdag_hs_18_1_20_4_c
		0.0	;	# 1337 CDIPTr_18_1_20_4|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_18_1_20_4_c --> cmp_c+h_c+pail_hs_18_1_20_4_c
		0.0	;	# 1338 PIPLC_18_1_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_18_1_20_4_c --> mi1p_D_c+h_c+dag_hs_18_1_20_4_c
		0.0	;	# 1339 PIK4_18_1_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail_hs_18_1_20_4_c --> h_c+adp_c+pail4p_hs_18_1_20_4_c
		0.0	;	# 1340 PI4PLC_18_1_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_1_20_4_c --> h_c+mi14p_c+dag_hs_18_1_20_4_c
		0.0	;	# 1341 PI4P3K_18_1_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_18_1_20_4_c --> h_c+adp_c+pail34p_hs_18_1_20_4_c
		0.0	;	# 1342 PI34P5K_18_1_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_18_1_20_4_c --> pail345p_hs_18_1_20_4_c+h_c+adp_c
		0.0	;	# 1343 PI4P5K_18_1_20_4|Expanded Glycerophospholipid metabolism::pail45p_hs_18_1_20_4_c+atp_c --> pail345p_hs_18_1_20_4_c+h_c+adp_c
		0.0	;	# 1344 PI345P3P_18_1_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_1_20_4_c --> pail45p_hs_18_1_20_4_c+pi_c
		0.0	;	# 1345 PI45PLC_18_1_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_1_20_4_c --> h_c+mi145p_c+dag_hs_18_1_20_4_c
		0.0	;	# 1346 AGPAT1_18_2_18_2|Expanded DAG metabolism::alpha_hs_18_2_c+lnlccoa_c --> pa_hs_18_2_18_2_c+coa_c
		0.0	;	# 1347 PPAP_18_2_18_2|Expanded DAG metabolism::pa_hs_18_2_18_2_c+h2o_c --> pi_c+dag_hs_18_2_18_2_c
		0.0	;	# 1348 CEPTE_18_2_18_2|Expanded Phospholipid metabolism::cdpea_c+dag_hs_18_2_18_2_c --> cmp_c+pe_hs_18_2_18_2_c+h_c
		0.0	;	# 1349 PSSA2_hs_18_2_18_2|Expanded Phospholipid metabolism::ser_L_c+pe_hs_18_2_18_2_c --> ps_hs_18_2_18_2_c+etha_c
		0.0	;	# 1350 PSSA2_hs_18_2_18_2|Expanded Phospholipid metabolism_reverse::ps_hs_18_2_18_2_c+etha_c --> ser_L_c+pe_hs_18_2_18_2_c
		0.0	;	# 1351 PSSA1_hs_18_2_18_2|Expanded Phospholipid metabolism::chol_c+ps_hs_18_2_18_2_c --> pchol_hs_18_2_18_2_c+ser_L_c
		0.0	;	# 1352 PSSA1_hs_18_2_18_2|Expanded Phospholipid metabolism_reverse::pchol_hs_18_2_18_2_c+ser_L_c --> chol_c+ps_hs_18_2_18_2_c
		0.0	;	# 1353 CEPTC_18_2_18_2|Expanded Phospholipid metabolism::cdpchol_c+dag_hs_18_2_18_2_c --> pchol_hs_18_2_18_2_c+cmp_c+h_c
		0.0	;	# 1354 PLA2_2_18_2_18_2|Expanded Phospholipid metabolism::pchol_hs_18_2_18_2_c+h2o_c --> lnlc_c+h_c+lpchol_hs_18_2_c
		0.0	;	# 1355 DAGK_hs_18_2_18_2|Expanded DAG metabolism::pa_hs_18_2_18_2_c+h_c+adp_c --> atp_c+dag_hs_18_2_18_2_c
		0.0	;	# 1356 DAGK_hs_18_2_18_2|Expanded DAG metabolism_reverse::atp_c+dag_hs_18_2_18_2_c --> pa_hs_18_2_18_2_c+h_c+adp_c
		0.0	;	# 1357 LPS2_18_2_18_2|Expanded DAG metabolism::h2o_c+dag_hs_18_2_18_2_c --> lnlc_c+h_c+mag_hs_18_2_c
		0.0	;	# 1358 CDS_18_2_18_2|Expanded Glycerophospholipid metabolism::pa_hs_18_2_18_2_c+ctp_c+h_c --> cdpdag_hs_18_2_18_2_c+ppi_c
		0.0	;	# 1359 CDIPTr_18_2_18_2|Expanded Glycerophospholipid metabolism::cdpdag_hs_18_2_18_2_c+inost_c --> cmp_c+pail_hs_18_2_18_2_c+h_c
		0.0	;	# 1360 PIPLC_18_2_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_18_2_18_2_c --> mi1p_D_c+h_c+dag_hs_18_2_18_2_c
		0.0	;	# 1361 PIK4_18_2_18_2|Expanded Glycerophospholipid metabolism::pail_hs_18_2_18_2_c+atp_c --> h_c+adp_c+pail4p_hs_18_2_18_2_c
		0.0	;	# 1362 PI4PLC_18_2_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_2_18_2_c --> h_c+mi14p_c+dag_hs_18_2_18_2_c
		0.0	;	# 1363 PI4P3K_18_2_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_18_2_18_2_c --> pail34p_hs_18_2_18_2_c+h_c+adp_c
		0.0	;	# 1364 PI34P5K_18_2_18_2|Expanded Glycerophospholipid metabolism::pail34p_hs_18_2_18_2_c+atp_c --> pail345p_hs_18_2_18_2_c+h_c+adp_c
		0.0	;	# 1365 PI4P5K_18_2_18_2|Expanded Glycerophospholipid metabolism::pail45p_hs_18_2_18_2_c+atp_c --> pail345p_hs_18_2_18_2_c+h_c+adp_c
		0.0	;	# 1366 PI345P3P_18_2_18_2|Expanded Glycerophospholipid metabolism::pail345p_hs_18_2_18_2_c+h2o_c --> pail45p_hs_18_2_18_2_c+pi_c
		0.0	;	# 1367 PI45PLC_18_2_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_2_18_2_c --> h_c+mi145p_c+dag_hs_18_2_18_2_c
		0.0	;	# 1368 AGPAT1_18_2_20_4|Expanded DAG metabolism::arachdcoa_c+alpha_hs_18_2_c --> coa_c+pa_hs_18_2_20_4_c
		0.0	;	# 1369 PPAP_18_2_20_4|Expanded DAG metabolism::h2o_c+pa_hs_18_2_20_4_c --> pi_c+dag_hs_18_2_20_4_c
		0.0	;	# 1370 CEPTE_18_2_20_4|Expanded Phospholipid metabolism::cdpea_c+dag_hs_18_2_20_4_c --> cmp_c+pe_hs_18_2_20_4_c+h_c
		0.0	;	# 1371 PSSA2_hs_18_2_20_4|Expanded Phospholipid metabolism::pe_hs_18_2_20_4_c+ser_L_c --> etha_c+ps_hs_18_2_20_4_c
		0.0	;	# 1372 PSSA2_hs_18_2_20_4|Expanded Phospholipid metabolism_reverse::etha_c+ps_hs_18_2_20_4_c --> pe_hs_18_2_20_4_c+ser_L_c
		0.0	;	# 1373 PSSA1_hs_18_2_20_4|Expanded Phospholipid metabolism::chol_c+ps_hs_18_2_20_4_c --> ser_L_c+pchol_hs_18_2_20_4_c
		0.0	;	# 1374 PSSA1_hs_18_2_20_4|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_2_20_4_c --> chol_c+ps_hs_18_2_20_4_c
		0.0	;	# 1375 CEPTC_18_2_20_4|Expanded Phospholipid metabolism::cdpchol_c+dag_hs_18_2_20_4_c --> cmp_c+h_c+pchol_hs_18_2_20_4_c
		0.0	;	# 1376 PLA2_2_18_2_20_4|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_2_20_4_c --> h_c+lpchol_hs_18_2_c+arachd_c
		0.0	;	# 1377 DAGK_hs_18_2_20_4|Expanded DAG metabolism::pa_hs_18_2_20_4_c+h_c+adp_c --> atp_c+dag_hs_18_2_20_4_c
		0.0	;	# 1378 DAGK_hs_18_2_20_4|Expanded DAG metabolism_reverse::atp_c+dag_hs_18_2_20_4_c --> pa_hs_18_2_20_4_c+h_c+adp_c
		0.0	;	# 1379 LPS2_18_2_20_4|Expanded DAG metabolism::h2o_c+dag_hs_18_2_20_4_c --> h_c+arachd_c+mag_hs_18_2_c
		0.0	;	# 1380 CDS_18_2_20_4|Expanded Glycerophospholipid metabolism::ctp_c+pa_hs_18_2_20_4_c+h_c --> ppi_c+cdpdag_hs_18_2_20_4_c
		0.0	;	# 1381 CDIPTr_18_2_20_4|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_18_2_20_4_c --> cmp_c+pail_hs_18_2_20_4_c+h_c
		0.0	;	# 1382 PIPLC_18_2_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_18_2_20_4_c --> mi1p_D_c+h_c+dag_hs_18_2_20_4_c
		0.0	;	# 1383 PIK4_18_2_20_4|Expanded Glycerophospholipid metabolism::pail_hs_18_2_20_4_c+atp_c --> pail4p_hs_18_2_20_4_c+h_c+adp_c
		0.0	;	# 1384 PI4PLC_18_2_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_2_20_4_c --> h_c+dag_hs_18_2_20_4_c+mi14p_c
		0.0	;	# 1385 PI4P3K_18_2_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_18_2_20_4_c --> pail34p_hs_18_2_20_4_c+h_c+adp_c
		0.0	;	# 1386 PI34P5K_18_2_20_4|Expanded Glycerophospholipid metabolism::pail34p_hs_18_2_20_4_c+atp_c --> pail345p_hs_18_2_20_4_c+h_c+adp_c
		0.0	;	# 1387 PI4P5K_18_2_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_18_2_20_4_c --> pail345p_hs_18_2_20_4_c+h_c+adp_c
		0.0	;	# 1388 PI345P3P_18_2_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_2_20_4_c --> pi_c+pail45p_hs_18_2_20_4_c
		0.0	;	# 1389 PI45PLC_18_2_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_2_20_4_c --> h_c+mi145p_c+dag_hs_18_2_20_4_c
		0.0	;	# 1390 AGPAT1_20_4_20_4|Expanded DAG metabolism::alpha_hs_20_4_c+arachdcoa_c --> pa_hs_20_4_20_4_c+coa_c
		0.0	;	# 1391 PPAP_20_4_20_4|Expanded DAG metabolism::h2o_c+pa_hs_20_4_20_4_c --> dag_hs_20_4_20_4_c+pi_c
		0.0	;	# 1392 CEPTE_20_4_20_4|Expanded Phospholipid metabolism::dag_hs_20_4_20_4_c+cdpea_c --> pe_hs_20_4_20_4_c+cmp_c+h_c
		0.0	;	# 1393 PSSA2_hs_20_4_20_4|Expanded Phospholipid metabolism::pe_hs_20_4_20_4_c+ser_L_c --> ps_hs_20_4_20_4_c+etha_c
		0.0	;	# 1394 PSSA2_hs_20_4_20_4|Expanded Phospholipid metabolism_reverse::ps_hs_20_4_20_4_c+etha_c --> pe_hs_20_4_20_4_c+ser_L_c
		0.0	;	# 1395 PSSA1_hs_20_4_20_4|Expanded Phospholipid metabolism::chol_c+ps_hs_20_4_20_4_c --> ser_L_c+pchol_hs_20_4_20_4_c
		0.0	;	# 1396 PSSA1_hs_20_4_20_4|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_20_4_20_4_c --> chol_c+ps_hs_20_4_20_4_c
		0.0	;	# 1397 CEPTC_20_4_20_4|Expanded Phospholipid metabolism::dag_hs_20_4_20_4_c+cdpchol_c --> cmp_c+h_c+pchol_hs_20_4_20_4_c
		0.0	;	# 1398 PLA2_2_20_4_20_4|Expanded Phospholipid metabolism::h2o_c+pchol_hs_20_4_20_4_c --> h_c+lpchol_hs_20_4_c+arachd_c
		0.0	;	# 1399 DAGK_hs_20_4_20_4|Expanded DAG metabolism::pa_hs_20_4_20_4_c+h_c+adp_c --> dag_hs_20_4_20_4_c+atp_c
		0.0	;	# 1400 DAGK_hs_20_4_20_4|Expanded DAG metabolism_reverse::dag_hs_20_4_20_4_c+atp_c --> pa_hs_20_4_20_4_c+h_c+adp_c
		0.0	;	# 1401 LPS2_20_4_20_4|Expanded DAG metabolism::dag_hs_20_4_20_4_c+h2o_c --> mag_hs_20_4_c+h_c+arachd_c
		0.0	;	# 1402 CDS_20_4_20_4|Expanded Glycerophospholipid metabolism::pa_hs_20_4_20_4_c+ctp_c+h_c --> ppi_c+cdpdag_hs_20_4_20_4_c
		0.0	;	# 1403 CDIPTr_20_4_20_4|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_20_4_20_4_c --> cmp_c+pail_hs_20_4_20_4_c+h_c
		0.0	;	# 1404 PIPLC_20_4_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_20_4_20_4_c --> dag_hs_20_4_20_4_c+mi1p_D_c+h_c
		0.0	;	# 1405 PIK4_20_4_20_4|Expanded Glycerophospholipid metabolism::pail_hs_20_4_20_4_c+atp_c --> h_c+adp_c+pail4p_hs_20_4_20_4_c
		0.0	;	# 1406 PI4PLC_20_4_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_20_4_20_4_c --> dag_hs_20_4_20_4_c+h_c+mi14p_c
		0.0	;	# 1407 PI4P3K_20_4_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_20_4_20_4_c --> h_c+pail34p_hs_20_4_20_4_c+adp_c
		0.0	;	# 1408 PI34P5K_20_4_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_20_4_20_4_c --> pail345p_hs_20_4_20_4_c+h_c+adp_c
		0.0	;	# 1409 PI4P5K_20_4_20_4|Expanded Glycerophospholipid metabolism::pail45p_hs_20_4_20_4_c+atp_c --> pail345p_hs_20_4_20_4_c+h_c+adp_c
		0.0	;	# 1410 PI345P3P_20_4_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_20_4_20_4_c --> pail45p_hs_20_4_20_4_c+pi_c
		0.0	;	# 1411 PI45PLC_20_4_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_20_4_20_4_c --> dag_hs_20_4_20_4_c+h_c+mi145p_c
		0.0	;	# 1412 PAFH|Glycerophospholipid Metabolism::h2o_c+paf_hs_c --> ac_c+h_c+ak2lgchol_hs_c
		0.0	;	# 1413 PAFS|Glycerophospholipid Metabolism::accoa_c+ak2lgchol_hs_c --> coa_c+paf_hs_c
		0.0	;	# 1414 PYRt2m|Transport_ Mitochondrial::pyr_c+h_c --> h_m+pyr_m
		0.0	;	# 1415 PYRt2m|Transport_ Mitochondrial_reverse::h_m+pyr_m --> pyr_c+h_c
		0.0	;	# 1416 sink_Tyr_ggn|Intracellular Constraint::Tyr_ggn_c --> []
		0.0	;	# 1417 sink_Tyr_ggn|Intracellular Constraint_reverse::[] --> Tyr_ggn_c
		0.0	;	# 1418 EX_paf_hs_e|Extracellular exchange::paf_hs_e --> []
		0.0	;	# 1419 EX_paf_hs_e|Extracellular exchange_reverse::[] --> paf_hs_e
		0.0	;	# 1420 PAFt|Transport_ Extracellular::paf_hs_e --> paf_hs_c
		0.0	;	# 1421 PAFt|Transport_ Extracellular_reverse::paf_hs_c --> paf_hs_e
		0.0	;	# 1422 sink_paf_hs|Intracellular Constraint::paf_hs_c --> []
		0.0	;	# 1423 sink_paf_hs|Intracellular Constraint_reverse::[] --> paf_hs_c
		0.0	;	# 1424 GLYt2r|Transport_ Extracellular::gly_e+h_e --> gly_c+h_c
		0.0	;	# 1425 GLYt2r|Transport_ Extracellular_reverse::gly_c+h_c --> gly_e+h_e
		0.0	;	# 1426 PROD2m|Proline Metabolism::fad_m+pro_L_m --> 1pyr5c_m+fadh2_m+h_m
		0.0	;	# 1427 PROD2m|Proline Metabolism_reverse::1pyr5c_m+fadh2_m+h_m --> fad_m+pro_L_m
		0.0	;	# 1428 HXANtx|Transport_ Peroxisomal::hxan_c --> hxan_x
		0.0	;	# 1429 HXANtx|Transport_ Peroxisomal_reverse::hxan_x --> hxan_c
		0.0	;	# 1430 XAO2x|Purine Catabolism::hxan_x+o2_x+h2o_x --> h2o2_x+xan_x
		0.0	;	# 1431 XAO2x|Purine Catabolism_reverse::h2o2_x+xan_x --> hxan_x+o2_x+h2o_x
		0.0	;	# 1432 DM_glygn3_c|Intracellular Constraint::glygn3_c --> []
		0.0	;	# 1433 DM_glygn3_c|Intracellular Constraint_reverse::[] --> glygn3_c
		0.0	;	# 1434 sink_adp_c|Intracellular Constraint::adp_c --> []
		0.0	;	# 1435 sink_adp_c|Intracellular Constraint_reverse::[] --> adp_c
		0.0	;	# 1436 DM_atp_c|Intracellular Constraint::h2o_c+atp_c --> pi_c+h_c+adp_c
		0.0	;	# 1437 DM_atp_c|Intracellular Constraint_reverse::pi_c+h_c+adp_c --> h2o_c+atp_c
		0.0	;	# 1438 ACCOAtm|Transport_ Mitochondrial::accoa_c --> accoa_m
		0.0	;	# 1439 AMPt|Transport_ Extracellular::amp_e --> amp_c
		0.0	;	# 1440 AMPt|Transport_ Extracellular_reverse::amp_c --> amp_e
		0.0	;	# 1441 ATPtm|Transport_ Mitochondrial::atp_m+adp_c --> atp_c+adp_m
		0.0	;	# 1442 H2Otm|Transport_ Mitochondrial::h2o_c --> h2o_m
		0.0	;	# 1443 H2Otm|Transport_ Mitochondrial_reverse::h2o_m --> h2o_c
		0.0	;	# 1444 H2Ot|Transport_ Extracellular::h2o_e --> h2o_c
		0.0	;	# 1445 H2Ot|Transport_ Extracellular_reverse::h2o_c --> h2o_e
		0.0	;	# 1446 PIt9|Transport_ Extracellular::2.0*na1_e+pi_e --> 2.0*na1_c+pi_c
		0.0	;	# 1447 PIt9|Transport_ Extracellular_reverse::2.0*na1_c+pi_c --> 2.0*na1_e+pi_e
		0.0	;	# 1448 SUCOASm|Citric Acid Cycle::atp_m+coa_m+succ_m --> pi_m+succoa_m+adp_m
		0.0	;	# 1449 SUCOASm|Citric Acid Cycle_reverse::pi_m+succoa_m+adp_m --> atp_m+coa_m+succ_m
		0.0	;	# 1450 CO2tm|Transport_ Mitochondrial::co2_c --> co2_m
		0.0	;	# 1451 CO2tm|Transport_ Mitochondrial_reverse::co2_m --> co2_c
		0.0	;	# 1452 COAtm|Transport_ Mitochondrial::coa_c --> coa_m
		0.0	;	# 1453 COAtm|Transport_ Mitochondrial_reverse::coa_m --> coa_c
		0.0	;	# 1454 NH4t3r|Transport_ Extracellular::nh4_c+h_e --> nh4_e+h_c
		0.0	;	# 1455 NH4t3r|Transport_ Extracellular_reverse::nh4_e+h_c --> nh4_c+h_e
		0.0	;	# 1456 Ht|Transport_ Extracellular::h_e --> h_c
		0.0	;	# 1457 Ht|Transport_ Extracellular_reverse::h_c --> h_e
		0.0	;	# 1458 GLNt|Transport_ Extracellular::gln_L_e --> gln_L_c
		0.0	;	# 1459 GLNt|Transport_ Extracellular_reverse::gln_L_c --> gln_L_e
	];

	# Min/Max flag - default is minimum - 
	is_minimum_flag = true

	# List of reation strings - used to write flux report 
	list_of_reaction_strings = [
		"sink_xan_c|Intracellular Constraint::xan_c --> []"
		"sink_xan_c|Intracellular Constraint_reverse::[] --> xan_c"
		"EX_35cgmp_e|Extracellular exchange::35cgmp_e --> []"
		"EX_35cgmp_e|Extracellular exchange_reverse::[] --> 35cgmp_e"
		"EX_4hphac_e|Extracellular exchange::4hphac_e --> []"
		"EX_4hphac_e|Extracellular exchange_reverse::[] --> 4hphac_e"
		"EX_4nph_e|Extracellular exchange::4nph_e --> []"
		"EX_4nph_e|Extracellular exchange_reverse::[] --> 4nph_e"
		"EX_4nphsf_e|Extracellular exchange::4nphsf_e --> []"
		"EX_4nphsf_e|Extracellular exchange_reverse::[] --> 4nphsf_e"
		"EX_Lcystin_e|Extracellular exchange::Lcystin_e --> []"
		"EX_Lcystin_e|Extracellular exchange_reverse::[] --> Lcystin_e"
		"EX_ac_e|Extracellular exchange::ac_e --> []"
		"EX_ac_e|Extracellular exchange_reverse::[] --> ac_e"
		"EX_ade_e|Extracellular exchange::ade_e --> []"
		"EX_ade_e|Extracellular exchange_reverse::[] --> ade_e"
		"EX_adn_e|Extracellular exchange::adn_e --> []"
		"EX_adn_e|Extracellular exchange_reverse::[] --> adn_e"
		"EX_adp_e|Extracellular exchange::adp_e --> []"
		"EX_adp_e|Extracellular exchange_reverse::[] --> adp_e"
		"EX_adprib_e|Extracellular exchange::adprib_e --> []"
		"EX_adprib_e|Extracellular exchange_reverse::[] --> adprib_e"
		"EX_adrnl_e|Extracellular exchange::adrnl_e --> []"
		"EX_adrnl_e|Extracellular exchange_reverse::[] --> adrnl_e"
		"EX_ala_L_e|Extracellular exchange::ala_L_e --> []"
		"EX_ala_L_e|Extracellular exchange_reverse::[] --> ala_L_e"
		"EX_amp_e|Extracellular exchange::amp_e --> []"
		"EX_amp_e|Extracellular exchange_reverse::[] --> amp_e"
		"EX_arachd_e|Extracellular exchange::arachd_e --> []"
		"EX_arachd_e|Extracellular exchange_reverse::[] --> arachd_e"
		"EX_arg_L_e|Extracellular exchange::arg_L_e --> []"
		"EX_arg_L_e|Extracellular exchange_reverse::[] --> arg_L_e"
		"EX_ascb_L_e|Extracellular exchange::ascb_L_e --> []"
		"EX_ascb_L_e|Extracellular exchange_reverse::[] --> ascb_L_e"
		"EX_asn_L_e|Extracellular exchange::asn_L_e --> []"
		"EX_asn_L_e|Extracellular exchange_reverse::[] --> asn_L_e"
		"EX_asp_L_e|Extracellular exchange::asp_L_e --> []"
		"EX_asp_L_e|Extracellular exchange_reverse::[] --> asp_L_e"
		"EX_bilirub_e|Extracellular exchange::bilirub_e --> []"
		"EX_bilirub_e|Extracellular exchange_reverse::[] --> bilirub_e"
		"EX_ca2_e|Extracellular exchange::ca2_e --> []"
		"EX_ca2_e|Extracellular exchange_reverse::[] --> ca2_e"
		"EX_chol_e|Extracellular exchange::chol_e --> []"
		"EX_chol_e|Extracellular exchange_reverse::[] --> chol_e"
		"EX_cit_e|Extracellular exchange::cit_e --> []"
		"EX_cit_e|Extracellular exchange_reverse::[] --> cit_e"
		"EX_co_e|Extracellular exchange::co_e --> []"
		"EX_co_e|Extracellular exchange_reverse::[] --> co_e"
		"EX_co2_e|Extracellular exchange::co2_e --> []"
		"EX_co2_e|Extracellular exchange_reverse::[] --> co2_e"
		"EX_creat_e|Extracellular exchange::creat_e --> []"
		"EX_creat_e|Extracellular exchange_reverse::[] --> creat_e"
		"EX_cyan_e|Extracellular exchange::cyan_e --> []"
		"EX_cyan_e|Extracellular exchange_reverse::[] --> cyan_e"
		"EX_cys_L_e|Extracellular exchange::cys_L_e --> []"
		"EX_cys_L_e|Extracellular exchange_reverse::[] --> cys_L_e"
		"EX_cytd_e|Extracellular exchange::cytd_e --> []"
		"EX_cytd_e|Extracellular exchange_reverse::[] --> cytd_e"
		"EX_dhdascb_e|Extracellular exchange::dhdascb_e --> []"
		"EX_dhdascb_e|Extracellular exchange_reverse::[] --> dhdascb_e"
		"EX_dopa_e|Extracellular exchange::dopa_e --> []"
		"EX_dopa_e|Extracellular exchange_reverse::[] --> dopa_e"
		"EX_dopasf_e|Extracellular exchange::dopasf_e --> []"
		"EX_dopasf_e|Extracellular exchange_reverse::[] --> dopasf_e"
		"EX_fe2_e|Extracellular exchange::fe2_e --> []"
		"EX_fe2_e|Extracellular exchange_reverse::[] --> fe2_e"
		"EX_fru_e|Extracellular exchange::fru_e --> []"
		"EX_fru_e|Extracellular exchange_reverse::[] --> fru_e"
		"EX_gal_e|Extracellular exchange::gal_e --> []"
		"EX_gal_e|Extracellular exchange_reverse::[] --> gal_e"
		"EX_gdp_e|Extracellular exchange::gdp_e --> []"
		"EX_gdp_e|Extracellular exchange_reverse::[] --> gdp_e"
		"EX_glc_e|Extracellular exchange::glc_D_e --> []"
		"EX_glc_e|Extracellular exchange_reverse::[] --> glc_D_e"
		"EX_gln_L_e|Extracellular exchange::gln_L_e --> []"
		"EX_gln_L_e|Extracellular exchange_reverse::[] --> gln_L_e"
		"EX_glu_L_e|Extracellular exchange::glu_L_e --> []"
		"EX_glu_L_e|Extracellular exchange_reverse::[] --> glu_L_e"
		"EX_gly_e|Extracellular exchange::gly_e --> []"
		"EX_gly_e|Extracellular exchange_reverse::[] --> gly_e"
		"EX_glyb_e|Extracellular exchange::glyb_e --> []"
		"EX_glyb_e|Extracellular exchange_reverse::[] --> glyb_e"
		"EX_gthox_e|Extracellular exchange::gthox_e --> []"
		"EX_gthox_e|Extracellular exchange_reverse::[] --> gthox_e"
		"EX_gthrd_e|Extracellular exchange::gthrd_e --> []"
		"EX_gthrd_e|Extracellular exchange_reverse::[] --> gthrd_e"
		"EX_h_e|Extracellular exchange::h_e --> []"
		"EX_h_e|Extracellular exchange_reverse::[] --> h_e"
		"EX_h2o_e|Extracellular exchange::h2o_e --> []"
		"EX_h2o_e|Extracellular exchange_reverse::[] --> h2o_e"
		"EX_h2o2_e|Extracellular exchange::h2o2_e --> []"
		"EX_h2o2_e|Extracellular exchange_reverse::[] --> h2o2_e"
		"EX_hco3_e|Extracellular exchange::hco3_e --> []"
		"EX_hco3_e|Extracellular exchange_reverse::[] --> hco3_e"
		"EX_hdca_e|Extracellular exchange::hdca_e --> []"
		"EX_hdca_e|Extracellular exchange_reverse::[] --> hdca_e"
		"EX_his_L_e|Extracellular exchange::his_L_e --> []"
		"EX_his_L_e|Extracellular exchange_reverse::[] --> his_L_e"
		"EX_hista_e|Extracellular exchange::hista_e --> []"
		"EX_hista_e|Extracellular exchange_reverse::[] --> hista_e"
		"EX_hxan_e|Extracellular exchange::hxan_e --> []"
		"EX_hxan_e|Extracellular exchange_reverse::[] --> hxan_e"
		"EX_ile_L_e|Extracellular exchange::ile_L_e --> []"
		"EX_ile_L_e|Extracellular exchange_reverse::[] --> ile_L_e"
		"EX_inost_e|Extracellular exchange::inost_e --> []"
		"EX_inost_e|Extracellular exchange_reverse::[] --> inost_e"
		"EX_ins_e|Extracellular exchange::ins_e --> []"
		"EX_ins_e|Extracellular exchange_reverse::[] --> ins_e"
		"EX_lac_L_e|Extracellular exchange::lac_L_e --> []"
		"EX_lac_L_e|Extracellular exchange_reverse::[] --> lac_L_e"
		"EX_leuktrF4_e|Extracellular exchange::leuktrF4_e --> []"
		"EX_leuktrF4_e|Extracellular exchange_reverse::[] --> leuktrF4_e"
		"EX_lnlc_e|Extracellular exchange::lnlc_e --> []"
		"EX_lnlc_e|Extracellular exchange_reverse::[] --> lnlc_e"
		"EX_lys_L_e|Extracellular exchange::lys_L_e --> []"
		"EX_lys_L_e|Extracellular exchange_reverse::[] --> lys_L_e"
		"EX_met_L_e|Extracellular exchange::met_L_e --> []"
		"EX_met_L_e|Extracellular exchange_reverse::[] --> met_L_e"
		"EX_na1_e|Extracellular exchange::na1_e --> []"
		"EX_na1_e|Extracellular exchange_reverse::[] --> na1_e"
		"EX_nad_e|Extracellular exchange::nad_e --> []"
		"EX_nad_e|Extracellular exchange_reverse::[] --> nad_e"
		"EX_ncam_e|Extracellular exchange::ncam_e --> []"
		"EX_ncam_e|Extracellular exchange_reverse::[] --> ncam_e"
		"EX_nh4_e|Extracellular exchange::nh4_e --> []"
		"EX_nh4_e|Extracellular exchange_reverse::[] --> nh4_e"
		"EX_no_e|Extracellular exchange::no_e --> []"
		"EX_no_e|Extracellular exchange_reverse::[] --> no_e"
		"EX_nrpphrsf_e|Extracellular exchange::nrpphrsf_e --> []"
		"EX_nrpphrsf_e|Extracellular exchange_reverse::[] --> nrpphrsf_e"
		"EX_o2_e|Extracellular exchange::o2_e --> []"
		"EX_o2_e|Extracellular exchange_reverse::[] --> o2_e"
		"EX_o2s_e|Extracellular exchange::o2s_e --> []"
		"EX_o2s_e|Extracellular exchange_reverse::[] --> o2s_e"
		"EX_ocdca_e|Extracellular exchange::ocdca_e --> []"
		"EX_ocdca_e|Extracellular exchange_reverse::[] --> ocdca_e"
		"EX_ocdcea_e|Extracellular exchange::ocdcea_e --> []"
		"EX_ocdcea_e|Extracellular exchange_reverse::[] --> ocdcea_e"
		"EX_orn_e|Extracellular exchange::orn_e --> []"
		"EX_orn_e|Extracellular exchange_reverse::[] --> orn_e"
		"EX_phe_L_e|Extracellular exchange::phe_L_e --> []"
		"EX_phe_L_e|Extracellular exchange_reverse::[] --> phe_L_e"
		"EX_pheacgln_e|Extracellular exchange::pheacgln_e --> []"
		"EX_pheacgln_e|Extracellular exchange_reverse::[] --> pheacgln_e"
		"EX_pheme_e|Extracellular exchange::pheme_e --> []"
		"EX_pheme_e|Extracellular exchange_reverse::[] --> pheme_e"
		"EX_pi_e|Extracellular exchange::pi_e --> []"
		"EX_pi_e|Extracellular exchange_reverse::[] --> pi_e"
		"EX_pro_L_e|Extracellular exchange::pro_L_e --> []"
		"EX_pro_L_e|Extracellular exchange_reverse::[] --> pro_L_e"
		"EX_prostgd2_e|Extracellular exchange::prostgd2_e --> []"
		"EX_prostgd2_e|Extracellular exchange_reverse::[] --> prostgd2_e"
		"EX_pyr_e|Extracellular exchange::pyr_e --> []"
		"EX_pyr_e|Extracellular exchange_reverse::[] --> pyr_e"
		"EX_ser_L_e|Extracellular exchange::ser_L_e --> []"
		"EX_ser_L_e|Extracellular exchange_reverse::[] --> ser_L_e"
		"EX_so4_e|Extracellular exchange::so4_e --> []"
		"EX_so4_e|Extracellular exchange_reverse::[] --> so4_e"
		"EX_spc_hs_e|Extracellular exchange::spc_hs_e --> []"
		"EX_spc_hs_e|Extracellular exchange_reverse::[] --> spc_hs_e"
		"EX_sphs1p_e|Extracellular exchange::sphs1p_e --> []"
		"EX_sphs1p_e|Extracellular exchange_reverse::[] --> sphs1p_e"
		"EX_srtn_e|Extracellular exchange::srtn_e --> []"
		"EX_srtn_e|Extracellular exchange_reverse::[] --> srtn_e"
		"EX_succ_e|Extracellular exchange::succ_e --> []"
		"EX_succ_e|Extracellular exchange_reverse::[] --> succ_e"
		"EX_tcynt_e|Extracellular exchange::tcynt_e --> []"
		"EX_tcynt_e|Extracellular exchange_reverse::[] --> tcynt_e"
		"EX_thym_e|Extracellular exchange::thym_e --> []"
		"EX_thym_e|Extracellular exchange_reverse::[] --> thym_e"
		"EX_thymd_e|Extracellular exchange::thymd_e --> []"
		"EX_thymd_e|Extracellular exchange_reverse::[] --> thymd_e"
		"EX_trp_L_e|Extracellular exchange::trp_L_e --> []"
		"EX_trp_L_e|Extracellular exchange_reverse::[] --> trp_L_e"
		"EX_tsul_e|Extracellular exchange::tsul_e --> []"
		"EX_tsul_e|Extracellular exchange_reverse::[] --> tsul_e"
		"EX_txa2_e|Extracellular exchange::txa2_e --> []"
		"EX_txa2_e|Extracellular exchange_reverse::[] --> txa2_e"
		"EX_tymsf_e|Extracellular exchange::tymsf_e --> []"
		"EX_tymsf_e|Extracellular exchange_reverse::[] --> tymsf_e"
		"EX_tyr_L_e|Extracellular exchange::tyr_L_e --> []"
		"EX_tyr_L_e|Extracellular exchange_reverse::[] --> tyr_L_e"
		"EX_ura_e|Extracellular exchange::ura_e --> []"
		"EX_ura_e|Extracellular exchange_reverse::[] --> ura_e"
		"EX_urate_e|Extracellular exchange::urate_e --> []"
		"EX_urate_e|Extracellular exchange_reverse::[] --> urate_e"
		"EX_urea_e|Extracellular exchange::urea_e --> []"
		"EX_urea_e|Extracellular exchange_reverse::[] --> urea_e"
		"EX_uri_e|Extracellular exchange::uri_e --> []"
		"EX_uri_e|Extracellular exchange_reverse::[] --> uri_e"
		"EX_val_L_e|Extracellular exchange::val_L_e --> []"
		"EX_val_L_e|Extracellular exchange_reverse::[] --> val_L_e"
		"sink_12harachd_c|Intracellular Constraint::12harachd_c --> []"
		"sink_12harachd_c|Intracellular Constraint_reverse::[] --> 12harachd_c"
		"sink_15HPET_c|Intracellular Constraint::15HPET_c --> []"
		"sink_15HPET_c|Intracellular Constraint_reverse::[] --> 15HPET_c"
		"sink_4mop|Intracellular Constraint::4mop_c --> []"
		"sink_4mop|Intracellular Constraint_reverse::[] --> 4mop_c"
		"sink_5moxact_c|Intracellular Constraint::5moxact_c --> []"
		"sink_5moxact_c|Intracellular Constraint_reverse::[] --> 5moxact_c"
		"EX_ca2_c_ca2_e|Intracellular Constraint::ca2_c --> ca2_e"
		"EX_ca2_c_ca2_e|Intracellular Constraint_reverse::ca2_e --> ca2_c"
		"sink_homoval_c|Intracellular Constraint::homoval_c --> []"
		"sink_homoval_c|Intracellular Constraint_reverse::[] --> homoval_c"
		"sink_ind3ac_c|Intracellular Constraint::ind3ac_c --> []"
		"sink_ind3ac_c|Intracellular Constraint_reverse::[] --> ind3ac_c"
		"sink_mal_c|Intracellular Constraint::mal_L_c --> []"
		"sink_mal_c|Intracellular Constraint_reverse::[] --> mal_L_c"
		"sink_na1|Intracellular Constraint::na1_c --> []"
		"sink_na1|Intracellular Constraint_reverse::[] --> na1_c"
		"sink_txb_c|Intracellular Constraint::txb2_c --> []"
		"sink_txb_c|Intracellular Constraint_reverse::[] --> txb2_c"
		"10FTHF6GLUtm|Transport_ Mitochondrial::10fthf6glu_m --> 10fthf6glu_c"
		"10FTHF7GLUtl|Transport_ Lysosomal::10fthf7glu_c --> 10fthf7glu_l"
		"10FTHF7GLUtm|Transport_ Mitochondrial::10fthf7glu_m --> 10fthf7glu_c"
		"10FTHFtl|Transport_ Lysosomal::10fthf_c --> 10fthf_l"
		"10FTHFtl|Transport_ Lysosomal_reverse::10fthf_l --> 10fthf_c"
		"2AMADPTm|Lysine Metabolism::L2aadp_c+akg_m --> L2aadp_m+akg_c"
		"2AMADPTm|Lysine Metabolism_reverse::L2aadp_m+akg_c --> L2aadp_c+akg_m"
		"2DR1PP|Pyrimidine Catabolism::h2o_c+2dr1p_c --> drib_c+pi_c"
		"2OXOADOXm|Lysine Metabolism::coa_m+nad_m+2oxoadp_m --> nadh_m+co2_m+glutcoa_m"
		"2OXOADPTm|Tryptophan metabolism::akg_m+2oxoadp_c --> akg_c+2oxoadp_m"
		"2OXOADPTm|Tryptophan metabolism_reverse::akg_c+2oxoadp_m --> akg_m+2oxoadp_c"
		"34DHPHAMT|Tyrosine metabolism::amet_c+34dhpha_c --> homoval_c+h_c+ahcys_c"
		"34DHPLACOX|Tyrosine metabolism::h2o_c+nad_c+34dhpac_c --> nadh_c+34dhpha_c+2.0*h_c"
		"34HPPOR|Tyrosine metabolism::34hpp_c+o2_c --> hgentis_c+co2_c"
		"3HBCOAHLm|Valine_ Leucine_ and Isoleucine Metabolism::h2o_m+3hibutcoa_m --> coa_m+3hmp_m+h_m"
		"3HLYTCL|Tyrosine metabolism::34dhphe_c+h_c --> dopa_c+co2_c"
		"3M4HDXPAC|Tyrosine metabolism::3mox4hpac_c+h2o_c+nad_c --> homoval_c+nadh_c+2.0*h_c"
		"3M4HDXPAC|Tyrosine metabolism_reverse::homoval_c+nadh_c+2.0*h_c --> 3mox4hpac_c+h2o_c+nad_c"
		"3MOBt2im|Transport_ Mitochondrial::3mob_c+h_c --> 3mob_m+h_m"
		"3MOPt2im|Transport_ Mitochondrial::3mop_c+h_c --> h_m+3mop_m"
		"3MOXTYROX|Tyrosine metabolism::o2_c+h2o_c+3moxtyr_c --> 3mox4hpac_c+h2o2_c+nh4_c"
		"42A12BOOX|Tyrosine metabolism::o2_c+h2o_c+dopa_c --> h2o2_c+nh4_c+34dhpac_c"
		"4ABUTtm|Transport_ Mitochondrial::4abut_c --> 4abut_m"
		"4ABUTtm|Transport_ Mitochondrial_reverse::4abut_m --> 4abut_c"
		"4HOXPACDOX_NADP|Tyrosine metabolism::h2o_c+nadp_c+4hoxpacd_c --> 4hphac_c+2.0*h_c+nadph_c"
		"4HOXPACDOX_NADP|Tyrosine metabolism_reverse::4hphac_c+2.0*h_c+nadph_c --> h2o_c+nadp_c+4hoxpacd_c"
		"4MOPt2im|Transport_ Mitochondrial::4mop_c+h_c --> 4mop_m+h_m"
		"4NPHSFte|Transport_ Extracellular::4nphsf_e --> 4nphsf_c"
		"4NPHSFte|Transport_ Extracellular_reverse::4nphsf_c --> 4nphsf_e"
		"4NPHSULT|CYP Metabolism::paps_c+4nph_c --> pap_c+4nphsf_c+h_c"
		"4NPHte|Transport_ Extracellular::4nph_e --> 4nph_c"
		"4NPHte|Transport_ Extracellular_reverse::4nph_c --> 4nph_e"
		"5AOPtm|Heme Biosynthesis::5aop_c --> 5aop_m"
		"5AOPtm|Heme Biosynthesis_reverse::5aop_m --> 5aop_c"
		"5HLTDL|Tryptophan metabolism::5htrp_c+h_c --> srtn_c+co2_c"
		"5HOXINDACTOX|Tryptophan metabolism::5hoxindact_c+h2o_c+nad_c --> nadh_c+2.0*h_c+5hoxindoa_c"
		"5HOXINOXDA|Tryptophan metabolism::o2_c+h2o_c+srtn_c --> 5hoxindact_c+h2o2_c+nh4_c"
		"5MTHFt|Transport_ Extracellular::5mthf_e --> 5mthf_c"
		"5MTHFt|Transport_ Extracellular_reverse::5mthf_c --> 5mthf_e"
		"5MTHFt2|Transport_ Extracellular::oh1_c+5mthf_e --> oh1_e+5mthf_c"
		"5MTHFt2|Transport_ Extracellular_reverse::oh1_e+5mthf_c --> oh1_c+5mthf_e"
		"AACOAT|Propanoate Metabolism::coa_c+atp_c+acac_c --> ppi_c+amp_c+aacoa_c"
		"AACOAT|Propanoate Metabolism_reverse::ppi_c+amp_c+aacoa_c --> coa_c+atp_c+acac_c"
		"AASAD3m|Lysine Metabolism::L2aadp6sa_m+h2o_m+nad_m --> L2aadp_m+nadh_m+2.0*h_m"
		"AATAi|Lysine Metabolism::L2aadp_c+akg_c --> glu_L_c+2oxoadp_c"
		"ABTArm|Glutamate metabolism::4abut_m+akg_m --> glu_L_m+sucsal_m"
		"ABTArm|Glutamate metabolism_reverse::glu_L_m+sucsal_m --> 4abut_m+akg_m"
		"ACACT1|Cholesterol Metabolism::2.0*accoa_c --> coa_c+aacoa_c"
		"ACACT1|Cholesterol Metabolism_reverse::coa_c+aacoa_c --> 2.0*accoa_c"
		"ACACT10m|Valine_ Leucine_ and Isoleucine Metabolism::coa_m+2maacoa_m --> accoa_m+ppcoa_m"
		"ACACT10m|Valine_ Leucine_ and Isoleucine Metabolism_reverse::accoa_m+ppcoa_m --> coa_m+2maacoa_m"
		"ACACT1r|Tryptophan metabolism::2.0*accoa_c --> coa_c+aacoa_c"
		"ACACT1r|Tryptophan metabolism_reverse::coa_c+aacoa_c --> 2.0*accoa_c"
		"ACACT1rm|Tryptophan metabolism::2.0*accoa_m --> coa_m+aacoa_m"
		"ACACT1rm|Tryptophan metabolism_reverse::coa_m+aacoa_m --> 2.0*accoa_m"
		"ACCOAC|Fatty Acid Metabolism::atp_c+accoa_c+hco3_c --> malcoa_c+pi_c+h_c+adp_c"
		"ACITL|Citric Acid Cycle::coa_c+atp_c+cit_c --> oaa_c+pi_c+accoa_c+adp_c"
		"ACOAD10m|Valine_ Leucine_ and Isoleucine Metabolism::fad_m+2mbcoa_m --> 2mb2coa_m+fadh2_m"
		"ACOAD8m|Valine_ Leucine_ and Isoleucine Metabolism::fad_m+ivcoa_m --> fadh2_m+3mb2coa_m"
		"ACOAD9m|Valine_ Leucine_ and Isoleucine Metabolism::fad_m+ibcoa_m --> fadh2_m+2mp2coa_m"
		"ACONT|Citric Acid Cycle::cit_c --> icit_c"
		"ACONT|Citric Acid Cycle_reverse::icit_c --> cit_c"
		"ACONTm|Citric Acid Cycle::cit_m --> icit_m"
		"ACONTm|Citric Acid Cycle_reverse::icit_m --> cit_m"
		"ACS|Glycolysis/Gluconeogenesis::ac_c+coa_c+atp_c --> ppi_c+accoa_c+amp_c"
		"ACSOMT|Tryptophan metabolism::amet_c+5hoxindoa_c --> 5moxact_c+h_c+ahcys_c"
		"ACt2r|Transport_ Extracellular::ac_e+h_e --> ac_c+h_c"
		"ACt2r|Transport_ Extracellular_reverse::ac_c+h_c --> ac_e+h_e"
		"ADA|Purine Catabolism::adn_c+h2o_c+h_c --> ins_c+nh4_c"
		"ADAe|Nucleotides::h2o_e+adn_e+h_e --> ins_e+nh4_e"
		"ADEt|Transport_ Extracellular::ade_e --> ade_c"
		"ADEt|Transport_ Extracellular_reverse::ade_c --> ade_e"
		"ADK1|Nucleotides::atp_c+amp_c --> 2.0*adp_c"
		"ADK1|Nucleotides_reverse::2.0*adp_c --> atp_c+amp_c"
		"ADK1m|Nucleotides::atp_m+amp_m --> 2.0*adp_m"
		"ADK1m|Nucleotides_reverse::2.0*adp_m --> atp_m+amp_m"
		"ADK3m|Nucleotides::gtp_m+amp_m --> gdp_m+adp_m"
		"ADK3m|Nucleotides_reverse::gdp_m+adp_m --> gtp_m+amp_m"
		"ADNCYC|Nucleotides::atp_c --> camp_c+ppi_c"
		"ADNK1|Nucleotides::adn_c+atp_c --> h_c+adp_c+amp_c"
		"ADNt|Transport_ Extracellular::adn_e --> adn_c"
		"ADNt|Transport_ Extracellular_reverse::adn_c --> adn_e"
		"ADPRDP|Nucleotides::adprib_c+h2o_c --> 2.0*h_c+amp_c+r5p_c"
		"ADPT|Salvage Pathway::prpp_c+ade_c --> ppi_c+amp_c"
		"ADRNLPVESSEC|Transport_ Extracellular::2.0*h2o_c+2.0*atp_c+3.0*adrnl_c --> 3.0*adrnl_e+2.0*pi_c+2.0*h_c+2.0*adp_c"
		"ADSK|Nucleotides::atp_c+aps_c --> paps_c+h_c+adp_c"
		"ADSL1|Nucleotides::dcamp_c --> amp_c+fum_c"
		"ADSL2|IMP Biosynthesis::25aics_c --> fum_c+aicar_c"
		"ADSS|Nucleotides::gtp_c+imp_c+asp_L_c --> gdp_c+pi_c+2.0*h_c+dcamp_c"
		"AHC|Methionine Metabolism::h2o_c+ahcys_c --> adn_c+hcys_L_c"
		"AHC|Methionine Metabolism_reverse::adn_c+hcys_L_c --> h2o_c+ahcys_c"
		"AICART|IMP Biosynthesis::10fthf_c+aicar_c --> thf_c+fprica_c"
		"AICART|IMP Biosynthesis_reverse::thf_c+fprica_c --> 10fthf_c+aicar_c"
		"AIRCr|IMP Biosynthesis::co2_c+air_c --> 5aizc_c+h_c"
		"AIRCr|IMP Biosynthesis_reverse::5aizc_c+h_c --> co2_c+air_c"
		"AKGDm|Citric Acid Cycle::coa_m+nad_m+akg_m --> nadh_m+succoa_m+co2_m"
		"ALAGLNexR|Transport_ Extracellular::gln_L_c+ala_L_e --> gln_L_e+ala_L_c"
		"ALAGLNexR|Transport_ Extracellular_reverse::gln_L_e+ala_L_c --> gln_L_c+ala_L_e"
		"ALASm|Glycine_ Serine_ and Threonine Metabolism::gly_m+succoa_m+h_m --> coa_m+5aop_m+co2_m"
		"ALATA_L|Glutamate metabolism::ala_L_c+akg_c --> pyr_c+glu_L_c"
		"ALATA_L|Glutamate metabolism_reverse::pyr_c+glu_L_c --> ala_L_c+akg_c"
		"ALCD1|Miscellaneous::nad_c+meoh_c --> fald_c+nadh_c+h_c"
		"ALCD1|Miscellaneous_reverse::fald_c+nadh_c+h_c --> nad_c+meoh_c"
		"ALCD21_D|Pyruvate Metabolism::nad_c+12ppd_R_c --> lald_D_c+nadh_c+h_c"
		"ALCD21_D|Pyruvate Metabolism_reverse::lald_D_c+nadh_c+h_c --> nad_c+12ppd_R_c"
		"ALCD21_L|Pyruvate Metabolism::12ppd_S_c+nad_c --> lald_L_c+nadh_c+h_c"
		"ALDD19x|Phenylalanine metabolism::h2o_c+nad_c+pacald_c --> pac_c+nadh_c+2.0*h_c"
		"ALDD19x_P|Phenylalanine metabolism::h2o_c+nadp_c+pacald_c --> pac_c+2.0*h_c+nadph_c"
		"ALDD20x|Tryptophan metabolism::h2o_c+nad_c+id3acald_c --> ind3ac_c+nadh_c+2.0*h_c"
		"ALDD2x|Glycolysis/Gluconeogenesis::h2o_c+acald_c+nad_c --> ac_c+nadh_c+2.0*h_c"
		"ALDD2y|Glycolysis/Gluconeogenesis::h2o_c+nadp_c+acald_c --> ac_c+2.0*h_c+nadph_c"
		"ALOX12|Eicosanoid Metabolism::o2_c+arachd_c --> 12HPET_c"
		"ALOX15|Eicosanoid Metabolism::o2_c+arachd_c --> 15HPET_c"
		"ALOX5|Eicosanoid Metabolism::o2_c+arachd_c --> 5HPET_c"
		"ALOX52|Eicosanoid Metabolism::5HPET_c --> h2o_c+leuktrA4_c"
		"ALR|Glycine_ Serine_ and Threonine Metabolism::h2o_c+nadp_c+mthgxl_c --> pyr_c+2.0*h_c+nadph_c"
		"ALR2|Pyruvate Metabolism::h_c+mthgxl_c+nadph_c --> nadp_c+acetol_c"
		"ALR3|Pyruvate Metabolism::acetol_c+h_c+nadph_c --> 12ppd_S_c+nadp_c"
		"AMPDA|Nucleotides::h2o_c+h_c+amp_c --> nh4_c+imp_c"
		"AMPTASECGe|Glutathione Metabolism::h2o_e+cgly_e --> cys_L_e+gly_e"
		"APAT2rm|beta-Alanine metabolism::ala_B_m+akg_m --> glu_L_m+msa_m"
		"APAT2rm|beta-Alanine metabolism_reverse::glu_L_m+msa_m --> ala_B_m+akg_m"
		"ARACHDt2|Transport_ Extracellular::arachd_e --> arachd_c"
		"ARACHDt2|Transport_ Extracellular_reverse::arachd_c --> arachd_e"
		"ARACHDtr|Transport_ Endoplasmic Reticular::arachd_c --> arachd_r"
		"ARACHDtr|Transport_ Endoplasmic Reticular_reverse::arachd_r --> arachd_c"
		"ARGN|Urea cycle/amino group metabolism::h2o_c+arg_L_c --> urea_c+orn_c"
		"ARGSL|Alanine and Aspartate Metabolism::argsuc_c --> fum_c+arg_L_c"
		"ARGSL|Alanine and Aspartate Metabolism_reverse::fum_c+arg_L_c --> argsuc_c"
		"ARGSS|Alanine and Aspartate Metabolism::atp_c+citr_L_c+asp_L_c --> ppi_c+h_c+amp_c+argsuc_c"
		"ARGtiDF|Transport_ Extracellular::arg_L_e --> arg_L_c"
		"ARGtiDF|Transport_ Extracellular_reverse::arg_L_c --> arg_L_e"
		"ASCBt|Transport_ Extracellular::ascb_L_e --> ascb_L_c"
		"ASCBt|Transport_ Extracellular_reverse::ascb_L_c --> ascb_L_e"
		"ASCBt4|Transport_ Extracellular::na1_e+ascb_L_e --> na1_c+ascb_L_c"
		"ASCBt4|Transport_ Extracellular_reverse::na1_c+ascb_L_c --> na1_e+ascb_L_e"
		"ASNALANaEx|Transport_ Extracellular::na1_e+ala_L_c+asn_L_e --> na1_c+asn_L_c+ala_L_e"
		"ASNNm|Alanine and Aspartate Metabolism::asn_L_m+h2o_m --> nh4_m+asp_L_m"
		"ASNSERNaEx|Transport_ Extracellular::na1_e+ser_L_c+asn_L_e --> na1_c+asn_L_c+ser_L_e"
		"ASNtm|Transport_ Mitochondrial::asn_L_c --> asn_L_m"
		"ASPTA|Alanine and Aspartate Metabolism::asp_L_c+akg_c --> oaa_c+glu_L_c"
		"ASPTA|Alanine and Aspartate Metabolism_reverse::oaa_c+glu_L_c --> asp_L_c+akg_c"
		"ASPTAm|Alanine and Aspartate Metabolism::asp_L_m+akg_m --> glu_L_m+oaa_m"
		"ASPTAm|Alanine and Aspartate Metabolism_reverse::glu_L_m+oaa_m --> asp_L_m+akg_m"
		"ASPt6|Transport_ Extracellular::3.0*na1_e+h_e+asp_L_e+k_c --> 3.0*na1_c+h_c+asp_L_c+k_e"
		"ASPt6|Transport_ Extracellular_reverse::3.0*na1_c+h_c+asp_L_c+k_e --> 3.0*na1_e+h_e+asp_L_e+k_c"
		"ATPH2e|Nucleotides::h2o_e+adp_e --> pi_e+h_e+amp_e"
		"ATPS4m|Oxidative Phosphorylation::pi_m+4.0*h_c+adp_m --> atp_m+h2o_m+3.0*h_m"
		"BALAtmr|Transport_ Mitochondrial::ala_B_c --> ala_B_m"
		"BALAtmr|Transport_ Mitochondrial_reverse::ala_B_m --> ala_B_c"
		"BHMT|Glycine_ Serine_ and Threonine Metabolism::hcys_L_c+glyb_c --> dmgly_c+met_L_c"
		"BILIRED|Heme Degradation::biliverd_c+h_c+nadph_c --> bilirub_c+nadp_c"
		"BILIRUBt2|Transport_ Extracellular::bilirub_e+hco3_c --> bilirub_c+hco3_e"
		"BILIRUBt2|Transport_ Extracellular_reverse::bilirub_c+hco3_e --> bilirub_e+hco3_c"
		"BPNT|Nucleotides::pap_c+h2o_c --> pi_c+amp_c"
		"C160CPT1|Carnitine shuttle::pmtcoa_c+crn_c --> pmtcrn_c+coa_c"
		"C160CPT2|Carnitine shuttle::pmtcrn_m+coa_m --> pmtcoa_m+crn_m"
		"C160CRNt|Carnitine shuttle::pmtcrn_c --> pmtcrn_m"
		"C180CPT1|Carnitine shuttle::stcoa_c+crn_c --> coa_c+stcrn_c"
		"C180CPT2|Carnitine shuttle::stcrn_m+coa_m --> stcoa_m+crn_m"
		"C180CRNt|Carnitine shuttle::stcrn_c --> stcrn_m"
		"C181CPT1|Carnitine shuttle::odecoa_c+crn_c --> coa_c+odecrn_c"
		"C181CPT2|Carnitine shuttle::coa_m+odecrn_m --> odecoa_m+crn_m"
		"C181CRNt|Carnitine shuttle::odecrn_c --> odecrn_m"
		"C204CPT1|Carnitine shuttle::arachdcoa_c+crn_c --> coa_c+arachdcrn_c"
		"C204CPT2|Carnitine shuttle::arachdcrn_m+coa_m --> arachdcoa_m+crn_m"
		"C204CRNt|Carnitine shuttle::arachdcrn_c --> arachdcrn_m"
		"CAATPS|Transport_ Extracellular::h2o_c+atp_c+2.0*ca2_c --> 2.0*ca2_e+pi_c+h_e+adp_c"
		"CATm|ROS Detoxification::2.0*h2o2_m --> o2_m+2.0*h2o_m"
		"CATp|Miscellaneous::2.0*h2o2_x --> o2_x+2.0*h2o_x"
		"CBPSam|Glutamate metabolism::2.0*atp_m+nh4_m+hco3_m --> cbp_m+pi_m+2.0*h_m+2.0*adp_m"
		"CGMPt|Transport_ Extracellular::35cgmp_c+h2o_c+atp_c --> 35cgmp_e+pi_c+h_c+adp_c"
		"CHLPCTD|Glycerophospholipid Metabolism::cholp_c+ctp_c+h_c --> ppi_c+cdpchol_c"
		"CHOLt4|Transport_ Extracellular::na1_e+chol_e --> na1_c+chol_c"
		"CHOLt4|Transport_ Extracellular_reverse::na1_c+chol_c --> na1_e+chol_e"
		"CHOLtu|Transport_ Extracellular::chol_e --> chol_c"
		"CHOLtu|Transport_ Extracellular_reverse::chol_c --> chol_e"
		"CITRtm|Transport_ Mitochondrial::citr_L_m --> citr_L_c"
		"CITRtm|Transport_ Mitochondrial_reverse::citr_L_c --> citr_L_m"
		"CITt4_2|Transport_ Extracellular::2.0*na1_e+cit_e --> 2.0*na1_c+cit_c"
		"CITt4_2|Transport_ Extracellular_reverse::2.0*na1_c+cit_c --> 2.0*na1_e+cit_e"
		"CITt4_4|Transport_ Extracellular::4.0*na1_e+cit_e --> 4.0*na1_c+cit_c"
		"CITt4_4|Transport_ Extracellular_reverse::4.0*na1_c+cit_c --> 4.0*na1_e+cit_e"
		"CLOHtex2|Transport_ Extracellular::oh1_c+2.0*cl_e --> 2.0*cl_c+oh1_e"
		"CLOHtex2|Transport_ Extracellular_reverse::2.0*cl_c+oh1_e --> oh1_c+2.0*cl_e"
		"CO2t|Transport_ Extracellular::co2_e --> co2_c"
		"CO2t|Transport_ Extracellular_reverse::co2_c --> co2_e"
		"COt|Transport_ Extracellular::co_c --> co_e"
		"COt|Transport_ Extracellular_reverse::co_e --> co_c"
		"CPPPGO|Heme Biosynthesis::o2_c+2.0*h_c+cpppg3_c --> 2.0*h2o_c+pppg9_c+2.0*co2_c"
		"CREATt4_2r|Transport_ Extracellular::2.0*na1_e+creat_e --> 2.0*na1_c+creat_c"
		"CREATt4_2r|Transport_ Extracellular_reverse::2.0*na1_c+creat_c --> 2.0*na1_e+creat_e"
		"CRNt|Transport_ Extracellular::crn_e --> crn_c"
		"CRNt|Transport_ Extracellular_reverse::crn_c --> crn_e"
		"CRNtim|Transport_ Mitochondrial::crn_m --> crn_c"
		"CRNtuIR|Transport_ Extracellular::crn_e --> crn_c"
		"CRNtuIR|Transport_ Extracellular_reverse::crn_c --> crn_e"
		"CRNtuNa|Transport_ Extracellular::na1_e+crn_e --> na1_c+crn_c"
		"CRNtuNa|Transport_ Extracellular_reverse::na1_c+crn_c --> na1_e+crn_e"
		"CSNATr|Carnitine shuttle::accoa_c+crn_c --> coa_c+acrn_c"
		"CSNATr|Carnitine shuttle_reverse::coa_c+acrn_c --> accoa_c+crn_c"
		"CSm|Citric Acid Cycle::h2o_m+oaa_m+accoa_m --> coa_m+h_m+cit_m"
		"CYANSTm|Cysteine Metabolism::cyan_m+tsul_m --> tcynt_m+h_m+so3_m"
		"CYANt|Transport_ Extracellular::cyan_e --> cyan_c"
		"CYANt|Transport_ Extracellular_reverse::cyan_c --> cyan_e"
		"CYANtm|Transport_ Mitochondrial::cyan_c --> cyan_m"
		"CYANtm|Transport_ Mitochondrial_reverse::cyan_m --> cyan_c"
		"CYOOm2|Oxidative Phosphorylation::o2_m+4.0*focytC_m+8.0*h_m --> 2.0*h2o_m+4.0*h_c+4.0*ficytC_m"
		"CYOR_u10m|Oxidative Phosphorylation::2.0*h_m+q10h2_m+2.0*ficytC_m --> 2.0*focytC_m+4.0*h_c+q10_m"
		"CYSGLTH|Cysteine Metabolism::Lcystin_c+2.0*gthrd_c --> 2.0*cys_L_c+gthox_c"
		"CYSGLTH|Cysteine Metabolism_reverse::2.0*cys_L_c+gthox_c --> Lcystin_c+2.0*gthrd_c"
		"CYSTA|Cysteine Metabolism::cys_L_c+akg_c --> mercppyr_c+glu_L_c"
		"CYSTA|Cysteine Metabolism_reverse::mercppyr_c+glu_L_c --> cys_L_c+akg_c"
		"CYSTGLUex|Transport_ Extracellular::Lcystin_e+glu_L_c --> glu_L_e+Lcystin_c"
		"CYTDt|Transport_ Extracellular::cytd_e --> cytd_c"
		"CYTDt|Transport_ Extracellular_reverse::cytd_c --> cytd_e"
		"CYTK1|Nucleotides::cmp_c+atp_c --> cdp_c+adp_c"
		"CYTK1|Nucleotides_reverse::cdp_c+adp_c --> cmp_c+atp_c"
		"CYTK6|Nucleotides::cmp_c+ctp_c --> 2.0*cdp_c"
		"CYTK6|Nucleotides_reverse::2.0*cdp_c --> cmp_c+ctp_c"
		"CYTK7|Nucleotides::utp_c+cmp_c --> cdp_c+udp_c"
		"CYTK7|Nucleotides_reverse::cdp_c+udp_c --> utp_c+cmp_c"
		"DADA|Nucleotides::h2o_c+dad_2_c+h_c --> nh4_c+din_c"
		"DGULND|Pentose and Glucuronate Interconversions::h_c+3dhguln_c --> co2_c+xylu_L_c"
		"DGULND|Pentose and Glucuronate Interconversions_reverse::co2_c+xylu_L_c --> h_c+3dhguln_c"
		"DHAAt1r|Transport_ Extracellular::dhdascb_e --> dhdascb_c"
		"DHAAt1r|Transport_ Extracellular_reverse::dhdascb_c --> dhdascb_e"
		"DHPM1|Pyrimidine Catabolism::h2o_c+56dura_c --> h_c+cala_c"
		"DHPR2|Tetrahydrobiopterin::dhbpt_c+5mthf_c --> mlthf_c+thbpt_c+h_c"
		"DMGDHm|Glycine_ Serine_ and Threonine Metabolism::fad_m+h2o_m+dmgly_m --> fald_m+sarcs_m+fadh2_m"
		"DMGtm|Transport_ Mitochondrial::dmgly_c --> dmgly_m"
		"DMGtm|Transport_ Mitochondrial_reverse::dmgly_m --> dmgly_c"
		"DOPABMO|Tyrosine metabolism::o2_c+dopa_c+ascb_L_c --> h2o_c+nrpphr_c+dhdascb_c"
		"DOPAMT|Tyrosine metabolism::amet_c+dopa_c --> 3moxtyr_c+h_c+ahcys_c"
		"DOPASFt|Transport_ Extracellular::dopasf_c --> dopasf_e"
		"DOPASULT|Tyrosine metabolism::dopa_c+paps_c --> pap_c+dopasf_c+h_c"
		"DOPAVESSEC|Transport_ Extracellular::2.0*h2o_c+3.0*dopa_c+2.0*atp_c --> 3.0*dopa_e+2.0*pi_c+2.0*h_c+2.0*adp_c"
		"DPGM|Glycolysis/Gluconeogenesis::13dpg_c --> 23dpg_c+h_c"
		"DPGM|Glycolysis/Gluconeogenesis_reverse::23dpg_c+h_c --> 13dpg_c"
		"DPGase|Glycolysis/Gluconeogenesis::h2o_c+23dpg_c --> pi_c+3pg_c"
		"DRBK|Pentose Phosphate Pathway::atp_c+drib_c --> 2dr5p_c+h_c+adp_c"
		"DRPA|Pentose Phosphate Pathway::2dr5p_c --> acald_c+g3p_c"
		"DURAD|Pyrimidine Catabolism::56dura_c+nadp_c --> ura_c+h_c+nadph_c"
		"DURAD|Pyrimidine Catabolism_reverse::ura_c+h_c+nadph_c --> 56dura_c+nadp_c"
		"ECOAH12m|Valine_ Leucine_ and Isoleucine Metabolism::h2o_m+2mp2coa_m --> 3hibutcoa_m"
		"ECOAH12m|Valine_ Leucine_ and Isoleucine Metabolism_reverse::3hibutcoa_m --> h2o_m+2mp2coa_m"
		"ECOAH1m|Tryptophan metabolism::3hbcoa_m --> h2o_m+b2coa_m"
		"ECOAH1m|Tryptophan metabolism_reverse::h2o_m+b2coa_m --> 3hbcoa_m"
		"ECOAH9m|Valine_ Leucine_ and Isoleucine Metabolism::h2o_m+2mb2coa_m --> 3hmbcoa_m"
		"ECOAH9m|Valine_ Leucine_ and Isoleucine Metabolism_reverse::3hmbcoa_m --> h2o_m+2mb2coa_m"
		"ENO|Glycolysis/Gluconeogenesis::2pg_c --> pep_c+h2o_c"
		"ENO|Glycolysis/Gluconeogenesis_reverse::pep_c+h2o_c --> 2pg_c"
		"ESTSULT|Steroid Metabolism::paps_c+estrone_c --> pap_c+h_c+estrones_c"
		"ETF|Fatty acid oxidation::etfox_m+fadh2_m --> fad_m+etfrd_m"
		"ETFQO|Fatty acid oxidation::etfrd_m+q10_m --> etfox_m+q10h2_m"
		"FACOAL160i|Fatty acid activation::coa_c+hdca_c+atp_c --> ppi_c+pmtcoa_c+amp_c"
		"FACOAL180i|Fatty acid activation::coa_c+atp_c+ocdca_c --> ppi_c+amp_c+stcoa_c"
		"FACOAL181i|Fatty acid activation::ocdcea_c+coa_c+atp_c --> ppi_c+amp_c+odecoa_c"
		"FACOAL1821|Fatty acid activation::coa_c+lnlc_c+atp_c --> ppi_c+amp_c+lnlccoa_c"
		"FACOAL1821|Fatty acid activation_reverse::ppi_c+amp_c+lnlccoa_c --> coa_c+lnlc_c+atp_c"
		"FACOAL204i|Fatty acid activation::coa_c+atp_c+arachd_c --> ppi_c+arachdcoa_c+amp_c"
		"FALDH|Tyrosine metabolism::fald_c+nad_c+gthrd_c --> nadh_c+Sfglutth_c+h_c"
		"FALDH|Tyrosine metabolism_reverse::nadh_c+Sfglutth_c+h_c --> fald_c+nad_c+gthrd_c"
		"FALDtm|Transport_ Mitochondrial::fald_m --> fald_c"
		"FALDtm|Transport_ Mitochondrial_reverse::fald_c --> fald_m"
		"FAOXC160|Fatty acid oxidation::7.0*fad_m+7.0*h2o_m+7.0*coa_m+7.0*nad_m+pmtcoa_m --> 7.0*nadh_m+8.0*accoa_m+7.0*fadh2_m+7.0*h_m"
		"FAOXC16080m|Fatty acid oxidation::4.0*fad_m+4.0*h2o_m+4.0*coa_m+4.0*nad_m+pmtcoa_m --> 4.0*nadh_m+4.0*accoa_m+4.0*fadh2_m+4.0*h_m+occoa_m"
		"FAOXC180|Fatty acid oxidation::fad_m+h2o_m+coa_m+nad_m+stcoa_m --> nadh_m+pmtcoa_m+accoa_m+fadh2_m+h_m"
		"FAOXC1811603m|Fatty acid oxidation::4.0*fad_m+5.0*h2o_m+5.0*coa_m+5.0*nad_m+odecoa_m --> 5.0*nadh_m+5.0*accoa_m+4.0*fadh2_m+5.0*h_m+occoa_m"
		"FAOXC182806m|Fatty acid oxidation::3.0*fad_m+5.0*h2o_m+5.0*coa_m+5.0*nad_m+lnlccoa_m --> 5.0*nadh_m+5.0*accoa_m+3.0*fadh2_m+5.0*h_m+occoa_m"
		"FAOXC204|Fatty acid oxidation::5.0*fad_m+9.0*h2o_m+arachdcoa_m+9.0*coa_m+9.0*nad_m --> 9.0*nadh_m+10.0*accoa_m+5.0*fadh2_m+9.0*h_m"
		"FAOXC80|Fatty acid oxidation::3.0*fad_m+3.0*h2o_m+3.0*coa_m+3.0*nad_m+occoa_m --> 3.0*nadh_m+4.0*accoa_m+3.0*fadh2_m+3.0*h_m"
		"FAS100COA|Fatty acid elongation::malcoa_c+3.0*h_c+occoa_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+dcacoa_c+co2_c"
		"FAS120COA|Fatty acid elongation::malcoa_c+3.0*h_c+dcacoa_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+ddcacoa_c+co2_c"
		"FAS140COA|Fatty acid elongation::malcoa_c+ddcacoa_c+3.0*h_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+tdcoa_c+co2_c"
		"FAS160COA|Fatty acid elongation::malcoa_c+tdcoa_c+3.0*h_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+pmtcoa_c+co2_c"
		"FAS180COA|Fatty acid elongation::malcoa_c+pmtcoa_c+3.0*h_c+2.0*nadph_c --> h2o_c+2.0*nadp_c+coa_c+stcoa_c+co2_c"
		"FAS80COA_L|Fatty acid elongation::3.0*malcoa_c+accoa_c+9.0*h_c+6.0*nadph_c --> 3.0*h2o_c+6.0*nadp_c+3.0*coa_c+occoa_c+3.0*co2_c"
		"FATP1t|Transport_ Extracellular::na1_c+hdca_c --> na1_e+hdca_e"
		"FATP1t|Transport_ Extracellular_reverse::na1_e+hdca_e --> na1_c+hdca_c"
		"FATP2t|Transport_ Extracellular::na1_c+ocdcea_c --> na1_e+ocdcea_e"
		"FATP2t|Transport_ Extracellular_reverse::na1_e+ocdcea_e --> na1_c+ocdcea_c"
		"FATP3t|Transport_ Extracellular::na1_c+ocdca_c --> na1_e+ocdca_e"
		"FATP3t|Transport_ Extracellular_reverse::na1_e+ocdca_e --> na1_c+ocdca_c"
		"FATP5t|Transport_ Extracellular::na1_c+arachd_c --> na1_e+arachd_e"
		"FATP5t|Transport_ Extracellular_reverse::na1_e+arachd_e --> na1_c+arachd_c"
		"FBA|Glycolysis/Gluconeogenesis::fdp_c --> dhap_c+g3p_c"
		"FBA|Glycolysis/Gluconeogenesis_reverse::dhap_c+g3p_c --> fdp_c"
		"FBA2|Fructose and Mannose Metabolism::f1p_c --> dhap_c+glyald_c"
		"FBA2|Fructose and Mannose Metabolism_reverse::dhap_c+glyald_c --> f1p_c"
		"FBP|Glycolysis/Gluconeogenesis::h2o_c+fdp_c --> f6p_c+pi_c"
		"FBP26|Fructose and Mannose Metabolism::h2o_c+f26bp_c --> f6p_c+pi_c"
		"FCLTm|Heme Biosynthesis::fe2_m+ppp9_m --> 2.0*h_m+pheme_m"
		"FE2t|Transport_ Extracellular::fe2_e --> fe2_c"
		"FE2tm|Transport_ Mitochondrial::fe2_c+h_c --> fe2_m+h_m"
		"FPGS7m|Folate Metabolism::4.0*atp_m+10fthf_m+4.0*glu_L_m --> 10fthf5glu_m+4.0*pi_m+4.0*h_m+4.0*adp_m"
		"FPGS8m|Folate Metabolism::atp_m+10fthf5glu_m+glu_L_m --> 10fthf6glu_m+pi_m+h_m+adp_m"
		"FPGS9|Folate Metabolism::10fthf6glu_c+atp_c+glu_L_c --> pi_c+h_c+adp_c+10fthf7glu_c"
		"FPGS9m|Folate Metabolism::atp_m+glu_L_m+10fthf6glu_m --> pi_m+h_m+adp_m+10fthf7glu_m"
		"FRUt1r|Transport_ Extracellular::fru_e --> fru_c"
		"FRUt1r|Transport_ Extracellular_reverse::fru_c --> fru_e"
		"FRUt4|Transport_ Extracellular::na1_e+fru_e --> na1_c+fru_c"
		"FRUt4|Transport_ Extracellular_reverse::na1_c+fru_c --> na1_e+fru_e"
		"FTHFL|Folate Metabolism::for_c+thf_c+atp_c --> 10fthf_c+pi_c+adp_c"
		"FTHFL|Folate Metabolism_reverse::10fthf_c+pi_c+adp_c --> for_c+thf_c+atp_c"
		"FUMAC|Tyrosine metabolism::h2o_c+4fumacac_c --> h_c+fum_c+acac_c"
		"FUMSO3tm|Transport_ Mitochondrial::fum_c+so3_m --> so3_c+fum_m"
		"FUMSO3tm|Transport_ Mitochondrial_reverse::so3_c+fum_m --> fum_c+so3_m"
		"FUMTSULtm|Transport_ Mitochondrial::fum_c+tsul_m --> fum_m+tsul_c"
		"FUMTSULtm|Transport_ Mitochondrial_reverse::fum_m+tsul_c --> fum_c+tsul_m"
		"FUMm|Citric Acid Cycle::h2o_m+fum_m --> mal_L_m"
		"FUMm|Citric Acid Cycle_reverse::mal_L_m --> h2o_m+fum_m"
		"FUMtm|Transport_ Mitochondrial::pi_m+fum_c --> pi_c+fum_m"
		"FUMtm|Transport_ Mitochondrial_reverse::pi_c+fum_m --> pi_m+fum_c"
		"G3PD1|Glycerophospholipid Metabolism::glyc3p_c+nad_c --> nadh_c+dhap_c+h_c"
		"G3PD1|Glycerophospholipid Metabolism_reverse::nadh_c+dhap_c+h_c --> glyc3p_c+nad_c"
		"G3PD2m|Glycolysis/Gluconeogenesis::fad_m+glyc3p_c --> fadh2_m+dhap_c"
		"G5SADrm|Proline Metabolism::glu5sa_m --> h2o_m+1pyr5c_m+h_m"
		"G5SADrm|Proline Metabolism_reverse::h2o_m+1pyr5c_m+h_m --> glu5sa_m"
		"G6PDH2r|Pentose Phosphate Pathway::nadp_c+g6p_c --> 6pgl_c+h_c+nadph_c"
		"G6PDH2r|Pentose Phosphate Pathway_reverse::6pgl_c+h_c+nadph_c --> nadp_c+g6p_c"
		"G6PPer|Glycolysis/Gluconeogenesis::h2o_r+g6p_r --> pi_r+glc_D_r"
		"G6Pter|Transport_ Endoplasmic Reticular::g6p_c --> g6p_r"
		"G6Pter|Transport_ Endoplasmic Reticular_reverse::g6p_r --> g6p_c"
		"GACMTRc|Urea cycle/amino group metabolism::amet_c+gudac_c --> h_c+creat_c+ahcys_c"
		"GACMTRc|Urea cycle/amino group metabolism_reverse::h_c+creat_c+ahcys_c --> amet_c+gudac_c"
		"GALK|Galactose metabolism::atp_c+gal_c --> gal1p_c+h_c+adp_c"
		"GALT|Galactose metabolism::utp_c+gal1p_c+h_c --> udpgal_c+ppi_c"
		"GALT|Galactose metabolism_reverse::udpgal_c+ppi_c --> utp_c+gal1p_c+h_c"
		"GALU|Galactose metabolism::utp_c+h_c+g1p_c --> ppi_c+udpg_c"
		"GALU|Galactose metabolism_reverse::ppi_c+udpg_c --> utp_c+h_c+g1p_c"
		"GALt1r|Transport_ Extracellular::gal_e --> gal_c"
		"GALt1r|Transport_ Extracellular_reverse::gal_c --> gal_e"
		"GAPD|Glycolysis/Gluconeogenesis::nad_c+pi_c+g3p_c --> nadh_c+13dpg_c+h_c"
		"GAPD|Glycolysis/Gluconeogenesis_reverse::nadh_c+13dpg_c+h_c --> nad_c+pi_c+g3p_c"
		"GARFT|IMP Biosynthesis::10fthf_c+gar_c --> thf_c+fgam_c+h_c"
		"GARFT|IMP Biosynthesis_reverse::thf_c+fgam_c+h_c --> 10fthf_c+gar_c"
		"GGH_10FTHF5GLUl|Folate Metabolism::4.0*h2o_l+10fthf5glu_l --> 10fthf_l+4.0*glu_L_l"
		"GGH_10FTHF6GLUl|Folate Metabolism::h2o_l+10fthf6glu_l --> 10fthf5glu_l+glu_L_l"
		"GGH_10FTHF7GLUl|Folate Metabolism::h2o_l+10fthf7glu_l --> glu_L_l+10fthf6glu_l"
		"GGLUCT|Glutathione Metabolism::gluala_e --> 5oxpro_c+ala_L_c"
		"GGNG|Starch and Sucrose Metabolism::Tyr_ggn_c+8.0*udpg_c --> 8.0*udp_c+8.0*h_c+ggn_c"
		"GGT5r|Eicosanoid Metabolism::h2o_r+leuktrC4_r --> glu_L_r+leuktrD4_r"
		"GGT5r|Eicosanoid Metabolism_reverse::glu_L_r+leuktrD4_r --> h2o_r+leuktrC4_r"
		"GGT6|Eicosanoid Metabolism::glu_L_c+leuktrE4_c --> leuktrF4_c+h2o_c"
		"GGT6|Eicosanoid Metabolism_reverse::leuktrF4_c+h2o_c --> glu_L_c+leuktrE4_c"
		"GHMT2r|Glycine_ Serine_ and Threonine Metabolism::ser_L_c+thf_c --> mlthf_c+h2o_c+gly_c"
		"GHMT2r|Glycine_ Serine_ and Threonine Metabolism_reverse::mlthf_c+h2o_c+gly_c --> ser_L_c+thf_c"
		"GK1|Nucleotides::atp_c+gmp_c --> gdp_c+adp_c"
		"GK1|Nucleotides_reverse::gdp_c+adp_c --> atp_c+gmp_c"
		"GLBRAN|Starch and Sucrose Metabolism::glygn1_c --> glygn2_c"
		"GLCURter|Transport_ Endoplasmic Reticular::glcur_c --> glcur_r"
		"GLCt1r|Transport_ Extracellular::glc_D_e --> glc_D_c"
		"GLCt1r|Transport_ Extracellular_reverse::glc_D_c --> glc_D_e"
		"GLCter|Transport_ Endoplasmic Reticular::glc_D_c --> glc_D_r"
		"GLCter|Transport_ Endoplasmic Reticular_reverse::glc_D_r --> glc_D_c"
		"GLDBRAN|Starch and Sucrose Metabolism::h2o_c+dxtrn_c --> glc_D_c+glygn3_c"
		"GLGNS1|Starch and Sucrose Metabolism::ggn_c+3.0*udpg_c --> 3.0*udp_c+3.0*h_c+glygn1_c"
		"GLNS|Glutamate metabolism::nh4_c+atp_c+glu_L_c --> gln_L_c+pi_c+h_c+adp_c"
		"GLNtm|Transport_ Mitochondrial::gln_L_c --> gln_L_m"
		"GLPASE1|Starch and Sucrose Metabolism::glygn2_c+3.0*pi_c --> dxtrn_c+3.0*g1p_c"
		"GLPASE2|Starch and Sucrose Metabolism::7.0*h2o_c+glygn3_c --> Tyr_ggn_c+7.0*glc_D_c"
		"GLUCYS|Glutathione Metabolism::cys_L_c+atp_c+glu_L_c --> glucys_c+pi_c+h_c+adp_c"
		"GLUDC|Glutamate metabolism::h_c+glu_L_c --> 4abut_c+co2_c"
		"GLUDxm|Glutamate metabolism::h2o_m+glu_L_m+nad_m --> nadh_m+nh4_m+h_m+akg_m"
		"GLUDxm|Glutamate metabolism_reverse::nadh_m+nh4_m+h_m+akg_m --> h2o_m+glu_L_m+nad_m"
		"GLUNm|Glutamate metabolism::h2o_m+gln_L_m --> glu_L_m+nh4_m"
		"GLUPRT|IMP Biosynthesis::gln_L_c+h2o_c+prpp_c --> ppi_c+pram_c+glu_L_c"
		"GLUTCOADHm|Tryptophan metabolism::fad_m+h_m+glutcoa_m --> b2coa_m+fadh2_m+co2_m"
		"GLUt6|Transport_ Extracellular::3.0*na1_e+glu_L_e+h_e+k_c --> 3.0*na1_c+h_c+glu_L_c+k_e"
		"GLUt7l|Transport_ Lysosomal::glu_L_l --> glu_L_c"
		"GLUtr|Transport_ Endoplasmic Reticular::glu_L_c --> glu_L_r"
		"GLUtr|Transport_ Endoplasmic Reticular_reverse::glu_L_r --> glu_L_c"
		"GLYAMDTRc|Urea cycle/amino group metabolism::gly_c+arg_L_c --> gudac_c+orn_c"
		"GLYAMDTRc|Urea cycle/amino group metabolism_reverse::gudac_c+orn_c --> gly_c+arg_L_c"
		"GLYBt4_2r|Transport_ Extracellular::2.0*na1_e+glyb_e --> 2.0*na1_c+glyb_c"
		"GLYBt4_2r|Transport_ Extracellular_reverse::2.0*na1_c+glyb_c --> 2.0*na1_e+glyb_e"
		"GLYK|Glycerophospholipid Metabolism::glyc_c+atp_c --> glyc3p_c+h_c+adp_c"
		"GLYOX|Pyruvate Metabolism::h2o_c+lgt_S_c --> lac_D_c+h_c+gthrd_c"
		"GMPR|Nucleotides::2.0*h_c+gmp_c+nadph_c --> nadp_c+nh4_c+imp_c"
		"GND|Pentose Phosphate Pathway::nadp_c+6pgc_c --> co2_c+nadph_c+ru5p_D_c"
		"GPDDA1|Glycerophospholipid Metabolism::h2o_c+g3pc_c --> chol_c+glyc3p_c+h_c"
		"GSNt|Transport_ Extracellular::gsn_e --> gsn_c"
		"GSNt|Transport_ Extracellular_reverse::gsn_c --> gsn_e"
		"GTHO|Glutamate metabolism::h_c+gthox_c+nadph_c --> nadp_c+2.0*gthrd_c"
		"GTHOm|Glutamate metabolism::h_m+gthox_m+nadph_m --> nadp_m+2.0*gthrd_m"
		"GTHP|Glutathione Metabolism::h2o2_c+2.0*gthrd_c --> 2.0*h2o_c+gthox_c"
		"GTHP|Glutathione Metabolism_reverse::2.0*h2o_c+gthox_c --> h2o2_c+2.0*gthrd_c"
		"GTHPe|Glutathione Metabolism::h2o2_e+2.0*gthrd_e --> 2.0*h2o_e+gthox_e"
		"GTHPe|Glutathione Metabolism_reverse::2.0*h2o_e+gthox_e --> h2o2_e+2.0*gthrd_e"
		"GTHPm|Glutathione Metabolism::h2o2_m+2.0*gthrd_m --> 2.0*h2o_m+gthox_m"
		"GTHPm|Glutathione Metabolism_reverse::2.0*h2o_m+gthox_m --> h2o2_m+2.0*gthrd_m"
		"GTHRDtr|Transport_ Endoplasmic Reticular::gthrd_c --> gthrd_r"
		"GTHRDtr|Transport_ Endoplasmic Reticular_reverse::gthrd_r --> gthrd_c"
		"GTHS|Glutathione Metabolism::atp_c+glucys_c+gly_c --> pi_c+h_c+adp_c+gthrd_c"
		"GTMLTe|Glutathione Metabolism::ala_L_c+gthrd_c --> cgly_e+gluala_e"
		"GUACYC|Nucleotides::gtp_c --> 35cgmp_c+ppi_c"
		"GUAPRT|Salvage Pathway::prpp_c+gua_c --> ppi_c+gmp_c"
		"GULN3D|Pentose and Glucuronate Interconversions::guln_c+nad_c --> nadh_c+h_c+3dhguln_c"
		"GULN3D|Pentose and Glucuronate Interconversions_reverse::nadh_c+h_c+3dhguln_c --> guln_c+nad_c"
		"GULNDer|Pentose and Glucuronate Interconversions::glcur_r+h_r+nadph_r --> nadp_r+guln_r"
		"GULNDer|Pentose and Glucuronate Interconversions_reverse::nadp_r+guln_r --> glcur_r+h_r+nadph_r"
		"GULNter|Transport_ Endoplasmic Reticular::guln_r --> guln_c"
		"H2CO3D|Miscellaneous::h2o_c+co2_c --> h2co3_c"
		"H2CO3D|Miscellaneous_reverse::h2co3_c --> h2o_c+co2_c"
		"H2CO3D2|Miscellaneous::hco3_c+h_c --> h2co3_c"
		"H2CO3D2|Miscellaneous_reverse::h2co3_c --> hco3_c+h_c"
		"H2O2t|Transport_ Extracellular::h2o2_e --> h2o2_c"
		"H2O2t|Transport_ Extracellular_reverse::h2o2_c --> h2o2_e"
		"H2O2tm|Transport_ Mitochondrial::h2o2_c --> h2o2_m"
		"H2O2tm|Transport_ Mitochondrial_reverse::h2o2_m --> h2o2_c"
		"H2Otly|Transport_ Lysosomal::h2o_c --> h2o_l"
		"H2Otly|Transport_ Lysosomal_reverse::h2o_l --> h2o_c"
		"H2Otp|Transport_ Peroxisomal::h2o_c --> h2o_x"
		"H2Otp|Transport_ Peroxisomal_reverse::h2o_x --> h2o_c"
		"HACD1m|Tryptophan metabolism::nadh_m+h_m+aacoa_m --> nad_m+3hbcoa_m"
		"HACD1m|Tryptophan metabolism_reverse::nad_m+3hbcoa_m --> nadh_m+h_m+aacoa_m"
		"HACD9m|Valine_ Leucine_ and Isoleucine Metabolism::nad_m+3hmbcoa_m --> nadh_m+h_m+2maacoa_m"
		"HACD9m|Valine_ Leucine_ and Isoleucine Metabolism_reverse::nadh_m+h_m+2maacoa_m --> nad_m+3hmbcoa_m"
		"HCO3Em|Urea cycle/amino group metabolism::h2o_m+co2_m --> hco3_m+h_m"
		"HCO3Em|Urea cycle/amino group metabolism_reverse::hco3_m+h_m --> h2o_m+co2_m"
		"HCO3_CLt|Transport_ Extracellular::cl_c+hco3_e --> hco3_c+cl_e"
		"HCO3_CLt|Transport_ Extracellular_reverse::hco3_c+cl_e --> cl_c+hco3_e"
		"HCO3_NAt|Transport_ Extracellular::na1_e+hco3_e --> na1_c+hco3_c"
		"HCO3_NAt|Transport_ Extracellular_reverse::na1_c+hco3_c --> na1_e+hco3_e"
		"HEX1|Glycolysis/Gluconeogenesis::atp_c+glc_D_c --> h_c+adp_c+g6p_c"
		"HEX7|Fructose and Mannose Metabolism::atp_c+fru_c --> f6p_c+h_c+adp_c"
		"HGNTOR|Tyrosine metabolism::o2_c+hgentis_c --> h_c+4mlacac_c"
		"HIBDm|Valine_ Leucine_ and Isoleucine Metabolism::3hmp_m+nad_m --> nadh_m+h_m+2mop_m"
		"HIBDm|Valine_ Leucine_ and Isoleucine Metabolism_reverse::nadh_m+h_m+2mop_m --> 3hmp_m+nad_m"
		"HISDC|Histidine Metabolism::h_c+his_L_c --> hista_c+co2_c"
		"HISTAVESSEC|Transport_ Extracellular::2.0*h2o_c+2.0*atp_c+3.0*hista_c --> 2.0*pi_c+2.0*h_c+2.0*adp_c+3.0*hista_e"
		"HISt4|Transport_ Extracellular::na1_e+his_L_e --> na1_c+his_L_c"
		"HIStiDF|Transport_ Extracellular::his_L_e --> his_L_c"
		"HMBS|Heme Biosynthesis::h2o_c+4.0*ppbng_c --> 4.0*nh4_c+hmbil_c"
		"HMGLm|Cholesterol Metabolism::hmgcoa_m --> acac_m+accoa_m"
		"HOXG|Heme Degradation::3.0*o2_c+5.0*h_c+pheme_c+3.0*nadph_c --> biliverd_c+3.0*h2o_c+3.0*nadp_c+fe2_c+co_c"
		"HPACtr|Transport_ Extracellular::4hphac_c --> 4hphac_e"
		"HPACtr|Transport_ Extracellular_reverse::4hphac_e --> 4hphac_c"
		"HPETOX|ROS Detoxification::12HPET_c+2.0*gthrd_c --> h2o_c+12harachd_c+gthox_c"
		"HPETOX|ROS Detoxification_reverse::h2o_c+12harachd_c+gthox_c --> 12HPET_c+2.0*gthrd_c"
		"HXPRT|Salvage Pathway::hxan_c+prpp_c --> ppi_c+imp_c"
		"HYXNt|Transport_ Extracellular::hxan_e --> hxan_c"
		"HYXNt|Transport_ Extracellular_reverse::hxan_c --> hxan_e"
		"Htr|Transport_ Endoplasmic Reticular::h_c --> h_r"
		"Htr|Transport_ Endoplasmic Reticular_reverse::h_r --> h_c"
		"Htx|Transport_ Peroxisomal::h_c --> h_x"
		"Htx|Transport_ Peroxisomal_reverse::h_x --> h_c"
		"ICDHxm|Citric Acid Cycle::nad_m+icit_m --> nadh_m+co2_m+akg_m"
		"ICDHxm|Citric Acid Cycle_reverse::nadh_m+co2_m+akg_m --> nad_m+icit_m"
		"ICDHy|Citric Acid Cycle::nadp_c+icit_c --> co2_c+akg_c+nadph_c"
		"ICDHyrm|Citric Acid Cycle::nadp_m+icit_m --> co2_m+akg_m+nadph_m"
		"ICDHyrm|Citric Acid Cycle_reverse::co2_m+akg_m+nadph_m --> nadp_m+icit_m"
		"ILETA|Valine_ Leucine_ and Isoleucine Metabolism::ile_L_c+akg_c --> 3mop_c+glu_L_c"
		"ILETA|Valine_ Leucine_ and Isoleucine Metabolism_reverse::3mop_c+glu_L_c --> ile_L_c+akg_c"
		"ILEt4|Transport_ Extracellular::na1_e+ile_L_e --> na1_c+ile_L_c"
		"ILEt4|Transport_ Extracellular_reverse::na1_c+ile_L_c --> na1_e+ile_L_e"
		"ILEtec|Transport_ Extracellular::ile_L_e --> ile_L_c"
		"ILEtec|Transport_ Extracellular_reverse::ile_L_c --> ile_L_e"
		"IMPC|IMP Biosynthesis::h2o_c+imp_c --> fprica_c"
		"IMPC|IMP Biosynthesis_reverse::fprica_c --> h2o_c+imp_c"
		"IMPD|Nucleotides::h2o_c+nad_c+imp_c --> xmp_c+nadh_c+h_c"
		"INOSTO|Inositol Phosphate Metabolism::o2_c+inost_c --> glcur_c+h2o_c+h_c"
		"INSTt4|Transport_ Extracellular::na1_e+inost_e --> na1_c+inost_c"
		"INSTt4|Transport_ Extracellular_reverse::na1_c+inost_c --> na1_e+inost_e"
		"INSTt4_2|Transport_ Extracellular::2.0*na1_e+inost_e --> 2.0*na1_c+inost_c"
		"INSTt4_2|Transport_ Extracellular_reverse::2.0*na1_c+inost_c --> 2.0*na1_e+inost_e"
		"KAS8|Fatty acid elongation::7.0*malcoa_c+accoa_c+20.0*h_c+14.0*nadph_c --> 6.0*h2o_c+14.0*nadp_c+8.0*coa_c+hdca_c+7.0*co2_c"
		"KHK|Fructose and Mannose Metabolism::atp_c+fru_c --> f1p_c+h_c+adp_c"
		"L_LACt2r|Transport_ Extracellular::lac_L_e+h_e --> lac_L_c+h_c"
		"L_LACt2r|Transport_ Extracellular_reverse::lac_L_c+h_c --> lac_L_e+h_e"
		"LALDO2|Pyruvate Metabolism::h_c+mthgxl_c+nadph_c --> lald_D_c+nadp_c"
		"LALDO2x|Pyruvate Metabolism::nadh_c+h_c+mthgxl_c --> lald_D_c+nad_c"
		"LCADi|Pyruvate Metabolism::h2o_c+lald_L_c+nad_c --> nadh_c+lac_L_c+2.0*h_c"
		"LCADi_D|Pyruvate Metabolism::h2o_c+lald_D_c+nad_c --> nadh_c+lac_D_c+2.0*h_c"
		"LDH_D|Pyruvate Metabolism::nad_c+lac_D_c --> pyr_c+nadh_c+h_c"
		"LDH_D|Pyruvate Metabolism_reverse::pyr_c+nadh_c+h_c --> nad_c+lac_D_c"
		"LDH_L|Glycolysis/Gluconeogenesis::nad_c+lac_L_c --> pyr_c+nadh_c+h_c"
		"LDH_L|Glycolysis/Gluconeogenesis_reverse::pyr_c+nadh_c+h_c --> nad_c+lac_L_c"
		"LEUKTRA4tr|Transport_ Endoplasmic Reticular::leuktrA4_c --> leuktrA4_r"
		"LEUKTRA4tr|Transport_ Endoplasmic Reticular_reverse::leuktrA4_r --> leuktrA4_c"
		"LEUKTRD4tr|Transport_ Endoplasmic Reticular::leuktrD4_c --> leuktrD4_r"
		"LEUKTRD4tr|Transport_ Endoplasmic Reticular_reverse::leuktrD4_r --> leuktrD4_c"
		"LEUKTRF4t|Transport_ Extracellular::leuktrF4_e --> leuktrF4_c"
		"LEUKTRF4t|Transport_ Extracellular_reverse::leuktrF4_c --> leuktrF4_e"
		"LEUt4|Transport_ Extracellular::na1_e+leu_L_e --> na1_c+leu_L_c"
		"LEUt4|Transport_ Extracellular_reverse::na1_c+leu_L_c --> na1_e+leu_L_e"
		"LGTHL|Pyruvate Metabolism::mthgxl_c+gthrd_c --> lgt_S_c"
		"LNLCCPT1|Carnitine shuttle::crn_c+lnlccoa_c --> coa_c+lnlccrn_c"
		"LNLCCPT2|Carnitine shuttle::coa_m+lnlccrn_m --> crn_m+lnlccoa_m"
		"LNLCCRNt|Carnitine shuttle::lnlccrn_c --> lnlccrn_m"
		"LNLCt|Transport_ Extracellular::lnlc_e --> lnlc_c"
		"LNLCt|Transport_ Extracellular_reverse::lnlc_c --> lnlc_e"
		"LSOProd|ROS Detoxification::o2_m+focytC_m --> o2s_m+ficytC_m"
		"LTC4Sr|Eicosanoid Metabolism::leuktrA4_r+gthrd_r --> leuktrC4_r"
		"LTD4DP|Eicosanoid Metabolism::h2o_c+leuktrD4_c --> gly_c+leuktrE4_c"
		"LTD4DP|Eicosanoid Metabolism_reverse::gly_c+leuktrE4_c --> h2o_c+leuktrD4_c"
		"LTDCL|Tryptophan metabolism::trp_L_c+h_c --> co2_c+trypta_c"
		"LYSt4|Transport_ Extracellular::na1_e+lys_L_e --> na1_c+lys_L_c"
		"LYStiDF|Transport_ Extracellular::lys_L_e --> lys_L_c"
		"LYStm|Transport_ Mitochondrial::lys_L_c+h_m --> lys_L_m+h_c"
		"LYStm|Transport_ Mitochondrial_reverse::lys_L_m+h_c --> lys_L_c+h_m"
		"MACACI|Tyrosine metabolism::4mlacac_c --> 4fumacac_c"
		"MALSO3tm|Transport_ Mitochondrial::mal_L_c+so3_m --> mal_L_m+so3_c"
		"MALSO3tm|Transport_ Mitochondrial_reverse::mal_L_m+so3_c --> mal_L_c+so3_m"
		"MALTSULtm|Transport_ Mitochondrial::mal_L_c+tsul_m --> mal_L_m+tsul_c"
		"MALTSULtm|Transport_ Mitochondrial_reverse::mal_L_m+tsul_c --> mal_L_c+tsul_m"
		"MALtm|Transport_ Mitochondrial::mal_L_c+pi_m --> mal_L_m+pi_c"
		"MALtm|Transport_ Mitochondrial_reverse::mal_L_m+pi_c --> mal_L_c+pi_m"
		"MCCCrm|Valine_ Leucine_ and Isoleucine Metabolism::atp_m+hco3_m+3mb2coa_m --> 3mgcoa_m+pi_m+h_m+adp_m"
		"MCCCrm|Valine_ Leucine_ and Isoleucine Metabolism_reverse::3mgcoa_m+pi_m+h_m+adp_m --> atp_m+hco3_m+3mb2coa_m"
		"MCPST|Cysteine Metabolism::cyan_c+mercppyr_c --> pyr_c+tcynt_c+h_c"
		"MDH|Citric Acid Cycle::mal_L_c+nad_c --> nadh_c+oaa_c+h_c"
		"MDH|Citric Acid Cycle_reverse::nadh_c+oaa_c+h_c --> mal_L_c+nad_c"
		"MDHm|Citric Acid Cycle::mal_L_m+nad_m --> nadh_m+oaa_m+h_m"
		"MDHm|Citric Acid Cycle_reverse::nadh_m+oaa_m+h_m --> mal_L_m+nad_m"
		"ME1m|Pyruvate Metabolism::mal_L_m+nad_m --> nadh_m+pyr_m+co2_m"
		"ME2m|Pyruvate Metabolism::mal_L_m+nadp_m --> pyr_m+co2_m+nadph_m"
		"METAT|Methionine Metabolism::h2o_c+atp_c+met_L_c --> amet_c+ppi_c+pi_c"
		"METLEUex|Transport_ Extracellular::leu_L_c+met_L_e --> leu_L_e+met_L_c"
		"METLEUex|Transport_ Extracellular_reverse::leu_L_e+met_L_c --> leu_L_c+met_L_e"
		"METt4|Transport_ Extracellular::na1_e+met_L_e --> na1_c+met_L_c"
		"METt4|Transport_ Extracellular_reverse::na1_c+met_L_c --> na1_e+met_L_e"
		"METtec|Transport_ Extracellular::met_L_e --> met_L_c"
		"METtec|Transport_ Extracellular_reverse::met_L_c --> met_L_e"
		"MGCHrm|Valine_ Leucine_ and Isoleucine Metabolism::h2o_m+3mgcoa_m --> hmgcoa_m"
		"MGCHrm|Valine_ Leucine_ and Isoleucine Metabolism_reverse::hmgcoa_m --> h2o_m+3mgcoa_m"
		"MGSA|Pyruvate Metabolism::dhap_c --> pi_c+mthgxl_c"
		"MGSA2|Pyruvate Metabolism::g3p_c --> pi_c+mthgxl_c"
		"MI145PP|Inositol Phosphate Metabolism::h2o_c+mi145p_c --> pi_c+mi14p_c"
		"MI14PP|Inositol Phosphate Metabolism::h2o_c+mi14p_c --> mi4p_D_c+pi_c"
		"MI1PP|Inositol Phosphate Metabolism::mi1p_D_c+h2o_c --> inost_c+pi_c"
		"MI4PP|Inositol Phosphate Metabolism::h2o_c+mi4p_D_c --> inost_c+pi_c"
		"MMEm|Valine_ Leucine_ and Isoleucine Metabolism::mmcoa_R_m --> mmcoa_S_m"
		"MMEm|Valine_ Leucine_ and Isoleucine Metabolism_reverse::mmcoa_S_m --> mmcoa_R_m"
		"MMMm|Valine_ Leucine_ and Isoleucine Metabolism::mmcoa_R_m --> succoa_m"
		"MMMm|Valine_ Leucine_ and Isoleucine Metabolism_reverse::succoa_m --> mmcoa_R_m"
		"MMSAD3m|Propanoate Metabolism::coa_m+nad_m+msa_m --> nadh_m+accoa_m+co2_m"
		"MMTSADm|Valine_ Leucine_ and Isoleucine Metabolism::coa_m+nad_m+2mop_m --> nadh_m+mmcoa_R_m+h_m"
		"MTHFC|Folate Metabolism::h2o_c+methf_c --> 10fthf_c+h_c"
		"MTHFC|Folate Metabolism_reverse::10fthf_c+h_c --> h2o_c+methf_c"
		"MTHFCm|Folate Metabolism::h2o_m+methf_m --> 10fthf_m+h_m"
		"MTHFCm|Folate Metabolism_reverse::10fthf_m+h_m --> h2o_m+methf_m"
		"MTHFD|Folate Metabolism::mlthf_c+nadp_c --> methf_c+nadph_c"
		"MTHFD|Folate Metabolism_reverse::methf_c+nadph_c --> mlthf_c+nadp_c"
		"MTHFD2m|Folate Metabolism::nad_m+mlthf_m --> nadh_m+methf_m"
		"MTHFD2m|Folate Metabolism_reverse::nadh_m+methf_m --> nad_m+mlthf_m"
		"MTHFDm|Folate Metabolism::nadp_m+mlthf_m --> methf_m+nadph_m"
		"MTHFDm|Folate Metabolism_reverse::methf_m+nadph_m --> nadp_m+mlthf_m"
		"MTHFR3|Folate Metabolism::mlthf_c+2.0*h_c+nadph_c --> nadp_c+5mthf_c"
		"NADH2_u10m|Oxidative Phosphorylation::nadh_m+5.0*h_m+q10_m --> nad_m+4.0*h_c+q10h2_m"
		"NADN|NAD Metabolism::h2o_c+nad_c --> adprib_c+ncam_c+h_c"
		"NADNe|NAD Metabolism::h2o_e+nad_e --> adprib_e+ncam_e+h_e"
		"NADPHtru|Transport_ Endoplasmic Reticular::nadph_c --> nadph_r"
		"NADPtru|Transport_ Endoplasmic Reticular::nadp_r --> nadp_c"
		"NDP3ex|Nucleotides::h2o_e+gdp_e --> pi_e+h_e+gmp_e"
		"NDPK1|Nucleotides::gdp_c+atp_c --> gtp_c+adp_c"
		"NDPK1|Nucleotides_reverse::gtp_c+adp_c --> gdp_c+atp_c"
		"NDPK1m|Nucleotides::atp_m+gdp_m --> gtp_m+adp_m"
		"NDPK1m|Nucleotides_reverse::gtp_m+adp_m --> atp_m+gdp_m"
		"NDPK2|Nucleotides::atp_c+udp_c --> utp_c+adp_c"
		"NDPK2|Nucleotides_reverse::utp_c+adp_c --> atp_c+udp_c"
		"NDPK3|Nucleotides::atp_c+cdp_c --> ctp_c+adp_c"
		"NDPK3|Nucleotides_reverse::ctp_c+adp_c --> atp_c+cdp_c"
		"NMNATr|NAD Metabolism::nmn_c+atp_c+h_c --> ppi_c+nad_c"
		"NMNATr|NAD Metabolism_reverse::ppi_c+nad_c --> nmn_c+atp_c+h_c"
		"NORANMT|Tyrosine metabolism::amet_c+nrpphr_c --> h_c+adrnl_c+ahcys_c"
		"NOS1|Proline Metabolism::o2_c+h_c+arg_L_c+nadph_c --> h2o_c+nwharg_c+nadp_c"
		"NOS2|Proline Metabolism::2.0*o2_c+2.0*nwharg_c+nadph_c --> 2.0*h2o_c+nadp_c+2.0*no_c+2.0*citr_L_c+h_c"
		"NOt|Transport_ Extracellular::no_e --> no_c"
		"NOt|Transport_ Extracellular_reverse::no_c --> no_e"
		"NRPPHRSFt|Transport_ Extracellular::nrpphrsf_c --> nrpphrsf_e"
		"NRPPHRSULT|Tyrosine metabolism::nrpphr_c+paps_c --> pap_c+nrpphrsf_c+h_c"
		"NTD10|Nucleotides::h2o_c+xmp_c --> xtsn_c+pi_c"
		"NTD11|Purine Catabolism::h2o_c+imp_c --> ins_c+pi_c"
		"NTD2|Pyrimidine Catabolism::ump_c+h2o_c --> uri_c+pi_c"
		"NTD4|Pyrimidine Catabolism::cmp_c+h2o_c --> pi_c+cytd_c"
		"NTD7e|Nucleotides::h2o_e+amp_e --> pi_e+adn_e"
		"NTD9e|Nucleotides::h2o_e+gmp_e --> gsn_e+pi_e"
		"NaKt|Transport_ Extracellular::3.0*na1_c+h2o_c+atp_c+2.0*k_e --> 3.0*na1_e+pi_c+h_c+adp_c+2.0*k_c"
		"O2St|Transport_ Extracellular::o2s_c --> o2s_e"
		"O2St|Transport_ Extracellular_reverse::o2s_e --> o2s_c"
		"O2Stm|Transport_ Mitochondrial::o2s_c --> o2s_m"
		"O2Stm|Transport_ Mitochondrial_reverse::o2s_m --> o2s_c"
		"O2Stx|Transport_ Peroxisomal::o2s_c --> o2s_x"
		"O2Stx|Transport_ Peroxisomal_reverse::o2s_x --> o2s_c"
		"O2t|Transport_ Extracellular::o2_e --> o2_c"
		"O2t|Transport_ Extracellular_reverse::o2_c --> o2_e"
		"O2ter|Transport_ Endoplasmic Reticular::o2_c --> o2_r"
		"O2ter|Transport_ Endoplasmic Reticular_reverse::o2_r --> o2_c"
		"O2tm|Transport_ Mitochondrial::o2_c --> o2_m"
		"O2tm|Transport_ Mitochondrial_reverse::o2_m --> o2_c"
		"OCBTm|Urea cycle/amino group metabolism::cbp_m+orn_m --> pi_m+citr_L_m+h_m"
		"OCDCAtr|Transport_ Extracellular::ocdca_e --> ocdca_c"
		"OCDCAtr|Transport_ Extracellular_reverse::ocdca_c --> ocdca_e"
		"OCDCEAtr|Transport_ Extracellular::ocdcea_e --> ocdcea_c"
		"OCDCEAtr|Transport_ Extracellular_reverse::ocdcea_c --> ocdcea_e"
		"OCOAT1m|Valine_ Leucine_ and Isoleucine Metabolism::acac_m+succoa_m --> succ_m+aacoa_m"
		"OCOAT1m|Valine_ Leucine_ and Isoleucine Metabolism_reverse::succ_m+aacoa_m --> acac_m+succoa_m"
		"OIVD1m|Valine_ Leucine_ and Isoleucine Metabolism::4mop_m+coa_m+nad_m --> nadh_m+ivcoa_m+co2_m"
		"OIVD2m|Valine_ Leucine_ and Isoleucine Metabolism::coa_m+nad_m+3mob_m --> nadh_m+ibcoa_m+co2_m"
		"OIVD3m|Valine_ Leucine_ and Isoleucine Metabolism::coa_m+nad_m+3mop_m --> nadh_m+co2_m+2mbcoa_m"
		"OPAHir|Glutathione Metabolism::2.0*h2o_c+5oxpro_c+atp_c --> pi_c+h_c+glu_L_c+adp_c"
		"ORNTArm|Urea cycle/amino group metabolism::akg_m+orn_m --> glu_L_m+glu5sa_m"
		"ORNTArm|Urea cycle/amino group metabolism_reverse::glu_L_m+glu5sa_m --> akg_m+orn_m"
		"ORNt3m|Transport_ Mitochondrial::h_c+orn_m --> h_m+orn_c"
		"ORNt3m|Transport_ Mitochondrial_reverse::h_m+orn_c --> h_c+orn_m"
		"ORNt4m|Transport_ Mitochondrial::citr_L_c+h_c+orn_m --> citr_L_m+h_m+orn_c"
		"ORNt4m|Transport_ Mitochondrial_reverse::citr_L_m+h_m+orn_c --> citr_L_c+h_c+orn_m"
		"ORNtiDF|Transport_ Extracellular::orn_e --> orn_c"
		"P5CRm|Proline Metabolism::1pyr5c_m+2.0*h_m+nadph_m --> pro_L_m+nadp_m"
		"P5CRxm|Proline Metabolism::nadh_m+1pyr5c_m+2.0*h_m --> pro_L_m+nad_m"
		"PACCOAL|Phenylalanine metabolism::pac_c+coa_c+atp_c --> phaccoa_c+ppi_c+amp_c"
		"PDE1|Nucleotides::h2o_c+camp_c --> h_c+amp_c"
		"PDE4|Nucleotides::35cgmp_c+h2o_c --> h_c+gmp_c"
		"PDHm|Glycolysis/Gluconeogenesis::coa_m+nad_m+pyr_m --> nadh_m+accoa_m+co2_m"
		"PEAMNO|Phenylalanine metabolism::o2_c+h2o_c+peamn_c --> h2o2_c+nh4_c+pacald_c"
		"PFK|Glycolysis/Gluconeogenesis::f6p_c+atp_c --> h_c+adp_c+fdp_c"
		"PFK26|Fructose and Mannose Metabolism::f6p_c+atp_c --> h_c+adp_c+f26bp_c"
		"PGDI|Eicosanoid Metabolism::prostgh2_c --> prostgd2_c"
		"PGDI|Eicosanoid Metabolism_reverse::prostgd2_c --> prostgh2_c"
		"PGI|Glycolysis/Gluconeogenesis::g6p_c --> f6p_c"
		"PGI|Glycolysis/Gluconeogenesis_reverse::f6p_c --> g6p_c"
		"PGK|Glycolysis/Gluconeogenesis::atp_c+3pg_c --> 13dpg_c+adp_c"
		"PGK|Glycolysis/Gluconeogenesis_reverse::13dpg_c+adp_c --> atp_c+3pg_c"
		"PGL|Pentose Phosphate Pathway::h2o_c+6pgl_c --> 6pgc_c+h_c"
		"PGM|Glycolysis/Gluconeogenesis::2pg_c --> 3pg_c"
		"PGM|Glycolysis/Gluconeogenesis_reverse::3pg_c --> 2pg_c"
		"PGMT|Glycolysis/Gluconeogenesis::g1p_c --> g6p_c"
		"PGMT|Glycolysis/Gluconeogenesis_reverse::g6p_c --> g1p_c"
		"PGS|Eicosanoid Metabolism::2.0*o2_c+h_c+arachd_c+nadph_c --> h2o_c+prostgh2_c+nadp_c"
		"PGS_COX|Eicosanoid Metabolism::2.0*o2_c+h_c+arachd_c --> prostgg2_c"
		"PGS_PO|Eicosanoid Metabolism::prostgg2_c+nadph_c --> h2o_c+prostgh2_c+nadp_c"
		"PGSr|Eicosanoid Metabolism::2.0*o2_r+h_r+arachd_r+nadph_r --> h2o_r+nadp_r+prostgh2_r"
		"PHACCOAGLNAC|Phenylalanine metabolism::gln_L_c+phaccoa_c --> coa_c+pheacgln_c"
		"PHEACGLNt|Transport_ Extracellular::pheacgln_c --> pheacgln_e"
		"PHEACGLNt|Transport_ Extracellular_reverse::pheacgln_e --> pheacgln_c"
		"PHEMEt|Transport_ Extracellular::pheme_e --> pheme_c"
		"PHEMEt|Transport_ Extracellular_reverse::pheme_c --> pheme_e"
		"PHEMEtm|Transport_ Mitochondrial::pheme_m --> pheme_c"
		"PHEMEtm|Transport_ Mitochondrial_reverse::pheme_c --> pheme_m"
		"PHEt4|Transport_ Extracellular::na1_e+phe_L_e --> na1_c+phe_L_c"
		"PHEt4|Transport_ Extracellular_reverse::na1_c+phe_L_c --> na1_e+phe_L_e"
		"PHEtec|Transport_ Extracellular::phe_L_e --> phe_L_c"
		"PHEtec|Transport_ Extracellular_reverse::phe_L_c --> phe_L_e"
		"PHYCBOXL|Phenylalanine metabolism::phe_L_c+h_c --> peamn_c+co2_c"
		"PIt2m_2|Transport_ Extracellular::pi_c+2.0*h_c --> pi_m+2.0*h_m"
		"PIt2m_2|Transport_ Extracellular_reverse::pi_m+2.0*h_m --> pi_c+2.0*h_c"
		"PIter|Transport_ Endoplasmic Reticular::pi_r --> pi_c"
		"PIter|Transport_ Endoplasmic Reticular_reverse::pi_c --> pi_r"
		"PNP|NAD Metabolism::rnam_c+pi_c --> ncam_c+r1p_c+h_c"
		"PNP|NAD Metabolism_reverse::ncam_c+r1p_c+h_c --> rnam_c+pi_c"
		"PPA|Oxidative Phosphorylation::h2o_c+ppi_c --> 2.0*pi_c+h_c"
		"PPBNGS|Heme Biosynthesis::2.0*5aop_c --> 2.0*h2o_c+ppbng_c+h_c"
		"PPCOACm|Valine_ Leucine_ and Isoleucine Metabolism::atp_m+hco3_m+ppcoa_m --> pi_m+h_m+adp_m+mmcoa_S_m"
		"PPDOx|Pyruvate Metabolism::lald_D_c+nadh_c+h_c --> nad_c+12ppd_R_c"
		"PPDOx|Pyruvate Metabolism_reverse::nad_c+12ppd_R_c --> lald_D_c+nadh_c+h_c"
		"PPDOy|Pyruvate Metabolism::lald_D_c+h_c+nadph_c --> nadp_c+12ppd_R_c"
		"PPM|Pentose Phosphate Pathway::r1p_c --> r5p_c"
		"PPM|Pentose Phosphate Pathway_reverse::r5p_c --> r1p_c"
		"PPPG9tm|Heme Biosynthesis::pppg9_c --> pppg9_m"
		"PPPG9tm|Heme Biosynthesis_reverse::pppg9_m --> pppg9_c"
		"PPPGOm|Heme Biosynthesis::3.0*o2_m+2.0*pppg9_m --> 6.0*h2o_m+2.0*ppp9_m"
		"PRAGSr|IMP Biosynthesis::pram_c+atp_c+gly_c --> pi_c+gar_c+h_c+adp_c"
		"PRAGSr|IMP Biosynthesis_reverse::pi_c+gar_c+h_c+adp_c --> pram_c+atp_c+gly_c"
		"PRAIS|IMP Biosynthesis::atp_c+fpram_c --> pi_c+2.0*h_c+adp_c+air_c"
		"PRASCS|IMP Biosynthesis::5aizc_c+atp_c+asp_L_c --> pi_c+h_c+adp_c+25aics_c"
		"PRASCS|IMP Biosynthesis_reverse::pi_c+h_c+adp_c+25aics_c --> 5aizc_c+atp_c+asp_L_c"
		"PRDX|Miscellaneous::h2o2_c+meoh_c --> fald_c+2.0*h2o_c"
		"PRFGS|IMP Biosynthesis::gln_L_c+h2o_c+fgam_c+atp_c --> pi_c+h_c+glu_L_c+adp_c+fpram_c"
		"PROSTGD2t|Transport_ Extracellular::hco3_c+prostgd2_e --> hco3_e+prostgd2_c"
		"PROSTGD2t|Transport_ Extracellular_reverse::hco3_e+prostgd2_c --> hco3_c+prostgd2_e"
		"PROt4_2r|Transport_ Extracellular::2.0*na1_e+pro_L_e --> 2.0*na1_c+pro_L_c"
		"PROt4_2r|Transport_ Extracellular_reverse::2.0*na1_c+pro_L_c --> 2.0*na1_e+pro_L_e"
		"PROtm|Transport_ Mitochondrial::pro_L_c --> pro_L_m"
		"PROtm|Transport_ Mitochondrial_reverse::pro_L_m --> pro_L_c"
		"PRPPS|Pentose Phosphate Pathway::atp_c+r5p_c --> prpp_c+h_c+amp_c"
		"PRPPS|Pentose Phosphate Pathway_reverse::prpp_c+h_c+amp_c --> atp_c+r5p_c"
		"PUNP1|Nucleotides::adn_c+pi_c --> r1p_c+ade_c"
		"PUNP1|Nucleotides_reverse::r1p_c+ade_c --> adn_c+pi_c"
		"PUNP2|Purine Catabolism::dad_2_c+pi_c --> 2dr1p_c+ade_c"
		"PUNP2|Purine Catabolism_reverse::2dr1p_c+ade_c --> dad_2_c+pi_c"
		"PUNP3|Purine Catabolism::pi_c+gsn_c --> gua_c+r1p_c"
		"PUNP3|Purine Catabolism_reverse::gua_c+r1p_c --> pi_c+gsn_c"
		"PUNP5|Purine Catabolism::ins_c+pi_c --> hxan_c+r1p_c"
		"PUNP5|Purine Catabolism_reverse::hxan_c+r1p_c --> ins_c+pi_c"
		"PUNP6|Purine Catabolism::pi_c+din_c --> hxan_c+2dr1p_c"
		"PUNP6|Purine Catabolism_reverse::hxan_c+2dr1p_c --> pi_c+din_c"
		"PUNP7|Nucleotides::xtsn_c+pi_c --> r1p_c+xan_c"
		"PUNP7|Nucleotides_reverse::r1p_c+xan_c --> xtsn_c+pi_c"
		"PYK|Glycolysis/Gluconeogenesis::pep_c+h_c+adp_c --> pyr_c+atp_c"
		"PYNP2r|Pyrimidine Catabolism::uri_c+pi_c --> ura_c+r1p_c"
		"PYNP2r|Pyrimidine Catabolism_reverse::ura_c+r1p_c --> uri_c+pi_c"
		"PYRt2r|Transport_ Extracellular::pyr_e+h_e --> pyr_c+h_c"
		"PYRt2r|Transport_ Extracellular_reverse::pyr_c+h_c --> pyr_e+h_e"
		"RNMK|NAD Metabolism::rnam_c+atp_c --> nmn_c+h_c+adp_c"
		"RPI|Pentose Phosphate Pathway::r5p_c --> ru5p_D_c"
		"RPI|Pentose Phosphate Pathway_reverse::ru5p_D_c --> r5p_c"
		"SACCD3m|Lysine Metabolism::lys_L_m+h_m+akg_m+nadph_m --> h2o_m+nadp_m+saccrp_L_m"
		"SACCD4m|Lysine Metabolism::h2o_m+nadp_m+saccrp_L_m --> L2aadp6sa_m+glu_L_m+h_m+nadph_m"
		"SADT|Nucleotides::so4_c+atp_c+h_c --> ppi_c+aps_c"
		"SARDHm|Urea cycle/amino group metabolism::fad_m+sarcs_m+thf_m --> mlthf_m+gly_m+fadh2_m"
		"SBTD_D2|Fructose and Mannose Metabolism::nad_c+sbt_D_c --> nadh_c+fru_c+h_c"
		"SBTR|Fructose and Mannose Metabolism::glc_D_c+h_c+nadph_c --> nadp_c+sbt_D_c"
		"SERGLNexR|Transport_ Extracellular::gln_L_c+ser_L_e --> gln_L_e+ser_L_c"
		"SERGLNexR|Transport_ Extracellular_reverse::gln_L_e+ser_L_c --> gln_L_c+ser_L_e"
		"SFGTH|Tyrosine metabolism::h2o_c+Sfglutth_c --> for_c+h_c+gthrd_c"
		"SFGTH|Tyrosine metabolism_reverse::for_c+h_c+gthrd_c --> h2o_c+Sfglutth_c"
		"SMPD4|Sphingolipid Metabolism::h2o_c+spc_hs_c --> sphings_c+cholp_c+h_c"
		"SO4CLtex2|Transport_ Extracellular::2.0*so4_e+cl_c --> 2.0*so4_c+cl_e"
		"SO4CLtex2|Transport_ Extracellular_reverse::2.0*so4_c+cl_e --> 2.0*so4_e+cl_c"
		"SO4HCOtex|Transport_ Extracellular::so4_e+2.0*hco3_c --> so4_c+2.0*hco3_e"
		"SO4HCOtex|Transport_ Extracellular_reverse::so4_c+2.0*hco3_e --> so4_e+2.0*hco3_c"
		"SO4t4_2|Transport_ Extracellular::2.0*na1_e+so4_e --> 2.0*na1_c+so4_c"
		"SO4t4_2|Transport_ Extracellular_reverse::2.0*na1_c+so4_c --> 2.0*na1_e+so4_e"
		"SO4t4_3|Transport_ Extracellular::3.0*na1_e+so4_e --> 3.0*na1_c+so4_c"
		"SO4t4_3|Transport_ Extracellular_reverse::3.0*na1_c+so4_c --> 3.0*na1_e+so4_e"
		"SPC_HSt|Transport_ Extracellular::spc_hs_c --> spc_hs_e"
		"SPC_HSt|Transport_ Extracellular_reverse::spc_hs_e --> spc_hs_c"
		"SPHK21c|Sphingolipid Metabolism::sphings_c+atp_c --> h_c+adp_c+sphs1p_c"
		"SPHS1Pte|Transport_ Extracellular::sphs1p_c --> sphs1p_e"
		"SPHS1Pte|Transport_ Extracellular_reverse::sphs1p_e --> sphs1p_c"
		"SPODM|ROS Detoxification::2.0*o2s_c+2.0*h_c --> o2_c+h2o2_c"
		"SPODMm|ROS Detoxification::2.0*o2s_m+2.0*h_m --> o2_m+h2o2_m"
		"SPODMx|ROS Detoxification::2.0*o2s_x+2.0*h_x --> o2_x+h2o2_x"
		"SRTNt6_2r|Transport_ Extracellular::2.0*na1_e+srtn_e+2.0*k_c --> 2.0*na1_c+srtn_c+2.0*k_e"
		"SRTNt6_2r|Transport_ Extracellular_reverse::2.0*na1_c+srtn_c+2.0*k_e --> 2.0*na1_e+srtn_e+2.0*k_c"
		"SSALxm|Glutamate metabolism::h2o_m+nad_m+sucsal_m --> nadh_m+2.0*h_m+succ_m"
		"STS2|Steroid Metabolism::h2o_c+estrones_c --> so4_c+estrone_c+h_c"
		"SUCCt2m|Transport_ Mitochondrial::pi_m+succ_c --> pi_c+succ_m"
		"SUCCt2m|Transport_ Mitochondrial_reverse::pi_c+succ_m --> pi_m+succ_c"
		"SUCCt4_2|Transport_ Extracellular::2.0*na1_e+succ_e --> 2.0*na1_c+succ_c"
		"SUCCt4_2|Transport_ Extracellular_reverse::2.0*na1_c+succ_c --> 2.0*na1_e+succ_e"
		"SUCCt4_3|Transport_ Extracellular::3.0*na1_e+succ_e --> 3.0*na1_c+succ_c"
		"SUCCt4_3|Transport_ Extracellular_reverse::3.0*na1_c+succ_c --> 3.0*na1_e+succ_e"
		"SUCD1m|Citric Acid Cycle::fad_m+succ_m --> fadh2_m+fum_m"
		"SUCD1m|Citric Acid Cycle_reverse::fadh2_m+fum_m --> fad_m+succ_m"
		"SUCOAS1m|Citric Acid Cycle::gtp_m+coa_m+succ_m --> gdp_m+pi_m+succoa_m"
		"SUCOAS1m|Citric Acid Cycle_reverse::gdp_m+pi_m+succoa_m --> gtp_m+coa_m+succ_m"
		"SULFOX|Cysteine Metabolism::h2o_c+so3_c+2.0*ficytC_m --> so4_c+2.0*focytC_m+2.0*h_c"
		"TALA|Pentose Phosphate Pathway::s7p_c+g3p_c --> f6p_c+e4p_c"
		"TALA|Pentose Phosphate Pathway_reverse::f6p_c+e4p_c --> s7p_c+g3p_c"
		"TCYNTt|Transport_ Extracellular::tcynt_c --> tcynt_e"
		"TCYNTtm|Transport_ Mitochondrial::tcynt_m --> tcynt_c"
		"THBPT4ACAMDASE|Tetrahydrobiopterin::thbpt4acam_c --> h2o_c+dhbpt_c"
		"THFtm|Transport_ Mitochondrial::thf_c --> thf_m"
		"THFtm|Transport_ Mitochondrial_reverse::thf_m --> thf_c"
		"THMDt4|Transport_ Extracellular::na1_e+thymd_e --> na1_c+thymd_c"
		"THMDt5|Transport_ Extracellular::2.0*na1_e+thymd_e --> 2.0*na1_c+thymd_c"
		"THYMDt1|Transport_ Extracellular::thymd_e --> thymd_c"
		"THYMt|Transport_ Extracellular::thym_e --> thym_c"
		"THYMt|Transport_ Extracellular_reverse::thym_c --> thym_e"
		"TKT1|Pentose Phosphate Pathway::xu5p_D_c+r5p_c --> s7p_c+g3p_c"
		"TKT1|Pentose Phosphate Pathway_reverse::s7p_c+g3p_c --> xu5p_D_c+r5p_c"
		"TKT2|Pentose Phosphate Pathway::xu5p_D_c+e4p_c --> f6p_c+g3p_c"
		"TKT2|Pentose Phosphate Pathway_reverse::f6p_c+g3p_c --> xu5p_D_c+e4p_c"
		"TMDPP|Pyrimidine Catabolism::thymd_c+pi_c --> 2dr1p_c+thym_c"
		"TMDPP|Pyrimidine Catabolism_reverse::2dr1p_c+thym_c --> thymd_c+pi_c"
		"TPI|Glycolysis/Gluconeogenesis::dhap_c --> g3p_c"
		"TPI|Glycolysis/Gluconeogenesis_reverse::g3p_c --> dhap_c"
		"TRIOK|Fructose and Mannose Metabolism::atp_c+glyald_c --> h_c+adp_c+g3p_c"
		"TRPHYDRO2|Tryptophan metabolism::trp_L_c+o2_c+thbpt_c --> 5htrp_c+thbpt4acam_c"
		"TRPt|Transport_ Extracellular::trp_L_e --> trp_L_c"
		"TRPt|Transport_ Extracellular_reverse::trp_L_c --> trp_L_e"
		"TRPt4|Transport_ Extracellular::trp_L_e+na1_e --> trp_L_c+na1_c"
		"TRPt4|Transport_ Extracellular_reverse::trp_L_c+na1_c --> trp_L_e+na1_e"
		"TRYPTAOX|Tryptophan metabolism::o2_c+h2o_c+trypta_c --> h2o2_c+nh4_c+id3acald_c"
		"TSULt4_3|Transport_ Extracellular::3.0*na1_e+tsul_e --> 3.0*na1_c+tsul_c"
		"TSULt4_3|Transport_ Extracellular_reverse::3.0*na1_c+tsul_c --> 3.0*na1_e+tsul_e"
		"TXA2te|Transport_ Extracellular::txa2_e --> txa2_c"
		"TXA2te|Transport_ Extracellular_reverse::txa2_c --> txa2_e"
		"TXA2tr|Transport_ Endoplasmic Reticular::txa2_c --> txa2_r"
		"TXA2tr|Transport_ Endoplasmic Reticular_reverse::txa2_r --> txa2_c"
		"TXASr|Eicosanoid Metabolism::prostgh2_r --> txa2_r"
		"TXBS|Eicosanoid Metabolism::txa2_c+h2o_c+h_c --> txb2_c"
		"TYMSFt|Transport_ Extracellular::tymsf_c --> tymsf_e"
		"TYMSULT|Tyrosine metabolism::paps_c+tym_c --> pap_c+tymsf_c+h_c"
		"TYR3MO2|Tyrosine metabolism::o2_c+thbpt_c+tyr_L_c --> thbpt4acam_c+34dhphe_c"
		"TYRCBOX|Tyrosine metabolism::tyr_L_c+h_c --> tym_c+co2_c"
		"TYRDOPO|Tyrosine metabolism::o2_c+2.0*tyr_L_c --> 2.0*34dhphe_c"
		"TYROXDAc|Tyrosine metabolism::o2_c+h2o_c+tym_c --> h2o2_c+nh4_c+4hoxpacd_c"
		"TYRTA|Tyrosine metabolism::tyr_L_c+akg_c --> 34hpp_c+glu_L_c"
		"TYRTA|Tyrosine metabolism_reverse::34hpp_c+glu_L_c --> tyr_L_c+akg_c"
		"TYRt|Transport_ Extracellular::tyr_L_e --> tyr_L_c"
		"TYRt|Transport_ Extracellular_reverse::tyr_L_c --> tyr_L_e"
		"TYRt4|Transport_ Extracellular::na1_e+tyr_L_e --> na1_c+tyr_L_c"
		"TYRt4|Transport_ Extracellular_reverse::na1_c+tyr_L_c --> na1_e+tyr_L_e"
		"UDPG4E|Galactose metabolism::udpg_c --> udpgal_c"
		"UDPG4E|Galactose metabolism_reverse::udpgal_c --> udpg_c"
		"UGLT|Galactose metabolism::gal1p_c+udpg_c --> udpgal_c+g1p_c"
		"UGLT|Galactose metabolism_reverse::udpgal_c+g1p_c --> gal1p_c+udpg_c"
		"UMPK|Nucleotides::ump_c+atp_c --> udp_c+adp_c"
		"UMPK|Nucleotides_reverse::udp_c+adp_c --> ump_c+atp_c"
		"UMPK2|Nucleotides::ump_c+ctp_c --> cdp_c+udp_c"
		"UMPK2|Nucleotides_reverse::cdp_c+udp_c --> ump_c+ctp_c"
		"UMPK3|Nucleotides::ump_c+utp_c --> 2.0*udp_c"
		"UMPK3|Nucleotides_reverse::2.0*udp_c --> ump_c+utp_c"
		"UMPK4|Nucleotides::ump_c+gtp_c --> gdp_c+udp_c"
		"UMPK4|Nucleotides_reverse::gdp_c+udp_c --> ump_c+gtp_c"
		"UPP3S|Heme Biosynthesis::hmbil_c --> h2o_c+uppg3_c"
		"UPPDC1|Heme Biosynthesis::uppg3_c+4.0*h_c --> 4.0*co2_c+cpppg3_c"
		"UPPN|Pyrimidine Catabolism::h2o_c+2.0*h_c+cala_c --> ala_B_c+nh4_c+co2_c"
		"URATEt|Transport_ Extracellular::urate_c --> urate_e"
		"URATEt|Transport_ Extracellular_reverse::urate_e --> urate_c"
		"URATEtx|Transport_ Peroxisomal::urate_x --> urate_c"
		"URATEtx|Transport_ Peroxisomal_reverse::urate_c --> urate_x"
		"URAt|Transport_ Extracellular::ura_e --> ura_c"
		"URAt|Transport_ Extracellular_reverse::ura_c --> ura_e"
		"UREAt|Transport_ Extracellular::urea_e --> urea_c"
		"UREAt|Transport_ Extracellular_reverse::urea_c --> urea_e"
		"UREAt5|Transport_ Extracellular::urea_e+h2o_e --> urea_c+h2o_c"
		"UREAt5|Transport_ Extracellular_reverse::urea_c+h2o_c --> urea_e+h2o_e"
		"URIK1|Pyrimidine Biosynthesis::uri_c+atp_c --> ump_c+h_c+adp_c"
		"URIt|Transport_ Extracellular::uri_e --> uri_c"
		"URIt|Transport_ Extracellular_reverse::uri_c --> uri_e"
		"URIt4|Transport_ Extracellular::uri_e+na1_e --> uri_c+na1_c"
		"URIt4|Transport_ Extracellular_reverse::uri_c+na1_c --> uri_e+na1_e"
		"URIt5|Transport_ Extracellular::uri_e+2.0*na1_e --> uri_c+2.0*na1_c"
		"URIt5|Transport_ Extracellular_reverse::uri_c+2.0*na1_c --> uri_e+2.0*na1_e"
		"VALTA|Valine_ Leucine_ and Isoleucine Metabolism::val_L_c+akg_c --> 3mob_c+glu_L_c"
		"VALTA|Valine_ Leucine_ and Isoleucine Metabolism_reverse::3mob_c+glu_L_c --> val_L_c+akg_c"
		"VALt4|Transport_ Extracellular::val_L_e+na1_e --> val_L_c+na1_c"
		"VALt4|Transport_ Extracellular_reverse::val_L_c+na1_c --> val_L_e+na1_e"
		"VALtec|Transport_ Extracellular::val_L_e --> val_L_c"
		"VALtec|Transport_ Extracellular_reverse::val_L_c --> val_L_e"
		"XANtx|Transport_ Peroxisomal::xan_c --> xan_x"
		"XANtx|Transport_ Peroxisomal_reverse::xan_x --> xan_c"
		"XAOx|Purine Catabolism::o2_x+h2o_x+xan_x --> h2o2_x+urate_x"
		"XAOx|Purine Catabolism_reverse::h2o2_x+urate_x --> o2_x+h2o_x+xan_x"
		"XYLK|Pentose and Glucuronate Interconversions::atp_c+xylu_D_c --> xu5p_D_c+h_c+adp_c"
		"XYLTD_Dr|Pentose and Glucuronate Interconversions::xylt_c+nad_c --> nadh_c+h_c+xylu_D_c"
		"XYLTD_Dr|Pentose and Glucuronate Interconversions_reverse::nadh_c+h_c+xylu_D_c --> xylt_c+nad_c"
		"XYLUR|Pentose and Glucuronate Interconversions::h_c+nadph_c+xylu_L_c --> nadp_c+xylt_c"
		"XYLUR|Pentose and Glucuronate Interconversions_reverse::nadp_c+xylt_c --> h_c+nadph_c+xylu_L_c"
		"sink_etha|Intracellular Constraint::etha_c --> []"
		"sink_etha|Intracellular Constraint_reverse::[] --> etha_c"
		"EX_3mob_e|Extracellular exchange::3mob_c --> []"
		"EX_3mob_e|Extracellular exchange_reverse::[] --> 3mob_c"
		"EX_5oxpro_e|Extracellular exchange::5oxpro_c --> []"
		"EX_5oxpro_e|Extracellular exchange_reverse::[] --> 5oxpro_c"
		"EX_acrn_e|Extracellular exchange::acrn_c --> []"
		"EX_acrn_e|Extracellular exchange_reverse::[] --> acrn_c"
		"EX_ahcys_e|Extracellular exchange::ahcys_c --> []"
		"EX_ahcys_e|Extracellular exchange_reverse::[] --> ahcys_c"
		"EX_cdpea_e|Extracellular exchange::cdpea_c --> []"
		"EX_cdpea_e|Extracellular exchange_reverse::[] --> cdpea_c"
		"EX_cholp_e|Extracellular exchange::cholp_c --> []"
		"EX_cholp_e|Extracellular exchange_reverse::[] --> cholp_c"
		"EX_citr_L_e|Extracellular exchange::citr_L_c --> []"
		"EX_citr_L_e|Extracellular exchange_reverse::[] --> citr_L_c"
		"EX_fum_e|Extracellular exchange::fum_c --> []"
		"EX_fum_e|Extracellular exchange_reverse::[] --> fum_c"
		"EX_pmtcrn_e|Extracellular exchange::pmtcrn_c --> []"
		"EX_pmtcrn_e|Extracellular exchange_reverse::[] --> pmtcrn_c"
		"GPAM_hs_16_0|Expanded DAG metabolism::glyc3p_c+pmtcoa_c --> coa_c+alpha_hs_16_0_c"
		"LPS3_hs_16_0|Expanded DAG metabolism::h2o_c+mag_hs_16_0_c --> glyc_c+hdca_c+h_c"
		"LPASE_16_0|Expanded Phospholipid metabolism::h2o_c+lpchol_hs_16_0_c --> hdca_c+h_c+g3pc_c"
		"GPAM_hs_18_0|Expanded DAG metabolism::glyc3p_c+stcoa_c --> coa_c+alpha_hs_18_0_c"
		"LPS3_hs_18_0|Expanded DAG metabolism::h2o_c+mag_hs_18_0_c --> glyc_c+h_c+ocdca_c"
		"LPASE_18_0|Expanded Phospholipid metabolism::h2o_c+lpchol_hs_18_0_c --> h_c+ocdca_c+g3pc_c"
		"GPAM_hs_18_1|Expanded DAG metabolism::glyc3p_c+odecoa_c --> coa_c+alpha_hs_18_1_c"
		"LPS3_hs_18_1|Expanded DAG metabolism::h2o_c+mag_hs_18_1_c --> ocdcea_c+glyc_c+h_c"
		"LPASE_18_1|Expanded Phospholipid metabolism::h2o_c+lpchol_hs_18_1_c --> ocdcea_c+h_c+g3pc_c"
		"GPAM_hs_18_2|Expanded DAG metabolism::glyc3p_c+lnlccoa_c --> coa_c+alpha_hs_18_2_c"
		"LPS3_hs_18_2|Expanded DAG metabolism::h2o_c+mag_hs_18_2_c --> glyc_c+lnlc_c+h_c"
		"LPASE_18_2|Expanded Phospholipid metabolism::h2o_c+lpchol_hs_18_2_c --> lnlc_c+h_c+g3pc_c"
		"GPAM_hs_20_4|Expanded DAG metabolism::glyc3p_c+arachdcoa_c --> coa_c+alpha_hs_20_4_c"
		"LPS3_hs_20_4|Expanded DAG metabolism::h2o_c+mag_hs_20_4_c --> glyc_c+h_c+arachd_c"
		"LPASE_20_4|Expanded Phospholipid metabolism::h2o_c+lpchol_hs_20_4_c --> h_c+arachd_c+g3pc_c"
		"AGPAT1_16_0_16_0|Expanded DAG metabolism::pmtcoa_c+alpha_hs_16_0_c --> coa_c+pa_hs_16_0_16_0_c"
		"PPAP_16_0_16_0|Expanded DAG metabolism::h2o_c+pa_hs_16_0_16_0_c --> dag_hs_16_0_16_0_c+pi_c"
		"CEPTE_16_0_16_0|Expanded Phospholipid metabolism::dag_hs_16_0_16_0_c+cdpea_c --> cmp_c+pe_hs_16_0_16_0_c+h_c"
		"PSSA2_hs_16_0_16_0|Expanded Phospholipid metabolism::ser_L_c+pe_hs_16_0_16_0_c --> ps_hs_16_0_16_0_c+etha_c"
		"PSSA2_hs_16_0_16_0|Expanded Phospholipid metabolism_reverse::ps_hs_16_0_16_0_c+etha_c --> ser_L_c+pe_hs_16_0_16_0_c"
		"PSSA1_hs_16_0_16_0|Expanded Phospholipid metabolism::chol_c+ps_hs_16_0_16_0_c --> ser_L_c+pchol_hs_16_0_16_0_c"
		"PSSA1_hs_16_0_16_0|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_16_0_16_0_c --> chol_c+ps_hs_16_0_16_0_c"
		"CEPTC_16_0_16_0|Expanded Phospholipid metabolism::dag_hs_16_0_16_0_c+cdpchol_c --> cmp_c+h_c+pchol_hs_16_0_16_0_c"
		"PLA2_2_16_0_16_0|Expanded Phospholipid metabolism::h2o_c+pchol_hs_16_0_16_0_c --> lpchol_hs_16_0_c+hdca_c+h_c"
		"DAGK_hs_16_0_16_0|Expanded DAG metabolism::pa_hs_16_0_16_0_c+h_c+adp_c --> dag_hs_16_0_16_0_c+atp_c"
		"DAGK_hs_16_0_16_0|Expanded DAG metabolism_reverse::dag_hs_16_0_16_0_c+atp_c --> pa_hs_16_0_16_0_c+h_c+adp_c"
		"LPS2_16_0_16_0|Expanded DAG metabolism::h2o_c+dag_hs_16_0_16_0_c --> hdca_c+mag_hs_16_0_c+h_c"
		"CDS_16_0_16_0|Expanded Glycerophospholipid metabolism::ctp_c+pa_hs_16_0_16_0_c+h_c --> ppi_c+cdpdag_hs_16_0_16_0_c"
		"CDIPTr_16_0_16_0|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_16_0_16_0_c --> cmp_c+h_c+pail_hs_16_0_16_0_c"
		"PIPLC_16_0_16_0|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_16_0_16_0_c --> mi1p_D_c+dag_hs_16_0_16_0_c+h_c"
		"PIK4_16_0_16_0|Expanded Glycerophospholipid metabolism::atp_c+pail_hs_16_0_16_0_c --> pail4p_hs_16_0_16_0_c+h_c+adp_c"
		"PI4PLC_16_0_16_0|Expanded Glycerophospholipid metabolism::pail4p_hs_16_0_16_0_c+h2o_c --> dag_hs_16_0_16_0_c+h_c+mi14p_c"
		"PI4P3K_16_0_16_0|Expanded Glycerophospholipid metabolism::pail4p_hs_16_0_16_0_c+atp_c --> h_c+adp_c+pail34p_hs_16_0_16_0_c"
		"PI34P5K_16_0_16_0|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_16_0_16_0_c --> pail345p_hs_16_0_16_0_c+h_c+adp_c"
		"PI4P5K_16_0_16_0|Expanded Glycerophospholipid metabolism::pail45p_hs_16_0_16_0_c+atp_c --> pail345p_hs_16_0_16_0_c+h_c+adp_c"
		"PI345P3P_16_0_16_0|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_16_0_16_0_c --> pail45p_hs_16_0_16_0_c+pi_c"
		"PI45PLC_16_0_16_0|Expanded Glycerophospholipid metabolism::pail45p_hs_16_0_16_0_c+h2o_c --> dag_hs_16_0_16_0_c+h_c+mi145p_c"
		"AGPAT1_16_0_18_0|Expanded DAG metabolism::stcoa_c+alpha_hs_16_0_c --> pa_hs_16_0_18_0_c+coa_c"
		"PPAP_16_0_18_0|Expanded DAG metabolism::h2o_c+pa_hs_16_0_18_0_c --> pi_c+dag_hs_16_0_18_0_c"
		"CEPTE_16_0_18_0|Expanded Phospholipid metabolism::cdpea_c+dag_hs_16_0_18_0_c --> pe_hs_16_0_18_0_c+cmp_c+h_c"
		"PSSA2_hs_16_0_18_0|Expanded Phospholipid metabolism::pe_hs_16_0_18_0_c+ser_L_c --> etha_c+ps_hs_16_0_18_0_c"
		"PSSA2_hs_16_0_18_0|Expanded Phospholipid metabolism_reverse::etha_c+ps_hs_16_0_18_0_c --> pe_hs_16_0_18_0_c+ser_L_c"
		"PSSA1_hs_16_0_18_0|Expanded Phospholipid metabolism::chol_c+ps_hs_16_0_18_0_c --> ser_L_c+pchol_hs_16_0_18_0_c"
		"PSSA1_hs_16_0_18_0|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_16_0_18_0_c --> chol_c+ps_hs_16_0_18_0_c"
		"CEPTC_16_0_18_0|Expanded Phospholipid metabolism::dag_hs_16_0_18_0_c+cdpchol_c --> cmp_c+pchol_hs_16_0_18_0_c+h_c"
		"PLA2_2_16_0_18_0|Expanded Phospholipid metabolism::h2o_c+pchol_hs_16_0_18_0_c --> lpchol_hs_16_0_c+h_c+ocdca_c"
		"DAGK_hs_16_0_18_0|Expanded DAG metabolism::pa_hs_16_0_18_0_c+h_c+adp_c --> atp_c+dag_hs_16_0_18_0_c"
		"DAGK_hs_16_0_18_0|Expanded DAG metabolism_reverse::atp_c+dag_hs_16_0_18_0_c --> pa_hs_16_0_18_0_c+h_c+adp_c"
		"LPS2_16_0_18_0|Expanded DAG metabolism::h2o_c+dag_hs_16_0_18_0_c --> mag_hs_16_0_c+h_c+ocdca_c"
		"CDS_16_0_18_0|Expanded Glycerophospholipid metabolism::pa_hs_16_0_18_0_c+ctp_c+h_c --> ppi_c+cdpdag_hs_16_0_18_0_c"
		"CDIPTr_16_0_18_0|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_16_0_18_0_c --> cmp_c+pail_hs_16_0_18_0_c+h_c"
		"PIPLC_16_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_16_0_18_0_c --> mi1p_D_c+h_c+dag_hs_16_0_18_0_c"
		"PIK4_16_0_18_0|Expanded Glycerophospholipid metabolism::atp_c+pail_hs_16_0_18_0_c --> h_c+adp_c+pail4p_hs_16_0_18_0_c"
		"PI4PLC_16_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_16_0_18_0_c --> h_c+dag_hs_16_0_18_0_c+mi14p_c"
		"PI4P3K_16_0_18_0|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_16_0_18_0_c --> h_c+pail34p_hs_16_0_18_0_c+adp_c"
		"PI34P5K_16_0_18_0|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_16_0_18_0_c --> pail345p_hs_16_0_18_0_c+h_c+adp_c"
		"PI4P5K_16_0_18_0|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_16_0_18_0_c --> pail345p_hs_16_0_18_0_c+h_c+adp_c"
		"PI345P3P_16_0_18_0|Expanded Glycerophospholipid metabolism::pail345p_hs_16_0_18_0_c+h2o_c --> pi_c+pail45p_hs_16_0_18_0_c"
		"PI45PLC_16_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_16_0_18_0_c --> h_c+dag_hs_16_0_18_0_c+mi145p_c"
		"AGPAT1_16_0_18_1|Expanded DAG metabolism::odecoa_c+alpha_hs_16_0_c --> pa_hs_16_0_18_1_c+coa_c"
		"PPAP_16_0_18_1|Expanded DAG metabolism::pa_hs_16_0_18_1_c+h2o_c --> pi_c+dag_hs_16_0_18_1_c"
		"CEPTE_16_0_18_1|Expanded Phospholipid metabolism::cdpea_c+dag_hs_16_0_18_1_c --> cmp_c+pe_hs_16_0_18_1_c+h_c"
		"PSSA2_hs_16_0_18_1|Expanded Phospholipid metabolism::pe_hs_16_0_18_1_c+ser_L_c --> etha_c+ps_hs_16_0_18_1_c"
		"PSSA2_hs_16_0_18_1|Expanded Phospholipid metabolism_reverse::etha_c+ps_hs_16_0_18_1_c --> pe_hs_16_0_18_1_c+ser_L_c"
		"PSSA1_hs_16_0_18_1|Expanded Phospholipid metabolism::chol_c+ps_hs_16_0_18_1_c --> ser_L_c+pchol_hs_16_0_18_1_c"
		"PSSA1_hs_16_0_18_1|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_16_0_18_1_c --> chol_c+ps_hs_16_0_18_1_c"
		"CEPTC_16_0_18_1|Expanded Phospholipid metabolism::cdpchol_c+dag_hs_16_0_18_1_c --> cmp_c+h_c+pchol_hs_16_0_18_1_c"
		"PLA2_2_16_0_18_1|Expanded Phospholipid metabolism::h2o_c+pchol_hs_16_0_18_1_c --> ocdcea_c+lpchol_hs_16_0_c+h_c"
		"DAGK_hs_16_0_18_1|Expanded DAG metabolism::pa_hs_16_0_18_1_c+h_c+adp_c --> atp_c+dag_hs_16_0_18_1_c"
		"DAGK_hs_16_0_18_1|Expanded DAG metabolism_reverse::atp_c+dag_hs_16_0_18_1_c --> pa_hs_16_0_18_1_c+h_c+adp_c"
		"LPS2_16_0_18_1|Expanded DAG metabolism::h2o_c+dag_hs_16_0_18_1_c --> ocdcea_c+mag_hs_16_0_c+h_c"
		"CDS_16_0_18_1|Expanded Glycerophospholipid metabolism::pa_hs_16_0_18_1_c+ctp_c+h_c --> ppi_c+cdpdag_hs_16_0_18_1_c"
		"CDIPTr_16_0_18_1|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_16_0_18_1_c --> cmp_c+h_c+pail_hs_16_0_18_1_c"
		"PIPLC_16_0_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_16_0_18_1_c --> mi1p_D_c+h_c+dag_hs_16_0_18_1_c"
		"PIK4_16_0_18_1|Expanded Glycerophospholipid metabolism::atp_c+pail_hs_16_0_18_1_c --> pail4p_hs_16_0_18_1_c+h_c+adp_c"
		"PI4PLC_16_0_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_16_0_18_1_c --> h_c+mi14p_c+dag_hs_16_0_18_1_c"
		"PI4P3K_16_0_18_1|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_16_0_18_1_c --> pail34p_hs_16_0_18_1_c+h_c+adp_c"
		"PI34P5K_16_0_18_1|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_16_0_18_1_c --> h_c+adp_c+pail345p_hs_16_0_18_1_c"
		"PI4P5K_16_0_18_1|Expanded Glycerophospholipid metabolism::pail45p_hs_16_0_18_1_c+atp_c --> h_c+adp_c+pail345p_hs_16_0_18_1_c"
		"PI345P3P_16_0_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_16_0_18_1_c --> pail45p_hs_16_0_18_1_c+pi_c"
		"PI45PLC_16_0_18_1|Expanded Glycerophospholipid metabolism::pail45p_hs_16_0_18_1_c+h2o_c --> h_c+mi145p_c+dag_hs_16_0_18_1_c"
		"AGPAT1_16_0_18_2|Expanded DAG metabolism::lnlccoa_c+alpha_hs_16_0_c --> coa_c+pa_hs_16_0_18_2_c"
		"PPAP_16_0_18_2|Expanded DAG metabolism::h2o_c+pa_hs_16_0_18_2_c --> pi_c+dag_hs_16_0_18_2_c"
		"CEPTE_16_0_18_2|Expanded Phospholipid metabolism::cdpea_c+dag_hs_16_0_18_2_c --> pe_hs_16_0_18_2_c+cmp_c+h_c"
		"PSSA2_hs_16_0_18_2|Expanded Phospholipid metabolism::pe_hs_16_0_18_2_c+ser_L_c --> etha_c+ps_hs_16_0_18_2_c"
		"PSSA2_hs_16_0_18_2|Expanded Phospholipid metabolism_reverse::etha_c+ps_hs_16_0_18_2_c --> pe_hs_16_0_18_2_c+ser_L_c"
		"PSSA1_hs_16_0_18_2|Expanded Phospholipid metabolism::chol_c+ps_hs_16_0_18_2_c --> ser_L_c+pchol_hs_16_0_18_2_c"
		"PSSA1_hs_16_0_18_2|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_16_0_18_2_c --> chol_c+ps_hs_16_0_18_2_c"
		"CEPTC_16_0_18_2|Expanded Phospholipid metabolism::dag_hs_16_0_18_2_c+cdpchol_c --> cmp_c+h_c+pchol_hs_16_0_18_2_c"
		"PLA2_2_16_0_18_2|Expanded Phospholipid metabolism::h2o_c+pchol_hs_16_0_18_2_c --> lpchol_hs_16_0_c+lnlc_c+h_c"
		"DAGK_hs_16_0_18_2|Expanded DAG metabolism::h_c+adp_c+pa_hs_16_0_18_2_c --> atp_c+dag_hs_16_0_18_2_c"
		"DAGK_hs_16_0_18_2|Expanded DAG metabolism_reverse::atp_c+dag_hs_16_0_18_2_c --> h_c+adp_c+pa_hs_16_0_18_2_c"
		"LPS2_16_0_18_2|Expanded DAG metabolism::h2o_c+dag_hs_16_0_18_2_c --> lnlc_c+mag_hs_16_0_c+h_c"
		"CDS_16_0_18_2|Expanded Glycerophospholipid metabolism::ctp_c+h_c+pa_hs_16_0_18_2_c --> ppi_c+cdpdag_hs_16_0_18_2_c"
		"CDIPTr_16_0_18_2|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_16_0_18_2_c --> cmp_c+pail_hs_16_0_18_2_c+h_c"
		"PIPLC_16_0_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_16_0_18_2_c --> mi1p_D_c+h_c+dag_hs_16_0_18_2_c"
		"PIK4_16_0_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail_hs_16_0_18_2_c --> h_c+adp_c+pail4p_hs_16_0_18_2_c"
		"PI4PLC_16_0_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_16_0_18_2_c --> h_c+dag_hs_16_0_18_2_c+mi14p_c"
		"PI4P3K_16_0_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_16_0_18_2_c --> h_c+pail34p_hs_16_0_18_2_c+adp_c"
		"PI34P5K_16_0_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_16_0_18_2_c --> pail345p_hs_16_0_18_2_c+h_c+adp_c"
		"PI4P5K_16_0_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_16_0_18_2_c --> pail345p_hs_16_0_18_2_c+h_c+adp_c"
		"PI345P3P_16_0_18_2|Expanded Glycerophospholipid metabolism::pail345p_hs_16_0_18_2_c+h2o_c --> pi_c+pail45p_hs_16_0_18_2_c"
		"PI45PLC_16_0_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_16_0_18_2_c --> h_c+dag_hs_16_0_18_2_c+mi145p_c"
		"AGPAT1_16_0_20_4|Expanded DAG metabolism::arachdcoa_c+alpha_hs_16_0_c --> pa_hs_16_0_20_4_c+coa_c"
		"PPAP_16_0_20_4|Expanded DAG metabolism::pa_hs_16_0_20_4_c+h2o_c --> dag_hs_16_0_20_4_c+pi_c"
		"CEPTE_16_0_20_4|Expanded Phospholipid metabolism::cdpea_c+dag_hs_16_0_20_4_c --> cmp_c+h_c+pe_hs_16_0_20_4_c"
		"PSSA2_hs_16_0_20_4|Expanded Phospholipid metabolism::ser_L_c+pe_hs_16_0_20_4_c --> ps_hs_16_0_20_4_c+etha_c"
		"PSSA2_hs_16_0_20_4|Expanded Phospholipid metabolism_reverse::ps_hs_16_0_20_4_c+etha_c --> ser_L_c+pe_hs_16_0_20_4_c"
		"PSSA1_hs_16_0_20_4|Expanded Phospholipid metabolism::ps_hs_16_0_20_4_c+chol_c --> pchol_hs_16_0_20_4_c+ser_L_c"
		"PSSA1_hs_16_0_20_4|Expanded Phospholipid metabolism_reverse::pchol_hs_16_0_20_4_c+ser_L_c --> ps_hs_16_0_20_4_c+chol_c"
		"CEPTC_16_0_20_4|Expanded Phospholipid metabolism::dag_hs_16_0_20_4_c+cdpchol_c --> cmp_c+pchol_hs_16_0_20_4_c+h_c"
		"PLA2_2_16_0_20_4|Expanded Phospholipid metabolism::h2o_c+pchol_hs_16_0_20_4_c --> lpchol_hs_16_0_c+h_c+arachd_c"
		"DAGK_hs_16_0_20_4|Expanded DAG metabolism::pa_hs_16_0_20_4_c+h_c+adp_c --> atp_c+dag_hs_16_0_20_4_c"
		"DAGK_hs_16_0_20_4|Expanded DAG metabolism_reverse::atp_c+dag_hs_16_0_20_4_c --> pa_hs_16_0_20_4_c+h_c+adp_c"
		"LPS2_16_0_20_4|Expanded DAG metabolism::h2o_c+dag_hs_16_0_20_4_c --> mag_hs_16_0_c+h_c+arachd_c"
		"CDS_16_0_20_4|Expanded Glycerophospholipid metabolism::pa_hs_16_0_20_4_c+ctp_c+h_c --> ppi_c+cdpdag_hs_16_0_20_4_c"
		"CDIPTr_16_0_20_4|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_16_0_20_4_c --> pail_hs_16_0_20_4_c+cmp_c+h_c"
		"PIPLC_16_0_20_4|Expanded Glycerophospholipid metabolism::pail_hs_16_0_20_4_c+h2o_c --> mi1p_D_c+dag_hs_16_0_20_4_c+h_c"
		"PIK4_16_0_20_4|Expanded Glycerophospholipid metabolism::pail_hs_16_0_20_4_c+atp_c --> h_c+adp_c+pail4p_hs_16_0_20_4_c"
		"PI4PLC_16_0_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_16_0_20_4_c --> dag_hs_16_0_20_4_c+h_c+mi14p_c"
		"PI4P3K_16_0_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_16_0_20_4_c --> pail34p_hs_16_0_20_4_c+h_c+adp_c"
		"PI34P5K_16_0_20_4|Expanded Glycerophospholipid metabolism::pail34p_hs_16_0_20_4_c+atp_c --> pail345p_hs_16_0_20_4_c+h_c+adp_c"
		"PI4P5K_16_0_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_16_0_20_4_c --> pail345p_hs_16_0_20_4_c+h_c+adp_c"
		"PI345P3P_16_0_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_16_0_20_4_c --> pi_c+pail45p_hs_16_0_20_4_c"
		"PI45PLC_16_0_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_16_0_20_4_c --> dag_hs_16_0_20_4_c+h_c+mi145p_c"
		"AGPAT1_18_0_18_0|Expanded DAG metabolism::alpha_hs_18_0_c+stcoa_c --> coa_c+pa_hs_18_0_18_0_c"
		"PPAP_18_0_18_0|Expanded DAG metabolism::h2o_c+pa_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+pi_c"
		"CEPTE_18_0_18_0|Expanded Phospholipid metabolism::dag_hs_18_0_18_0_c+cdpea_c --> cmp_c+h_c+pe_hs_18_0_18_0_c"
		"PSSA2_hs_18_0_18_0|Expanded Phospholipid metabolism::ser_L_c+pe_hs_18_0_18_0_c --> ps_hs_18_0_18_0_c+etha_c"
		"PSSA2_hs_18_0_18_0|Expanded Phospholipid metabolism_reverse::ps_hs_18_0_18_0_c+etha_c --> ser_L_c+pe_hs_18_0_18_0_c"
		"PSSA1_hs_18_0_18_0|Expanded Phospholipid metabolism::chol_c+ps_hs_18_0_18_0_c --> ser_L_c+pchol_hs_18_0_18_0_c"
		"PSSA1_hs_18_0_18_0|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_0_18_0_c --> chol_c+ps_hs_18_0_18_0_c"
		"CEPTC_18_0_18_0|Expanded Phospholipid metabolism::dag_hs_18_0_18_0_c+cdpchol_c --> cmp_c+pchol_hs_18_0_18_0_c+h_c"
		"PLA2_2_18_0_18_0|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_0_18_0_c --> h_c+lpchol_hs_18_0_c+ocdca_c"
		"DAGK_hs_18_0_18_0|Expanded DAG metabolism::h_c+adp_c+pa_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+atp_c"
		"DAGK_hs_18_0_18_0|Expanded DAG metabolism_reverse::dag_hs_18_0_18_0_c+atp_c --> h_c+adp_c+pa_hs_18_0_18_0_c"
		"LPS2_18_0_18_0|Expanded DAG metabolism::dag_hs_18_0_18_0_c+h2o_c --> h_c+ocdca_c+mag_hs_18_0_c"
		"CDS_18_0_18_0|Expanded Glycerophospholipid metabolism::ctp_c+h_c+pa_hs_18_0_18_0_c --> ppi_c+cdpdag_hs_18_0_18_0_c"
		"CDIPTr_18_0_18_0|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_18_0_18_0_c --> cmp_c+pail_hs_18_0_18_0_c+h_c"
		"PIPLC_18_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+mi1p_D_c+h_c"
		"PIK4_18_0_18_0|Expanded Glycerophospholipid metabolism::pail_hs_18_0_18_0_c+atp_c --> pail4p_hs_18_0_18_0_c+h_c+adp_c"
		"PI4PLC_18_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+h_c+mi14p_c"
		"PI4P3K_18_0_18_0|Expanded Glycerophospholipid metabolism::pail4p_hs_18_0_18_0_c+atp_c --> pail34p_hs_18_0_18_0_c+h_c+adp_c"
		"PI34P5K_18_0_18_0|Expanded Glycerophospholipid metabolism::pail34p_hs_18_0_18_0_c+atp_c --> pail345p_hs_18_0_18_0_c+h_c+adp_c"
		"PI4P5K_18_0_18_0|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_18_0_18_0_c --> pail345p_hs_18_0_18_0_c+h_c+adp_c"
		"PI345P3P_18_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_0_18_0_c --> pi_c+pail45p_hs_18_0_18_0_c"
		"PI45PLC_18_0_18_0|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_0_18_0_c --> dag_hs_18_0_18_0_c+h_c+mi145p_c"
		"AGPAT1_18_0_18_1|Expanded DAG metabolism::alpha_hs_18_0_c+odecoa_c --> coa_c+pa_hs_18_0_18_1_c"
		"PPAP_18_0_18_1|Expanded DAG metabolism::h2o_c+pa_hs_18_0_18_1_c --> dag_hs_18_0_18_1_c+pi_c"
		"CEPTE_18_0_18_1|Expanded Phospholipid metabolism::dag_hs_18_0_18_1_c+cdpea_c --> cmp_c+h_c+pe_hs_18_0_18_1_c"
		"PSSA2_hs_18_0_18_1|Expanded Phospholipid metabolism::ser_L_c+pe_hs_18_0_18_1_c --> ps_hs_18_0_18_1_c+etha_c"
		"PSSA2_hs_18_0_18_1|Expanded Phospholipid metabolism_reverse::ps_hs_18_0_18_1_c+etha_c --> ser_L_c+pe_hs_18_0_18_1_c"
		"PSSA1_hs_18_0_18_1|Expanded Phospholipid metabolism::chol_c+ps_hs_18_0_18_1_c --> ser_L_c+pchol_hs_18_0_18_1_c"
		"PSSA1_hs_18_0_18_1|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_0_18_1_c --> chol_c+ps_hs_18_0_18_1_c"
		"CEPTC_18_0_18_1|Expanded Phospholipid metabolism::dag_hs_18_0_18_1_c+cdpchol_c --> cmp_c+h_c+pchol_hs_18_0_18_1_c"
		"PLA2_2_18_0_18_1|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_0_18_1_c --> ocdcea_c+h_c+lpchol_hs_18_0_c"
		"DAGK_hs_18_0_18_1|Expanded DAG metabolism::h_c+adp_c+pa_hs_18_0_18_1_c --> dag_hs_18_0_18_1_c+atp_c"
		"DAGK_hs_18_0_18_1|Expanded DAG metabolism_reverse::dag_hs_18_0_18_1_c+atp_c --> h_c+adp_c+pa_hs_18_0_18_1_c"
		"LPS2_18_0_18_1|Expanded DAG metabolism::dag_hs_18_0_18_1_c+h2o_c --> ocdcea_c+h_c+mag_hs_18_0_c"
		"CDS_18_0_18_1|Expanded Glycerophospholipid metabolism::ctp_c+h_c+pa_hs_18_0_18_1_c --> ppi_c+cdpdag_hs_18_0_18_1_c"
		"CDIPTr_18_0_18_1|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_18_0_18_1_c --> pail_hs_18_0_18_1_c+cmp_c+h_c"
		"PIPLC_18_0_18_1|Expanded Glycerophospholipid metabolism::pail_hs_18_0_18_1_c+h2o_c --> mi1p_D_c+dag_hs_18_0_18_1_c+h_c"
		"PIK4_18_0_18_1|Expanded Glycerophospholipid metabolism::pail_hs_18_0_18_1_c+atp_c --> pail4p_hs_18_0_18_1_c+h_c+adp_c"
		"PI4PLC_18_0_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_0_18_1_c --> dag_hs_18_0_18_1_c+h_c+mi14p_c"
		"PI4P3K_18_0_18_1|Expanded Glycerophospholipid metabolism::pail4p_hs_18_0_18_1_c+atp_c --> pail34p_hs_18_0_18_1_c+h_c+adp_c"
		"PI34P5K_18_0_18_1|Expanded Glycerophospholipid metabolism::pail34p_hs_18_0_18_1_c+atp_c --> h_c+pail345p_hs_18_0_18_1_c+adp_c"
		"PI4P5K_18_0_18_1|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_18_0_18_1_c --> h_c+pail345p_hs_18_0_18_1_c+adp_c"
		"PI345P3P_18_0_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_0_18_1_c --> pi_c+pail45p_hs_18_0_18_1_c"
		"PI45PLC_18_0_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_0_18_1_c --> dag_hs_18_0_18_1_c+h_c+mi145p_c"
		"AGPAT1_18_0_18_2|Expanded DAG metabolism::alpha_hs_18_0_c+lnlccoa_c --> coa_c+pa_hs_18_0_18_2_c"
		"PPAP_18_0_18_2|Expanded DAG metabolism::h2o_c+pa_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+pi_c"
		"CEPTE_18_0_18_2|Expanded Phospholipid metabolism::dag_hs_18_0_18_2_c+cdpea_c --> pe_hs_18_0_18_2_c+cmp_c+h_c"
		"PSSA2_hs_18_0_18_2|Expanded Phospholipid metabolism::pe_hs_18_0_18_2_c+ser_L_c --> ps_hs_18_0_18_2_c+etha_c"
		"PSSA2_hs_18_0_18_2|Expanded Phospholipid metabolism_reverse::ps_hs_18_0_18_2_c+etha_c --> pe_hs_18_0_18_2_c+ser_L_c"
		"PSSA1_hs_18_0_18_2|Expanded Phospholipid metabolism::chol_c+ps_hs_18_0_18_2_c --> ser_L_c+pchol_hs_18_0_18_2_c"
		"PSSA1_hs_18_0_18_2|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_0_18_2_c --> chol_c+ps_hs_18_0_18_2_c"
		"CEPTC_18_0_18_2|Expanded Phospholipid metabolism::dag_hs_18_0_18_2_c+cdpchol_c --> cmp_c+h_c+pchol_hs_18_0_18_2_c"
		"PLA2_2_18_0_18_2|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_0_18_2_c --> lnlc_c+h_c+lpchol_hs_18_0_c"
		"DAGK_hs_18_0_18_2|Expanded DAG metabolism::h_c+adp_c+pa_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+atp_c"
		"DAGK_hs_18_0_18_2|Expanded DAG metabolism_reverse::dag_hs_18_0_18_2_c+atp_c --> h_c+adp_c+pa_hs_18_0_18_2_c"
		"LPS2_18_0_18_2|Expanded DAG metabolism::dag_hs_18_0_18_2_c+h2o_c --> lnlc_c+h_c+mag_hs_18_0_c"
		"CDS_18_0_18_2|Expanded Glycerophospholipid metabolism::ctp_c+h_c+pa_hs_18_0_18_2_c --> ppi_c+cdpdag_hs_18_0_18_2_c"
		"CDIPTr_18_0_18_2|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_18_0_18_2_c --> cmp_c+pail_hs_18_0_18_2_c+h_c"
		"PIPLC_18_0_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+mi1p_D_c+h_c"
		"PIK4_18_0_18_2|Expanded Glycerophospholipid metabolism::pail_hs_18_0_18_2_c+atp_c --> pail4p_hs_18_0_18_2_c+h_c+adp_c"
		"PI4PLC_18_0_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+h_c+mi14p_c"
		"PI4P3K_18_0_18_2|Expanded Glycerophospholipid metabolism::pail4p_hs_18_0_18_2_c+atp_c --> pail34p_hs_18_0_18_2_c+h_c+adp_c"
		"PI34P5K_18_0_18_2|Expanded Glycerophospholipid metabolism::pail34p_hs_18_0_18_2_c+atp_c --> pail345p_hs_18_0_18_2_c+h_c+adp_c"
		"PI4P5K_18_0_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_18_0_18_2_c --> pail345p_hs_18_0_18_2_c+h_c+adp_c"
		"PI345P3P_18_0_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_0_18_2_c --> pi_c+pail45p_hs_18_0_18_2_c"
		"PI45PLC_18_0_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_0_18_2_c --> dag_hs_18_0_18_2_c+h_c+mi145p_c"
		"AGPAT1_18_0_20_4|Expanded DAG metabolism::arachdcoa_c+alpha_hs_18_0_c --> coa_c+pa_hs_18_0_20_4_c"
		"PPAP_18_0_20_4|Expanded DAG metabolism::h2o_c+pa_hs_18_0_20_4_c --> pi_c+dag_hs_18_0_20_4_c"
		"CEPTE_18_0_20_4|Expanded Phospholipid metabolism::cdpea_c+dag_hs_18_0_20_4_c --> cmp_c+pe_hs_18_0_20_4_c+h_c"
		"PSSA2_hs_18_0_20_4|Expanded Phospholipid metabolism::ser_L_c+pe_hs_18_0_20_4_c --> ps_hs_18_0_20_4_c+etha_c"
		"PSSA2_hs_18_0_20_4|Expanded Phospholipid metabolism_reverse::ps_hs_18_0_20_4_c+etha_c --> ser_L_c+pe_hs_18_0_20_4_c"
		"PSSA1_hs_18_0_20_4|Expanded Phospholipid metabolism::chol_c+ps_hs_18_0_20_4_c --> ser_L_c+pchol_hs_18_0_20_4_c"
		"PSSA1_hs_18_0_20_4|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_0_20_4_c --> chol_c+ps_hs_18_0_20_4_c"
		"CEPTC_18_0_20_4|Expanded Phospholipid metabolism::cdpchol_c+dag_hs_18_0_20_4_c --> cmp_c+pchol_hs_18_0_20_4_c+h_c"
		"PLA2_2_18_0_20_4|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_0_20_4_c --> h_c+lpchol_hs_18_0_c+arachd_c"
		"DAGK_hs_18_0_20_4|Expanded DAG metabolism::h_c+adp_c+pa_hs_18_0_20_4_c --> atp_c+dag_hs_18_0_20_4_c"
		"DAGK_hs_18_0_20_4|Expanded DAG metabolism_reverse::atp_c+dag_hs_18_0_20_4_c --> h_c+adp_c+pa_hs_18_0_20_4_c"
		"LPS2_18_0_20_4|Expanded DAG metabolism::h2o_c+dag_hs_18_0_20_4_c --> h_c+arachd_c+mag_hs_18_0_c"
		"CDS_18_0_20_4|Expanded Glycerophospholipid metabolism::ctp_c+h_c+pa_hs_18_0_20_4_c --> cdpdag_hs_18_0_20_4_c+ppi_c"
		"CDIPTr_18_0_20_4|Expanded Glycerophospholipid metabolism::cdpdag_hs_18_0_20_4_c+inost_c --> cmp_c+pail_hs_18_0_20_4_c+h_c"
		"PIPLC_18_0_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_18_0_20_4_c --> mi1p_D_c+h_c+dag_hs_18_0_20_4_c"
		"PIK4_18_0_20_4|Expanded Glycerophospholipid metabolism::pail_hs_18_0_20_4_c+atp_c --> pail4p_hs_18_0_20_4_c+h_c+adp_c"
		"PI4PLC_18_0_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_0_20_4_c --> h_c+dag_hs_18_0_20_4_c+mi14p_c"
		"PI4P3K_18_0_20_4|Expanded Glycerophospholipid metabolism::pail4p_hs_18_0_20_4_c+atp_c --> pail34p_hs_18_0_20_4_c+h_c+adp_c"
		"PI34P5K_18_0_20_4|Expanded Glycerophospholipid metabolism::pail34p_hs_18_0_20_4_c+atp_c --> pail345p_hs_18_0_20_4_c+h_c+adp_c"
		"PI4P5K_18_0_20_4|Expanded Glycerophospholipid metabolism::pail45p_hs_18_0_20_4_c+atp_c --> pail345p_hs_18_0_20_4_c+h_c+adp_c"
		"PI345P3P_18_0_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_0_20_4_c --> pail45p_hs_18_0_20_4_c+pi_c"
		"PI45PLC_18_0_20_4|Expanded Glycerophospholipid metabolism::pail45p_hs_18_0_20_4_c+h2o_c --> h_c+mi145p_c+dag_hs_18_0_20_4_c"
		"AGPAT1_18_1_18_1|Expanded DAG metabolism::alpha_hs_18_1_c+odecoa_c --> pa_hs_18_1_18_1_c+coa_c"
		"PPAP_18_1_18_1|Expanded DAG metabolism::h2o_c+pa_hs_18_1_18_1_c --> dag_hs_18_1_18_1_c+pi_c"
		"CEPTE_18_1_18_1|Expanded Phospholipid metabolism::cdpea_c+dag_hs_18_1_18_1_c --> cmp_c+h_c+pe_hs_18_1_18_1_c"
		"PSSA2_hs_18_1_18_1|Expanded Phospholipid metabolism::ser_L_c+pe_hs_18_1_18_1_c --> ps_hs_18_1_18_1_c+etha_c"
		"PSSA2_hs_18_1_18_1|Expanded Phospholipid metabolism_reverse::ps_hs_18_1_18_1_c+etha_c --> ser_L_c+pe_hs_18_1_18_1_c"
		"PSSA1_hs_18_1_18_1|Expanded Phospholipid metabolism::chol_c+ps_hs_18_1_18_1_c --> ser_L_c+pchol_hs_18_1_18_1_c"
		"PSSA1_hs_18_1_18_1|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_1_18_1_c --> chol_c+ps_hs_18_1_18_1_c"
		"CEPTC_18_1_18_1|Expanded Phospholipid metabolism::dag_hs_18_1_18_1_c+cdpchol_c --> cmp_c+pchol_hs_18_1_18_1_c+h_c"
		"PLA2_2_18_1_18_1|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_1_18_1_c --> ocdcea_c+h_c+lpchol_hs_18_1_c"
		"DAGK_hs_18_1_18_1|Expanded DAG metabolism::pa_hs_18_1_18_1_c+h_c+adp_c --> dag_hs_18_1_18_1_c+atp_c"
		"DAGK_hs_18_1_18_1|Expanded DAG metabolism_reverse::dag_hs_18_1_18_1_c+atp_c --> pa_hs_18_1_18_1_c+h_c+adp_c"
		"LPS2_18_1_18_1|Expanded DAG metabolism::h2o_c+dag_hs_18_1_18_1_c --> ocdcea_c+mag_hs_18_1_c+h_c"
		"CDS_18_1_18_1|Expanded Glycerophospholipid metabolism::pa_hs_18_1_18_1_c+ctp_c+h_c --> cdpdag_hs_18_1_18_1_c+ppi_c"
		"CDIPTr_18_1_18_1|Expanded Glycerophospholipid metabolism::cdpdag_hs_18_1_18_1_c+inost_c --> cmp_c+pail_hs_18_1_18_1_c+h_c"
		"PIPLC_18_1_18_1|Expanded Glycerophospholipid metabolism::pail_hs_18_1_18_1_c+h2o_c --> mi1p_D_c+dag_hs_18_1_18_1_c+h_c"
		"PIK4_18_1_18_1|Expanded Glycerophospholipid metabolism::pail_hs_18_1_18_1_c+atp_c --> pail4p_hs_18_1_18_1_c+h_c+adp_c"
		"PI4PLC_18_1_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_1_18_1_c --> dag_hs_18_1_18_1_c+h_c+mi14p_c"
		"PI4P3K_18_1_18_1|Expanded Glycerophospholipid metabolism::pail4p_hs_18_1_18_1_c+atp_c --> pail34p_hs_18_1_18_1_c+h_c+adp_c"
		"PI34P5K_18_1_18_1|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_18_1_18_1_c --> pail345p_hs_18_1_18_1_c+h_c+adp_c"
		"PI4P5K_18_1_18_1|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_18_1_18_1_c --> pail345p_hs_18_1_18_1_c+h_c+adp_c"
		"PI345P3P_18_1_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_1_18_1_c --> pi_c+pail45p_hs_18_1_18_1_c"
		"PI45PLC_18_1_18_1|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_1_18_1_c --> dag_hs_18_1_18_1_c+h_c+mi145p_c"
		"AGPAT1_18_1_18_2|Expanded DAG metabolism::alpha_hs_18_1_c+lnlccoa_c --> coa_c+pa_hs_18_1_18_2_c"
		"PPAP_18_1_18_2|Expanded DAG metabolism::h2o_c+pa_hs_18_1_18_2_c --> pi_c+dag_hs_18_1_18_2_c"
		"CEPTE_18_1_18_2|Expanded Phospholipid metabolism::cdpea_c+dag_hs_18_1_18_2_c --> cmp_c+pe_hs_18_1_18_2_c+h_c"
		"PSSA2_hs_18_1_18_2|Expanded Phospholipid metabolism::pe_hs_18_1_18_2_c+ser_L_c --> ps_hs_18_1_18_2_c+etha_c"
		"PSSA2_hs_18_1_18_2|Expanded Phospholipid metabolism_reverse::ps_hs_18_1_18_2_c+etha_c --> pe_hs_18_1_18_2_c+ser_L_c"
		"PSSA1_hs_18_1_18_2|Expanded Phospholipid metabolism::chol_c+ps_hs_18_1_18_2_c --> ser_L_c+pchol_hs_18_1_18_2_c"
		"PSSA1_hs_18_1_18_2|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_1_18_2_c --> chol_c+ps_hs_18_1_18_2_c"
		"CEPTC_18_1_18_2|Expanded Phospholipid metabolism::dag_hs_18_1_18_2_c+cdpchol_c --> cmp_c+pchol_hs_18_1_18_2_c+h_c"
		"PLA2_2_18_1_18_2|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_1_18_2_c --> lnlc_c+h_c+lpchol_hs_18_1_c"
		"DAGK_hs_18_1_18_2|Expanded DAG metabolism::pa_hs_18_1_18_2_c+h_c+adp_c --> atp_c+dag_hs_18_1_18_2_c"
		"DAGK_hs_18_1_18_2|Expanded DAG metabolism_reverse::atp_c+dag_hs_18_1_18_2_c --> pa_hs_18_1_18_2_c+h_c+adp_c"
		"LPS2_18_1_18_2|Expanded DAG metabolism::h2o_c+dag_hs_18_1_18_2_c --> lnlc_c+mag_hs_18_1_c+h_c"
		"CDS_18_1_18_2|Expanded Glycerophospholipid metabolism::pa_hs_18_1_18_2_c+ctp_c+h_c --> ppi_c+cdpdag_hs_18_1_18_2_c"
		"CDIPTr_18_1_18_2|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_18_1_18_2_c --> cmp_c+h_c+pail_hs_18_1_18_2_c"
		"PIPLC_18_1_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_18_1_18_2_c --> mi1p_D_c+dag_hs_18_1_18_2_c+h_c"
		"PIK4_18_1_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail_hs_18_1_18_2_c --> pail4p_hs_18_1_18_2_c+h_c+adp_c"
		"PI4PLC_18_1_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_1_18_2_c --> dag_hs_18_1_18_2_c+h_c+mi14p_c"
		"PI4P3K_18_1_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_18_1_18_2_c --> h_c+adp_c+pail34p_hs_18_1_18_2_c"
		"PI34P5K_18_1_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_18_1_18_2_c --> h_c+adp_c+pail345p_hs_18_1_18_2_c"
		"PI4P5K_18_1_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_18_1_18_2_c --> h_c+adp_c+pail345p_hs_18_1_18_2_c"
		"PI345P3P_18_1_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_1_18_2_c --> pi_c+pail45p_hs_18_1_18_2_c"
		"PI45PLC_18_1_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_1_18_2_c --> dag_hs_18_1_18_2_c+h_c+mi145p_c"
		"AGPAT1_18_1_20_4|Expanded DAG metabolism::alpha_hs_18_1_c+arachdcoa_c --> coa_c+pa_hs_18_1_20_4_c"
		"PPAP_18_1_20_4|Expanded DAG metabolism::h2o_c+pa_hs_18_1_20_4_c --> pi_c+dag_hs_18_1_20_4_c"
		"CEPTE_18_1_20_4|Expanded Phospholipid metabolism::cdpea_c+dag_hs_18_1_20_4_c --> cmp_c+h_c+pe_hs_18_1_20_4_c"
		"PSSA2_hs_18_1_20_4|Expanded Phospholipid metabolism::ser_L_c+pe_hs_18_1_20_4_c --> ps_hs_18_1_20_4_c+etha_c"
		"PSSA2_hs_18_1_20_4|Expanded Phospholipid metabolism_reverse::ps_hs_18_1_20_4_c+etha_c --> ser_L_c+pe_hs_18_1_20_4_c"
		"PSSA1_hs_18_1_20_4|Expanded Phospholipid metabolism::chol_c+ps_hs_18_1_20_4_c --> ser_L_c+pchol_hs_18_1_20_4_c"
		"PSSA1_hs_18_1_20_4|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_1_20_4_c --> chol_c+ps_hs_18_1_20_4_c"
		"CEPTC_18_1_20_4|Expanded Phospholipid metabolism::cdpchol_c+dag_hs_18_1_20_4_c --> cmp_c+h_c+pchol_hs_18_1_20_4_c"
		"PLA2_2_18_1_20_4|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_1_20_4_c --> h_c+arachd_c+lpchol_hs_18_1_c"
		"DAGK_hs_18_1_20_4|Expanded DAG metabolism::pa_hs_18_1_20_4_c+h_c+adp_c --> atp_c+dag_hs_18_1_20_4_c"
		"DAGK_hs_18_1_20_4|Expanded DAG metabolism_reverse::atp_c+dag_hs_18_1_20_4_c --> pa_hs_18_1_20_4_c+h_c+adp_c"
		"LPS2_18_1_20_4|Expanded DAG metabolism::h2o_c+dag_hs_18_1_20_4_c --> mag_hs_18_1_c+h_c+arachd_c"
		"CDS_18_1_20_4|Expanded Glycerophospholipid metabolism::pa_hs_18_1_20_4_c+ctp_c+h_c --> ppi_c+cdpdag_hs_18_1_20_4_c"
		"CDIPTr_18_1_20_4|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_18_1_20_4_c --> cmp_c+h_c+pail_hs_18_1_20_4_c"
		"PIPLC_18_1_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_18_1_20_4_c --> mi1p_D_c+h_c+dag_hs_18_1_20_4_c"
		"PIK4_18_1_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail_hs_18_1_20_4_c --> h_c+adp_c+pail4p_hs_18_1_20_4_c"
		"PI4PLC_18_1_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_1_20_4_c --> h_c+mi14p_c+dag_hs_18_1_20_4_c"
		"PI4P3K_18_1_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_18_1_20_4_c --> h_c+adp_c+pail34p_hs_18_1_20_4_c"
		"PI34P5K_18_1_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_18_1_20_4_c --> pail345p_hs_18_1_20_4_c+h_c+adp_c"
		"PI4P5K_18_1_20_4|Expanded Glycerophospholipid metabolism::pail45p_hs_18_1_20_4_c+atp_c --> pail345p_hs_18_1_20_4_c+h_c+adp_c"
		"PI345P3P_18_1_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_1_20_4_c --> pail45p_hs_18_1_20_4_c+pi_c"
		"PI45PLC_18_1_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_1_20_4_c --> h_c+mi145p_c+dag_hs_18_1_20_4_c"
		"AGPAT1_18_2_18_2|Expanded DAG metabolism::alpha_hs_18_2_c+lnlccoa_c --> pa_hs_18_2_18_2_c+coa_c"
		"PPAP_18_2_18_2|Expanded DAG metabolism::pa_hs_18_2_18_2_c+h2o_c --> pi_c+dag_hs_18_2_18_2_c"
		"CEPTE_18_2_18_2|Expanded Phospholipid metabolism::cdpea_c+dag_hs_18_2_18_2_c --> cmp_c+pe_hs_18_2_18_2_c+h_c"
		"PSSA2_hs_18_2_18_2|Expanded Phospholipid metabolism::ser_L_c+pe_hs_18_2_18_2_c --> ps_hs_18_2_18_2_c+etha_c"
		"PSSA2_hs_18_2_18_2|Expanded Phospholipid metabolism_reverse::ps_hs_18_2_18_2_c+etha_c --> ser_L_c+pe_hs_18_2_18_2_c"
		"PSSA1_hs_18_2_18_2|Expanded Phospholipid metabolism::chol_c+ps_hs_18_2_18_2_c --> pchol_hs_18_2_18_2_c+ser_L_c"
		"PSSA1_hs_18_2_18_2|Expanded Phospholipid metabolism_reverse::pchol_hs_18_2_18_2_c+ser_L_c --> chol_c+ps_hs_18_2_18_2_c"
		"CEPTC_18_2_18_2|Expanded Phospholipid metabolism::cdpchol_c+dag_hs_18_2_18_2_c --> pchol_hs_18_2_18_2_c+cmp_c+h_c"
		"PLA2_2_18_2_18_2|Expanded Phospholipid metabolism::pchol_hs_18_2_18_2_c+h2o_c --> lnlc_c+h_c+lpchol_hs_18_2_c"
		"DAGK_hs_18_2_18_2|Expanded DAG metabolism::pa_hs_18_2_18_2_c+h_c+adp_c --> atp_c+dag_hs_18_2_18_2_c"
		"DAGK_hs_18_2_18_2|Expanded DAG metabolism_reverse::atp_c+dag_hs_18_2_18_2_c --> pa_hs_18_2_18_2_c+h_c+adp_c"
		"LPS2_18_2_18_2|Expanded DAG metabolism::h2o_c+dag_hs_18_2_18_2_c --> lnlc_c+h_c+mag_hs_18_2_c"
		"CDS_18_2_18_2|Expanded Glycerophospholipid metabolism::pa_hs_18_2_18_2_c+ctp_c+h_c --> cdpdag_hs_18_2_18_2_c+ppi_c"
		"CDIPTr_18_2_18_2|Expanded Glycerophospholipid metabolism::cdpdag_hs_18_2_18_2_c+inost_c --> cmp_c+pail_hs_18_2_18_2_c+h_c"
		"PIPLC_18_2_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_18_2_18_2_c --> mi1p_D_c+h_c+dag_hs_18_2_18_2_c"
		"PIK4_18_2_18_2|Expanded Glycerophospholipid metabolism::pail_hs_18_2_18_2_c+atp_c --> h_c+adp_c+pail4p_hs_18_2_18_2_c"
		"PI4PLC_18_2_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_2_18_2_c --> h_c+mi14p_c+dag_hs_18_2_18_2_c"
		"PI4P3K_18_2_18_2|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_18_2_18_2_c --> pail34p_hs_18_2_18_2_c+h_c+adp_c"
		"PI34P5K_18_2_18_2|Expanded Glycerophospholipid metabolism::pail34p_hs_18_2_18_2_c+atp_c --> pail345p_hs_18_2_18_2_c+h_c+adp_c"
		"PI4P5K_18_2_18_2|Expanded Glycerophospholipid metabolism::pail45p_hs_18_2_18_2_c+atp_c --> pail345p_hs_18_2_18_2_c+h_c+adp_c"
		"PI345P3P_18_2_18_2|Expanded Glycerophospholipid metabolism::pail345p_hs_18_2_18_2_c+h2o_c --> pail45p_hs_18_2_18_2_c+pi_c"
		"PI45PLC_18_2_18_2|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_2_18_2_c --> h_c+mi145p_c+dag_hs_18_2_18_2_c"
		"AGPAT1_18_2_20_4|Expanded DAG metabolism::arachdcoa_c+alpha_hs_18_2_c --> coa_c+pa_hs_18_2_20_4_c"
		"PPAP_18_2_20_4|Expanded DAG metabolism::h2o_c+pa_hs_18_2_20_4_c --> pi_c+dag_hs_18_2_20_4_c"
		"CEPTE_18_2_20_4|Expanded Phospholipid metabolism::cdpea_c+dag_hs_18_2_20_4_c --> cmp_c+pe_hs_18_2_20_4_c+h_c"
		"PSSA2_hs_18_2_20_4|Expanded Phospholipid metabolism::pe_hs_18_2_20_4_c+ser_L_c --> etha_c+ps_hs_18_2_20_4_c"
		"PSSA2_hs_18_2_20_4|Expanded Phospholipid metabolism_reverse::etha_c+ps_hs_18_2_20_4_c --> pe_hs_18_2_20_4_c+ser_L_c"
		"PSSA1_hs_18_2_20_4|Expanded Phospholipid metabolism::chol_c+ps_hs_18_2_20_4_c --> ser_L_c+pchol_hs_18_2_20_4_c"
		"PSSA1_hs_18_2_20_4|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_18_2_20_4_c --> chol_c+ps_hs_18_2_20_4_c"
		"CEPTC_18_2_20_4|Expanded Phospholipid metabolism::cdpchol_c+dag_hs_18_2_20_4_c --> cmp_c+h_c+pchol_hs_18_2_20_4_c"
		"PLA2_2_18_2_20_4|Expanded Phospholipid metabolism::h2o_c+pchol_hs_18_2_20_4_c --> h_c+lpchol_hs_18_2_c+arachd_c"
		"DAGK_hs_18_2_20_4|Expanded DAG metabolism::pa_hs_18_2_20_4_c+h_c+adp_c --> atp_c+dag_hs_18_2_20_4_c"
		"DAGK_hs_18_2_20_4|Expanded DAG metabolism_reverse::atp_c+dag_hs_18_2_20_4_c --> pa_hs_18_2_20_4_c+h_c+adp_c"
		"LPS2_18_2_20_4|Expanded DAG metabolism::h2o_c+dag_hs_18_2_20_4_c --> h_c+arachd_c+mag_hs_18_2_c"
		"CDS_18_2_20_4|Expanded Glycerophospholipid metabolism::ctp_c+pa_hs_18_2_20_4_c+h_c --> ppi_c+cdpdag_hs_18_2_20_4_c"
		"CDIPTr_18_2_20_4|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_18_2_20_4_c --> cmp_c+pail_hs_18_2_20_4_c+h_c"
		"PIPLC_18_2_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_18_2_20_4_c --> mi1p_D_c+h_c+dag_hs_18_2_20_4_c"
		"PIK4_18_2_20_4|Expanded Glycerophospholipid metabolism::pail_hs_18_2_20_4_c+atp_c --> pail4p_hs_18_2_20_4_c+h_c+adp_c"
		"PI4PLC_18_2_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_18_2_20_4_c --> h_c+dag_hs_18_2_20_4_c+mi14p_c"
		"PI4P3K_18_2_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_18_2_20_4_c --> pail34p_hs_18_2_20_4_c+h_c+adp_c"
		"PI34P5K_18_2_20_4|Expanded Glycerophospholipid metabolism::pail34p_hs_18_2_20_4_c+atp_c --> pail345p_hs_18_2_20_4_c+h_c+adp_c"
		"PI4P5K_18_2_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail45p_hs_18_2_20_4_c --> pail345p_hs_18_2_20_4_c+h_c+adp_c"
		"PI345P3P_18_2_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_18_2_20_4_c --> pi_c+pail45p_hs_18_2_20_4_c"
		"PI45PLC_18_2_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_18_2_20_4_c --> h_c+mi145p_c+dag_hs_18_2_20_4_c"
		"AGPAT1_20_4_20_4|Expanded DAG metabolism::alpha_hs_20_4_c+arachdcoa_c --> pa_hs_20_4_20_4_c+coa_c"
		"PPAP_20_4_20_4|Expanded DAG metabolism::h2o_c+pa_hs_20_4_20_4_c --> dag_hs_20_4_20_4_c+pi_c"
		"CEPTE_20_4_20_4|Expanded Phospholipid metabolism::dag_hs_20_4_20_4_c+cdpea_c --> pe_hs_20_4_20_4_c+cmp_c+h_c"
		"PSSA2_hs_20_4_20_4|Expanded Phospholipid metabolism::pe_hs_20_4_20_4_c+ser_L_c --> ps_hs_20_4_20_4_c+etha_c"
		"PSSA2_hs_20_4_20_4|Expanded Phospholipid metabolism_reverse::ps_hs_20_4_20_4_c+etha_c --> pe_hs_20_4_20_4_c+ser_L_c"
		"PSSA1_hs_20_4_20_4|Expanded Phospholipid metabolism::chol_c+ps_hs_20_4_20_4_c --> ser_L_c+pchol_hs_20_4_20_4_c"
		"PSSA1_hs_20_4_20_4|Expanded Phospholipid metabolism_reverse::ser_L_c+pchol_hs_20_4_20_4_c --> chol_c+ps_hs_20_4_20_4_c"
		"CEPTC_20_4_20_4|Expanded Phospholipid metabolism::dag_hs_20_4_20_4_c+cdpchol_c --> cmp_c+h_c+pchol_hs_20_4_20_4_c"
		"PLA2_2_20_4_20_4|Expanded Phospholipid metabolism::h2o_c+pchol_hs_20_4_20_4_c --> h_c+lpchol_hs_20_4_c+arachd_c"
		"DAGK_hs_20_4_20_4|Expanded DAG metabolism::pa_hs_20_4_20_4_c+h_c+adp_c --> dag_hs_20_4_20_4_c+atp_c"
		"DAGK_hs_20_4_20_4|Expanded DAG metabolism_reverse::dag_hs_20_4_20_4_c+atp_c --> pa_hs_20_4_20_4_c+h_c+adp_c"
		"LPS2_20_4_20_4|Expanded DAG metabolism::dag_hs_20_4_20_4_c+h2o_c --> mag_hs_20_4_c+h_c+arachd_c"
		"CDS_20_4_20_4|Expanded Glycerophospholipid metabolism::pa_hs_20_4_20_4_c+ctp_c+h_c --> ppi_c+cdpdag_hs_20_4_20_4_c"
		"CDIPTr_20_4_20_4|Expanded Glycerophospholipid metabolism::inost_c+cdpdag_hs_20_4_20_4_c --> cmp_c+pail_hs_20_4_20_4_c+h_c"
		"PIPLC_20_4_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail_hs_20_4_20_4_c --> dag_hs_20_4_20_4_c+mi1p_D_c+h_c"
		"PIK4_20_4_20_4|Expanded Glycerophospholipid metabolism::pail_hs_20_4_20_4_c+atp_c --> h_c+adp_c+pail4p_hs_20_4_20_4_c"
		"PI4PLC_20_4_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail4p_hs_20_4_20_4_c --> dag_hs_20_4_20_4_c+h_c+mi14p_c"
		"PI4P3K_20_4_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail4p_hs_20_4_20_4_c --> h_c+pail34p_hs_20_4_20_4_c+adp_c"
		"PI34P5K_20_4_20_4|Expanded Glycerophospholipid metabolism::atp_c+pail34p_hs_20_4_20_4_c --> pail345p_hs_20_4_20_4_c+h_c+adp_c"
		"PI4P5K_20_4_20_4|Expanded Glycerophospholipid metabolism::pail45p_hs_20_4_20_4_c+atp_c --> pail345p_hs_20_4_20_4_c+h_c+adp_c"
		"PI345P3P_20_4_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail345p_hs_20_4_20_4_c --> pail45p_hs_20_4_20_4_c+pi_c"
		"PI45PLC_20_4_20_4|Expanded Glycerophospholipid metabolism::h2o_c+pail45p_hs_20_4_20_4_c --> dag_hs_20_4_20_4_c+h_c+mi145p_c"
		"PAFH|Glycerophospholipid Metabolism::h2o_c+paf_hs_c --> ac_c+h_c+ak2lgchol_hs_c"
		"PAFS|Glycerophospholipid Metabolism::accoa_c+ak2lgchol_hs_c --> coa_c+paf_hs_c"
		"PYRt2m|Transport_ Mitochondrial::pyr_c+h_c --> h_m+pyr_m"
		"PYRt2m|Transport_ Mitochondrial_reverse::h_m+pyr_m --> pyr_c+h_c"
		"sink_Tyr_ggn|Intracellular Constraint::Tyr_ggn_c --> []"
		"sink_Tyr_ggn|Intracellular Constraint_reverse::[] --> Tyr_ggn_c"
		"EX_paf_hs_e|Extracellular exchange::paf_hs_e --> []"
		"EX_paf_hs_e|Extracellular exchange_reverse::[] --> paf_hs_e"
		"PAFt|Transport_ Extracellular::paf_hs_e --> paf_hs_c"
		"PAFt|Transport_ Extracellular_reverse::paf_hs_c --> paf_hs_e"
		"sink_paf_hs|Intracellular Constraint::paf_hs_c --> []"
		"sink_paf_hs|Intracellular Constraint_reverse::[] --> paf_hs_c"
		"GLYt2r|Transport_ Extracellular::gly_e+h_e --> gly_c+h_c"
		"GLYt2r|Transport_ Extracellular_reverse::gly_c+h_c --> gly_e+h_e"
		"PROD2m|Proline Metabolism::fad_m+pro_L_m --> 1pyr5c_m+fadh2_m+h_m"
		"PROD2m|Proline Metabolism_reverse::1pyr5c_m+fadh2_m+h_m --> fad_m+pro_L_m"
		"HXANtx|Transport_ Peroxisomal::hxan_c --> hxan_x"
		"HXANtx|Transport_ Peroxisomal_reverse::hxan_x --> hxan_c"
		"XAO2x|Purine Catabolism::hxan_x+o2_x+h2o_x --> h2o2_x+xan_x"
		"XAO2x|Purine Catabolism_reverse::h2o2_x+xan_x --> hxan_x+o2_x+h2o_x"
		"DM_glygn3_c|Intracellular Constraint::glygn3_c --> []"
		"DM_glygn3_c|Intracellular Constraint_reverse::[] --> glygn3_c"
		"sink_adp_c|Intracellular Constraint::adp_c --> []"
		"sink_adp_c|Intracellular Constraint_reverse::[] --> adp_c"
		"DM_atp_c|Intracellular Constraint::h2o_c+atp_c --> pi_c+h_c+adp_c"
		"DM_atp_c|Intracellular Constraint_reverse::pi_c+h_c+adp_c --> h2o_c+atp_c"
		"ACCOAtm|Transport_ Mitochondrial::accoa_c --> accoa_m"
		"AMPt|Transport_ Extracellular::amp_e --> amp_c"
		"AMPt|Transport_ Extracellular_reverse::amp_c --> amp_e"
		"ATPtm|Transport_ Mitochondrial::atp_m+adp_c --> atp_c+adp_m"
		"H2Otm|Transport_ Mitochondrial::h2o_c --> h2o_m"
		"H2Otm|Transport_ Mitochondrial_reverse::h2o_m --> h2o_c"
		"H2Ot|Transport_ Extracellular::h2o_e --> h2o_c"
		"H2Ot|Transport_ Extracellular_reverse::h2o_c --> h2o_e"
		"PIt9|Transport_ Extracellular::2.0*na1_e+pi_e --> 2.0*na1_c+pi_c"
		"PIt9|Transport_ Extracellular_reverse::2.0*na1_c+pi_c --> 2.0*na1_e+pi_e"
		"SUCOASm|Citric Acid Cycle::atp_m+coa_m+succ_m --> pi_m+succoa_m+adp_m"
		"SUCOASm|Citric Acid Cycle_reverse::pi_m+succoa_m+adp_m --> atp_m+coa_m+succ_m"
		"CO2tm|Transport_ Mitochondrial::co2_c --> co2_m"
		"CO2tm|Transport_ Mitochondrial_reverse::co2_m --> co2_c"
		"COAtm|Transport_ Mitochondrial::coa_c --> coa_m"
		"COAtm|Transport_ Mitochondrial_reverse::coa_m --> coa_c"
		"NH4t3r|Transport_ Extracellular::nh4_c+h_e --> nh4_e+h_c"
		"NH4t3r|Transport_ Extracellular_reverse::nh4_e+h_c --> nh4_c+h_e"
		"Ht|Transport_ Extracellular::h_e --> h_c"
		"Ht|Transport_ Extracellular_reverse::h_c --> h_e"
		"GLNt|Transport_ Extracellular::gln_L_e --> gln_L_c"
		"GLNt|Transport_ Extracellular_reverse::gln_L_c --> gln_L_e"
	];

	# List of metabolite strings - used to write flux report 
	list_of_metabolite_symbols = [
		"10fthf5glu_l"
		"10fthf5glu_m"
		"10fthf6glu_c"
		"10fthf6glu_l"
		"10fthf6glu_m"
		"10fthf7glu_c"
		"10fthf7glu_l"
		"10fthf7glu_m"
		"10fthf_c"
		"10fthf_l"
		"10fthf_m"
		"12HPET_c"
		"12harachd_c"
		"12ppd_R_c"
		"12ppd_S_c"
		"13dpg_c"
		"15HPET_c"
		"1pyr5c_m"
		"23dpg_c"
		"25aics_c"
		"2dr1p_c"
		"2dr5p_c"
		"2maacoa_m"
		"2mb2coa_m"
		"2mbcoa_m"
		"2mop_m"
		"2mp2coa_m"
		"2oxoadp_c"
		"2oxoadp_m"
		"2pg_c"
		"34dhpac_c"
		"34dhpha_c"
		"34dhphe_c"
		"34hpp_c"
		"35cgmp_c"
		"35cgmp_e"
		"3dhguln_c"
		"3hbcoa_m"
		"3hibutcoa_m"
		"3hmbcoa_m"
		"3hmp_m"
		"3mb2coa_m"
		"3mgcoa_m"
		"3mob_c"
		"3mob_m"
		"3mop_c"
		"3mop_m"
		"3mox4hpac_c"
		"3moxtyr_c"
		"3pg_c"
		"4abut_c"
		"4abut_m"
		"4fumacac_c"
		"4hoxpacd_c"
		"4hphac_c"
		"4hphac_e"
		"4mlacac_c"
		"4mop_c"
		"4mop_m"
		"4nph_c"
		"4nph_e"
		"4nphsf_c"
		"4nphsf_e"
		"56dura_c"
		"5HPET_c"
		"5aizc_c"
		"5aop_c"
		"5aop_m"
		"5hoxindact_c"
		"5hoxindoa_c"
		"5htrp_c"
		"5moxact_c"
		"5mthf_c"
		"5mthf_e"
		"5oxpro_c"
		"6pgc_c"
		"6pgl_c"
		"L2aadp6sa_m"
		"L2aadp_c"
		"L2aadp_m"
		"Lcystin_c"
		"Lcystin_e"
		"Sfglutth_c"
		"Tyr_ggn_c"
		"aacoa_c"
		"aacoa_m"
		"ac_c"
		"ac_e"
		"acac_c"
		"acac_m"
		"acald_c"
		"accoa_c"
		"accoa_m"
		"acetol_c"
		"acrn_c"
		"ade_c"
		"ade_e"
		"adn_c"
		"adn_e"
		"adp_c"
		"adp_e"
		"adp_m"
		"adprib_c"
		"adprib_e"
		"adrnl_c"
		"adrnl_e"
		"ahcys_c"
		"aicar_c"
		"air_c"
		"ak2lgchol_hs_c"
		"akg_c"
		"akg_m"
		"ala_B_c"
		"ala_B_m"
		"ala_L_c"
		"ala_L_e"
		"alpha_hs_16_0_c"
		"alpha_hs_18_0_c"
		"alpha_hs_18_1_c"
		"alpha_hs_18_2_c"
		"alpha_hs_20_4_c"
		"amet_c"
		"amp_c"
		"amp_e"
		"amp_m"
		"aps_c"
		"arachd_c"
		"arachd_e"
		"arachd_r"
		"arachdcoa_c"
		"arachdcoa_m"
		"arachdcrn_c"
		"arachdcrn_m"
		"arg_L_c"
		"arg_L_e"
		"argsuc_c"
		"ascb_L_c"
		"ascb_L_e"
		"asn_L_c"
		"asn_L_e"
		"asn_L_m"
		"asp_L_c"
		"asp_L_e"
		"asp_L_m"
		"atp_c"
		"atp_m"
		"b2coa_m"
		"bilirub_c"
		"bilirub_e"
		"biliverd_c"
		"ca2_c"
		"ca2_e"
		"cala_c"
		"camp_c"
		"cbp_m"
		"cdp_c"
		"cdpchol_c"
		"cdpdag_hs_16_0_16_0_c"
		"cdpdag_hs_16_0_18_0_c"
		"cdpdag_hs_16_0_18_1_c"
		"cdpdag_hs_16_0_18_2_c"
		"cdpdag_hs_16_0_20_4_c"
		"cdpdag_hs_18_0_18_0_c"
		"cdpdag_hs_18_0_18_1_c"
		"cdpdag_hs_18_0_18_2_c"
		"cdpdag_hs_18_0_20_4_c"
		"cdpdag_hs_18_1_18_1_c"
		"cdpdag_hs_18_1_18_2_c"
		"cdpdag_hs_18_1_20_4_c"
		"cdpdag_hs_18_2_18_2_c"
		"cdpdag_hs_18_2_20_4_c"
		"cdpdag_hs_20_4_20_4_c"
		"cdpea_c"
		"cgly_e"
		"chol_c"
		"chol_e"
		"cholp_c"
		"cit_c"
		"cit_e"
		"cit_m"
		"citr_L_c"
		"citr_L_m"
		"cl_c"
		"cl_e"
		"cmp_c"
		"co2_c"
		"co2_e"
		"co2_m"
		"co_c"
		"co_e"
		"coa_c"
		"coa_m"
		"cpppg3_c"
		"creat_c"
		"creat_e"
		"crn_c"
		"crn_e"
		"crn_m"
		"ctp_c"
		"cyan_c"
		"cyan_e"
		"cyan_m"
		"cys_L_c"
		"cys_L_e"
		"cytd_c"
		"cytd_e"
		"dad_2_c"
		"dag_hs_16_0_16_0_c"
		"dag_hs_16_0_18_0_c"
		"dag_hs_16_0_18_1_c"
		"dag_hs_16_0_18_2_c"
		"dag_hs_16_0_20_4_c"
		"dag_hs_18_0_18_0_c"
		"dag_hs_18_0_18_1_c"
		"dag_hs_18_0_18_2_c"
		"dag_hs_18_0_20_4_c"
		"dag_hs_18_1_18_1_c"
		"dag_hs_18_1_18_2_c"
		"dag_hs_18_1_20_4_c"
		"dag_hs_18_2_18_2_c"
		"dag_hs_18_2_20_4_c"
		"dag_hs_20_4_20_4_c"
		"dcacoa_c"
		"dcamp_c"
		"ddcacoa_c"
		"dhap_c"
		"dhbpt_c"
		"dhdascb_c"
		"dhdascb_e"
		"din_c"
		"dmgly_c"
		"dmgly_m"
		"dopa_c"
		"dopa_e"
		"dopasf_c"
		"dopasf_e"
		"drib_c"
		"dxtrn_c"
		"e4p_c"
		"estrone_c"
		"estrones_c"
		"etfox_m"
		"etfrd_m"
		"etha_c"
		"f1p_c"
		"f26bp_c"
		"f6p_c"
		"fad_m"
		"fadh2_m"
		"fald_c"
		"fald_m"
		"fdp_c"
		"fe2_c"
		"fe2_e"
		"fe2_m"
		"fgam_c"
		"ficytC_m"
		"focytC_m"
		"for_c"
		"fpram_c"
		"fprica_c"
		"fru_c"
		"fru_e"
		"fum_c"
		"fum_m"
		"g1p_c"
		"g3p_c"
		"g3pc_c"
		"g6p_c"
		"g6p_r"
		"gal1p_c"
		"gal_c"
		"gal_e"
		"gar_c"
		"gdp_c"
		"gdp_e"
		"gdp_m"
		"ggn_c"
		"glc_D_c"
		"glc_D_e"
		"glc_D_r"
		"glcur_c"
		"glcur_r"
		"gln_L_c"
		"gln_L_e"
		"gln_L_m"
		"glu5sa_m"
		"glu_L_c"
		"glu_L_e"
		"glu_L_l"
		"glu_L_m"
		"glu_L_r"
		"gluala_e"
		"glucys_c"
		"glutcoa_m"
		"gly_c"
		"gly_e"
		"gly_m"
		"glyald_c"
		"glyb_c"
		"glyb_e"
		"glyc3p_c"
		"glyc_c"
		"glygn1_c"
		"glygn2_c"
		"glygn3_c"
		"gmp_c"
		"gmp_e"
		"gsn_c"
		"gsn_e"
		"gthox_c"
		"gthox_e"
		"gthox_m"
		"gthrd_c"
		"gthrd_e"
		"gthrd_m"
		"gthrd_r"
		"gtp_c"
		"gtp_m"
		"gua_c"
		"gudac_c"
		"guln_c"
		"guln_r"
		"h2co3_c"
		"h2o2_c"
		"h2o2_e"
		"h2o2_m"
		"h2o2_x"
		"h2o_c"
		"h2o_e"
		"h2o_l"
		"h2o_m"
		"h2o_r"
		"h2o_x"
		"h_c"
		"h_e"
		"h_m"
		"h_r"
		"h_x"
		"hco3_c"
		"hco3_e"
		"hco3_m"
		"hcys_L_c"
		"hdca_c"
		"hdca_e"
		"hgentis_c"
		"his_L_c"
		"his_L_e"
		"hista_c"
		"hista_e"
		"hmbil_c"
		"hmgcoa_m"
		"homoval_c"
		"hxan_c"
		"hxan_e"
		"hxan_x"
		"ibcoa_m"
		"icit_c"
		"icit_m"
		"id3acald_c"
		"ile_L_c"
		"ile_L_e"
		"imp_c"
		"ind3ac_c"
		"inost_c"
		"inost_e"
		"ins_c"
		"ins_e"
		"ivcoa_m"
		"k_c"
		"k_e"
		"lac_D_c"
		"lac_L_c"
		"lac_L_e"
		"lald_D_c"
		"lald_L_c"
		"leu_L_c"
		"leu_L_e"
		"leuktrA4_c"
		"leuktrA4_r"
		"leuktrC4_r"
		"leuktrD4_c"
		"leuktrD4_r"
		"leuktrE4_c"
		"leuktrF4_c"
		"leuktrF4_e"
		"lgt_S_c"
		"lnlc_c"
		"lnlc_e"
		"lnlccoa_c"
		"lnlccoa_m"
		"lnlccrn_c"
		"lnlccrn_m"
		"lpchol_hs_16_0_c"
		"lpchol_hs_18_0_c"
		"lpchol_hs_18_1_c"
		"lpchol_hs_18_2_c"
		"lpchol_hs_20_4_c"
		"lys_L_c"
		"lys_L_e"
		"lys_L_m"
		"mag_hs_16_0_c"
		"mag_hs_18_0_c"
		"mag_hs_18_1_c"
		"mag_hs_18_2_c"
		"mag_hs_20_4_c"
		"mal_L_c"
		"mal_L_m"
		"malcoa_c"
		"meoh_c"
		"mercppyr_c"
		"met_L_c"
		"met_L_e"
		"methf_c"
		"methf_m"
		"mi145p_c"
		"mi14p_c"
		"mi1p_D_c"
		"mi4p_D_c"
		"mlthf_c"
		"mlthf_m"
		"mmcoa_R_m"
		"mmcoa_S_m"
		"msa_m"
		"mthgxl_c"
		"na1_c"
		"na1_e"
		"nad_c"
		"nad_e"
		"nad_m"
		"nadh_c"
		"nadh_m"
		"nadp_c"
		"nadp_m"
		"nadp_r"
		"nadph_c"
		"nadph_m"
		"nadph_r"
		"ncam_c"
		"ncam_e"
		"nh4_c"
		"nh4_e"
		"nh4_m"
		"nmn_c"
		"no_c"
		"no_e"
		"nrpphr_c"
		"nrpphrsf_c"
		"nrpphrsf_e"
		"nwharg_c"
		"o2_c"
		"o2_e"
		"o2_m"
		"o2_r"
		"o2_x"
		"o2s_c"
		"o2s_e"
		"o2s_m"
		"o2s_x"
		"oaa_c"
		"oaa_m"
		"occoa_c"
		"occoa_m"
		"ocdca_c"
		"ocdca_e"
		"ocdcea_c"
		"ocdcea_e"
		"odecoa_c"
		"odecoa_m"
		"odecrn_c"
		"odecrn_m"
		"oh1_c"
		"oh1_e"
		"orn_c"
		"orn_e"
		"orn_m"
		"pa_hs_16_0_16_0_c"
		"pa_hs_16_0_18_0_c"
		"pa_hs_16_0_18_1_c"
		"pa_hs_16_0_18_2_c"
		"pa_hs_16_0_20_4_c"
		"pa_hs_18_0_18_0_c"
		"pa_hs_18_0_18_1_c"
		"pa_hs_18_0_18_2_c"
		"pa_hs_18_0_20_4_c"
		"pa_hs_18_1_18_1_c"
		"pa_hs_18_1_18_2_c"
		"pa_hs_18_1_20_4_c"
		"pa_hs_18_2_18_2_c"
		"pa_hs_18_2_20_4_c"
		"pa_hs_20_4_20_4_c"
		"pac_c"
		"pacald_c"
		"paf_hs_c"
		"paf_hs_e"
		"pail345p_hs_16_0_16_0_c"
		"pail345p_hs_16_0_18_0_c"
		"pail345p_hs_16_0_18_1_c"
		"pail345p_hs_16_0_18_2_c"
		"pail345p_hs_16_0_20_4_c"
		"pail345p_hs_18_0_18_0_c"
		"pail345p_hs_18_0_18_1_c"
		"pail345p_hs_18_0_18_2_c"
		"pail345p_hs_18_0_20_4_c"
		"pail345p_hs_18_1_18_1_c"
		"pail345p_hs_18_1_18_2_c"
		"pail345p_hs_18_1_20_4_c"
		"pail345p_hs_18_2_18_2_c"
		"pail345p_hs_18_2_20_4_c"
		"pail345p_hs_20_4_20_4_c"
		"pail34p_hs_16_0_16_0_c"
		"pail34p_hs_16_0_18_0_c"
		"pail34p_hs_16_0_18_1_c"
		"pail34p_hs_16_0_18_2_c"
		"pail34p_hs_16_0_20_4_c"
		"pail34p_hs_18_0_18_0_c"
		"pail34p_hs_18_0_18_1_c"
		"pail34p_hs_18_0_18_2_c"
		"pail34p_hs_18_0_20_4_c"
		"pail34p_hs_18_1_18_1_c"
		"pail34p_hs_18_1_18_2_c"
		"pail34p_hs_18_1_20_4_c"
		"pail34p_hs_18_2_18_2_c"
		"pail34p_hs_18_2_20_4_c"
		"pail34p_hs_20_4_20_4_c"
		"pail45p_hs_16_0_16_0_c"
		"pail45p_hs_16_0_18_0_c"
		"pail45p_hs_16_0_18_1_c"
		"pail45p_hs_16_0_18_2_c"
		"pail45p_hs_16_0_20_4_c"
		"pail45p_hs_18_0_18_0_c"
		"pail45p_hs_18_0_18_1_c"
		"pail45p_hs_18_0_18_2_c"
		"pail45p_hs_18_0_20_4_c"
		"pail45p_hs_18_1_18_1_c"
		"pail45p_hs_18_1_18_2_c"
		"pail45p_hs_18_1_20_4_c"
		"pail45p_hs_18_2_18_2_c"
		"pail45p_hs_18_2_20_4_c"
		"pail45p_hs_20_4_20_4_c"
		"pail4p_hs_16_0_16_0_c"
		"pail4p_hs_16_0_18_0_c"
		"pail4p_hs_16_0_18_1_c"
		"pail4p_hs_16_0_18_2_c"
		"pail4p_hs_16_0_20_4_c"
		"pail4p_hs_18_0_18_0_c"
		"pail4p_hs_18_0_18_1_c"
		"pail4p_hs_18_0_18_2_c"
		"pail4p_hs_18_0_20_4_c"
		"pail4p_hs_18_1_18_1_c"
		"pail4p_hs_18_1_18_2_c"
		"pail4p_hs_18_1_20_4_c"
		"pail4p_hs_18_2_18_2_c"
		"pail4p_hs_18_2_20_4_c"
		"pail4p_hs_20_4_20_4_c"
		"pail_hs_16_0_16_0_c"
		"pail_hs_16_0_18_0_c"
		"pail_hs_16_0_18_1_c"
		"pail_hs_16_0_18_2_c"
		"pail_hs_16_0_20_4_c"
		"pail_hs_18_0_18_0_c"
		"pail_hs_18_0_18_1_c"
		"pail_hs_18_0_18_2_c"
		"pail_hs_18_0_20_4_c"
		"pail_hs_18_1_18_1_c"
		"pail_hs_18_1_18_2_c"
		"pail_hs_18_1_20_4_c"
		"pail_hs_18_2_18_2_c"
		"pail_hs_18_2_20_4_c"
		"pail_hs_20_4_20_4_c"
		"pap_c"
		"paps_c"
		"pchol_hs_16_0_16_0_c"
		"pchol_hs_16_0_18_0_c"
		"pchol_hs_16_0_18_1_c"
		"pchol_hs_16_0_18_2_c"
		"pchol_hs_16_0_20_4_c"
		"pchol_hs_18_0_18_0_c"
		"pchol_hs_18_0_18_1_c"
		"pchol_hs_18_0_18_2_c"
		"pchol_hs_18_0_20_4_c"
		"pchol_hs_18_1_18_1_c"
		"pchol_hs_18_1_18_2_c"
		"pchol_hs_18_1_20_4_c"
		"pchol_hs_18_2_18_2_c"
		"pchol_hs_18_2_20_4_c"
		"pchol_hs_20_4_20_4_c"
		"pe_hs_16_0_16_0_c"
		"pe_hs_16_0_18_0_c"
		"pe_hs_16_0_18_1_c"
		"pe_hs_16_0_18_2_c"
		"pe_hs_16_0_20_4_c"
		"pe_hs_18_0_18_0_c"
		"pe_hs_18_0_18_1_c"
		"pe_hs_18_0_18_2_c"
		"pe_hs_18_0_20_4_c"
		"pe_hs_18_1_18_1_c"
		"pe_hs_18_1_18_2_c"
		"pe_hs_18_1_20_4_c"
		"pe_hs_18_2_18_2_c"
		"pe_hs_18_2_20_4_c"
		"pe_hs_20_4_20_4_c"
		"peamn_c"
		"pep_c"
		"phaccoa_c"
		"phe_L_c"
		"phe_L_e"
		"pheacgln_c"
		"pheacgln_e"
		"pheme_c"
		"pheme_e"
		"pheme_m"
		"pi_c"
		"pi_e"
		"pi_m"
		"pi_r"
		"pmtcoa_c"
		"pmtcoa_m"
		"pmtcrn_c"
		"pmtcrn_m"
		"ppbng_c"
		"ppcoa_m"
		"ppi_c"
		"ppp9_m"
		"pppg9_c"
		"pppg9_m"
		"pram_c"
		"pro_L_c"
		"pro_L_e"
		"pro_L_m"
		"prostgd2_c"
		"prostgd2_e"
		"prostgg2_c"
		"prostgh2_c"
		"prostgh2_r"
		"prpp_c"
		"ps_hs_16_0_16_0_c"
		"ps_hs_16_0_18_0_c"
		"ps_hs_16_0_18_1_c"
		"ps_hs_16_0_18_2_c"
		"ps_hs_16_0_20_4_c"
		"ps_hs_18_0_18_0_c"
		"ps_hs_18_0_18_1_c"
		"ps_hs_18_0_18_2_c"
		"ps_hs_18_0_20_4_c"
		"ps_hs_18_1_18_1_c"
		"ps_hs_18_1_18_2_c"
		"ps_hs_18_1_20_4_c"
		"ps_hs_18_2_18_2_c"
		"ps_hs_18_2_20_4_c"
		"ps_hs_20_4_20_4_c"
		"pyr_c"
		"pyr_e"
		"pyr_m"
		"q10_m"
		"q10h2_m"
		"r1p_c"
		"r5p_c"
		"rnam_c"
		"ru5p_D_c"
		"s7p_c"
		"saccrp_L_m"
		"sarcs_m"
		"sbt_D_c"
		"ser_L_c"
		"ser_L_e"
		"so3_c"
		"so3_m"
		"so4_c"
		"so4_e"
		"spc_hs_c"
		"spc_hs_e"
		"sphings_c"
		"sphs1p_c"
		"sphs1p_e"
		"srtn_c"
		"srtn_e"
		"stcoa_c"
		"stcoa_m"
		"stcrn_c"
		"stcrn_m"
		"succ_c"
		"succ_e"
		"succ_m"
		"succoa_m"
		"sucsal_m"
		"tcynt_c"
		"tcynt_e"
		"tcynt_m"
		"tdcoa_c"
		"thbpt4acam_c"
		"thbpt_c"
		"thf_c"
		"thf_m"
		"thym_c"
		"thym_e"
		"thymd_c"
		"thymd_e"
		"trp_L_c"
		"trp_L_e"
		"trypta_c"
		"tsul_c"
		"tsul_e"
		"tsul_m"
		"txa2_c"
		"txa2_e"
		"txa2_r"
		"txb2_c"
		"tym_c"
		"tymsf_c"
		"tymsf_e"
		"tyr_L_c"
		"tyr_L_e"
		"udp_c"
		"udpg_c"
		"udpgal_c"
		"ump_c"
		"uppg3_c"
		"ura_c"
		"ura_e"
		"urate_c"
		"urate_e"
		"urate_x"
		"urea_c"
		"urea_e"
		"uri_c"
		"uri_e"
		"utp_c"
		"val_L_c"
		"val_L_e"
		"xan_c"
		"xan_x"
		"xmp_c"
		"xtsn_c"
		"xu5p_D_c"
		"xylt_c"
		"xylu_D_c"
		"xylu_L_c"
	];

	# =============================== DO NOT EDIT BELOW THIS LINE ============================== #
	data_dictionary = Dict{AbstractString,Any}()
	data_dictionary["stoichiometric_matrix"] = stoichiometric_matrix
	data_dictionary["objective_coefficient_array"] = objective_coefficient_array
	data_dictionary["default_flux_bounds_array"] = default_bounds_array;
	data_dictionary["species_bounds_array"] = species_bounds_array
	data_dictionary["list_of_reaction_strings"] = list_of_reaction_strings
	data_dictionary["list_of_metabolite_symbols"] = list_of_metabolite_symbols
	data_dictionary["is_minimum_flag"] = is_minimum_flag
	# =============================== DO NOT EDIT ABOVE THIS LINE ============================== #
	return data_dictionary
end
