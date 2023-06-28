# Desafio Travels Booker em construção... 🚧

Sérgio está construindo este projeto para desafiar a si mesmo, desenvolvendo uma **API REST** em uma linguagem de programação completamente nova para ele, e da qual tem pouca informação na internet, obrigando-o a pesquisar apenas utilizando as documentações das tecnologias utilizadas. 

Este repositório documenta os requisitos desta API para planejamento de viagens no universo de **[Rick and Morty](https://rickandmortyapi.com/)**. A API contém apenas um recurso (/travel-plans), que representa um plano de viagem.

O objetivo de Sérgio é implementar a API de acordo com as especificações fornecidas e torná-la funcional para que os usuários possam planejar suas viagens no mundo de **[Rick and Morty](https://rickandmortyapi.com/)**.

```json
{
  "id": 1,
  "travel_stops": [1, 2]
}
```

## Tecnologias

- [Docker](https://www.docker.com/)
- [Crystal Language](https://crystal-lang.org/)
- [Kemal Framework](https://github.com/kemalcr/kemal/)
- [Jennifer ORM](https://github.com/imdrasil/jennifer.cr/)
- [Rick and Morty API](https://rickandmortyapi.com/documentation/)

## Como executar

- Faça o download do [Docker](https://www.docker.com/) para rodar a aplicação
- Clone o repositório `git clone git@github.com:sergiovieirawebb/desafio-travels-booker.git`
- Entre na pasta `desafio-travels-booker` com o comando `cd desafio-travels-booker`
- E execute o comando `docker-compose up -d build` para iniciar a aplicação

Por fim, a aplicação estará disponível em `http://localhost:3000/travel_plans`

## Requisitos

### 1. Criação de um novo plano de viagem

- **Endpoint:** POST /travel-plans

- **Exemplo de uso:** POST /travel-plans
  - **Corpo da requisição (Content-Type: application/json):**
    ```json
    {
      "travel_stops": [1, 2]
    }
    ```
  - **Resposta de sucesso (Status: 201, Content-Type: application/json):**
    ```json
    {
      "id": 1,
      "travel_stops": [1, 2]
    }
    ```

### 2. Obtenção de todos os planos de viagem

- **Endpoint:** GET /travel-plans
- **Query Parameters (opcionais):**

  - optimize (boolean - falso por padrão): Quando verdadeiro, o array de travel_stops é ordenado de maneira a otimizar a viagem.
  - expand (boolean - falso por padrão): Quando verdadeiro, o campo de travel_stops é um array de entidades com informações detalhadas sobre cada parada.

- **Exemplo de uso:** GET /travel-plans
  - **Resposta de sucesso (Status: 200, Content-Type: application/json):**
    ```json
    [
      {
        "id": 1,
        "travel_stops": [1, 2]
      },
      {
        "id": 2,
        "travel_stops": [3, 7]
      }
    ]
    ```

- **Exemplo de uso:** GET /travel-plans?optimize=false&expand=true
  - **Resposta de sucesso (Status: 200, Content-Type: application/json):**
    ```json
    [
      {
        "id": 1,
        "travel_stops": [
          {
            "id": 1,
            "name": "Earth (C-137)",
            "type": "Planet",
            "dimension": "Dimension C-137"
          },
          {
            "id": 2,
            "name": "Abadango",
            "type": "Cluster",
            "dimension": "unknown"
          }
        ]
      },
      {
        "id": 2,
        "travel_stops": [
          {
            "id": 3,
            "name": "Citadel of Ricks",
            "type": "Space station",
            "dimension": "unknown"
          },
          {
            "id": 7,
            "name": "Immortality Field Resort",
            "type": "Resort",
            "dimension": "unknown"
          }
        ]
      }
    ]
    ```

### 3. Obtenção de um plano de viagem específico

- **Endpoint:** GET /travel-plans/{id}
- **Parâmetros:**

  - {id}: O identificador único do plano de viagem.

- **Query Parameters (opcionais):**

  - optimize (boolean - falso por padrão): Quando verdadeiro, o array de travel_stops é ordenado de maneira a otimizar a viagem.
  - expand (boolean - falso por padrão): Quando verdadeiro, o campo de travel_stops é um array de entidades com informações detalhadas sobre cada parada.

- **Exemplo de uso:** GET /travel-plans/1
  - **Resposta de sucesso (Status: 200, Content-Type: application/json):**
    ```json
    {
      "id": 1,
      "travel_stops": [1, 2, 3]
    }
    ```

- **Exemplo de uso:** GET /travel-plans/1?optimize=false&expand=true
  - **Resposta de sucesso (Status: 200, Content-Type: application/json):**
    ```json
    {
      "id": 1,
      "travel_stops": [
        {
          "id": 1,
          "name": "Earth (C-137)",
          "type": "Planet",
          "dimension": "Dimension C-137"
        },
        {
          "id": 2,
          "name": "Abadango",
          "type": "Cluster",
          "dimension": "unknown"
        }
      ]
    }
    ```

### 4. Atualização de um plano de viagem existente

- **Endpoint:** PUT /travel-plans/{id}

- **Parâmetros:**

  - {id}: O identificador único do plano de viagem.

- **Exemplo de uso:** PUT /travel-plans/1

  - **Corpo da requisição (Content-Type: application/json):**

    ```json
    {
      "travel_stops": [4, 5, 6]
    }
    ```

  - **Resposta de sucesso (Status: 200, Content-Type: application/json):**
    ```json
    {
      "id": 1,
      "travel_stops": [4, 5, 6]
    }
    ```

### 5. Exclusão de um plano de viagem existente

- **Endpoint:** DELETE /travel-plans/{id}

- **Parâmetros:**

  - {id}: O identificador único do plano de viagem.

- **Exemplo de uso:** DELETE /travel-plans/1
  - **Resposta de sucesso (Status: 204): Resposta sem corpo**

## Parâmetros Modificadores

Como dito anteriormente, os _query parameters_ `expand` e `optimize` podem ser utilizados para modificar as respostas da API. Ambos podem ser utilizados separadamente ou em conjunto. Esta sessão descreve em detalhes o comportamento de cada um.

### expand

Ao receber esse parâmetro, a API deve expandir as paradas de cada viagem de modo que o campo `travel_stops` deixe de ser um array de inteiros representando os IDs de cada localização e passe a ser um array de objetos da forma

```json
{
  "id": 1,
  "name": "Earth (C-137)",
  "type": "Planet",
  "dimension": "Dimension C-137"
}
```

populado com os dados da respectiva localização registrada na Rick and Morty API sob o dado ID.

### optimize

Ao receber esse parâmetro, a API deve retornar o array de `travel_stops` reordenado com o objetivo de minimizar o número de saltos interdimensionais e organizar as paradas de viagem passando das localizações menos populares para as mais populares. Para tanto, deve-se visitar todas as localizações de uma mesma dimensão antes de se pular para uma localização de outra dimensão.

Dentro de uma mesma dimensão, as localizações devem ser visitadas em ordem crescente de popularidade e, em caso de empate, em ordem alfabética do nome. A popularidade de uma localização é calculada somando a quantidade de episódios em que cada residente dessa localização apareceu.

Para definir a ordem de visita das dimensões, deve ser utilizada a popularidade média de suas localizações. Em caso de empate na popularidade média, ordenar as dimensões em ordem alfabética.

O campo `travel_stops` retornado deve continuar sendo um array de inteiros, ou — no caso do parâmetro `expand` ter sido utilizado conjuntamente — um array de localizações na forma expandida.

Ex: Para as seguintes paradas
```json
[
  {
    "id": "2",
    "name": "Abadango",
    "dimension": "unknown",
    "residents": [
      { "episode": [...1 item], ... }
    ]
  },
  {
    "id": "7",
    "name": "Immortality Field Resort",
    "dimension": "unknown",
    "residents": [
      { "episode": [...5 items], ... },
      { "episode": [...1 item], ... },
      { "episode": [...1 item], ... }
    ]
  },
  {
    "id": "9",
    "name": "Purge Planet",
    "dimension": "Replacement Dimension",
    "residents": [
      { "episode": [...1 item], ... },
      { "episode": [...1 item], ... },
      { "episode": [...1 item], ... },
      { "episode": [...1 item], ... }
    ]
  },
  {
    "id": "11",
    "name": "Bepis 9",
    "dimension": "unknown",
    "residents": [
      { "episode": [...4 items], ... }
    ]
  },
  {
    "id": "19",
    "name": "Gromflom Prime",
    "dimension": "Replacement Dimension",
    "residents": []
  }
]
```
A popularidade de cada localização é:
- Abadango (ID 2): 1
- Immortality Field Resort (ID 7): 7
- Purge Planet (ID 9): 4
- Bepis 9 (ID 11): 4
- Gromflom Prime (ID 19): 0

E a de cada dimensão é:
- unknown: 4.0
- Replacement Dimension: 2.0

Portanto o resultado esperado para uma query com `optimize` e sem `expand` é:
```json
{
  "id": id do travel plan,
  "travel_stops":[19,9,2,11,7]
}
```

**Dica**: as informações necessárias para otimizar e/ou expandir as localizações de um plano de viagens podem ser recuperadas com uma única query _graphql_.

### Funcionalidades adicionais

- Implementar um endpoint que retorne imagens de cada localização (Dica: as imagens podem ser obtidas realizando *webscrapping* na [wiki do show](https://rickandmorty.fandom.com/wiki/Rickipedia));
- Implementar um endpoint /travel-plans/{id}/append que adiciona novas paradas à lista já existente;
- Implementar um front-end simples para a aplicação.

#

[Sérgio Vieira](https://www.linkedin.com/in/sergiovieirawebb/), formado em Desenvolvimento Web Full-Stack pela [Trybe](https://www.betrybe.com/)... :rocket:

