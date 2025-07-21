Feature: Add airport to favorites

Background:
  * url baseUrl
  * def tokenVars = call read('reusable/Token.feature')
  * def bodyVars = call read('reusable/FavoriteBody.feature')
  * header Authorization = 'Bearer ' + tokenVars.token
  * header Content-Type = 'application/x-www-form-urlencoded'
  * def expectedStatus = karate.get('statusCodes.created')


Scenario: Add JFK airport to favorites
  Given path endpoints.addFavorite
  And form fields bodyVars.favoriteBody
  When method POST
  Then match responseStatus == expectedStatus  
  * print response
