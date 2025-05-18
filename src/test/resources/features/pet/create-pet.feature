@functional
  Feature: Crear una nueva mascota en Petstore

    Background:
      * url 'https://petstore.swagger.io/v2'
      * def randomId = Math.floor(Math.random() * 1000000)
      * def randomName = 'Pet-' + randomId

      * print "hola1", randomId
      * print "hola2", randomName

    Scenario: Crear una mascota con datos dinamicos

      Given path 'pet'
      And request
      """
      {
        "id": #(randomId),
        "name": "#(randomName)",
        "photoUrls": ["https://ejemplo.com/foto.jpeg"],
        "status": "available"
      }
      """

      When method POST
      Then status 200
      #Validaciones clave
      * match response.id == randomId
      * match response.name == randomName
      * match response.status == 'available'

