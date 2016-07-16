Feature: User creation
  As a human
  I want to play battlepets
  So I can relax

  Scenario: User creates new battlebots user when none with same username exists
    Given no user exists with username "ronswanson"
    When I create a user with username "ronswanson"
    Then the request returns a successful response

  Scenario: User creates new battlebots user when one with same username exists
    Given a user exists with username "christraeger"
    When I create a user with username "christraeger"
    Then the request returns an already exists response
