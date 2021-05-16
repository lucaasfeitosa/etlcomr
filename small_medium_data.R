library(data.table)

casos= 15e6

# cria o data.frame com o total de casos definido acima
largeData = data.table(a=rpois(casos, 3),
                       b=rbinom(casos, 1, 0.7),
                       c=rnorm(casos),
                       d=sample(c("fogo","agua","terra","ar"), casos, replace=TRUE),
                       e=rnorm(casos),
                       f=rpois(casos, 3),
                       g=rnorm(casos)
)

object.size(largeData) # retorna o tamanho do objeto

head(largeData) # vê as primeiras linhas

write.table(largeData,"bases_originais/largeData.csv",sep=",",row.names=FALSE,quote=FALSE) # salva em disco

# criando objeto enderecobase

enderecoBase <- 'bases_originais/largeData.csv'

# extração direta via read.csv
system.time(extracaoLD1 <- read.csv2(enderecoBase))

# extração via amostragem com read.csv

# ler apenas as primeiras 25 linhas
amostraLD1 <- read.csv2(enderecoBase, nrows=25)  

amostraLD1Classes <- sapply(amostraLD1, class)

# leitura passando as classes de antemão, a partir da amostra
system.time(extracaoLD2 <- data.frame(read.csv2("bases_originais/largeData.csv", colClasses=amostraLD1Classes)))  

# extração via função fread, que já faz amostragem automaticamente
system.time(extracaoLD3 <- fread(enderecoBase))

#interpretação das colunas
str(extracaoLD1)
str(extracaoLD2)
str(extracaoLD3)
