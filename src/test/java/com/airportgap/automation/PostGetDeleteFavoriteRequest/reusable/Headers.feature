Feature: Authorization header for multiple APIs

Scenario: Set standard auth headers
  * def tokenVars = call read('reusable/Token.feature')
  * def bearerToken = 'Bearer ' + tokenVars.token
  * def authHeaders =
  """
  {
    Authorization: '#(bearerToken)',
    Content-Type: 'application/x-www-form-urlencoded'
  }
  """
  * configure headers = authHeaders
