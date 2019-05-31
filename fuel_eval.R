library(vein)
library(colorout)
library(data.table)
# try 1 ####
knafta <-  c(0.2775777, 0.1542446, 0.4300551, 0.4334802, 2.2121656, 0.2312098,
             1.0619719, 0.3004660, 0.4501197, 0.3172736, 1.0471770, 0.3762997,
             0.1884973, 0.4036504, 0.4625240, 0.5869188, 0.3796140, 0.3133562, 
             0.4082554, 0.3448157, 0.2706457, 0.4722369, 0.2988164, 0.4064186)*0.2
koil <- c(6.176076, 2.252808, 5.303669, 10.073901, 7.015313, 9.107443,
          4.918953, 7.819899, 6.612879, 4.193052, 18.803312, 4.108397,
          5.130961, 6.268600, 6.564272, 9.937281, 8.277155, 5.640285,
          7.979161, 6.401898, 10.996208, 11.968698, 3.775625, 7.208769)*0.3
kcn <-  rep(0, 24)
source("traffic.R")
vehi <- data.frame(iter0 = c(
  "PC_G_1400: 1959 MIL",
  "PC_G_1400_2000: 4978 MIL",
  "PC_G_2000: 653 MIL",
  "PC_D_1400: 359 MIL",
  "PC_D_1400_2000: 912 MIL",
  "PC_D_2000: 120 MIL",
  "PC_CNG: 0 MIL",
  "LCV_G: 1881 MIL",
  "LCV_D: 345 MIL",
  "LCV_CNG: 0 MIL",
  "RT_D_12_14t: 355 MIL",
  "AT_D_14_20: 325 MIL",
  "BUS_Urban_D_15_18: 76 MIL",
  "BUS_Coach_D_15_18: 8 MIL",
  "MC_G_50: 26 MIL",
  "MC_G_50_250: 2432 MIL",
  "MC_G_250_750: 159 MIL"
))
inputs <- list.files(path = 'fuel_eval', pattern = 'input.R',
                     recursive = TRUE, full.names = TRUE)



for (i in 1:length(inputs)){
  print(inputs[i])
  source(inputs[i], echo = F)
}

net <- readRDS("network/net.rds")
d_oil = 0.845 # kg/ly
d_nafta = 0.735 # kg/ly
d_cng = 0.5 # kg/ly

a <- list.files(path = "emi", pattern = ".rds", full.names = T)
e <- rbindlist(lapply(a, readRDS)) 

dff <- e[, sum(emissions, na.rm = T), by = .(vfuel, province)]
dff <- long_to_wide(dff, 
                    column_with_new_names = "vfuel",
                    column_with_data = "V1",
                    column_fixed = "province")
dff$G <- dff$G*1/(d_nafta*1000*1000)
dff$D <- dff$D*1/(d_oil*1000*1000)
dff$CNG <- dff$CNG*1/(d_cng*1000*1000)
names(net)
net$nafta/dff$G
net$gas_oil/dff$D
net$gn/dff$CNG
cbind(dff$G, net$nafta, dff$G/net$nafta)
cbind(dff$D, net$gas_oil, dff$D/net$gas_oil)
cbind(dff$CNG, net$gn, dff$CNG/net$gn)