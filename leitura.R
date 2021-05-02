# carrega a base de snistros de transito do site da PCR
sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2019Mod <- sinistrosRecife2019Raw[, -(10:12)]


#verificando o nome das variÃ¡veis

names(sinistrosRecife2019Mod) == names(sinistrosRecife2020Raw)

#alterando o nome da variÃ¡vel da primeira coluna

names(sinistrosRecife2019Mod)[grep('DATA', names(sinistrosRecife2019Mod))] <- 'data'


# junta as bases de dados com comando rbind (juntas por linhas)

sinistrosRecifeRaw <- rbind(sinistrosRecife2020Raw, sinistrosRecife2021Raw, sinistrosRecife2019Mod)

# observa a estrutura dos dados
str(sinistrosRecifeRaw)

# modifca a data para formato date
sinistrosRecifeRaw$data <- as.Date(sinistrosRecifeRaw$data, format = "%Y-%m-%d")

# modifica natureza do sinistro de texto para fator
sinistrosRecifeRaw$natureza_acidente <- as.factor(sinistrosRecifeRaw$natureza_acidente)

# modifica situacao de texto para fator
sinistrosRecifeRaw$situacao <- as.factor(sinistrosRecifeRaw$situacao)

#cria funÃ§aÃµ para substituir not available (na) por 0
naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

# aplica a funÃ§Ã£o naZero a todas as colunas de contagem
sinistrosRecifeRaw[, 15:25] <- sapply(sinistrosRecifeRaw[, 15:25], naZero)

#ficamos com staging area?

ls()

# vamos ver quanto cada objeto estÃ¡ ocupando

for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format = "d", 
                width = 30), 
        quote = F)
}

ls() # lista todos os objetos no R

# agora, vamos remover

gc() # uso explÃ­cito do garbage collector

rm(list = c('sinistrosRecife2020Raw', 'sinistrosRecife2021Raw', 'sinistrosRecife2019Raw', 'sinistrosRecife2019Mod'))

##########

install.packages("microbenchmark")

library(microbenchmark)

# exporta em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife1.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife1.csv")

# exporta em formato fst

install.packages("fst")

library(fst)

write_fst(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife1.fst")

# carrega base de dados em formato nativo R
sinistrosRecife <- readRDS('bases_tratadas/sinistrosRecife1.rds')           

# carrega base de dados em formato tabular (.csv) - padrão para interoperabilidade
sinistrosRecife <- read.csv2('bases_tratadas/sinistrosRecife1.csv', sep = ';')

# carrega base de dados em formato tst

sinistrosRecife <- read_fst('bases_tratadas/sinistrosRecife1.fst')

# compara os tres processos de exportação, usando a função microbenchmark

microbenchmark(a <- saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife1.rds"), b <- write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife1.csv"), c <- write_fst(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife1.fst"), times = 30L)

microbenchmark(a <- readRDS('bases_tratadas/sinistrosRecife1.rds'), b <- read.csv2('bases_tratadas/sinistrosRecife1.csv', sep = ';'), c <- read_fst('bases_tratadas/sinistrosRecife1.fst'), times = 10L)
