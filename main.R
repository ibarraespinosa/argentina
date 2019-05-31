# setwd('/home/sergio/MEGA/PostDoc/suda/argentina')
library(vein)
sessionInfo()

# 0 Delete previous emissions? ####
# borrar <- list.files('emi',
#                      pattern = '.rds', recursive = TRUE,
#                      full.names = TRUE)
# file.remove(borrar)
# 1) Network ####

# 2) Traffic ####
# source('fuel_eval.R') # Edit traffic.R
# traffic.R genera los archivos de vehiculos

# 3) Estimation #### 
# Edit each input.R
inputs <- list.files(path = 'est', pattern = 'input.R',
                     recursive = TRUE, full.names = TRUE)
for (i in 1:length(inputs)){
  print(inputs[i])
  source(inputs[i], echo = F)
}

# 4) Post-estimation #### 
source('post.R') # genera 'network/net_pollutant.rds'
title = "Inventario de emisiones vehiculares ARGENTINA 2017 (beta) TOP DOWN"
notes = c("Hay que agregar el efecto de vein::fuel_corr()",
          "Hay que agregar el efecto de 12% de etanol de maiz en nafta",
          "Hay que agregar el efecto de 10% de etanol de soja en diesel",
          "Hay que agregar el efecto de deterioramento (normal) en motor 4-strokes",
          "Queda en duda si se agrega efecto flota adulterada")
  
vein_notes("README",title = title,notes = notes)
invcop(out_name = "/home/sergio/Documentos/suda/brazil", all = T)
