# Exemplo: Criando uma API
#################################

# Plumber: https://www.rplumber.io/
# OpenCPU: https://www.opencpu.org/ https://github.com/opencpu/opencpu


# Baixando os filmes do IMDb utitlizando o pacote 'ggplot2movies'
if (!require(ggplot2movies)) install.packages("ggplot2movies")

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


prever_nota <- function(orcamento, ano) {
  predict(modelo, newdata = data.frame(
    budget = as.numeric(orcamento), 
    year = as.numeric(ano)
  ))
}


amostrar_filmes <- function() {
  dados %>% 
    sample_n(10)
}


# ---------------------------------------------------------

# Instalando o pacote do plumber
if (!require(plumber)) install.packages("plumber")
library(plumber)


# Rodando o servidor
server <- plumber::plumb('api.R')
server$run(port  = 8888)
