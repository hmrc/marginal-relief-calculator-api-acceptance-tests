Feature: Complex MR calculation

  Scenario:MR-49_AC1-ED -- YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES LIE WITHIN 2023 THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 90000,exemptDistributions as 6000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 16952.05               | 4520.55               | 22.59   | 2023 | 188356.16              | 1631.64        | 37671.23               | 15320.42       | 67808.22       |
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 4216.44        | 19.0    | 22191.78       |

  Scenario:MR-49_AC2-ED - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE LESS THAN 2023 THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 40000,exemptDistributions as 6000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 1873.97        | 19.0    | 9863.01        |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 19.0            | 5726.03                | 4520.55               | 19.0    | 2023 | 188356.16              | 0.0            | 37671.23               | 5726.03        | 30136.99       |

  Scenario:MR-49_AC3-ED - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE GREATER THAN 2023 THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 290167,exemptDistributions as 6000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 13594.13       | 19.0    | 71548.03       |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 54654.74               | 4520.55               | 25.0    | 2023 | 188356.16              | 0.0            | 37671.23               | 54654.74       | 218618.97      |

  Scenario:MR-49_AC4-ED - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE EQUAL TO THE LOWER 2023 THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 44000,exemptDistributions as 6000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 19.0            | 6298.63                | 4520.55               | 19.0    | 2023 | 188356.16              | 0.0            | 37671.23               | 6298.63        | 33150.68       |
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 2061.37        | 19.0    | 10849.32       |

  Scenario:MR-49_AC5-ED - SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE EQUAL TO THE UPPER 2023 THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 240000,exemptDistributions as 10000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 11243.84       | 19.0    | 59178.08       |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 45205.48               | 7534.25               | 25.0    | 2023 | 188356.16              | 0.0            | 37671.23               | 45205.48       | 180821.92      |

  Scenario:MR-49_AC7- ED - YEAR MR YEAR LEAP YEAR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 100000,exemptDistributions as 20000,associatedCompanies as 0
    Then the MRC response code should be 200
    And MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 25000.0                | 20000.0               | 23.38   | 2023 | 250000.0               | 1625.0         | 50000.0                | 23375.0        | 100000.0       |

  Scenario:MR-49_AC8- YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE EQUAL TO THE LOWER 2023
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 40000,exemptDistributions as 20000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 1873.97        | 19.0    | 9863.01        |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 7534.25                | 15068.49              | 20.25   | 2023 | 188356.16              | 1431.51        | 37671.23               | 6102.74        | 30136.99       |

  Scenario:MR-49_AC9 - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE EQUAL TO THE LOWER 2023
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 48000,exemptDistributions as 205000,associatedCompanies as 0
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 2248.77        | 19.0    | 11835.62       |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 9041.1                 | 154452.05             | 25.0    | 2023 | 188356.16              | 0.0            | 37671.23               | 9041.1         | 36164.38       |

  Scenario:MR-49_AC10 - ONE COMPLETE YEAR WITH MR RATES +  PROFITS BELOW LOWER THRESHOLDS / ED'S AND AUGMENTED FIGURES ARE GREATER THAN THE LOWER 2023
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 40000,exemptDistributions as 20000,associatedCompanies as 0
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 10000.0                | 20000.0               | 20.25   | 2023 | 250000.0               | 1900.0         | 50000.0                | 8100.0         | 40000.0        |

  Scenario:MR-49_AC11 - ONE COMPLETE YEAR WITH MR RATES +  PROFITS BELOW UPPER THRESHOLDS / ED'S AND AUGMENTED FIGURES ARE GREATER THAN THE UPPER 2023
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 230000,exemptDistributions as 30000,associatedCompanies as 0
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 57500.0                | 30000.0               | 25.0    | 2023 | 250000.0               | 0.0            | 50000.0                | 57500.0        | 230000.0       |


  Scenario:MR-49_AC12 - ONE COMPLETE YEAR WITH MR RATES +  PROFITS / ED'S AND AUGMENTED FIGURES ARE WITHIN MR 2023
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 150000,exemptDistributions as 30000,associatedCompanies as 0
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 37500.0                | 30000.0               | 24.42   | 2023 | 250000.0               | 875.0          | 50000.0                | 36625.0        | 150000.0       |

  Scenario:MR-58_AC1 - 1 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 50000,exemptDistributions as 10000,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 2342.47        | 19.0    | 12328.77       |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 9417.81                | 7534.25               | 23.38   | 2023 | 94178.08               | 612.16         | 18835.62               | 8805.65        | 37671.23       |

  Scenario:MR-58_AC2 - 2 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 60000 ,exemptDistributions as 10000,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 2810.96        | 19.0    | 14794.52       |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 11301.37               | 7534.25               | 24.71   | 2023 | 62785.39               | 129.16         | 12557.08               | 11172.21       | 45205.48       |

  Scenario:MR-58_AC3 - 7 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 10000,exemptDistributions as 5000,associatedCompanies as 7
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 468.49         | 19.0    | 2465.75        |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 1883.56                | 3767.12               | 23.38   | 2023 | 23544.52               | 122.43         | 4708.9                 | 1761.13        | 7534.25        |

  Scenario:MR-58_AC4 - 2 AC - ED ** YEAR SPANS FLAT AND MR RATES +  PROFITS LIE BELOW THRESHOLDS AUGMENTED WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 12000,exemptDistributions as 6000,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 562.19         | 19.0    | 2958.9         |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 2260.27                | 4520.55               | 19.56   | 2023 | 62785.39               | 492.24         | 12557.08               | 1768.04        | 9041.1         |

  Scenario:MR-58_AC5 - 3 AC - ED ** YEAR MR RATES +  ADJUSTED PROFITS LIE BELOW THRESHOLDS  (W5)
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 42000,exemptDistributions as 5000,associatedCompanies as 3
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 10500.0                | 5000.0                | 24.51   | 2023 | 62500.0                | 207.77         | 12500.0                | 10292.23       | 42000.0        |

  Scenario:MR-58_AC6 - 4 AC - ** ED **** YEAR ** SPANS FLAT AND MR RATES +  **  PROFITS ** LIE BELOW THRESHOLDS ** AUGMENTED WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 6000,exemptDistributions as 6000,associatedCompanies as 4
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 281.1          | 19.0    | 1479.45        |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 1130.14                | 4520.55               | 20.25   | 2023 | 37671.23               | 214.73         | 7534.25                | 915.41         | 4520.55        |

  Scenario:MR-58_AC7 - 2 AC - ** ED  COMPLETE MR YEAR RATES AND COVER LEAP YEAR +  **  AUGMENTED WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 50000,exemptDistributions as 30000,associatedCompanies as 2
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 12500.0                | 30000.0               | 24.94   | 2023 | 83333.33               | 31.25          | 16666.67               | 12468.75       | 50000.0        |

  Scenario:MR-58_AC8 - 2 AC - ** ED  WITHIN ONE COMPLETE MR YEAR RATES AND COVER LEAP YEAR +  **  PROFITS ** LIE BELOW THRESHOLDS ** AUGMENTED WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-06-01,accountingPeriodEnd as 2024-03-31, profit as 10500,exemptDistributions as 5000,associatedCompanies as 2
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 2625.0                 | 5000.0                | 19.76   | 2023 | 69634.7                | 550.08         | 13926.94               | 2074.92        | 10500.0        |

  Scenario:MR-59_AC1 - 1 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE BELOW THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 15000,exemptDistributions as 7000,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 702.74         | 19.0    | 3698.63        |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 19.0            | 2147.26                | 5273.97               | 19.0    | 2023 | 94178.08               | 0.0            | 18835.62               | 2147.26        | 11301.37       |

  Scenario:MR-59_AC2 - 2 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE ABOVE THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 75000,exemptDistributions as 10000,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 3513.7         | 19.0    | 18493.15       |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 14126.71               | 7534.25               | 25.0    | 2023 | 62785.39               | 0.0            | 12557.08               | 14126.71       | 56506.85       |

  Scenario:MR-59_AC3.1 - 2 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE EQUAL TO LOWER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 10000,exemptDistributions as 6666.67,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 468.49         | 19.0    | 2465.75        |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 1883.56                | 5022.83               | 19.0    | 2023 | 62785.39               | 452.05         | 12557.08               | 1431.51        | 7534.25        |

  Scenario:MR-59_AC3 - 3 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE EQUAL TO LOWER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 10000,exemptDistributions as 2500,associatedCompanies as 3
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 468.49         | 19.0    | 2465.75        |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 19.0            | 1431.51                | 1883.56               | 19.0    | 2023 | 47089.04               | 0.0            | 9417.81                | 1431.51        | 7534.25        |

  Scenario:MR-59_AC4 - 4 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE EQUAL TO UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 10000,exemptDistributions as 55000,associatedCompanies as 3
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 468.49         | 19.0    | 2465.75        |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 1883.56                | 41438.36              | 25.0    | 2023 | 47089.04               | 0.0            | 9417.81                | 1883.56        | 7534.25        |

  Scenario:MR-59_AC5 - 3 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE BELOW THRESHOLDS 7 AUGMENTED ABOVE UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 10000,exemptDistributions as 55000,associatedCompanies as 3
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 468.49         | 19.0    | 2465.75        |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 1883.56                | 41438.36              | 25.0    | 2023 | 47089.04               | 0.0            | 9417.81                | 1883.56        | 7534.25        |

  Scenario:MR-59_AC6 - 2 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE BELOW THRESHOLDS & AUGMENTED EQUAL TO UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 80000,exemptDistributions as 3333.33,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 3747.95        | 19.0    | 19726.03       |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 15068.49               | 2511.41               | 25.0    | 2023 | 62785.39               | 0.0            | 12557.08               | 15068.49       | 60273.97       |

  Scenario:MR-59_AC7 - 3 AC - ED ** YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE WITHIN THRESHOLDS &  AUGMENTED ABOVE UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 50000,exemptDistributions as 50000,associatedCompanies as 3
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 2342.47        | 19.0    | 12328.77       |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 9417.81                | 37671.23              | 25.0    | 2023 | 47089.04               | 0.0            | 9417.81                | 9417.81        | 37671.23       |

  Scenario:MR-59_AC8 - 1 AC - ED ** COMPLETE YEAR MR RATES +  ADJUSTED PROFITS LIE LESS THAN THRESHOLDS &  AUGMENTED EQUAL TO UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-06-01,accountingPeriodEnd as 2024-03-31, profit as 20000,exemptDistributions as 84452.05,associatedCompanies as 1
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 5000.0                 | 84452.05              | 25.0    | 2023 | 104452.05              | 0.0            | 20890.41               | 5000.0         | 20000.0        |

  Scenario:MR-59_AC9 - 2 AC - ED ** COMPLETE YEAR MR RATES +  ADJUSTED PROFITS &  AUGMENTED LESS THAN THE THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-06-01,accountingPeriodEnd as 2024-03-31, profit as 10000,exemptDistributions as 3000,associatedCompanies as 2
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 19.0            | 1900.0                 | 3000.0                | 19.0    | 2023 | 69634.7                | 0.0            | 13926.94               | 1900.0         | 10000.0        |

  Scenario:MR-59_AC10 - 4 AC - ED ** COMPLETE YEAR MR RATES +  ADJUSTED PROFITS LESS THAN THRESHOLDS  &  AUGMENTED PROFIT GREATER THAN THE THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-06-01,accountingPeriodEnd as 2024-03-31, profit as 5000,exemptDistributions as 50000,associatedCompanies as 4
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 1250.0                 | 50000.0               | 25.0    | 2023 | 41780.82               | 0.0            | 8356.16                | 1250.0         | 5000.0         |

  Scenario:MR-54_AC1 - 1 AC - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 100000,exemptDistributions as 0,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 4684.93        | 19.0    | 24657.53       |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 18835.62               | 0.0                   | 24.63   | 2023 | 94178.08               | 282.53         | 18835.62               | 18553.08       | 75342.47       |

  Scenario:MR-54_AC2 - 2 AC - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 60000,exemptDistributions as 0,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 2810.96        | 19.0    | 14794.52       |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 11301.37               | 0.0                   | 24.42   | 2023 | 62785.39               | 263.7          | 12557.08               | 11037.67       | 45205.48       |

  Scenario:MR-54_AC3 - 5 AC - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE WITHIN THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 24333,exemptDistributions as 0,associatedCompanies as 5
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 1139.98        | 19.0    | 5999.92        |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 4583.27                | 0.0                   | 23.93   | 2023 | 31392.69               | 195.89         | 6278.54                | 4387.38        | 18333.08       |

  Scenario:MR-54_AC4 - 1 AC - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE LESS THAN LOWER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 17000,exemptDistributions as 0,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 796.44         | 19.0    | 4191.78        |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 19.0            | 2433.56                | 0.0                   | 19.0    | 2023 | 94178.08               | 0.0            | 18835.62               | 2433.56        | 12808.22       |

  Scenario:MR-54_AC5 - 3 AC - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS LIE EQUAL TO LOWER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 12500,exemptDistributions as 0,associatedCompanies as 3
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 585.62         | 19.0    | 3082.19        |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 19.0            | 1789.38                | 0.0                   | 19.0    | 2023 | 47089.04               | 0.0            | 9417.81                | 1789.38        | 9417.81        |

  Scenario:MR-54_AC6 - 2 AC - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS GREATER THAN UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 85000,exemptDistributions as 0,associatedCompanies as 2
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 3982.19        | 19.0    | 20958.9        |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 16010.27               | 0.0                   | 25.0    | 2023 | 62785.39               | 0.0            | 12557.08               | 16010.27       | 64041.1        |

  Scenario:MR-54_AC7 - 1 AC - YEAR SPANS FLAT AND MR RATES ADJUSTED PROFITS ** LIE EQUAL TO UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 125000,exemptDistributions as 0,associatedCompanies as 1
    Then the MRC response code should be 200
    And for the FlatRate year the MRC Response will return
      | year | corporationTax | taxRate | adjustedProfit |
      | 2022 | 5856.16        | 19.0    | 30821.92       |
    And for the MarginalRate year the MRC Response will return
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 23544.52               | 0.0                   | 25.0    | 2023 | 94178.08               | 0.0            | 18835.62               | 23544.52       | 94178.08       |

  Scenario:MR-54_AC8 - 1 AC - YEAR SPANS A COMPLETE MR RATES YEAR ADJUSTED PROFITS ** WITHIN LOWER AND UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 55000,exemptDistributions as 0,associatedCompanies as 1
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 13750.0                | 0.0                   | 23.09   | 2023 | 125000.0               | 1050.0         | 25000.0                | 12700.0        | 55000.0        |

  Scenario:MR-54_AC9 - 4 AC - YEAR SPANS A LESS THAN 1 YEAR MR RATES YEAR ADJUSTED PROFITS ** WITHIN LOWER AND UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-01-31, profit as 30000,exemptDistributions as 0,associatedCompanies as 4
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 7500.0                 | 0.0                   | 24.4    | 2023 | 41917.81               | 178.77         | 8383.56                | 7321.23        | 30000.0        |

  Scenario:MR-54_AC10 - 2 AC - YEAR SPANS A LESS THAN 1 YEAR MR RATES AND SPANS 29/02 (LY) LEAP YEAR MR RATES YEAR ADJUSTED PROFITS ** WITHIN LOWER AND UPPER THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-06-01,accountingPeriodEnd as 2024-03-01, profit as 30000,exemptDistributions as 0,associatedCompanies as 2
    Then the MRC response code should be 200
    And  MRC response contains
      | taxRateBeforeMR | corporationTaxBeforeMR | adjustedDistributions | taxRate | year | adjustedUpperThreshold | marginalRelief | adjustedLowerThreshold | corporationTax | adjustedProfit |
      | 25.0            | 7500.0                 | 0.0                   | 23.36   | 2023 | 62785.39               | 491.78         | 12557.08               | 7008.22        | 30000.0        |
