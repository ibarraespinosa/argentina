library(vein)
# source("veh/tablas1.R", echo = T)
# dir.create("csv", showWarnings = F) #no re escrive la carpeta existente
#   
cc <- c("1400", "1400_2000", ">2000")
x <- c(48, 122, 16)
per <- c(0.25806452, 0.65591398, 0.08602151)
df <- data.frame(cc, x, per)
#        cc   x        per
#    1400  48 0.25806452
# 1400_2000 122 0.65591398
#     >2000  16 0.08602151


moto <- data.frame(stringsAsFactors=FALSE,
                   V1 = c("50 cc", "70 cc", "100 cc", "110 cc", "125 cc", "150 cc",
                          "200 cc", "220 cc", "250 cc", "300 cc", "600 cc", "650 cc"),
                   V2 = c(1.01, 2.02, 9.09, 29.29, 21.21, 22.22, 6.06, 1.01, 2.02, 1.01,
                          3.03, 2.02))
moto$cat <- c("50", "50_250", "50_250", "50_250", "50_250",
              "50_250", "50_250", "50_250", "50_250",
              "250_750","250_750","250_750" )
moto$cat <- factor(x = moto$cat,
                   levels = c("50", "50_250", "250_750"))
motoo <- aggregate(moto$V2, by = list(moto$cat), sum)
names(motoo) <- c("cc", "per")
motoo$per <- motoo$per/sum(motoo$per)

# ADEFA Parque Automotor
veh <- read.csv("veh/Adefa_Parque.csv")[1:24,]
veh <- veh[order(as.character(veh$Province)),]
dft <- readRDS("veh/LDV2017_1978.rds")# *0.9127059 #PC + LCV (sin MC)
prov <- dft$Provincia
dft$Provincia <- NULL

# barplot(as.matrix(dft),
#         main = "2017-1978, Vehículos leves proyectados entre 1994 y 1978")
# PC_G_1400 ####
cate <- "PC_G_1400"
for(i in 1:nrow(dft)){
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]/sum(dft[i, 1:ncol(dft)]) #Distribucion porcentual
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]*veh$Cars[i]
}
PC <- dft
# PC$Provincia <- NULL #aqui queda en 40 columnas
PC_G = matvect(PC*71/100*df$per[1], knafta)
print(paste0(cate, ": ", round(sum(PC_G)/1000), " MIL"))
saveRDS(PC_G, paste0("veh/", cate, ".rds"))

# PC_G_1400_2000 ####
cate <- "PC_G_1400_2000"
PC_G = matvect(PC*71/100*df$per[2], knafta)
print(paste0(cate, ": ", round(sum(PC_G)/1000), " MIL"))
saveRDS(PC_G, paste0("veh/", cate, ".rds"))

# PC_G_2000 ####
cate <- "PC_G_2000"
PC_G = matvect(PC*71/100*df$per[3], knafta)
print(paste0(cate, ": ", round(sum(PC_G)/1000), " MIL"))
saveRDS(PC_G, paste0("veh/", cate, ".rds"))

# PC D CNG ####
dft <- readRDS("veh/LDV2017_1978.rds")
dft$Provincia <- NULL
dft <- dft[, 1:33] #Diesel comenzaro hace 33 años
for(i in 1:nrow(dft)){
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]/sum(dft[i, 1:ncol(dft)])
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]*veh$Cars[i]
}
cate <- "PC_D_1400"
PC_D = matvect(PC*13/100*df$per[1], koil)
print(paste0(cate, ": ", round(sum(PC_D)/1000), " MIL"))
saveRDS(PC_D, paste0("veh/", cate, ".rds"))

cate <- "PC_D_1400_2000"
PC_D = matvect(PC*13/100*df$per[2], koil)
print(paste0(cate, ": ", round(sum(PC_D)/1000), " MIL"))
saveRDS(PC_D, paste0("veh/", cate, ".rds"))

cate <- "PC_D_2000"
PC_D = matvect(PC*13/100*df$per[3], koil)
print(paste0(cate, ": ", round(sum(PC_D)/1000), " MIL"))
saveRDS(PC_D, paste0("veh/", cate, ".rds"))

PC_CNG = dft*16/100*kcn
cate <- "PC_CNG"
saveRDS(PC_CNG, "veh/PC_CNG.rds")
print(paste0(cate, ": ", round(sum(PC_CNG)/1000), " MIL"))

# LCV G ####
dft <- readRDS("veh/LDV2017_1978.rds")
dft$Provincia <- NULL
for(i in 1:nrow(dft)){
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]/sum(dft[i, 1:ncol(dft)])
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]*veh$Light.Vehicles[i]
}
cate <- "LCV_G"
LCV <- dft[, 1:(ncol(dft) - 1)]
LCV$Provincia <- NULL
LCV_G = matvect(LCV*13/100*df$per[1], knafta)
print(paste0(cate, ": ", round(sum(LCV_G)/1000), " MIL"))

saveRDS(LCV_G, "veh/LCV_G.rds")

# LCV D CNG ####
dft <- readRDS("veh/LDV2017_1978.rds")
dft$Provincia <- NULL
dft <- dft[, 1:33]
for(i in 1:nrow(dft)){
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]/sum(dft[i, 1:ncol(dft)])
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]*veh$Light.Vehicles[i]
}
cate <- "LCV_D"
LCV_D = matvect(LCV*13/100*df$per[1], koil)
print(paste0(cate, ": ", round(sum(LCV_D)/1000), " MIL"))
saveRDS(LCV_D, "veh/LCV_D.rds")

cate <- "LCV_CNG"
LCV_CNG = dft*16/100*kcn
print(paste0(cate, ": ", round(sum(LCV_CNG)/1000), " MIL"))
saveRDS(LCV_CNG, "veh/LCV_CNG.rds")

# Trucks
# N3: vehículos para transporte de carga con un 
# peso máximo superior a los 12.000 kilogramos.
cate <- "RT_D_12_14"
vtrucks <- rep(c(50.465, 27.887, 20.431, 16.81, 5.227, 50.866, 12.798, 12.798),
               each = 5)
HGV_D <- my_age(x = veh$Trucks, y = vtrucks, k = 0.52248)
HGV_D <- matvect(HGV_D, koil)
names(HGV_D) <- 2017:1978
print(paste0(cate, ": ", round(sum(HGV_D)/1000), " MIL"))
saveRDS(HGV_D, paste0("veh/", cate, ".rds"))

cate <- "AT_D_14_20"
vtrucks <- rep(
  c(36.359, 24.392, 20.235, 13.34, 5.474, 43.726, 25.085, 25.085),
  each = 5)
HGV_D <- my_age(x = veh$Trucks, y = vtrucks, k = 0.47752)
HGV_D <- matvect(HGV_D, koil)
names(HGV_D) <- 2017:1978
print(paste0(cate, ": ", round(sum(HGV_D)/1000), " MIL"))
saveRDS(HGV_D, paste0("veh/", cate, ".rds"))

# BUS
cate <- "BUS_Urban_D_15_18"
BUS_D <- age_hdv(x = veh$Buses, agemax = 20, a = 0.3, b = 10, 
                 k = 0.9)
BUS_D <- matvect(BUS_D, koil)
names(BUS_D) <- 2017:1998
print(paste0(cate, ": ", round(sum(BUS_D)/1000), " MIL"))
saveRDS(BUS_D, paste0("veh/", cate, ".rds"))

# Coach

cate <- "BUS_Coach_D_15_18"
BUS_D <- age_hdv(x = veh$Buses, agemax = 20, a = 0.3, b = 10, 
                 k = 0.1)
BUS_D <- matvect(BUS_D, koil)
names(BUS_D) <- 2017:1998
print(paste0(cate, ": ", round(sum(BUS_D)/1000), " MIL"))
saveRDS(BUS_D, paste0("veh/", cate, ".rds"))

#MC motoo[1]####
cate <- "MC_G_50"
dft <- readRDS("veh/MC2017_1978.rds")
dft$Provincia <- NULL
MC_G <- dft*motoo$per[1]
MC_G <- matvect(MC_G, knafta)
print(paste0(cate, ": ", round(sum(MC_G)/1000), " MIL"))
saveRDS(MC_G, paste0("veh/", cate, ".rds"))

#MC motoo[2]####
cate <- "MC_G_50_250"
dft <- readRDS("veh/MC2017_1978.rds")
dft$Provincia <- NULL
MC_G <- dft*motoo$per[2]
MC_G <- matvect(MC_G, knafta)
print(paste0(cate, ": ", round(sum(MC_G)/1000), " MIL"))
saveRDS(MC_G, paste0("veh/", cate, ".rds"))

#MC motoo[3]####
cate <- "MC_G_250_750"
dft <- readRDS("veh/MC2017_1978.rds")
dft$Provincia <- NULL
MC_G <- dft*motoo$per[3]
MC_G <- matvect(MC_G, knafta)
print(paste0(cate, ": ", round(sum(MC_G)/1000), " MIL"))
saveRDS(MC_G, paste0("veh/", cate, ".rds"))
