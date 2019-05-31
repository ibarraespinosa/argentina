# Network 
net <- readRDS("network/net.rds")
# Vehicles
veh <- readRDS('veh/LCV_CNG.rds') 
# Profiles
# Mileage, Check name of categories with names(fkm)
data(fkm)
lkm <- units::set_units(fkm$KM_LCV_E25(1:ncol(veh)), km)
# Euro
euro <- c(rep("V", length(2017:2013)),
                rep("IV", length(2012:2009)),
                rep("III", length(2008:2007)),
                rep("II", length(2006:2004)),
                rep("I", length(2003:1994)), # Comparando valores Standard
                rep("PRE", length(1993:1978))
)

# Sulphur
sulphur <- 50 # ppm

# Input and Output
directory <- "LCV_03"
vfuel <- 'CNG' 
vsize <- 'ALL' # It can be small/big/<=1400, one word
vname <-  "LCV_CNG" 
type_emi <- "Hot"
params = list(province = net$nombre,
              vname_fuel = vname,
              vname = vname,
              vfuel = vfuel,
              vsize = vsize)

#  pol ####
pol <- c("FC")   
for(j in 1:length(pol)){
lef <- ef_ldv_speed(v = "PC", 
                    t = "4S", 
                    cc = "<=1400", 
                    f = "LPG",
                    eu = euro, 
                    p = pol[j], 
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
  "CO", "NOx", "HC",  "CH4", "NMHC")   
for(j in 1:length(pol)){
lef <- ef_ldv_speed(v = "PC", 
                    t = "4S", 
                    cc = "<=1400", 
                    f = "LPG",
                    eu = euro, 
                    p = pol[j], 
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
