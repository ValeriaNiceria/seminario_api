# Exemplo: Acessando uma API

# Instalando os pacotes, caso não os tenha no computador
if (!require(httr)) install.packages("httr")
if (!require(jsonlite)) install.packages("jsonlite")

# Carregando os pacotes
library(httr)
library(jsonlite)

##############################
# Acessando API do COVID
##############################

# Separando a estrutura do endpoint 'endereço' que iremos acessar, em variáveis
base_url <- "https://api.covid19api.com"
path <- "country/brazil/status/confirmed"

endpoint <- paste(base_url, path, sep="/")

# Fazendo uma solitação GET a API, passando o endereço da requisição e o query string,
# que são parâmetros que segundo a documentação da API esse endpoint pode receber
res_api <- GET(
  url = endpoint, 
  query = list(
    from = "2020-06-20T00:00:00Z",
    to = "2020-07-07T00:00:00Z"
  )
)

# Visualizando o resposta da requisição
res_api

# -- 

# Nesse momento os nossos dados da requisição estão contidos em um Unicode bruto,
# sendo necessário converter seu conteúdo para um vetor de caracteres
content_text <- rawToChar(res_api$content)

# Visualizando o resultado da conversão, que será uma estrutura JSON no formato caractere
content_text

# --

# Convertendo a estrutura JSON no formato caratere para um objeto do R
content_json <- fromJSON(content_text, flatten=TRUE)

# Visualizando o resultado da conversão
content_json






################################
# Acessando API do AccuWeather
################################

# Separando a estrutura do endpoint 'endereço' que iremos acessar, em variáveis
base_url <- "http://dataservice.accuweather.com"
path <- "locations/v1/regions"

endpoint <- paste(base_url, path, sep="/")

# Atribuindo o token a uma variável de ambiente do R
# 1° opção: Será aberto um arquivo com todas as variáveis de ambiente e você poderá adicionar uma nova
#usethis::edit_r_environ()
# 2° opção: Cria uma variável, sem a necessidade de abrir o arquivo
#Sys.setenv("KEY_API" = "sua_api")

# Obtendo a variável de ambiente e atribuindo a uma nova variável
key_api <- Sys.getenv("KEY_API")

# Fazendo uma solitação GET a API, passando o endereço da requisição e o query string,
# que neste caso, será a chave e que queremos os detalhes
res_api <- GET(
  url = endpoint, 
  query = list(
    apikey= key_api,
    details = "true"
  )
)

# Visualizando o resposta da requisição
res_api

# ---

# Nesse momento os nossos dados da requisição estão contidos em um Unicode bruto,
# sendo necessário converter seu conteúdo para um vetor de caracteres
content_text <- rawToChar(res_api$content)

# Visualizando o resultado da conversão, que será uma estrutura JSON no formato caractere
content_text

# ---

# Convertendo a estrutura JSON no formato caratere para um objeto do R
content_json <- fromJSON(content_text, flatten=TRUE)

# Visualizando o resultado da conversão
content_json



