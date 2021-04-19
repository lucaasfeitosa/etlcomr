library("eeptools")

#vetor com nome dos países
nomepaíses <- c("Bélgica", "República Tcheca", "França", "Alemanha", "Itália", "Holanda", "Polônia", "Portugal", "Romênia", "Espanha", "Suécia", "Reino Unido", "Noruega", "Turquia", "Cazaquistão", "Ucrânia", "Uzbequistão", "Canadá", "Argentina", "Brasil", "Chile", "Colômbia", "México")

#vetor emissões de co2 a partir de combustíveis fósseis
co2_emissions <- c(93.92, 104.83, 325.33, 781.58, 326.05, 181.91, 313.77, 51.78, 74.80, 260.95, 38.27, 358.13, 35.70, 402.55, 233.47, 168.09, 95.51, 623.70, 195.38, 436.82, 85.21, 72.78, 436.49)

#vetor intensidade de co2
co2_intensity <- c(0.178, 0.278, 0.115, 0.192, 0.141, 0.206, 0.288, 0.162, 0.155, 0.152, 0.077, 0.127, 0.108, 0.198, 0.509, 0.473, 0.440, 0.376, 0.221, 0.140, 0.198, 0.105, 0.192)

#data.frame com base nos vetores
listapaíses <- data.frame(país = nomepaíses, emissãoc02 = co2_emissions, intensidadeco2 = co2_intensity)

#média de cada variável do data frame listapaíses
apply(listapaíses[ ,-1], 2, mean)
apply(listapaíses[ ,-1], 2, sd)
apply(listapaíses[ ,-1], 2, median)
apply(listapaíses[ ,-1], 2, sum)
