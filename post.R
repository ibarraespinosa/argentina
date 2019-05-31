library(vein)
library(data.table)
library(units)
data("pollutants")
print("hola!")
# net
net <- readRDS("network/net.rds")
names(net)
net$province <- net$ID
net <- net[, "province"]

# emissions
a <- list.files(path = "emi", pattern = ".rds", full.names = T)
e <- rbindlist(lapply(a, readRDS)) 
e$t <- set_units(e$emissions, Mg)
df <- e[, sum(t, na.rm = T), by = .(province, pollutant)]
dfs <- merge(net, df, by = "province", all = T)

names(net)
saveRDS(net, "network/net_pollutant.rds")


unique(dfs$pollutant)
plot(dfs[dfs$pollutant == "CO", "V1"], axes = T, breaks = "kmeans")

e[, sum(t, na.rm = T), by = .(pollutant)]