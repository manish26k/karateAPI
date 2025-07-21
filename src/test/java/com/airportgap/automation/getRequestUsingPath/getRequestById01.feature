Feature: Get Airport by ID using path variable

  Scenario: Get airport data for valid ID

    * def args = {}
    * args.baseUrl = 'https://airportgap.com/api/'
    * args.path = 'airports'
    * args.id = 'KIX'
    * args.status = 200
    * args.schemaPath = 'classpath:com/airportgap/automation/getRequestUsingPath/schemas/airport-schema.json'

    * call read('classpath:com/airportgap/automation/getRequestUsingPath/common/generic-get.feature') args
