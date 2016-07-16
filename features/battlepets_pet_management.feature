Feature: Pet management
  As a battlepets user
  I want to manage each pet

  Background:
    Given a user exists with username "aprilludgate"
    And "aprilludgate" has a collection of pets "totoro" and "catbus"

  Scenario: Existing user details a pet in their collection
    When I request to see "totoro"

  Scenario: Existing user details a pet not in their collection
