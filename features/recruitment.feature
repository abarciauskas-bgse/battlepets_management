Feature: Battlepet recruitment and attributes
  User submits some set of attributes to the BattlePets API,
  the server manifests a creature and responds with an appropriate payload.

  Scenario: Create pet with default attributes
    Given I create a new battlepet with no detailed attributes
    Then the battlepet should have the default attributes

  Scenario: Create a pet with custom attributes
    Given I create a battlepet to be very agile and witty
    Then it will be weak and have weak senses
