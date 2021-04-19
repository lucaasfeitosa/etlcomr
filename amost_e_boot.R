# atribui a tarefa à variável tarefaSemente
tarefaSemente <- addTaskCallback(function(...) {set.seed(234);TRUE})

# distribuição normal simulada
distNormalSimulacao <- rnorm(300)

# amostragem sem reposição usando função sample
sample(distNormalSimulacao, 22, replace = FALSE)

# amostragem com reposição usando função sample
sample(distNormalSimulacao, 22, replace = TRUE)

# bootstraping com função replicate
set.seed(234)

bootsDistNormal15 <- replicate(15, sample(distNormalSimulacao, 22, replace = TRUE))
bootsDistNormal15

# calculando uma estatística com bootstrapping (15 amostras)
mediaBootsNormal10 <- replicate(10, mean(sample(distNormalSimulacao, 15, replace = TRUE)))
mediaBootsNormal50 <-replicate(50, mean(sample(distNormalSimulacao, 15, replace = TRUE)))
mediaBootsNormal100 <-replicate(100, mean(sample(distNormalSimulacao, 15, replace = TRUE)))

# vamos comparar???

mean(mediaBootsNormal10) # media do boostraping 10
mean(mediaBootsNormal50) # media do boostraping 50
mean(mediaBootsNormal100) # media do boostraping 100
mean(distNormalSimulacao) # media dos dados originais

# partições
particaoDistNormal <- createDataPartition(1:length(distNormalSimulacao), p=.8)
treinoDistNormal <- distNormalSimulacao[unlist(particaoDistNormal)]
testeDistNormal <- distNormalSimulacao[- unlist(particaoDistNormal)]

