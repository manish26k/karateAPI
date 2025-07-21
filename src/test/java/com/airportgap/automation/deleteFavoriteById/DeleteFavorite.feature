Feature: Delete favorite airport using stored favoriteId

Background:
    * url baseUrl
    * def tokenVars = call read('reusable/Token.feature')
    * header Authorization = 'Bearer ' + tokenVars.token
    * def expectedStatus = karate.get('statusCodes.noContent')

    # Debug prints
    * print 'Airport Gap Url:', baseUrl
    * print 'Token:', tokenVars.token
    * print 'Expected Status:', expectedStatus
    

    # Load the favoriteId from saved locations
    * def favData = call read('reusable/LoadFavoriteId.feature')
    * def favoriteId = favData.favoriteId
    * print 'FavoriteId to delete:', favoriteId

    * def GetFavoriteUrl = baseUrl + '/' + endpoints.addFavorite + '/' + favoriteId
    * print 'Full URL:', GetFavoriteUrl

Scenario:Delete airport using favoriteId
    Given path endpoints.addFavorite, favoriteId
    When method DELETE
    Then match responseStatus == expectedStatus
    * print response

