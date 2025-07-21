Feature: Generic GET request using path variable

  Scenario: Send GET API with Path

    * def baseUrl = karate.get('baseUrl')
    * def path = karate.get('endpoints.airportById')
    * def id = karate.get('defaultId')
    * def expectedStatus = karate.get('statusCodes.success')
    * def schemaPath = 'classpath:com/airportgap/automation/getRequestUsingPath/schemas/airport-schema.json'

    * print 'DEBUG >>> URL:', baseUrl + '/' + path + '/' + id
    * def airportgapURL = baseUrl + '/' + path + '/' + id

    Given url airportgapURL
    When method get
    Then match responseStatus == expectedStatus
    And match response == read(schemaPath)

    


 