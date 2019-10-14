# Trabalho de implementação 1 da disciplina Hybrid Transaction Analytical Processing

## Enunciado

Neste primeiro trabalho, vamos explorar Bancos de Dados noSQL. A ideia é que cada grupo ou indivíduo realize uma análise simples de criminalidade usando um dataset de dados de crimes da cidade de Denver, Colorado, EUA. Passos a seguir:

1. Faça o download do arquivo anexo (denver-crime-data.zip). Esse arquivo zip contém uma série de arquivos, mas o principal é o crime.csv que contém todas as instâncias de crimes da cidade de Denver.

2. O arquivo offense_codes.csv contém os códigos e nomes dos crimes e atos ilícitos que são usados no crime.csv, e.g., drug-heroin-possess.

3. Cada grupo ou indivíduo deverá escolher 2 SGBDs, um relacional e um noSQL.

4. Façam a ingestão desses dados em ambos os SGBDs.

5. Elaborem pelo menos 5 consultas que explorem os dados estratificando por localidade (Endereço, Distrito, Latitude, Longitude), Data e Hora, e contabilizando o número de ocorrências de tipos de crimes. O objetivo é buscar identificar em que condições ocorrem mais crimes.

6. Elabore um relatório comparando as duas abordagens (apresentando vantagens e desvantagens, pontos fortes e fracos) e analisando pelo menos os seguintes quesitos:

6.1 Ingestão de Dados
6.2 Linguagem de Consulta
6.3 Tempo de Processamento

## Instruções para execução

Abra o terminal dentro da pasta raiz do projeto, e execute o seguinte comando:

```
docker-compose up
````
Para poder fazer a ingestão dos dados primeiro é necessário acessar o client no navegador por meio da rota:

```
http:\\localhost:9091
```

Feito isso, entre no notebook do CQL, e crie uma conexão, utilize o nome do container do servidor como host (my-server).

Após a conexão ser estabelecida, copie o conteúdo que está em ```schema.cql``` e cole em uma ```cell```, esse passo irá criar o keyspace e a tabela.
