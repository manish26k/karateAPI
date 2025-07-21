Feature: Generic GET request using path variable

  Scenario: GET API with path variable, status, header and schema validation

    * url args.baseUrl
    * path args.path, args.id
    * method get
    * def expectedStatus =  (args.status ? args.status : 200)
    * match responseStatus == expectedStatus
    * match header Content-Type contains 'application/json'
    * def schema = karate.read('classpath:com/airportgap/automation/getRequestUsingPath/schemas/airport-schema.json')
    * match response == schema


