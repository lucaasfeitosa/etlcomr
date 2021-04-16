library("eeptools")

#vetor com nome dos países
nomepaíses <- c("Bélgica", "República Tcheca", "França", "Alemanha", "Itália", "Holanda")

#vetor emissões de co2 a partir de combustíveis fósseis
co2_emissions <- c(93.92, 104.83, 325.33, 781.58, 326.05, 181.91)

#vetor intensidade de co2
co2_intensity <- c(0.178, 0.278, 0.115, 0.192, 0.141, 0.206)

#data.frame com base nos vetores
listapaíses <- data.frame(país = nomepaíses, emissãoc02 = co2_emissions, intensidadeco2 = co2_intensity)

#estrutura
str(listapaíses)
