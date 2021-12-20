#Abrindo Arquivo CSV
library(readr)
dados <- read.csv(file.choose())

View(dados)

#Filtrando os dados e salvando em uma nova variavel utilizando o Subset


fraudes <- subset(dados, dados$Class == 1)

View(fraudes)

#Renomeando as Colunas

colnames(fraudes)

names(fraudes)[names(fraudes)== "Amount"] <- "Montante"

names(fraudes)[names(fraudes)== "Time"] <- "Tempo"

names(fraudes)[names(fraudes)=="Class"]<- "Classe"

View(fraudes)


#Gerando um grafico para a distribuição dos valores
par(
  mfrow=c(1,2), 
  oma = c(0, 0, 2, 0)
) 

par(mar=c(4,2,2,2))

hist(fraudes$Montante,  main="" , breaks=30 , col=rgb(0.3,0.5,1,0.4) , xlab="Quantidade" , ylab="Numero de Casos")


plot(fraudes$Montante , fraudes$Tempo,  main="" , pch=20 , cex=0.4 , col=rgb(0.3,0.5,1,0.4)  , xlab="Tempo" , ylab="quantidade" )

