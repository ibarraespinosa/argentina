# Network 
net <- readRDS("network/net.rds")
# Vehicles
veh <- readRDS('veh/AT_D_14_20.rds') 
# Profiles
# Mileage, Check name of categories with names(fkm)
data(fkm)
lkm <- units::set_units(fkm$KM_ATRUCKS_B5(1:ncol(veh)), km)
# Euro
euro <- c(rep("IV", length(2017:2013)),
              rep("III", length(2012:2006)),
              rep("II", length(2005:1998)),
              rep("I", length(1997:1995)),
              rep("PRE", length(1994:1978))
)

# Sulphur
sulphur <- 50 # ppm

# Input and Output
directory <- "HGV_02"
vfuel <- 'D' 
vsize <- '12_14t' # It can be small/big/<=1400, one word
vname <-  "AT_12_14t" 
type_emi <- "Hot"
params = list(province = net$nombre,
              vname_fuel = vname,
              vname = vname,
              vfuel = vfuel,
              vsize = vsize)

#  pol ####
pol <- c("FC")   
for(j in 1:length(pol)){
lef <- ef_hdv_speed(v = "Trucks",
                    t = "TT", 
                    g = ">20 & <=28",
                    eu = euro, 
                    p = pol[j],
                    x = sulphur,
                    speed = Speed(34)) 
  array_x <- emis_hot_td(veh = veh, 
                         lkm = lkm, 
                         ef = lef, 
                         params = c(params, 
                                    pollutant = pol[j], 
                                    type_emi = type_emi))
}

#  pol ####
pol <- c(
  # criteria
  "CO", "NOx", "HC", "PM", "CH4", "NMHC", "CO2", "SO2", "Pb", "BC", "OM",
  # pah pop
  "indeno(1,2,3-cd)pyrene",
     "benzo(k)fluoranthene", "benzo(b)fluoranthene",
     "benzo(ghi)perylene", "fluoranthene", "benzo(a)pyrene", "pyrene",
     "perylene", "anthanthrene", "benzo(b)fluorene", "benzo(e)pyrene",
     "triphenylene", "benzo(j)fluoranthene", "dibenzo(a,j)anthacene",
     "dibenzo(a,l)pyrene", "3,6-dimethyl-phenanthrene",
     "benzo(a)anthracene", "acenaphthylene", "acenapthene", "chrysene",
     "phenanthrene", "napthalene", "anthracene", "coronene",
     "dibenzo(ah)anthracene",
#dioxins
"PCDD", "PCDF", "PCB",
# Metals
"As", "Cd", "Cr", "Cu", "Hg", "Ni", "Pb", "Se", "Zn",
# alkanes
"ethane", "propane", "butane", "isobutane",
     "pentane", "isopentane", "hexane", "heptane", "octane",
     "2-methylhexane", "nonane", "2-methylheptane", "3-methylhexane",
     "decane", "3-methylheptane", "alkanes_C10_C12", "alkanes_C13",
     "cycloalkanes",
# alkenes
"ethylene", "propylene", "propadiene",
     "1-butene", "isobutene", "2-butene", "1,3-butadiene", "1-pentene",
     "2-pentene", "1-hexene", "dimethylhexene",
# alkynes
"1-butyne", "propyne", "acetylene",
#aldehydes
"formaldehyde", "acetaldehyde", "acrolein",
     "benzaldehyde", "crotonaldehyde", "methacrolein", "butyraldehyde",
     "isobutanaldehyde", "propionaldehyde", "hexanal",
     "i-valeraldehyde", "valeraldehyde", "o-tolualdehyde",
     "m-tolualdehyde", "p-tolualdehyde",
# ketones
"acetone", "methylethlketone",
# aromatics
"toluene", "ethylbenzene", "m-xylene",
     "p-xylene", "o-xylene", "1,2,3-trimethylbenzene",
     "1,2,4-trimethylbenzene", "1,3,5-trimethylbenzene", "styrene",
     "benzene", "C9", "C10", "C13",
# Active syrface
 "AS_urban", "AS_rural", "AS_highway",
# particles
 "N_urban", "N_rural",
     "N_highway", "N_50nm_urban", "N_50_100nm_rural")   
for(j in 1:length(pol)){
lef <- ef_hdv_speed(v = "Trucks",
                    t = "TT", 
                    g = ">20 & <=28",
                    eu = euro, 
                    p = pol[j],
                    x = sulphur,
                    speed = Speed(34)) 
  array_rbind <- emis_hot_td(veh = veh, 
                         lkm = lkm, 
                         ef = lef, 
                         params = c(params, 
                                    pollutant = pol[j], 
                                    type_emi = type_emi))
 array_x <- rbind(array_x, array_rbind)
}
saveRDS(array_x, 
          file = paste0('emi/', vname,  '.rds'))
rm(array_x, lef)
gc()
