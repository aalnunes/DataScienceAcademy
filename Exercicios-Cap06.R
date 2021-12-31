# Solução Lista de Exercícios - Capítulo 6

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap06")
getwd()


# Exercicio 1 - Instale a carregue os pacotes necessários para trabalhar com SQLite e R


install.packages("RSQLite")

library(RSQLite)
library(dbplyr)
library(dplyr)

# Exercicio 2 - Crie a conexão para o arquivo mamiferos.sqlite em anexo a este script

drv = dbDriver("SQLite")

conection <- dbConnect(drv, dbname = "mamiferos.sqlite")

# Exercicio 3 - Qual a versão do SQLite usada no banco de dados?

src_dbi(conection)
# Dica: Consulte o help da função src_dbi()


# Exercicio 4 - Execute a query abaixo no banco de dados e grave em um objero em R:
# SELECT year, species_id, plot_id FROM surveys

consulta <- "SELECT year, species_id, plot_id FROM surveys"

result <- dbSendQuery(conection, consulta)

dados = fetch(result, n=-1)

dados

# Exercicio 5 - Qual o tipo de objeto criado no item anterior?

class(result)

# Exercicio 6 - Já carregamos a tabela abaixo para você. Selecione as colunas species_id, sex e weight com a seguinte condição:
# Condição: weight < 5

pesquisas <- tbl(conection, "surveys")




consulta2 <- "SELECT species_id, sex ,weight FROM surveys WHERE weight <5 "

result2 <- dbSendQuery(conection, consulta2)



# Exercicio 7 - Grave o resultado do item anterior em um objeto R. O objeto final deve ser um dataframe


dados2 = fetch(result2, n = -1)

dados2
# Exercicio 8 - Liste as tabelas do banco de dados carregado


dbListTables(conection)

# Exercicio 9 - A partir do dataframe criado no item 7, crie uma tabela no banco de dados

dbWriteTable(conection,"Alnunes", dados2)

dbListTables(conection)

# Exercicio 10 - Imprima os dados da tabela criada no item anterior

dbReadTable(conection, "Alnunes")


