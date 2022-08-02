Feature: Complex MR calculation-FutureYear

  Scenario:MR-61_AC4 - 2 FAC - FED - SPANS MR RATES AND FUTURE NO RATES +  PROFITS & AUGMENTED WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 50000,exemptDistributions as 10000,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 9417.81                | 7534.25               | 24.0    | 2025 | 75342.47               | 376.71         | 12557.08               | 9041.1         | 37671.23       |

  Scenario:MR-61_AC5 - 1 FAC - FED - SPANS MR RATES AND FUTURE NO RATES +  PROFITS WITHIN & AUGMENTED ABOVE  MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 100000,exemptDistributions as 50000,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 18835.62               | 37671.23              | 25.0    | 2025 | 113013.7               | 0.0            | 18835.62               | 18835.62       | 75342.47       |

  Scenario:MR-61_AC6 - 4 FAC - FED - SPANS MR RATES AND FUTURE NO RATES +  PROFITS WITHIN & AUGMENTED EQUAL TO MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 50000,exemptDistributions as 50000,associatedCompanies as 4
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 9417.81                | 37671.23              | 25.0    | 2025 | 45205.48               | 0.0            | 7534.25                | 9417.81        | 37671.23       |

  Scenario:MR-61_AC7 - 3 FAC - FED - SPANS LEAP YEAR FUTURE RATES +  PROFITS & AUGMENTED WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2024-02-01,accountingPeriodEnd as 2025-01-31, profit as 15000,exemptDistributions as 25000,associatedCompanies as 3
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 3135.25                | 20901.64              | 23.68   | 2024 | 62876.71               | 165.57         | 10479.45               | 2969.68        | 12540.98       |

  Scenario:MR-61_AC8 - 1 FAC - FED - SPANS LEAP YEAR FUTURE RATES +  PROFITS BELOW & AUGMENTED ABOVE MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 20000,exemptDistributions as 110000,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 3767.12                | 82876.71              | 24.77   | 2025 | 113013.7               | 34.77          | 18835.62               | 3732.35        | 15068.49       |

  Scenario:MR-61_AC9 - 2 FAC - FED - COMPLETE YEAR FUTURE RATES +  PROFITS & AUGMENTED WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2024-04-01,accountingPeriodEnd as 2025-03-31, profit as 50000,exemptDistributions as 10000,associatedCompanies as 2
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 12500.0                | 10000.0               | 24.0    | 2024 | 100000.0               | 500.0          | 16666.67               | 12000.0        | 50000.0        |

  Scenario:MR-61_AC10 - 1 FAC - FED - PARTIAL YEAR FUTURE RATES +  PROFITS BELOW & AUGMENTED ABOVE MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2024-06-01,accountingPeriodEnd as 2025-03-31, profit as 20000,exemptDistributions as 100000,associatedCompanies as 1
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 5000.0                 | 100000.0               | 24.94   | 2024 | 124931.51              | 12.33          | 20821.92               | 4987.67        | 20000.0        |

  Scenario:MR-55_AC3 - 1 FAC - SPANS FUTURE NO RATES AND FUTURE NO RATES +  PROFITS WITHIN MR THRESHOLDS (M5)
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 50000,exemptDistributions as 0,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 9417.81                | 0.0                   | 22.0    | 2025 | 113013.7               | 1130.14        | 18835.62               | 8287.67        | 37671.23       |

  Scenario:MR-55_AC4 - 2 FAC - SPANS FUTURE NO RATES AND FUTURE NO RATES +  PROFITS EQUAL TO LOWER MR THRESHOLDS (R5)
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 16666.67,exemptDistributions as 0,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 3139.27                | 0.0                   | 17.5    | 2025 | 75342.47               | 941.78         | 12557.08               | 2197.49        | 12557.08       |

  Scenario:MR-55_AC5 - 3 FAC - 1 COMPLETE FUTURE LEAP YEAR WITH NO RATES +  PROFITS WITHIN MR THRESHOLDS (C46)
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2027-04-01,accountingPeriodEnd as 2028-03-31, profit as 50000,exemptDistributions as 0,associatedCompanies as 3
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 12500.0                | 0.0                   | 24.25   | 2027 | 75000.0                | 375.0          | 12500.0                | 12125.0        | 50000.0        |

  Scenario:MR-55_AC6 - 4 FAC - 1 COMPLETE FUTURE LEAP YEAR WITH NO RATES +  PROFITS ABOVE MR THRESHOLDS (E46)
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2027-04-01,accountingPeriodEnd as 2028-03-31, profit as 55000,exemptDistributions as 0,associatedCompanies as 4
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 13750.0                | 0.0                   | 24.86   | 2027 | 60000.0                | 75.0           | 10000.0                | 13675.0        | 55000.0        |

  Scenario:MR-57_AC3 - FED - SPANS FUTURE NO RATES  AND FUTURE NO RATES +  PROFITS WITHIN MR THRESHOLDS (M5)
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 100000,exemptDistributions as 10000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 18835.62               | 7534.25               | 22.41   | 2025 | 226027.4               | 1952.05        | 37671.23               | 16883.56       | 75342.47       |

  Scenario:MR-57_AC4 - FED - SPANS FUTURE NO RATES  AND FUTURE NO RATES +  PROFITS EQUAL TO LOWER MR THRESHOLDS (R5)
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 40000,exemptDistributions as 10000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 19.0            | 5726.03                | 7534.25               | 19.0    | 2025 | 226027.4               | 0.0            | 37671.23               | 5726.03        | 30136.99       |