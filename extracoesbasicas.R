#extraindo em csv

licenciamentosanitario <- read.csv('http://dados.recife.pe.gov.br/dataset/3a4869e7-7021-485e-97fb-f25cd6422ea6/resource/6bb70e99-b7b9-4b2a-a213-adc757e3337a/download/licenciamento_sanitario.csv', sep = ',', encoding = 'UTF-8')

#extraindo em json

install.packages('rjson')
library(rjson)

resultadofinalalunos <- fromJSON(file = "http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/fb09086d-5df2-48d6-b868-acb00513fab1/download/situacao-final-dos-alunos-por-periodo-letivo.json")
resultadofinalalunos <- as.data.frame(resultadofinalalunos)

#extraindo em xml

install.packages('XML')
library(XML)

WSUcourses <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/courses/wsu.xml")
