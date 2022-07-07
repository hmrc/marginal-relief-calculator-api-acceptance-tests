Feature: Future MR calculation

  Scenario:MR-63_AC5 - SPANS 2 MR YEARS + NO CONFIG FOR NAP 1 & NAP 2 + PROFITS IS WITHIN THE LOWER & UPPER MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 100000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 6164.38                | 22.0             | 739.73         | 5424.66        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 18835.62               | 22.0             | 2260.27        | 16575.34       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 25.0                     | 22.0             |

  Scenario:MR-63_AC6 - SPANS 2 MR YEARS + NO CONFIG FOR NAP 1 & NAP 2 + PROFITS IS LOWER THE LOWER & UPPER MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 40000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 1873.97                | 19.0             | 0.0            | 1873.97        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 5726.03                | 19.0             | 0.0            | 5726.03        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 19.0                     | 19.0             |

  Scenario:MR-63_AC7 - SPANS 2 MR YEARS + NO CONFIG FOR NAP 1 & NAP 2 + PROFITS IS ABOVE THE UPPER MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 265000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 16335.62               | 24.8             | 129.45         | 16206.16       |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 49914.38               | 24.8             | 395.55         | 49518.84       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 25.0                     | 24.8             |
