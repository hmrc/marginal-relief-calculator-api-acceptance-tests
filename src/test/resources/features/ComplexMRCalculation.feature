Feature: Complex MR calculation

  Scenario:MR-49_AC1-ED -- YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES LIE WITHIN 2023 THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 90000,exemptDistributions as 6000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 4216.44                | 19.0             | 0.0            | 4216.44        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 16952.05               | 22.59            | 1631.64        | 15320.42       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 21.71            |

  Scenario:MR-49_AC2-ED - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE LESS THAN 2023 THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 40000,exemptDistributions as 6000,associatedCompanies as 0
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

  Scenario:MR-49_AC3-ED - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE GREATER THAN 2023 THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 290167,exemptDistributions as 6000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 13594.13               | 19.0             | 0.0            | 13594.13       |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 54654.74               | 25.0             | 0.0            | 54654.74       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 23.52            |

  Scenario:MR-49_AC4-ED - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE EQUAL TO THE LOWER 2023 THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 44000,exemptDistributions as 6000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 2061.37                | 19.0             | 0.0            | 2061.37        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 6298.63                | 19.0             | 0.0            | 6298.63        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 19.0                     | 19.0             |

  Scenario:MR-49_AC5-ED - SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE EQUAL TO THE UPPER 2023 THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 240000,exemptDistributions as 10000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 11243.84               | 19.0             | 0.0            | 11243.84       |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 45205.48               | 25.0             | 0.0            | 45205.48       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 23.52            |

  Scenario:MR-49_AC7- ED - YEAR MR YEAR LEAP YEAR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 100000,exemptDistributions as 20000,associatedCompanies as 0
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 25000.0                | 23.38            | 1625.0         | 23375.0        |

  Scenario:MR-49_AC8- YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE EQUAL TO THE LOWER 2023
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 40000,exemptDistributions as 20000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 1873.97                | 19.0             | 0.0            | 1873.97        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 7534.25                | 20.25            | 1431.51        | 6102.74        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 19.94            |

  Scenario:MR-49_AC9 - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE EQUAL TO THE LOWER 2023
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 48000,exemptDistributions as 205000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 2248.77                | 19.0             | 0.0            | 2248.77        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 9041.1                 | 25.0             | 0.0            | 9041.1         |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 23.52            |

  Scenario:MR-49_AC10 - ONE COMPLETE YEAR WITH MR RATES +  PROFITS BELOW LOWER THRESHOLDS / ED'S AND AUGMENTED FIGURES ARE GREATER THAN THE LOWER 2023
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 40000,exemptDistributions as 20000,associatedCompanies as 0
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 10000.0                | 20.25            | 1900.0         | 8100.0         |

  Scenario:MR-49_AC11 - ONE COMPLETE YEAR WITH MR RATES +  PROFITS BELOW UPPER THRESHOLDS / ED'S AND AUGMENTED FIGURES ARE GREATER THAN THE UPPER 2023
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 230000,exemptDistributions as 30000,associatedCompanies as 0
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 57500.0                | 25.0             | 0.0            | 57500.0        |

  Scenario:MR-49_AC12 - ONE COMPLETE YEAR WITH MR RATES +  PROFITS / ED'S AND AUGMENTED FIGURES ARE WITHIN MR 2023
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 150000,exemptDistributions as 30000,associatedCompanies as 0
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 37500.0                | 24.42            | 875.0          | 36625.0        |

  Scenario:MR-58_AC1 - 1 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 50000,exemptDistributions as 10000,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 2342.47                | 19.0             | 0.0            | 2342.47        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 9417.81                | 23.38            | 612.16         | 8805.65        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 22.3             |

  Scenario:MR-58_AC2 - 2 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 60000 ,exemptDistributions as 10000,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 2810.96                | 19.0             | 0.0            | 2810.96        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 11301.37               | 24.71            | 129.16         | 11172.21       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 23.31            |

  Scenario:MR-58_AC3 - 7 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 10000,exemptDistributions as 5000,associatedCompanies as 7
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 468.49                 | 19.0             | 0.0            | 468.49         |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 1883.56                | 23.38            | 122.43         | 1761.13        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 22.3             |

  Scenario:MR-58_AC4 - 2 AC - ED ** YEAR SPANS FLAT AND MR RATES +  PROFITS LIE BELOW THRESHOLDS AUGMENTED WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 12000,exemptDistributions as 6000,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 562.19                 | 19.0             | 0.0            | 562.19         |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 2260.27                | 19.56            | 492.24         | 1768.04        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 19.42            |

  Scenario:MR-58_AC5 - 3 AC - ED ** YEAR MR RATES +  ADJUSTED PROFITS LIE BELOW THRESHOLDS  (W5)
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 42000,exemptDistributions as 5000,associatedCompanies as 3
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 10500.0                | 24.51            | 207.77         | 10292.23       |

  Scenario:MR-58_AC6 - 4 AC - ** ED **** YEAR ** SPANS FLAT AND MR RATES +  **  PROFITS ** LIE BELOW THRESHOLDS ** AUGMENTED WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 6000,exemptDistributions as 6000,associatedCompanies as 4
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 281.1                  | 19.0             | 0.0            | 281.1          |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 1130.14                | 20.25            | 214.73         | 915.41         |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 19.94            |

  Scenario:MR-58_AC7 - 2 AC - ** ED  COMPLETE MR YEAR RATES AND COVER LEAP YEAR +  **  AUGMENTED WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 50000,exemptDistributions as 30000,associatedCompanies as 2
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 12500.0                | 24.94            | 31.25          | 12468.75       |

  Scenario:MR-58_AC8 - 2 AC - ** ED  WITHIN ONE COMPLETE MR YEAR RATES AND COVER LEAP YEAR +  **  PROFITS ** LIE BELOW THRESHOLDS ** AUGMENTED WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-06-01,accountingPeriodEnd as 2024-03-31, profit as 10500,exemptDistributions as 5000,associatedCompanies as 2
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 2625.0                 | 19.76            | 550.08         | 2074.92        |

  Scenario:MR-59_AC1 - 1 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE BELOW THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 15000,exemptDistributions as 7000,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 702.74                 | 19.0             | 0.0            | 702.74         |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 2147.26                | 19.0             | 0.0            | 2147.26        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 19.0                     | 19.0             |

  Scenario:MR-59_AC2 - 2 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE ABOVE THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 75000,exemptDistributions as 10000,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 3513.7                 | 19.0             | 0.0            | 3513.7         |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 14126.71               | 25.0             | 0.0            | 14126.71       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 23.52            |

  Scenario:MR-59_AC3.1 - 2 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE EQUAL TO LOWER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 10000,exemptDistributions as 6666.67,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 468.49                 | 19.0             | 0.0            | 468.49         |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 1883.56                | 19.0             | 452.05         | 1431.51        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 19.0             |

  Scenario:MR-59_AC3 - 3 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE EQUAL TO LOWER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 10000,exemptDistributions as 2500,associatedCompanies as 3
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 468.49                 | 19.0             | 0.0            | 468.49         |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 1431.51                | 19.0             | 0.0            | 1431.51        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 19.0                     | 19.0             |

  Scenario:MR-59_AC4 - 4 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE EQUAL TO UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 10000,exemptDistributions as 55000,associatedCompanies as 3
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 468.49                 | 19.0             | 0.0            | 468.49         |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 1883.56                | 25.0             | 0.0            | 1883.56        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 23.52            |

  Scenario:MR-59_AC5 - 3 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE BELOW THRESHOLDS 7 AUGMENTED ABOVE UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 10000,exemptDistributions as 55000,associatedCompanies as 3
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 468.49                 | 19.0             | 0.0            | 468.49         |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 1883.56                | 25.0             | 0.0            | 1883.56        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 23.52            |

  Scenario:MR-59_AC6 - 2 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE BELOW THRESHOLDS & AUGMENTED EQUAL TO UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 80000,exemptDistributions as 3333.33,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 3747.95                | 19.0             | 0.0            | 3747.95        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 15068.49               | 25.0             | 0.0            | 15068.49       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 23.52            |

  Scenario:MR-59_AC7 - 3 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE WITHIN THRESHOLDS &  AUGMENTED ABOVE UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 50000,exemptDistributions as 50000,associatedCompanies as 3
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 2342.47                | 19.0             | 0.0            | 2342.47        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 9417.81                | 25.0             | 0.0            | 9417.81        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 23.52            |

  Scenario:MR-59_AC8 - 1 AC - ED ** COMPLETE YEAR MR RATES +  ADJUSTED PROFITS LIE LESS THAN THRESHOLDS &  AUGMENTED EQUAL TO UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-06-01,accountingPeriodEnd as 2024-03-31, profit as 20000,exemptDistributions as 84452.05,associatedCompanies as 1
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 5000.0                 | 25.0             | 0.0            | 5000.0         |

  Scenario:MR-59_AC9 - 2 AC - ED ** COMPLETE YEAR MR RATES +  ADJUSTED PROFITS &  AUGMENTED LESS THAN THE THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-06-01,accountingPeriodEnd as 2024-03-31, profit as 10000,exemptDistributions as 3000,associatedCompanies as 2
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 1900.0                 | 19.0             | 0.0            | 1900.0         |

  Scenario:MR-59_AC9 - 2 AC - ED ** COMPLETE YEAR MR RATES +  ADJUSTED PROFITS &  AUGMENTED LESS THAN THE THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-06-01,accountingPeriodEnd as 2024-03-31, profit as 5000,exemptDistributions as 50000,associatedCompanies as 4
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 1250.0                 | 25.0             | 0.0            | 1250.0         |

  Scenario:MR-54_AC1 - 1 AC - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 100000,exemptDistributions as 0,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 4684.93                | 19.0             | 0.0            | 4684.93        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 18835.62               | 24.63            | 282.53         | 18553.08       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 23.24            |

  Scenario:MR-54_AC2 - 2 AC - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 60000,exemptDistributions as 0,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 2810.96                | 19.0             | 0.0            | 2810.96        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 11301.37               | 24.42            | 263.7          | 11037.67       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 23.08            |

  Scenario:MR-54_AC3 - 5 AC - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 24333,exemptDistributions as 0,associatedCompanies as 5
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 1139.98                | 19.0             | 0.0            | 1139.98        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 4583.27                | 23.93            | 195.89         | 4387.38        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 22.72            |

  Scenario:MR-54_AC4 - 1 AC - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE LESS THAN LOWER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 17000,exemptDistributions as 0,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 796.44                 | 19.0             | 0.0            | 796.44         |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 2433.56                | 19.0             | 0.0            | 2433.56        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 19.0                     | 19.0             |

  Scenario:MR-54_AC5 - 3 AC - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE EQUAL TO LOWER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 12500,exemptDistributions as 0,associatedCompanies as 3
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 585.62                 | 19.0             | 0.0            | 585.62         |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 1789.38                | 19.0             | 0.0            | 1789.38        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 19.0                     | 19.0             |

  Scenario:MR-54_AC6 - 2 AC - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS GREATER THAN UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 85000,exemptDistributions as 0,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 3982.19                | 19.0             | 0.0            | 3982.19        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 16010.27               | 25.0             | 0.0            | 16010.27       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 23.52            |

  Scenario:MR-54_AC7 - 1 AC - YEAR SPANS FLAT AND MR RATES ADJUSTED PROFITS ** LIE EQUAL TO UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 125000,exemptDistributions as 0,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 5856.16                | 19.0             | 0.0            | 5856.16        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 23544.52               | 25.0             | 0.0            | 23544.52       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 23.52                    | 23.52            |

  Scenario:MR-54_AC8 - 1 AC - YEAR SPANS A COMPLETE MR RATES YEAR ADJUSTED PROFITS ** WITHIN LOWER AND UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 55000,exemptDistributions as 0,associatedCompanies as 1
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 13750.0                | 23.09            | 1050.0         | 12700.0        |

  Scenario:MR-54_AC9 - 4 AC - YEAR SPANS A LESS THAN 1 YEAR MR RATES YEAR ADJUSTED PROFITS ** WITHIN LOWER AND UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-01-31, profit as 30000,exemptDistributions as 0,associatedCompanies as 4
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 7500.0                 | 24.4             | 178.77         | 7321.23        |

  Scenario:MR-54_AC10 - 2 AC - YEAR SPANS A LESS THAN 1 YEAR MR RATES AND SPANS 29/02 (LY) LEAP YEAR MR RATES YEAR ADJUSTED PROFITS ** WITHIN LOWER AND UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-06-01,accountingPeriodEnd as 2024-03-01, profit as 30000,exemptDistributions as 0,associatedCompanies as 2
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 7500.0                 | 23.36            | 491.78         | 7008.22        |

  Scenario: Unable to retrieve MRC Service
    When a request is made to GET response from MRC service for /calculatee with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-01, profit as 400000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 404