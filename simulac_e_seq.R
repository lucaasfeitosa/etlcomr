# atribui a tarefa à variável tarefaSemente
tarefaSemente <- addTaskCallback(function(...) {set.seed(234);TRUE})

# distribuição normal simulada
distNormalSimulacao <- rnorm(300)
summary(distNormalSimulacao)

# distribuição binomial simulada
distBinominalSimulacao <- rbinom(300, 1, 0.4)

# sequências
indexSimulacao <- seq(1, length(distNormalSimulacao))
