# carrega base de dados original
chamadosEMLURB <- read.csv2('http://dados.recife.pe.gov.br/dataset/99eea78a-1bd9-4b87-95b8-7e7bae8f64d4/resource/9afa68cf-7fd9-4735-b157-e23da873fef7/download/156_diario.csv', sep = ';', encoding = 'UTF-8')

#retirando uma linha para fins didáticos
chamadosEMLURB <- chamadosEMLURB[-22,]

# carrega base de dados atualizada
chamadosEMLURBnew <- read.csv2('http://dados.recife.pe.gov.br/dataset/99eea78a-1bd9-4b87-95b8-7e7bae8f64d4/resource/9afa68cf-7fd9-4735-b157-e23da873fef7/download/156_diario.csv', sep = ';', encoding = 'UTF-8')

# compara usando a chave substituta
# criar a chave substituta

chamadosEMLURB$chavesubstituta = apply(chamadosEMLURB[, c(1:7)], MARGIN = 1, FUN = function(i) paste(i, collapse = ""))

chamadosEMLURBnew$chavesubstituta = apply(chamadosEMLURBnew[, c(1:7)], MARGIN = 1, FUN = function(i) paste(i, collapse = ""))

# cria base de comparação
chamadosEMLURBincremento <- (!chamadosEMLURBnew$chavesubstituta %in% chamadosEMLURB$chavesubstituta)
summary(chamadosEMLURBincremento)

# junta base original e incremento
chamadosEMLURB <- rbind(chamadosEMLURB, chamadosEMLURB[chamadosEMLURBincremento,])

                        