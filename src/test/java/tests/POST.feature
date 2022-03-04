Feature: Post API Demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def exepectedOutput = read("response1.json")

  #POST simple Demo
  Scenario: Post Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name":"Luis", "job":"leader"}
    When method POST
    Then status 201
    And print response

  #POST scemario background
  Scenario: Post Demo 2
    Given path '/users'
    And request {"name":"Luis Angel", "job":"leader"}
    When method POST
    Then status 201
    And print response

  #POST with response assertions
  Scenario: Post Demo 3
    Given path '/users'
    And request {"name":"Luis Angel", "job":"leader"}
    When method POST
    Then status 201
    And match response == {"createdAt": "#ignore","name": "Luis Angel","id": "#string","job": "leader"}
    And print response

  #POST with external request
  Scenario: Post Demo 3
    Given path '/users'
    And request {"name":"Luis Angel", "job":"leader"}
    When method POST
    Then status 201
    And match response == exepectedOutput
    And print response
