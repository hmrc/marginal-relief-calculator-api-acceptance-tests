Feature: MarginalReliefCalculator

  @runME
  Scenario:  MR-68 Basic MR calculation for single financial year with MR rate
    When a request is made to GET response from MRC service
      | accountingPeriodStart | accountingPeriodEnd | profit |
      | 2023-04-01            | 2024-03-31          | 60000  |
    Then the MRC response code should be 200
    And the MRC service wilL return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 15000.0                | 20.25            | 2850.0         | 12150.0        |

  Scenario: Unable to retrieve hello world response from MRC Service
    When a request is made to an invalid MRC endpoint
    Then the MRC response code should be 404

