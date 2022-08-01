Feature: Basic MR calculation

  Scenario:MR-68_AC1 _1 COMPLETE YEAR + PROFITS LIES WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 100000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 25000.0                | 0.0                   | 22.75   | 2023 | 250000.0               | 2250.0         | 50000.0                | 22750.0        | 100000.0       |

  Scenario:MR-68_AC2_FALLS WITHIN 1 MR YEAR + PROFITS WITH WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-02-01, profit as 100000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 25000.0                | 0.0                   | 23.35   | 2023 | 210273.97              | 1654.11        | 42054.79               | 23345.89       | 100000.0       |

  Scenario:MR-68_AC3-FALLS WITHIN 1 ** MR YEAR INCLUDES 29/02/2024 (Leap Year) for Yr 23 + PROFITS WITH WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-01, profit as 100000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 25000.0                | 0.0                   | 23.05   | 2023 | 230136.99              | 1952.05        | 46027.4                | 23047.95       | 100000.0       |

  Scenario:MR-68_AC4_FALLS WITHIN 1 ** MR YEAR INCLUDES 29/02/2024 (Leap Year) for Yr 23 + PROFITS LESS THAN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-01, profit as 40000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 19.0            | 7600.0                 | 0.0                   | 19.0    | 2023 | 230136.99              | 0.0            | 46027.4                | 7600.0         | 40000.0        |

  Scenario:  MR-70 AC1 - SPANS FLAT AND MR RATES +  PROFITS WITH WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2022-06-01,accountingPeriodEnd as 2023-05-31, profit as 60000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 9494.79        | 19.0    | 49972.6        |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 2506.85                | 0.0                   | 20.25   | 2023 | 41780.82               | 476.3          | 8356.16                | 2030.55        | 10027.4        |

  Scenario:  MR-70 AC2 - SPANS FLAT AND MR RATES +  PROFITS LESS THAN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2022-06-01,accountingPeriodEnd as 2023-05-31, profit as 40000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 6329.86        | 19.0    | 33315.07       |
    And for the FY2 the MRC service will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 19.0            | 1270.14                | 0.0                   | 19.0    | 2023 | 41780.82               | 0.0            | 8356.16                | 1270.14        | 6684.93        |

  Scenario:  MR-70 AC3 - SPANS FLAT AND MR RATES +  PROFITS GREATER THAN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2022-06-01,accountingPeriodEnd as 2023-05-31, profit as 300000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 47473.97       | 19.0    | 249863.01      |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 12534.25               | 0.0                   | 25.0    | 2023 | 41780.82               | 0.0            | 8356.16                | 12534.25       | 50136.99       |

  Scenario:  MR-70 AC3 - SPANS FLAT AND MR RATES +  PROFITS GREATER THAN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2022-06-01,accountingPeriodEnd as 2023-05-31, profit as 250000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 39561.64       | 19.0    | 208219.18      |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 10445.21               | 0.0                   | 25.0    | 2023 | 41780.82               | 0.0            | 8356.16                | 10445.21       | 41780.82       |

  Scenario: Unable to retrieve MRC Service
    When a request is made to GET response from MRC service for /calculatee with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-01, profit as 400000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 404