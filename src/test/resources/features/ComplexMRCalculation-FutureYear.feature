Feature: Complex MR calculation-FutureYear

  Scenario:MR-61_AC4 - 2 FAC - FED - SPANS MR RATES AND FUTURE NO RATES +  PROFITS & AUGMENTED WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 50000,exemptDistributions as 10000,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 3082.19                | 24.0             | 123.29         | 2958.90        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 9417.81                | 24.0             | 376.71         | 9041.10        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 25.0                     | 24.0             |