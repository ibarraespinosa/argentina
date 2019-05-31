library(colorout)
library(htmltab)
library(tidyr)
url <- "http://www.dnrpa.gov.ar/portal_dnrpa/estadisticas/rrss_tramites/tram_prov.php"

get_veh_prov <- function(year = 1995, tipo = "A", mes = FALSE) {
  res <- httr::POST(
    url = url,
    body = list(
      anio = year, # 1995:2018
      codigo_tipo = tipo, # A M Q
      boton = "Aceptar",
      origen  = "portal_dnrpa",
      tipo_consulta = "transferencias",
      operacion    = 1
    ),
    encode = "form"
  )
  html <- xml2::read_html(res)
  t1 <- rvest::html_table(html, fill = TRUE)[[1]][c(-1) , ]
  names(t1) <- c("Provincia", paste0("Mes", 1:12), "Total")
  t1 <- t1[!is.na(t1$Provincia), ]
  t1 <- t1[t1$Provincia != "TOTAL", ]
  t1$Total <- as.numeric(gsub(pattern = "\\.", replacement = "", x = t1$Total))
  t1$Year <- year
  if(mes){
    return(t1)
  } else {
    t1 <- t1[, c("Provincia", "Total", "Year")]
    return(t1)
  }
}
anos <- 1995:2017
tipos <-  c("A", "M")
t1 <- get_veh_prov(year = anos[20], tipo = "A")
head(t1)

# Automoveis ####
df <- data.table::rbindlist(lapply(1:length(anos), function(i){
    get_veh_prov(year = anos[i], tipo = "A")
}))
dfpc <- df
# sum(dfmc$Total)/sum(df$Total)*100

dff <-  spread(data = as.data.frame(df), key = -Year, value = Total)
head(dff)
dft <- dff[rev(order(dff$Year)), ]
m1996 <- mean(as.numeric(dft[nrow(dft)-1,2:ncol(dft)]))
m1995 <- mean(as.numeric(dft[nrow(dft), 2:ncol(dft)]))
m1995/m1996
for(i in 24:40){
  dft[i, ] <- dft[nrow(dft), ]*m1995/m1996
}
dft$Year <- 2017:1978
# dft <- dft[order(dft$Year), ]
dft <- as.data.frame(t(dft))
dft1 <- dft[1, ]
dft <- dft[2:nrow(dft), ]
names(dft) <- dft1
dft$Provincia <- row.names(dft)
saveRDS(dft, "veh/LDV2017_1978.rds")

library(ggplot2)
ggplot(df, aes(x = Year, y = Total, colour = Provincia)) +
  geom_line()


# MC ####
dfmc <- data.table::rbindlist(lapply(13:length(anos), function(i){
  get_veh_prov(year = anos[i], tipo = "M")
}))
dff <-  spread(data = as.data.frame(dfmc), key = -Year, value = Total)
head(dff)
dft <- dff[rev(order(dff$Year)), ]
m1996 <- mean(as.numeric(dft[nrow(dft)-1,2:ncol(dft)]))
m1995 <- mean(as.numeric(dft[nrow(dft), 2:ncol(dft)]))
m1995/m1996
for(i in 12:40){
  dft[i, ] <- dft[nrow(dft), ]*m1995/m1996
}
dft$Year <- 2017:1978
# dft <- dft[order(dft$Year), ]
dft <- as.data.frame(t(dft))
dft1 <- dft[1, ]
dft <- dft[2:nrow(dft), ]
names(dft) <- dft1
dft$Provincia <- row.names(dft)
saveRDS(dft, "veh/MC2017_1978.rds")

# Trucks
dtrucks <- c(6294, 6886, 6429, 7833, 10361, 6015)
plot(x = 2004:2009, y = dtrucks, type = "b", pch = 16)

# library(htmltab)
# provincia <- c("BUENOS AIRES",
#                "CAPITAL FEDERAL",
#                "CATAMARCA",
#                "CORDOBA",
#                "CORRIENTES",
#                "CHACO",
#                "CHUBUT",
#                "ENTRE RIOS",
#                "FORMOSA",
#                "LA PAMPA",
#                "LA RIOJA",
#                "MENDOZA",
#                "MISIONES",
#                "LA NEUQUÉN",
#                "RIO NEGRO",
#                "SALTA",
#                "SAN JUAN",
#                "SAN LUIS",
#                "SANTA CRUZ",
#                "SANTA FE",
#                "SANTIAGO DEL ESTERO",
#                "TUCUMAN",
#                "TIERRA DEL FUEGO")
# # c_provincia=01 = "BUENOS AIRES",
# # c_provincia=02 = "CAPITAL FEDERAL",
# # c_provincia=03 = "CATAMARCA",
# # c_provincia=04 = "CORDOBA",
# # c_provincia=05 = "CORRIENTES",
# # c_provincia=06 = "CHACO",
# # c_provincia=07 = "CHUBUT",
# # c_provincia=08 = "ENTRE RIOS",
# # c_provincia=09 = "FORMOSA",
# # c_provincia=11 = "LA PAMPA",
# # c_provincia=12 = "LA RIOJA",
# # c_provincia=13 = "MENDOZA",
# # c_provincia=14 = "MISIONES",
# # c_provincia=15 = "LA NEUQUÉN",
# # c_provincia=16 = "RIO NEGRO",
# # c_provincia=17 = "SALTA",
# # c_provincia=18 = "SAN JUAN",
# # c_provincia=19 = "SAN LUIS",
# # c_provincia=20 = "SANTA CRUZ",
# # c_provincia=21 = "SANTA FE",
# # c_provincia=22 = "SANTIAGO DEL ESTERO",
# # c_provincia=23 = "TUCUMAN",
# # c_provincia=24 = "TIERRA DEL FUEGO",
# id_provincia <- c(paste0(0, 1:9), 10:24)
# id_tipo <- c("A")
# id_codigo_tramite <- c("4")
# anio <- 1995:2017
# origen = "portal_dnrpa"
# eco = "&"
# url = "http://www.dnrpa.gov.ar/portal_dnrpa/estadisticas/rrss_tramites/tram_prov_01.php?c_provincia=11&codigo_tipo=A&anio=2017&codigo_tramite=4&origen=portal_dnrpa"
# url1 <- "http://www.dnrpa.gov.ar/portal_dnrpa/estadisticas/rrss_tramites/tram_prov_01.php?"
# veh <- paste0(url1, "c_provincia=", id_provincia[1],
#               eco, "codigo_tipo=", id_tipo[1],
#               eco, "anio=", anio[1],
#               eco, "codigo_tramite=", id_codigo_tramite[1],
#               eco, "origen=", origen )
# t1 <- htmltab(doc = veh)
# head(t1)
# class(t1)
# names(t1)
# names(t1) <-  c("RRSS", paste0("MES_",c(paste0(0, 1:9), 10:12)), "Total")
# 
# la <- lapply(1:length(id_provincia), function(i){
#   lapply(1:length(anio), function(j){
#     cat(paste(provincia[i], anio[j], "\n"))
#     veh <- paste0(url1, "c_provincia=", id_provincia[i],
#                   eco, "codigo_tipo=", id_tipo[1],
#                   eco, "anio=", anio[j],
#                   eco, "codigo_tramite=", id_codigo_tramite[1],
#                   eco, "origen=", origen)
#     a <- htmltab(doc = veh, which = 1)
#     names(a) <-  c("RRSS",
#                    paste0("MES_",c(paste0(0, 1:9), 10:12)),
#                    "Total")
#     a$Provincia <- provincia[i]
#     a$Year <- anio[j]
#     a
#   })
# })
# length(la) # provincia
# length(la[[1]]) # años
# class(la)
# head(la[[1]][[1]])
# laa <- do.call("rbind", do.call("rbind", la))
# class(laa)
# dim(laa)
# head(laa)
# tail(laa)
# 
# saveRDS(laa, "veh/ListaAutos.rds")
# 
# # leyendo de nuevo
# 
# lista <- readRDS("veh/ListaAutos.rds")
# class(lista)
# head(lista[[24]])
