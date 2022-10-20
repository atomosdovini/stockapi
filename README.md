# StockAPi, from CSV

CSV com ações estão em 'db/stocks', checar initializer 'config/initializers/stocks_seed.rb'.

Dois modelos na DB:
    * Modelo Price
    * Modelo Ticket

* Configuration
Run:
    docker compose run web rake db:create
    docker compose build
    docker compose up

* Teste filtro Por Ação e Data
    docker compose run web bundle exec rspec ./spec/requests/prices_spec.rb

* API methods:

    -Filtrar Preço por Ação e Data
        Method: POST
        url: localhost:3000/prices/ticket
        json content:{
        "ticket_name": "MGLU3.SA",
        "date":"2011-05-02"
        }

    -Get nas ações
        Method: GET
        url: 'localhost:3000/tickets'

    -Deletar price
        Method: DELETE
        url:'localhost:3000/prices/:id'

    -Deletar ticket(deleta os valore na tabela price relacionados a esse ticket)
        Method: DELETE
        url:'localhost:3000/ticket/:id'