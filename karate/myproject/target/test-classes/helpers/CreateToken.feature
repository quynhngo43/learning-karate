Feature: Create token
  Scenario: Create token
    Given url 'https://api.realworld.io/api'
    Given path 'users/login'
    And request {"user": {"email": "diemquynh@gmail.com", "password": "12345678"}}
    When method Post
    Then status 200
    * def authToken = response.user.token
