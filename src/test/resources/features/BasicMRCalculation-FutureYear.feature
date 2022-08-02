Feature: Future MR calculation

  Scenario:MR-63_AC5 - SPANS 2 MR YEARS + NO CONFIG FOR NAP 1 & NAP 2 + PROFITS IS WITHIN THE LOWER & UPPER MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 100000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 18835.62               | 0.0                   | 22.0    | 2025 | 226027.4               | 2260.27        | 37671.23               | 16575.34       | 75342.47       |

  Scenario:MR-63_AC6 - SPANS 2 MR YEARS + NO CONFIG FOR NAP 1 & NAP 2 + PROFITS IS LOWER THE LOWER & UPPER MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 40000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 19.0            | 5726.03                | 0.0                   | 19.0    | 2025 | 226027.4               | 0.0            | 37671.23               | 5726.03        | 30136.99       |


  Scenario:MR-63_AC7 - SPANS 2 MR YEARS + NO CONFIG FOR NAP 1 & NAP 2 + PROFITS IS ABOVE THE UPPER MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 265000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 49914.38               | 0.0                   | 24.8    | 2025 | 226027.4               | 395.55         | 37671.23               | 49518.84       | 199657.53      |
