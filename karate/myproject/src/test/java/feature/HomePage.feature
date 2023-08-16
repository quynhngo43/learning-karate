@debug
Feature: Test for the home page
  Background: precondition
    Given  url 'https://api.realworld.io/api'

  Scenario: Get all tags
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains ["welcome", "implementations"]
    And match response.tags !contains 'coding'
    And match response.tags == '#array'
    Andmatch each response.tags == '#string'

  Scenario: Get all articles
    Given path 'articles'
    Given param limit = 10
    Given param offset = 0
    When method Get
    Then status 200
    And match response.articles == '#[2]'



