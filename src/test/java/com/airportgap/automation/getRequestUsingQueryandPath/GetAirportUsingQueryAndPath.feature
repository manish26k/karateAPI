Feature: Get Airport by ID with query parameters

Background:
    * url baseUrl
    * def pathVars = call read('reusable/PathVariables.feature') {id: 'GKA'}
    * def queryVars = call read('reusable/QueryParameters.feature') { latitude: '-6.08169', longitude: '145.391998' }
    * def expectedStatus = karate.get('statusCodes.success')

Scenario: Get airport info using path and query params
  Given path endpoints.airportById, pathVars.id
  And param latitude = queryVars.latitude
  And param longitude = queryVars.longitude
  When method GET
  Then match responseStatus == expectedStatus
  * print response

 