Feature: MarginalReliefCalculator

  Scenario:  MR-68 Basic MR calculation for single financial year with MR rate-Single year
    When a request is made to GET response from MRC service
    Then the MRC response code should be 200
    And for the FY1 the MRC service wilL return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 15000.0                | 20.25            | 2850.0         | 12150.0        |

  Scenario:  MR-70 Basic MR calculation for single financial year with MR rate-dual year
    When a request is made to GET response from MRC service
    Then the MRC response code should be 200
    And for the FY1 the MRC service wilL return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 15000.0                | 20.25            | 2850.0         | 12150.0        |
    And for the FY2 the MRC service wilL return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 15000.0                | 20.25            | 2850.0         | 12150.0        |

  Scenario: Unable to retrieve hello world response from MRC Service
    When a request is made to an invalid MRC endpoint
    Then the MRC response code should be 404

