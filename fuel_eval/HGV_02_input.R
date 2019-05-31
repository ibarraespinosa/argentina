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
  saveRDS(array_x, 
          file = paste0('emi/', vname,  '.rds'))
  rm(array_x, lef)
}
