---
title: "Trabalho Final - Estrutura??o e fortalecimento do Sistema Nacional de Cultura"
author: "Fl?via Gonzaga Serafim"
date: "16 de setembro de 2018"
output:
  word_document: default
  html_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
# Sobre a pol?tica cultural

A cultura, enquanto pol?tica p?blica, pode ser compreendida por suas dimens?es simb?lica, cidad? e econ?mica. A dimens?o simb?lica reconhece e valoriza o capital simb?lico, as linguagens e as pr?ticas culturais, que se expressam por cren?as, rituais, festas, vestimentas, comida, modo de viver; a dimens?o cidad? deve proporcionar o acesso, a democratiza??o e a universaliza??o cultural, enquanto direito humano de usufruir, produzir e difundir cultura; a dimens?o econ?mica percebe a cultura como vetor para o desenvolvimento econ?mico socialmente justo e sustent?vel (gerar ocupa??o produtiva, combater pr?ticas de monop?lio e de explora??o cultural, promover a diversidade e a criatividade). 

De forma a concretizar essas dimens?es, dois instrumentos foram institu?ddos para gest?o da pol?tica cultural: o Plano Nacional de Cultural - PNC (Lei N. 12.343/2010) que contempla diretrizes, estrat?gias e a??es para alcance de 53 metas (dispostas na Portaria n. 123/2011), em um per?odo de dez anos; e o Sistema Nacional de Cultura - SNC (Emenda Constitucional n. 71/2012), que se refere a um sistema de articula??o, gest?o, informa??o e forma??o de pol?ticas culturais, pactuado entre os entes federados, com a participa??o da sociedade civil, para efetiva??o do PNC, com foco na valoriza??o do capital simb?lico, na promo??o do pleno exerc?cio dos direitos culturais e no acesso ?s fontes de cultura nacional.

# Sobre os dados utilizados neste trabalho

O processo de implanta??o do SNC para fins de concretiza??o das metas do PNC inicia-se com ades?o das esferas de gest?o cultural ao SNC, que se materializa pela publica??o de termo de coopera??o entre a Uni?o e os entes da federa??o (estados, distrito federal e munic?pios). 

A partir da data de publica??o da ades?o, cada ente se compromete em constituir, no prazo de dois anos, os componentes que estruturam seu sistema local: sistema de cultura (lei de cria??o), ?rg?o gestor (estrutura adminsitrativa para gest?o da pol?tica cultural), conselho cultural (ata da primeira reuni?o com defini??o de participantes, inclusive da sociedade civil), mecanismo de fomento (forma de financiamento da ?rea cultural) e plano de cultura (defini??o de metas e indicadores locais que ir?o cooroborar para o alcance das metas nacionais dispostas no PNC).

A tabela "Datas" contempla descri??o de quais entes federativos (estados, distrito federal e munic?pios) aderiram ao SNC (e com isso se comprometeram a implementar, em dois anos, os demais componentes do sistema local) e qual a data da publica??o dessa ades?o (data a partir da qual come?a a contar o prazo de dois anos para essa implementa??o); a tabela contempla dados at? 31 agosto de 2018.

A tabela "Ades?o" contempla a situa??o, dentre os entes federados, frente ? publica??o do termo de coopera??o (que materializa a ades?o junto ao SNC), bem como a constitui??o de cada um dos componentes que integram o sistema local de cultura (sistema, ?rg?o gestor, conselho, mecanismo de fomento e plano de cultura); a tabela contempla dados at? 31 de agosto de 2018.

# Sobre os c?lculos e as an?lises realizadas neste trabalho

## Tabela "Datas"

### Importar a tabela em formato xlsx e conhecer os dados

```{r}
require(openxlsx)
```

```{r}
Datas <- read.xlsx("E:/D5 aulas/SNC/TrabalhoFinal/DadoTrabalhado/Datas.xlsx", detectDates = T)
```

```{r}
str(Datas)
```

### Converter a coluna Data_adesao, em formato "character", para o formato "data"

Como a coluna Data_adesao contempla caracteres, foi necess?ria sua convers?o para o formato de datas.

```{r}
Datas$Data_adesao <- as.Date(Datas$Data_adesao,format = "%Y-%m-%d")
```

```{r}
head(Datas)
```

```{r}
str(Datas)
```

### Identificar a menor e a maior data, na coluna Data_adesao

```{r}
Datas$Data_adesao[which.min(Datas$Data_adesao)]
```

Pelo resultado obtido percebe-se que as ades?es dos entes federados iniciaram no mesmo ano da institui??o do SNC (2012).

```{r}
Datas$Data_adesao[which.max(Datas$Data_adesao)]
```

Como a tabela "Datas" completa dados at? agosto/2018, percebe-se, em fun??o do resultado da maior data de ades?o ao SNC, que as ades?es continuam em curso.

### Conhecer a quantidade de entes federados que aderiram ao SNC

```{r}
summary(Datas$Aderiu_ao_SNC)
```

De acordo com o resultado, verifica-se que a tabela "Datas" contempla 5.598 registros entre estados, distrito federal e munic?pios.

```{r}
summary(Datas$Aderiu_ao_SNC== "Sim")
```

```{r}
2647*100/5598
```

```{r}
2951*100/5598
```

```{r}
aderiu <- data.frame(aderiu = c("sim","n?o"),quanti_adesoes = c(2647, 2951),percent_adesoes = c(47.3, 52.7))
```

```{r}
aderiu
```

Conforme resultado, de 2012 at? o momento (cerca de 6,5 anos), 2.647 entes federados aderiram ao SNC, o que corresponde a 47,3% do total; enquanto que 2.951 entes federativos (52,7%) ainda n?o se compromemteram a constituir os componentes de seu sistema local de cultura.

### De forma alternativa (rotina)

```{r}
aderiu_data <- data.frame(aderiu = c("sim","n?o"),
                          quanti_adesoes  = c(sum(Datas$Aderiu_ao_SNC== "Sim", na.rm = T),sum(is.na(Datas$Aderiu_ao_SNC))),
                          percent_adesoes = c(sum(Datas$Aderiu_ao_SNC== "Sim", na.rm = T)/5598*100,sum(is.na(Datas$Aderiu_ao_SNC))/5598*100))
```

```{r}
aderiu_data
```

### Conhecer a quantidade de ades?es por ano

```{r}
adesoes_2012 <- sum(Datas$Data_adesao >="2012/01/01" & Datas$Data_adesao <="2012/12/31",na.rm = T)
```

```{r}
adesoes_2013 <- sum(Datas$Data_adesao >="2013/01/01" & Datas$Data_adesao <="2013/12/31",na.rm = T)
```

```{r}
adesoes_2014 <- sum(Datas$Data_adesao >="2014/01/01" & Datas$Data_adesao <="2014/12/31",na.rm = T)
```

```{r}
adesoes_2015 <- sum(Datas$Data_adesao >="2015/01/01" & Datas$Data_adesao <="2015/12/31",na.rm = T)
```

```{r}
adesoes_2016 <- sum(Datas$Data_adesao >="2016/01/01" & Datas$Data_adesao <="2016/12/31",na.rm = T)
```

```{r}
adesoes_2017 <- sum(Datas$Data_adesao >="2017/01/01" & Datas$Data_adesao <="2017/12/31",na.rm = T)
```

```{r}
adesoes_2018 <- sum(Datas$Data_adesao >="2018/01/01" & Datas$Data_adesao <="2018/12/31",na.rm = T)
```

```{r}
adesao_ano <- data.frame(ano = c("2012","2013","2014","2015","2016","2017","2018"), quant_adesoes = c(adesoes_2012, adesoes_2013, adesoes_2014, adesoes_2015,adesoes_2016, adesoes_2017, adesoes_2018))
```

```{r}
adesao_ano
```

Em fun??o do resultado, verifica-se que o primeiro ano (2012) registrou o menor n?mero de ades?es ao SNC; enquanto que em 2013 foi registrada a maior quantidade de ades?es.

### Visualizar os dados de 2012 a 2017, em gr?fico

Para facilitar a visualiza??o, os resultados foram disposto em gr?fico. 

```{r}
adesao_2012_2017 <- adesao_ano[-7,]
```

```{r}
str(adesao_2012_2017)
```

```{r}
adesao_2012_2017
```

```{r}
media_adesoes <- mean(adesao_2012_2017$quant_adesoes)
```

```{r}
media_adesoes
```

```{r}
plot(as.character(adesao_2012_2017$ano), as.character(adesao_2012_2017$quant_adesoes), xlab = "ano", ylab = "quantidade de adesoes", main = "Quantidade de ades?es entre 2012 a 2017", pch = 17)
abline(h= media_adesoes)
```

Como o ano de 2018 est? em curso, os dados para esse ano n?o foram inclu?dos no gr?fico.

Conforme o gr?fico, sem considerar o cen?rio pol?tico e econ?mico ao longo do per?odo, conclui-se que as estrat?gias adotadas nos anos de 2013 e 2014, para ampliar o n?mero de ades?es ao SNC, foram as que obtiveram os melhores desempenhos (a quantidade de ades?es nesses anos foi superior ? m?dia dos anos em an?lise - 428 ades?es/ano).

## Tabela "Adesao"

### Importar a tabela em formato xlsx e conhecer os dados

```{r}
Adesao <- read.xlsx("E:/D5 aulas/SNC/TrabalhoFinal/DadoTrabalhado/Adesao.xlsx")
```

```{r}
str(Adesao)
```

### Conhecer os dados sobre os acordos de coopera??o publicados em imprensa oficial

```{r}
str(Adesao[Adesao$Situa??o =="Publicado no DOU",])
```

O resultado informa que 2.695 entes federados (estados, distrito federal e munic?pios) tiveram seus acordos de coopera??o publicados em imprensa oficial.

A partir da publica??o de cada acordo, se faz necess?rio acompanhar a execu??o do plano de trabalho do correspondente ente, para fim de constitui??o dos componentes do sistema local de cultura.

### Conhecer os dados sobre os acordos de coopera??o n?o publicados em imprensa oficial

```{r}
str(Adesao[Adesao$Situa??o!="Publicado no DOU",])
```

O resultado informa que 349 entes da federa??o ainda n?o tiveram seus acordos de coopera??o publicados, em fun??o de pend?ncias (diligenciado, aguardando envio de documenta??o, aguardando preenchimento de dados cadatrais).

Nesse caso, faz-se necess?rio manter contato com o ente feerado para resolu??o dessas pend?ncias e publica??o de seu acordo de coopera??o.

### Identificar a quantidade de entes federados com ades?o publicada e que possuem ao menos um dos componentes do sistema de cultura local institu?do

```{r}
sum(Adesao[Adesao$Situa??o=="Publicado no DOU","Possui_Sistema"]=="Sim")
```

```{r}
sum(Adesao[Adesao$Situa??o=="Publicado no DOU","Possui_?rg?o_Gestor"]=="Sim")
```

```{r}
sum(Adesao[Adesao$Situa??o=="Publicado no DOU","Possui_Conselho"]=="Sim")
```

```{r}
sum(Adesao[Adesao$Situa??o=="Publicado no DOU","Possui_Mecanismo_Fomento"]=="Sim")
```

```{r}
sum(Adesao[Adesao$Situa??o=="Publicado no DOU","Possui_Plano"]=="Sim")
```

```{r}
adesao_componente <- data.frame(componente = c("sistema","?rg?o_gestor","conselho","mecanismo_fomento","plano"),
                                quant_componentes = c(347,345,296,246,142)
                                )
```

```{r}
adesao_componente
```

### De forma alternativa (rotina)

```{r}
adesao_comp <- data.frame(comp = c("sistema", "?rg?o_gestor", "conselho", "mecanismo_fomento", "plano"),
                          quant_comp = c(sum(Adesao[Adesao$Situa??o=="Publicado no DOU","Possui_Sistema"]== "Sim"),sum(Adesao[Adesao$Situa??o=="Publicado no DOU","Possui_?rg?o_Gestor"]=="Sim"),sum(Adesao[Adesao$Situa??o=="Publicado no DOU","Possui_Conselho"]=="Sim"),sum(Adesao[Adesao$Situa??o=="Publicado no DOU","Possui_Mecanismo_Fomento"]=="Sim"),sum(Adesao[Adesao$Situa??o=="Publicado no DOU","Possui_Plano"]=="Sim")))
```

```{r}
adesao_comp
```

### Conhecer a quantidade de entes federados com ades?o publicada e com um ou mais componentes do sistema local de cultura institut?do

#### Quantidade de entes com ades?o publicada

```{r}
public <- Adesao[Adesao$Situa??o=="Publicado no DOU",]
```

```{r}
str(public)
```

```{r}
sum(Adesao$Situa??o=="Publicado no DOU")
```

#### Quantidade de entes com ades?o publicada e com sistema institu?do

```{r}
public_sist <- public[public$Possui_Sistema== "Sim",]
```

```{r}
str(public_sist)
```

```{r}
sum(Adesao[Adesao$Situa??o=="Publicado no DOU","Possui_Sistema"]=="Sim")
```

#### Quantidade de entes com ades?o publicada, com sistema institu?do e com ?rg?o gestor definido

```{r}
public_sist_gestor <- public_sist[public_sist$Possui_?rg?o_Gestor== "Sim",]
```

```{r}
str(public_sist_gestor)
```

#### Quantidade de entes com ades?o publicada, com sistema institu?do, com ?rg?o gestor definido e com conselho criado

```{r}
public_sist_gestor_cons <- public_sist_gestor[public_sist_gestor$Possui_Conselho== "Sim",]
```

```{r}
str(public_sist_gestor_cons)
```

#### Quantidade de entes com ades?o publicada, com sistema institu?do, com ?rg?o gestor definido, com conselho criado e com mecanismo de fomento estabelecido

```{r}
public_sist_gestor_cons_fomento <- public_sist_gestor_cons[public_sist_gestor_cons$Possui_Mecanismo_Fomento== "Sim",]
```

```{r}
str(public_sist_gestor_cons_fomento)
```

#### Quantidade de entes com ades?o publicada, com sistema institu?do, com ?rg?o gestor definido, com conselho criado, com mecanismo de fomento estabelecido e com plano de cultura elaborado

```{r}
public_sist_gestor_cons_fomento_plano <- public_sist_gestor_cons_fomento[public_sist_gestor_cons_fomento$Possui_Plano== "Sim",]
```

```{r}
str(public_sist_gestor_cons_fomento_plano)
```

### Conhecer a quantidade de entes com ades?o publicada e que possuem todos os cinco componentes do sistema local de cultura institu?dos (Lei, ?rg?o gestor, conselho, mecanismo de fomento e plano) 

```{r}
total <- Adesao[Adesao$Situa??o=="Publicado no DOU" & Adesao$Possui_Sistema== "Sim" & Adesao$Possui_?rg?o_Gestor== "Sim" & Adesao$Possui_Conselho== "Sim" & Adesao$Possui_Mecanismo_Fomento== "Sim" & Adesao$Possui_Plano== "Sim",]
```

```{r}
str(total)
```

### Visualizar os resultados da quantidade de ades?o (para todos os cinco compoenentes) em gr?ficos

```{r}
public_comp <- c(nrow(public),nrow(public_sist),nrow(public_sist_gestor),              nrow(public_sist_gestor_cons),nrow(public_sist_gestor_cons_fomento),nrow(public_sist_gestor_cons_fomento_plano))
names(public_comp) <- c("publicado", "sistema", "gestor", "conselho", "fomento", "plano")
barplot(public_comp, horiz = F, las = 2, main = "Entes federados e componentes do SNC, visualizando ades?es")
```

```{r}
todos_comp <- c(nrow(public_sist),nrow(public_sist_gestor), nrow(public_sist_gestor_cons),nrow(public_sist_gestor_cons_fomento),nrow(public_sist_gestor_cons_fomento_plano))
names(todos_comp) <- c("sistema", "gestor", "conselho", "fomento", "plano")
pie(todos_comp, las = 2, main = "Entes federados e componentes do SNC, sem visualizar ades?es")
```









