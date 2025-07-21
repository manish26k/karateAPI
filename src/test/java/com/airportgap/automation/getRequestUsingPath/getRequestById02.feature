Feature: Get Airport by ID using path variable

  Scenario: Get airport data for valid ID

    * def path = karate.get('endpoints.airportById')
    * def id = karate.get('defaultId')
    * def status = 200
    * def schemaPath = 'classpath:com/airportgap/automation/getRequestUsingPath/schemas/airport-schema.json'

    * call read('classpath:com/airportgap/automation/getRequestUsingPath/common/generic-get01.feature')
