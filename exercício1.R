#1 Criando um data.frame

#criando variável normal simulada a
variavel_normal_a <- rnorm(500)
sd(variavel_normal_a)
summary(variavel_normal_a)

#criando variavel normal simulada b
variavel_normal_b <- rnorm(500)
summary(variavel_normal_b)
sd(variavel_normal_b)

#criando variável de contagem com disperção (binomial negativa)
binomialnegativa <- rnbinom(500, mu = 10, size = 30)
binomialnegativa
summary(binomialnegativa)

#criando variável de contagem (poisson)
poissonsimulacao <- rpois(500, 6)
poissonsimulacao
summary(poissonsimulacao)

#criando variável binomial simulada
variavelbinomial <- rbinom(500, 1, 0.7)
variavelbinomial

#criando variavel qualitativa
variavelqualitativa <- factor(variavelbinomial, labels = c("sim", "não"), levels = c(1, 0))
variavelqualitativa

#criando variável de index
variavelindex <- seq(1, length(variavel_normal_a))
variavelindex

#conclusão do data.frame
dados <- data.frame(variavel_normal_a, variavel_normal_b, poissonsimulacao, binomialnegativa, variavelbinomial, variavelqualitativa, variavelindex) 

#2 centralizando as variáveis normais
#centralizando a variável normal a
variavel_normal_a_central <- variavel_normal_a - mean(variavel_normal_a)
hist(variavel_normal_a)
hist(variavel_normal_a_central)
summary(variavel_normal_a_central)
summary(variavel_normal_a)

#centralizando a variável normal b
variavel_normal_b_central <- variavel_normal_b - mean(variavel_normal_b)
hist(variavel_normal_b)
hist(variavel_normal_b_central)
summary(variavel_normal_b)
summary(variavel_normal_b_central)

#3 troque os zeros por um nas variáveis de contagem

poisson_alt <- ifelse(poissonsimulacao == 0, 1, poissonsimulacao)
poisson_alt


binomialnegativa_alt <- ifelse(binomialnegativa == 0, 1, binomialnegativa)
binomialnegativa_alt


#4 crie um novo data.frame com amostra (100) casos da base de dados original

amostra_variavel_normal_a <- replicate(1, sample(variavel_normal_a, 100, replace = TRUE))
amostra_variavel_normal_a
amostra_variavel_normal_b <- replicate(1, sample(variavel_normal_b, 100, replace = TRUE))
amostra_variavel_normal_b
amostra_poisson <- replicate(1, sample(poissonsimulacao, 100, replace = TRUE))
amostra_poisson
amostra_binomialnegativa <- replicate(1, sample(binomialnegativa, 100, replace = TRUE))
amostra_binomialnegativa
amostra_variavelbinomial <- replicate(1, sample(variavelbinomial, 100, replace = TRUE))
amostra_variavelbinomial
amostra_variavelindex <- replicate(1, sample(variavelindex, 100, replace = TRUE))
amostra_variavelindex
amostra_variavelqualitativa <- factor(amostra_variavelbinomial, labels = c("sim", "não"), levels = c(1, 0))
amostra_variavelqualitativa

amostragem <- data.frame(amostra_variavel_normal_a, amostra_variavel_normal_b, amostra_poisson, amostra_binomialnegativa, amostra_variavelbinomial,amostra_variavelqualitativa, amostra_variavelindex)
