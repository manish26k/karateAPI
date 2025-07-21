Feature: Reusable Path Variable

Scenario: set airport ID  from config or input
    * def id = karate.get('id', karate.get('defaultPathParams.id'))