#arquivos html

library(rvest)
library(dplyr)

#tabelas da wikipedia

url <- "https://pt.wikipedia.org/wiki/Lionel_Messi"

urlTables <- url %>% read_html %>% html_nodes("table")
urlLinks <- url %>% read_html %>% html_nodes("link")

numerospelobarcelona <- as.data.frame(html_table(urlTables[19]))

