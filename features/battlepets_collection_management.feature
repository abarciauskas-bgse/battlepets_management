Feature: Pet Collection management
  As a battlepets user
  I want to create and delete pets in my collection

  Background:
    Given a user exists with username "aprilludgate"
    And "aprilludgate" has a collection of pets "totoro" and "catbus"
    And I am "aprilludgate"

  Scenario: Existing user creates a new pet
    When I create a pet "luna"
    Then the request returns a successful response

  Scenario: Existing user attempts to create an existing pet
    When I create a pet "totoro"
    Then the request returns an already exists response

  Scenario: Existing user deletes a pet
    When I delete "catbus"
    Then the request returns a successful response

  Scenario: Existing user lists their pets
    When I list my pets
    Then I see all my pets

  Scenario: Non-existing user attempts to list their pets
    Given I am "jerrygergich"
    When I list my pets
    Then I see a not found response

  Scenario: Non-existing user attempts to create a pet
    Given I am "jerrygergich"
    When I create a pet "totoro"
    Then I see a not found response

  Scenario: Non-existing user attempts to delete a pet
    Given I am "jerrygergich"
    When I delete "catbus"
    Then I see a not found response
