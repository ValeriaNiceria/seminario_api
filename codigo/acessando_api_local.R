library(httr)
library(jsonlite)

res <- httr::GET("http://localhost:8888/amostrar")
content <- rawToChar(res$content)
content_json <- fromJSON(content)

# ---------------------

endpoint <- "http://127.0.0.1:8888/prever"

req <- GET(
  url = endpoint,
  query = list(
    orcamento = 50000,
    ano = 2000
  )
)

content <- rawToChar(req$content)
content_json <- fromJSON(content)





req <- POST(
  url = "http://127.0.0.1:8888/preverfilme",
  body = list(
    orcamento = 75000,
    ano = 1996
  ),
  httr::content_type("application/octet-stream")
)