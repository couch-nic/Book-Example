# Books API

This are the docs for the books API, all the resources and how to use it.

# Group Books


## Books [/books]
### Resource for Book
Here we will have all the endpoints for the book resource

### Get books [GET /books]


+ Request returns a success response
**GET**&nbsp;&nbsp;`/books`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 81,
                "title": "Christine",
                "plot": "Christine plot goes here"
              }
            ]

### Get a book [GET /books/{id}]

+ Parameters
    + id: `82` (number, required)

+ Request returns a success response
**GET**&nbsp;&nbsp;`/books/82`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 82,
              "title": "Christine",
              "plot": "Christine plot goes here"
            }

### Create a book [POST /books]


+ Request creates a new Book
**POST**&nbsp;&nbsp;`/books`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            book%5Bplot%5D=Christine+plot+goes+here&book%5Brelease_date%5D=1983-04-29&book%5Btitle%5D=Christine

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 83,
              "title": "Christine",
              "plot": "Christine plot goes here"
            }

+ Request renders a JSON response with the new book
**POST**&nbsp;&nbsp;`/books`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            book%5Bplot%5D=Christine+plot+goes+here&book%5Brelease_date%5D=1983-04-29&book%5Btitle%5D=Christine

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 84,
              "title": "Christine",
              "plot": "Christine plot goes here"
            }

+ Request renders a JSON response with errors for the new book
**POST**&nbsp;&nbsp;`/books`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            book%5Bauthor%5D=&book%5Bplot%5D=&book%5Brelease_date%5D=&book%5Btitle%5D=

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "title": [
                "can't be blank"
              ],
              "plot": [
                "can't be blank"
              ]
            }

### Update a book [PUT /books/{id}]

+ Parameters
    + id: `85` (number, required)

+ Request updates the requested book
**PUT**&nbsp;&nbsp;`/books/85`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            book%5Bplot%5D=Shining+plot+goes+here&book%5Brelease_date%5D=1977-01-28&book%5Btitle%5D=The+Shining

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 85,
              "title": "The Shining",
              "plot": "Shining plot goes here"
            }

+ Request renders a JSON response with the book
**PUT**&nbsp;&nbsp;`/books/86`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            book%5Bplot%5D=Christine+plot+goes+here&book%5Brelease_date%5D=1983-04-29&book%5Btitle%5D=Christine

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 86,
              "title": "Christine",
              "plot": "Christine plot goes here"
            }

+ Request renders a JSON response with errors for the book
**PUT**&nbsp;&nbsp;`/books/87`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            book%5Bauthor%5D=&book%5Bplot%5D=&book%5Brelease_date%5D=&book%5Btitle%5D=

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "title": [
                "can't be blank"
              ],
              "plot": [
                "can't be blank"
              ]
            }

### Delete a book [DELETE /books/{id}]

+ Parameters
    + id: `88` (number, required)

+ Request destroys the requested book
**DELETE**&nbsp;&nbsp;`/books/88`

    + Headers

            Content-Type: application/x-www-form-urlencoded

+ Response 204
