Feature: Reusbale Query paramters

Scenario: Set latitude and longitude
    * def latitude = karate.get('latitude', karate.get('defaultQueryParams.latitude'))
    * def longitude = karate.get('longitude', karate.get('defaultQueryParams.longitude'))
