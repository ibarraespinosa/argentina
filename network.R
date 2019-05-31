library(sf)
# bajar por orden
veh <- readRDS("veh/PC_G_1400.rds")
row.names(veh)
pro <- sf::st_read("network/argentina_all.gpkg")
pro <- pro[unique(pro$nombre), ]
pro$nombre <- iconv(toupper(as.character(pro$nombre)), to="ASCII//TRANSLIT")
tfuego <- sf::st_read("network/isla.shp", crs =sf::st_crs(pro))

pro$geom[18] <- st_union(tfuego)
pro$nombre <- ifelse(pro$nombre == "TIERRA DEL FUEGO, ANTARTIDA E ISLAS DEL ATLANTICO SUR",
                     row.names(veh)[23],
              ifelse(pro$nombre == "CIUDAD AUTONOMA DE BUENOS AIRES",
                     row.names(veh)[2],
                     pro$nombre))

pro <- pro[order(pro$nombre),] 
for(i in 1:nrow(pro)){
print(identical(pro$nombre[i], row.names(veh)[i])) 
}
fuel <- read.csv("data/Combustibles_por_provincia.csv")
names(fuel) <- c("provincia", "gas_oil", "gn", "nafta")
head(fuel)
fuel$provincia <- toupper(fuel$provincia)
fuel <- fuel[order(fuel$provincia),] 

for(i in 1:nrow(pro)){
  print(identical(fuel$provincia[i], row.names(veh)[i])
  ) 
}

pro$gas_oil <- fuel$gas_oil
pro$gn <- fuel$gn
pro$nafta <- fuel$nafta
plot(pro["gas_oil"], axes = T, breaks = "kmeans")
plot(pro["nafta"], axes = T, breaks = "kmeans")
pro$ID <- pro$nombre
saveRDS(pro, 'network/net.rds')
