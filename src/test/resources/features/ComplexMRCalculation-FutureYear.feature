Feature: Complex MR calculation-FutureYear

  Scenario:MR-61_AC4 - 2 FAC - FED - SPANS MR RATES AND FUTURE NO RATES +  PROFITS & AUGMENTED WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 50000,exemptDistributions as 10000,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 3082.19                | 24.0             | 123.29         | 2958.9         |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 9417.81                | 24.0             | 376.71         | 9041.1         |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 25.0                     | 24.0             |

  Scenario:MR-61_AC5 - 1 FAC - FED - SPANS MR RATES AND FUTURE NO RATES +  PROFITS WITHIN & AUGMENTED ABOVE  MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 100000,exemptDistributions as 50000,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 6164.38                | 25.0             | 0.0            | 6164.38        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 18835.62               | 25.0             | 0.0            | 18835.62       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 25.0                     | 25.0             |

  Scenario:MR-61_AC6 - 4 FAC - FED - SPANS MR RATES AND FUTURE NO RATES +  PROFITS WITHIN & AUGMENTED EQUAL TO MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 50000,exemptDistributions as 50000,associatedCompanies as 4
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 3082.19                | 25.0             | 0.0            | 3082.19        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 9417.81                | 25.0             | 0.0            | 9417.81        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 25.0                     | 25.0             |

  Scenario:MR-61_AC7 - 3 FAC - FED - SPANS LEAP YEAR FUTURE RATES +  PROFITS & AUGMENTED WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2024-02-01,accountingPeriodEnd as 2025-01-31, profit as 15000,exemptDistributions as 25000,associatedCompanies as 3
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 614.75                 | 24.16            | 20.75          | 594.01         |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 3135.25                | 23.68            | 165.57         | 2969.68        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 25.0                     | 23.76            |

  Scenario:MR-61_AC8 - 1 FAC - FED - SPANS LEAP YEAR FUTURE RATES +  PROFITS BELOW & AUGMENTED ABOVE MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 20000,exemptDistributions as 110000,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 1232.88                | 24.77            | 11.38          | 1221.5         |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 3767.12                | 24.77            | 34.77          | 3732.35        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 25.0                     | 24.77            |

  Scenario:MR-61_AC9 - 2 FAC - FED - COMPLETE YEAR FUTURE RATES +  PROFITS & AUGMENTED WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2024-04-01,accountingPeriodEnd as 2025-03-31, profit as 50000,exemptDistributions as 10000,associatedCompanies as 2
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 12500.0                | 24.0             | 500.0          | 12000.0        |

  Scenario:MR-61_AC10 - 1 FAC - FED - PARTIAL YEAR FUTURE RATES +  PROFITS BELOW & AUGMENTED ABOVE MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2024-06-01,accountingPeriodEnd as 2025-03-31, profit as 20000,exemptDistributions as 100000,associatedCompanies as 1
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 5000.0                 | 24.94            | 12.33          | 4987.67        |

  Scenario:MR-55_AC3 - 1 FAC - SPANS FUTURE NO RATES AND FUTURE NO RATES +  PROFITS WITHIN MR THRESHOLDS (M5)
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 50000,exemptDistributions as 0,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 3082.19                | 22.75            | 277.4          | 2804.79        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 9417.81                | 22.75            | 847.6          | 8570.21        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 25.0                     | 22.75            |

  Scenario:MR-55_AC4 - 2 FAC - SPANS FUTURE NO RATES AND FUTURE NO RATES +  PROFITS EQUAL TO LOWER MR THRESHOLDS (R5)
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 16666.67,exemptDistributions as 0,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 1027.4                 | 19.0             | 246.58         | 780.82         |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 3139.27                | 19.0             | 753.42         | 2385.85        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 25.0                     | 19.0             |

  Scenario:MR-55_AC5 - 3 FAC - 1 COMPLETE FUTURE LEAP YEAR WITH NO RATES +  PROFITS WITHIN MR THRESHOLDS (C46)
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2027-04-01,accountingPeriodEnd as 2028-03-31, profit as 50000,exemptDistributions as 0,associatedCompanies as 3
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 12500.0                | 24.63            | 187.5          | 12312.5        |

  Scenario:MR-55_AC6 - 4 FAC - 1 COMPLETE FUTURE LEAP YEAR WITH NO RATES +  PROFITS ABOVE MR THRESHOLDS (E46)
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2027-04-01,accountingPeriodEnd as 2028-03-31, profit as 55000,exemptDistributions as 0,associatedCompanies as 4
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 13750.0                | 25.0             | 0.0            | 13750.0        |

  Scenario:MR-57_AC3 - FED - SPANS FUTURE NO RATES  AND FUTURE NO RATES +  PROFITS WITHIN MR THRESHOLDS (M5)
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 100000,exemptDistributions as 10000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 6164.38                | 23.09            | 470.73         | 5693.65        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 18835.62               | 23.09            | 1438.36        | 17397.26       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 25.0                     | 23.09            |

    @failed
  Scenario:MR-57_AC4 - FED - SPANS FUTURE NO RATES  AND FUTURE NO RATES +  PROFITS EQUAL TO LOWER MR THRESHOLDS (R5)
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2025-01-01,accountingPeriodEnd as 2025-12-31, profit as 40000,exemptDistributions as 10000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 1837.97                | 24.8             | 50.44          | 1837.97        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 5726.03                | 24.8             | 154.11         | 5726.03        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 19.0                     | 19.0             |

