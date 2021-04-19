#vetor emissões de co2 a partir de combustíveis fósseis
co2_emissions <- c(93.92, 104.83, 325.33, 781.58, 326.05, 181.91, 313.77, 51.78,  74.80, 260.95, 38.27, 358.13, 35.7, 402.55, 233.47, 168.09, 95.51, 623.70, 195.38, 436.82)

#função de centralização
centralizacao <- function(x) {
  x <- x - mean(x)
  return(x)
}

centralizacao(co2_emissions)

