#@debug
Feature: Article
  Background: Define URL
    Given url 'https://api.realworld.io/api'
    Given path 'users/login'
    And request {"user": {"email": "diemquynh@gmail.com", "password": "12345678"}}
    When method Post
    Then status 200
    * def token = response.user.token

  Scenario: Create a new article
    Given path 'articles'
    And header Authorization = 'Token' + token
    And request {"article": {"tagList": [], "title": "my_articles001", "description": "description for my_articles001", "body": "body for my_articles001"}}
    When method Post
    Then status 200
    And match response.article.title == 'my_articles001'

  Scenario: Create and delete an article
    Given path 'articles'
    And header Authorization = 'Token' + token
    And request {"article": {"tagList": [], "title": "Deleted_article", "description": "description for my_articles001", "body": "body for my_articles001"}}
    When method Post
    Then status 200
    And match response.article.title == 'my_articles001'
    * def articleId  = response.article.slug
    #get
    Given path 'articles'
    Given param limit = 10
    Given param offset = 0
    When method Get
    Then status 200
    And match response.articles[0].title == 'Deleted_article'

    Given path 'articles', articleId
    Given header Authorization = 'Token' + token
    When method Delete
    Then status 204


