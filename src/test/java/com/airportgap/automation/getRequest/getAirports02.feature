Feature: Get Airports List

  Scenario: Verify the list of airports

    Given url 'https://airportgap.com/api/airports'
    When method GET
    Then status 200
    And print response
