x <- readRDS("veh/PC_G_<=1400.rds")
y <- x*knafta

# PC_G_<=1400 ####
cate <- "PC_G_<=1400"
for(i in 1:nrow(dft)){
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]/sum(dft[i, 1:ncol(dft)])
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]*veh$Cars[i]
}
PC <- dft
# PC$Provincia <- NULL #aqui queda en 40 columnas
PC_G = PC*71/100*df$per[1]
saveRDS(PC_G, paste0("veh/", cate, ".rds"))
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(PC_G),
        main = paste0(cate, ": ", round(sum(PC_G, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
PC_G$Provincia <- dft$Provincia
write.table(PC_G, paste0("veh/csv/", cate, ".txt"), quote = F, row.names = F)

PC_G$Provincia <- dft$Provincia
write.table(PC_G, paste0("veh/csv/", cate, ".txt"), quote = F, row.names = F)

# PC_G_1400_2000 ####
cate <- "PC_G_1400_2000"
for(i in 1:nrow(dft)){
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]/sum(dft[i, 1:ncol(dft)])
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]*veh$Cars[i]
}
PC$Provincia <- NULL #aqui queda en 40 columnas
PC <- dft
PC_G = PC*71/100*df$per[2]
saveRDS(PC_G, paste0("veh/", cate, ".rds"))
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(PC_G),
        main = paste0(cate, ": ", round(sum(PC_G, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
PC_G$Provincia <- dft$Provincia
write.table(PC_G, paste0("veh/csv/", cate, ".txt"), quote = F, row.names = F)

# PC_G_>2000 ####
cate <- "PC_G_>2000"
for(i in 1:nrow(dft)){
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]/sum(dft[i, 1:ncol(dft)])
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]*veh$Cars[i]
}
PC$Provincia <- NULL #aqui queda en 40 columnas 
PC <- dft
PC_G = PC*71/100*df$per[3]
saveRDS(PC_G, paste0("veh/", cate, ".rds"))
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(PC_G),
        main = paste0(cate, ": ", round(sum(PC_G, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
PC_G$Provincia <- dft$Provincia
write.table(PC_G, paste0("veh/csv/", cate, ".txt"), quote = F, row.names = F)


# PC D CNG ####
dft <- readRDS("veh/LDV2017_1978.rds")
dft$Provincia <- NULL
dft <- dft[, 1:33]
for(i in 1:nrow(dft)){
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]/sum(dft[i, 1:ncol(dft)])
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]*veh$Cars[i]
}
cate <- "PC_D_<=1400"
PC_D = dft*13/100*df$per[1]
saveRDS(PC_D, paste0("veh/", cate, ".rds"))
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(PC_D),
        main = paste0(cate, ": ", round(sum(PC_D, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
PC_D$Provincia <- dft$Provincia
write.table(PC_G, paste0("veh/csv/", cate, ".txt"), quote = F, row.names = F)

cate <- "PC_D_1400_2000"
PC_D = dft*13/100*df$per[2]
saveRDS(PC_D, paste0("veh/", cate, ".rds"))
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(PC_D),
        main = paste0(cate, ": ", round(sum(PC_D, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
PC_D$Provincia <- dft$Provincia
write.table(PC_G, paste0("veh/csv/", cate, ".txt"), quote = F, row.names = F)

cate <- "PC_D_>1400"
PC_D = dft*13/100*df$per[1]
saveRDS(PC_D, paste0("veh/", cate, ".rds"))
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(PC_D),
        main = paste0(cate, ": ", round(sum(PC_D, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
PC_D$Provincia <- dft$Provincia
write.table(PC_G, paste0("veh/csv/", cate, ".txt"), quote = F, row.names = F)

PC_CNG = dft*16/100
saveRDS(PC_CNG, "veh/PC_CNG.rds")
png("images/PC_CNG.png", width = 1000, height = 600, units = "px")
barplot(as.matrix(PC_CNG),
        main = paste0("PC_CNG: ", round(sum(PC_CNG, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
PC_CNG$Provincia <- dft$Provincia
write.table(PC_CNG, "veh/csv/PC_CNG.txt", quote = F, row.names = F)

# LCV G ####
dft <- readRDS("veh/LDV2017_1978.rds")
dft$Provincia <- NULL
for(i in 1:nrow(dft)){
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]/sum(dft[i, 1:ncol(dft)])
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]*veh$Light.Vehicles[i]
}

LCV <- dft[, 1:(ncol(dft) - 1)]
LCV$Provincia <- NULL
LCV_G = LCV*71/100
saveRDS(LCV_G, "veh/LCV_G.rds")
png("images/LCV_G.png", width = 1000, height = 600, units = "px")
barplot(as.matrix(LCV_G),
        main = paste0("LCV_G: ", round(sum(LCV_G, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
LCV_G$Provincia <- dft$Provincia
write.table(LCV_G, "veh/csv/LCV_G.txt", quote = F, row.names = F)


# LCV D CNG ####
dft <- readRDS("veh/LDV2017_1978.rds")
dft$Provincia <- NULL
dft <- dft[, 1:33]
for(i in 1:nrow(dft)){
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]/sum(dft[i, 1:ncol(dft)])
  dft[i, 1:ncol(dft)] <- dft[i, 1:ncol(dft)]*veh$Light.Vehicles[i]
}
LCV_D = dft*13/100
saveRDS(LCV_D, "veh/LCV_D.rds")
png("images/LCV_D.png", width = 1000, height = 600, units = "px")
barplot(as.matrix(LCV_D),
        main = paste0("LCV_D: ", round(sum(LCV_D, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
LCV_D$Provincia <- dft$Provincia
write.table(LCV_D, "veh/csv/LCV_D.txt", quote = F, row.names = F)

LCV_CNG = dft*16/100
saveRDS(LCV_CNG, "veh/LCV_CNG.rds")
png("images/LCV_CNG.png", width = 1000, height = 600, units = "px")
barplot(as.matrix(LCV_CNG),
        main = paste0("LCV_CNG: ", round(sum(LCV_CNG, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
LCV_CNG$Provincia <- dft$Provincia
write.table(LCV_CNG, "veh/csv/LCV_CNG.txt", quote = F, row.names = F)

# Trucks
# N3: vehículos para transporte de carga con un 
# peso máximo superior a los 12.000 kilogramos.
cate <- "RT_D_>12_14t"
vtrucks <- rep(c(50.465, 27.887, 20.431, 16.81, 5.227, 50.866, 12.798, 12.798),
               each = 5)
HGV_D <- my_age(x = veh$Trucks, y = vtrucks, k = 0.52248)
names(HGV_D) <- 2017:1978
saveRDS(HGV_D, paste0("veh/", cate, ".rds"))
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(HGV_D),
        main = paste0(cate, ": ", round(sum(HGV_D, na.rm = T))))
dev.off()
HGV_D$Provincia <- dft$Provincia
write.table(HGV_D, paste0("veh/csv/", cate, ".txt"), quote = F, row.names = F)


cate <- "AT_D_>14_20"
vtrucks <- rep(
  c(36.359, 24.392, 20.235, 13.34, 5.474, 43.726, 25.085, 25.085),
               each = 5)
HGV_D <- my_age(x = veh$Trucks, y = vtrucks, k = 0.47752)
names(HGV_D) <- 2017:1978
saveRDS(HGV_D, paste0("veh/", cate, ".rds"))
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(HGV_D),
        main = paste0(cate, ": ", round(sum(HGV_D, na.rm = T))))
dev.off()
HGV_D$Provincia <- dft$Provincia
write.table(HGV_D, paste0("veh/csv/", cate, ".txt"), quote = F, row.names = F)


# BUS
cate <- "BUS_Urban_D_15_18"
BUS_D <- age_hdv(x = veh$Buses, agemax = 20, a = 0.3, b = 10, k = 0.9)
names(BUS_D) <- 2017:1998
saveRDS(BUS_D, paste0("veh/", cate, ".rds"))
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(BUS_D),
        main = paste0(cate, ": ", round(sum(BUS_D, na.rm = T)),
                      ", distribucion estadistica"))
dev.off()
BUS_D$Provincia <- BUS_D$Provincia
write.table(BUS_D, paste0("veh/csv/", cate, ".txt"), quote = F, row.names = F)

# Coach

cate <- "BUS_Coach_D_15_18"
BUS_D <- age_hdv(x = veh$Buses, agemax = 20, a = 0.3, b = 10, k = 0.1)
names(BUS_D) <- 2017:1998
saveRDS(BUS_D, paste0("veh/", cate, ".rds"))
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(BUS_D),
        main = paste0(cate, ": ", round(sum(BUS_D, na.rm = T)),
                      ", distribucion estadistica"))
dev.off()
BUS_D$Provincia <- BUS_D$Provincia
write.table(BUS_D, paste0("veh/csv/", cate, ".txt"), quote = F, row.names = F)


#MC motoo[1]####
cate <- "MC_G_<=50"
dft <- readRDS("veh/MC2017_1978.rds")
dft$Provincia <- NULL
MC_G <- dft*motoo$per[1]
saveRDS(MC_G, paste0("veh/", cate, ".rds"))
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(MC_G),
        main = paste0(cate, ": ", round(sum(MC_G, na.rm = T)),
                      ", distribución estadistica"))
dev.off()
MC_G$Provincia <- dft$Provincia
write.table(MC_G, paste0("veh/csv/", cate, ".txt"), quote = F, row.names = F)

#MC motoo[2]####
cate <- "MC_G_50_250"
dft <- readRDS("veh/MC2017_1978.rds")
dft$Provincia <- NULL
MC_G <- dft*motoo$per[2]
saveRDS(MC_G, paste0("veh/", cate, ".rds"))
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(MC_G),
        main = paste0(cate, ": ", round(sum(MC_G, na.rm = T)),
                      ", distribución estadistica"))
dev.off()
MC_G$Provincia <- dft$Provincia
write.table(MC_G, paste0("veh/csv/", cate, ".txt"), quote = F, row.names = F)

#MC motoo[3]####
cate <- "MC_G_250_750"
dft <- readRDS("veh/MC2017_1978.rds")
dft$Provincia <- NULL
MC_G <- dft*motoo$per[3]
saveRDS(MC_G, paste0("veh/", cate, ".rds"))
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(MC_G),
        main = paste0(cate, ": ", round(sum(MC_G, na.rm = T)),
                      ", distribución estadistica"))
dev.off()
MC_G$Provincia <- dft$Provincia
write.table(MC_G, paste0("veh/csv/", cate, ".txt"), quote = F, row.names = F)

