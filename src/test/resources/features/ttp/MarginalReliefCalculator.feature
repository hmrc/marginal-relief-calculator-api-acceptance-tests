Feature: MarginalReliefCalculator

Feature: Marginal Relief Calculator Hello World test

  Scenario: Retrieve hello world response from MRC Service
    When a request is made to get response from MRC service hello world endpoint
    Then the MRC response code should be 200
    And the MRC hello world response body should be Hello world

  Scenario: Unable to retrieve hello world response from MRC Service
    When a request is made to an invalid MRC endpoint
    Then the MRC response code should be 404

