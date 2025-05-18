@functional
Feature: Obtener una mascota por ID desde Swagger Petstore

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: Consultar una mascota existente por ID
    Given path 'pet', 1
    When method GET
    Then status 200
    #Validación de campos
    * print "El valor de status es ===> ", response.status
    * match response.id == 1
    * match response.name != null
    #* match response.status in ['available', 'pending', 'solid']
    * match ['available', 'pending', 'sold'] contains response.status