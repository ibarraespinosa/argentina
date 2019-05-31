PC_G <- readRDS("veh/PC_G_1400.rds") # 1 ####
cate <- "PC_G_1400"

png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(PC_G),
        main = paste0(cate, ": ", round(sum(PC_G, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
PC_G$Provincia <- dft$Provincia
write.table(PC_G, paste0("csv/", cate, ".txt"), quote = F, row.names = F)

PC_G$Provincia <- dft$Provincia
write.table(PC_G, paste0("csv/", cate, ".txt"), quote = F, row.names = F)


PC_G <- readRDS("veh/PC_G_1400_2000.rds") # 2 ####
cate <- "PC_G_1400_2000"
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(PC_G),
        main = paste0(cate, ": ", round(sum(PC_G, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
PC_G$Provincia <- dft$Provincia
write.table(PC_G, paste0("csv/", cate, ".txt"), quote = F, row.names = F)


PC_G <- readRDS("veh/PC_G_2000.rds") # 3 ####
cate <- "PC_G_2000"
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(PC_G),
        main = paste0(cate, ": ", round(sum(PC_G, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
PC_G$Provincia <- dft$Provincia
write.table(PC_G, paste0("csv/", cate, ".txt"), quote = F, row.names = F)

PC_D <- readRDS("veh/PC_D_1400.rds") # 4 ####
cate <- "PC_D_1400"
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(PC_D),
        main = paste0(cate, ": ", round(sum(PC_D, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
PC_D$Provincia <- dft$Provincia
write.table(PC_D, paste0("csv/", cate, ".txt"), quote = F, row.names = F)


PC_D <- readRDS("veh/PC_D_1400_2000.rds") # 5 ####
cate <- "PC_D_1400_2000"
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(PC_D),
        main = paste0(cate, ": ", round(sum(PC_D, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
PC_D$Provincia <- dft$Provincia
write.table(PC_D, paste0("csv/", cate, ".txt"), quote = F, row.names = F)

PC_D <- readRDS("veh/PC_D_2000.rds") # 6 ####
cate <- "PC_D_2000"
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(PC_D),
        main = paste0(cate, ": ", round(sum(PC_D, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
PC_D$Provincia <- dft$Provincia
write.table(PC_G, paste0("csv/", cate, ".txt"), quote = F, row.names = F)


PC_CNG <- readRDS("veh/PC_CNG.rds") # 7 ####
cate <- "PC_CNG"
png("images/PC_CNG.png", width = 1000, height = 600, units = "px")
barplot(as.matrix(PC_CNG),
        main = paste0("PC_CNG: ", round(sum(PC_CNG, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
PC_CNG$Provincia <- dft$Provincia
write.table(PC_CNG, "csv/PC_CNG.txt", quote = F, row.names = F)

LCV_G <- readRDS("veh/LCV_G.rds") # 8 ####
cate <- "LCV_G"
png("images/LCV_G.png", width = 1000, height = 600, units = "px")
barplot(as.matrix(LCV_G),
        main = paste0("LCV_G: ", round(sum(LCV_G, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
LCV_G$Provincia <- dft$Provincia
write.table(LCV_G, "csv/LCV_G.txt", quote = F, row.names = F)

LCV_D <- readRDS("veh/LCV_D.rds") # 9 ####
cate <- "LCV_D"
png("images/LCV_D.png", width = 1000, height = 600, units = "px")
barplot(as.matrix(LCV_D),
        main = paste0("LCV_D: ", round(sum(LCV_D, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
LCV_D$Provincia <- dft$Provincia
write.table(LCV_D, "csv/LCV_D.txt", quote = F, row.names = F)


LCV_CNG <- readRDS("veh/LCV_CNG.rds") # 10 ####
cate <- "LCV_CNG"
png("images/LCV_CNG.png", width = 1000, height = 600, units = "px")
barplot(as.matrix(LCV_CNG),
        main = paste0("LCV_CNG: ", round(sum(LCV_CNG, na.rm = T)),
                      ", proyectados entre 1994 y 1978"))
dev.off()
LCV_CNG$Provincia <- dft$Provincia
write.table(LCV_CNG, "csv/LCV_CNG.txt", quote = F, row.names = F)

HGV_D <- readRDS("veh/RT_D_12_14.rds") # 11 ####
cate <- "RT_D_12_14"
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(HGV_D),
        main = paste0(cate, ": ", round(sum(HGV_D, na.rm = T))))
dev.off()
HGV_D$Provincia <- dft$Provincia
write.table(HGV_D, paste0("csv/", cate, ".txt"), quote = F, row.names = F)

HGV_D <- readRDS("veh/AT_D_14_20.rds") # 12 ####
cate <- "AT_D_14_20"
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(HGV_D),
        main = paste0(cate, ": ", round(sum(HGV_D, na.rm = T))))
dev.off()
HGV_D$Provincia <- dft$Provincia
write.table(HGV_D, paste0("csv/", cate, ".txt"), quote = F, row.names = F)


BUS_D <- readRDS("veh/BUS_Urban_D_15_18.rds") # 13 ####
cate <- "BUS_Urban_D_15_18"
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(BUS_D),
        main = paste0(cate, ": ", round(sum(BUS_D, na.rm = T)),
                      ", distribucion estadistica"))
dev.off()
BUS_D$Provincia <- BUS_D$Provincia
write.table(BUS_D, paste0("csv/", cate, ".txt"), quote = F, row.names = F)


BUS_D <- readRDS("veh/BUS_Coach_D_15_18.rds") # 14 ####
cate <- "BUS_Coach_D_15_18"
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(BUS_D),
        main = paste0(cate, ": ", round(sum(BUS_D, na.rm = T)),
                      ", distribucion estadistica"))
dev.off()
BUS_D$Provincia <- BUS_D$Provincia
write.table(BUS_D, paste0("csv/", cate, ".txt"), quote = F, row.names = F)

MC_G <- readRDS("veh/MC_G_50.rds") # 15 ####
cate <- "MC_G_50"
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(MC_G),
        main = paste0(cate, ": ", round(sum(MC_G, na.rm = T)),
                      ", distribución estadistica"))
dev.off()
MC_G$Provincia <- dft$Provincia
write.table(MC_G, paste0("csv/", cate, ".txt"), quote = F, row.names = F)


MC_G <- readRDS("veh/MC_G_50_250.rds") # 16 ####
cate <- "MC_G_50_250"
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(MC_G),
        main = paste0(cate, ": ", round(sum(MC_G, na.rm = T)),
                      ", distribución estadistica"))
dev.off()
MC_G$Provincia <- dft$Provincia
write.table(MC_G, paste0("csv/", cate, ".txt"), quote = F, row.names = F)

MC_G <- readRDS("veh/MC_G_250_750.rds") # 17 ####
cate <- "MC_G_250_750"
png(paste0("images/", cate, ".png"), width = 1000, height = 600, units = "px")
barplot(as.matrix(MC_G),
        main = paste0(cate, ": ", round(sum(MC_G, na.rm = T)),
                      ", distribución estadistica"))
dev.off()
MC_G$Provincia <- dft$Provincia
write.table(MC_G, paste0("csv/", cate, ".txt"), quote = F, row.names = F)
