Feature: Returns the favorite airport from your Airport Gap account specified by the ID

Background:
    * url baseUrl
    * def pathVars = call read('reusable/PathVariables.feature') { id: 36843 }
    * def tokenVars = call read('reusable/Token.feature')
    * header Authorization = 'Bearer ' + tokenVars.token
    * def expectedStatus = karate.get('statusCodes.success')

    # Debug prints
    * print 'Airport Gap Url:', baseUrl
    * print 'Path Variables:', pathVars
    * print 'Token:', tokenVars.token
    * print 'Expected Status:', expectedStatus
    * def GetFavoriteUrl = baseUrl + '/' + endpoints.addFavorite + '/' + pathVars.id
    * print 'Full URL:', GetFavoriteUrl

Scenario: Get Airport Using Favorite id
    Given path endpoints.addFavorite, pathVars.id
    When method GET
    Then match responseStatus == expectedStatus
    * print response

    # Extract and print the favorite ID
    * def favoriteId = response.data.id
    * print 'Extracted Favorite ID:', favoriteId

    # save favorite id
    * call read('classpath:com/airportgap/automation/getFavorityById/reusable/SetFavoriteId.feature'){ favoriteId: '#(favoriteId)'}

