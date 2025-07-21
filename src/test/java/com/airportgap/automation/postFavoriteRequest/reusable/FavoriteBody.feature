Feature: Reusable POST body for favorite

Scenario: Set default favorite airport body
  * def favoriteBody = karate.get('defaultFavoriteBody')
