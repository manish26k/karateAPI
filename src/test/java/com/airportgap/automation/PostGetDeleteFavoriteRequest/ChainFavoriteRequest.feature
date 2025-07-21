Feature: Chained test to POST → GET → DELETE → Confirm 404

Background:
  * url baseUrl
  # Set headers once for entire scenario
  * call read('reusable/Headers.feature')
  * def bodyVars = call read('reusable/FavoriteBody.feature')
  * def endpoints = karate.get('endpoints')
  * def status = karate.get('statusCodes')

  

  # Debug prints
  * print '=== BASE URL ===', baseUrl
  * print '=== Token ===', tokenVars.token
  * print '=== Favorite Body ===', bodyVars.favoriteBody

Scenario: Create favorite → GET → DELETE → Confirm deletion (404)

    # STEP 1: POST - create a new favorite
    * print '\n--- Step 1: Create Favorite ---'
    Given path endpoints.addFavorite
    And form fields bodyVars.favoriteBody
    * print 'Request Body:', bodyVars.favoriteBody
    When method POST
    * match responseStatus == status.created
    * def favoriteId = response.data.id
    * print 'Created Favorite ID:', favoriteId

    # STEP 2: GET - retrieve favorite using ID
    * print '\n--- Step 2: Get Favorite by ID ---'
    Given path endpoints.addFavorite, favoriteId
    * print 'GET URL:', baseUrl + '/' + endpoints.addFavorite + '/' + favoriteId
    When method GET
    * match responseStatus == status.success
    * print 'GET Response:', response
    * match response.data.id == favoriteId

    # STEP 3: DELETE - delete the favorite
    * print '\n--- Step 3: Delete Favorite ---'
    Given path endpoints.addFavorite,favoriteId
     * print 'DELETE URL:', baseUrl + '/' + endpoints.addFavorite + '/' + favoriteId
    When method DELETE
    * match responseStatus == status.noContent
    * print 'Deleted Favorite ID:', favoriteId

    # STEP 4: GET again - should return 404 (not found)
    * print '\n--- Step 4: Confirm Deletion with GET ---'
    Given path endpoints.addFavorite, favoriteId
    * print 'GET (After DELETE) URL:', baseUrl + '/' + endpoints.addFavorite + '/' + favoriteId
    When method GET
    * match responseStatus == status.notFound
    * print 'GET After Delete Response:', response
    

