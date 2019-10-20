# Trabalho de implementação 1 da disciplina Hybrid Transaction Analytical Processing

## Enunciado

Neste primeiro trabalho, vamos explorar Bancos de Dados noSQL. A ideia é que cada grupo ou indivíduo realize uma análise simples de criminalidade usando um dataset de dados de crimes da cidade de Denver, Colorado, EUA. Passos a seguir:

1. Faça o download do arquivo anexo (denver-crime-data.zip). Esse arquivo zip contém uma série de arquivos, mas o principal é o crime.csv que contém todas as instâncias de crimes da cidade de Denver.

2. O arquivo offense_codes.csv contém os códigos e nomes dos crimes e atos ilícitos que são usados no crime.csv, e.g., drug-heroin-possess.

3. Cada grupo ou indivíduo deverá escolher 2 SGBDs, um relacional e um noSQL.

4. Façam a ingestão desses dados em ambos os SGBDs.

5. Elaborem pelo menos 5 consultas que explorem os dados estratificando por localidade (Endereço, Distrito, Latitude, Longitude), Data e Hora, e contabilizando o número de ocorrências de tipos de crimes. O objetivo é buscar identificar em que condições ocorrem mais crimes.

6. Elabore um relatório comparando as duas abordagens (apresentando vantagens e desvantagens, pontos fortes e fracos) e analisando pelo menos os seguintes quesitos:

* 6.1 Ingestão de Dados
* 6.2 Linguagem de Consulta
* 6.3 Tempo de Processamento

Este trabalho consiste do uso do banco de dados NoSQL Cassandra rodando em um container docker a través de um servidor chamado DataStax, e usando como client o DataStax Studio.

## Remoção de timeouts

Por padrão, os valores de timeout definidos pelo cassandra são muito pequenos, resultando em timeouts no cluster e no client. O arquivo ```cassandra.yaml``` possui valores customizados que resolver o problema em questão para este trabalho, se desejar valores diferentes é só editar esse arquivo.

Para aplicar essas configurações é necessário copiar esse arquivo para dentro do container, logo primeiro o container precisa estar sendo executado, execute ```docker-compose up```antes. 

Copie o arquivo ```cassandra.yaml```para dentro do conaiter com o comando:

``` 
docker cp cassandra.yaml my-server:/opt/dse/resources/cassandra/conf/cassandra.yaml
````

Para ter certeza de que essas configurações estão de fato aplicadas interrompa a execução do container e execute-o novamente.

## Instruções para execução

Abra o terminal dentro da pasta raiz do projeto, e execute o seguinte comando:

```
docker-compose up
````

## Ingestão de dados
Para poder fazer a ingestão dos dados primeiro é necessário acessar o client no navegador por meio da rota:

```
http:\\localhost:9091
```

Feito isso, entre no notebook do CQL.

![Dashboard de notebooks](https://github.com/VictorOlimpio/trabalho_htap/blob/master/notebooks.png)

Crie uma conexão. 

![Criação de conexão](https://github.com/VictorOlimpio/trabalho_htap/blob/master/edit_connection.png)

Utilize o nome do container do servidor como host (my-server).

![Edição](https://github.com/VictorOlimpio/trabalho_htap/blob/master/connection.png)

Após a conexão ser estabelecida, copie o conteúdo que está em ```schema.cql``` e cole em uma ```cell```, esse passo irá criar o keyspace e a tabela.

Para carregar os dados dentro do banco copie o arquivo cvs desejado e cole dentro do container do servidor com o seguinte comando:

```
docker cp arquivo.csv my-server:/opt/dse/arquivo.csv
```

Feito isso, entre no container do servidor com o comando:

```
docker exec -it my-server sh
```

Acesse o cqlsh digitando ```cqlsh```.

Agora para carregar os dados presentes dentro do arquivo csv que foi copiado para dentro do container do servidor, primeiro é necessário utilizar o keyspace criado anteriormente com o comando ```use db;```, pois db é o nome do keyspace criado no conteúdo copiado de schema.cql.

Feito isso basta carregar os dados com o comando:

```
COPY tableName(column1, column2, ...) FROM ‘arquivo.csv’ WITH DELIMITER=',' AND HEADER=TRUE;
```
Dentro do arquivo injestion.txt existe um exemplo desse mesmo comando.
