# Carregando os pacotes
library(ggplot2movies)
library(tidyverse)

# Visualizando os dados dos filmes
# View(movies)


# Filtrando os filmes que tiveram um orçamento maior que 0 e selecionando algumas variáveis
dados <- movies %>% 
  filter(
    !is.na(budget), 
    budget > 0
  ) %>% 
  dplyr::select(title, year, budget, rating) %>% 
  arrange(desc(year))

# Visualizando os dados
# View(dados)


# Criando um modelo que preve a nota do filme, utilizando as variáveis 'orçamento' e 'ano'
modelo <- lm(rating ~ budget + year, data = dados)
# summary(modelo)


# #* @post /prever
# prever_nota <- function(orcamento, ano) {
#  nota <- predict(modelo, newdata = data.frame(
#     budget = as.numeric(orcamento), 
#     year = as.numeric(ano)
#   ))
#  
#  nota
#  
#  # paste("A nota prevista para o filme do ano", ano, "com o orcamento de", orcamento, "e:", nota)
# }

#* @post /preverfilme
prever_nota_filme <- function(req, orcamento, ano) {
  
  body <- req$robj
  body
  
  # body$orcamento
  # body$ano
  
  # list(
  #   orcamento = orcamento,
  #   ano = ano
  # )
  # d <- data.frame(budget = as.numeric(orcamento), year = as.numeric(ano))
  # predict(modelo, newdata = d)
}


#* @get /amostrar
amostrar_filmes <- function() {
  dados %>% 
    sample_n(10)
}

