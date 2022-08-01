@wip
Feature: Future MR calculation

  Scenario:MR-63_AC5 - SPANS 2 MR YEARS + NO CONFIG FOR NAP 1 & NAP 2 + PROFITS IS WITHIN THE LOWER & UPPER MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 100000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 6164.38                | 0.0                   | 22.6    | 2024 | 73972.6                | 591.78         | 12328.77               | 15572.6        | 24657.53       |
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2025 | 14315.07       | 19.0    | 75342.47       |

  Scenario:MR-63_AC6 - SPANS 2 MR YEARS + NO CONFIG FOR NAP 1 & NAP 2 + PROFITS IS LOWER THE LOWER & UPPER MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 40000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 19.0            | 1873.97                | 19.0                  | 25.0    | 2024 | 73972.6                | 0.0            | 12328.77               | 1873.97        | 9863.0         |
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2025 | 5726.03        | 19.0    | 30136.99       |

  Scenario:MR-63_AC7 - SPANS 2 MR YEARS + NO CONFIG FOR NAP 1 & NAP 2 + PROFITS IS ABOVE THE UPPER MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 265000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 16335.62               | 0.0                   | 24.84   | 2024 | 73972.6                | 103.56         | 12328.77               | 16232.05       | 65342.47       |
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2025 | 37934.93       | 19.0    | 199657.53      |
