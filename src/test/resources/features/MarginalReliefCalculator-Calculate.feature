Feature:  Basic MR calculation for single financial year with MR rate

  Scenario:MR-68_AC1 _1 COMPLETE YEAR + PROFITS LIES WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 100000,exemptDistributions as 0
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 25000.0                | 22.75            | 2250.0         | 22750.0        |

  Scenario:MR-68_AC2_FALLS WITHIN 1 MR YEAR + PROFITS WITH WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-02-01, profit as 100000,exemptDistributions as 0
    Then the MRC response code should be 200
    And MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 25000.0                | 23.35            | 1654.11        | 23345.89       |

  Scenario:MR-68_AC3-FALLS WITHIN 1 ** MR YEAR INCLUDES 29/02/2024 (Leap Year) for Yr 23 + PROFITS WITH WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-01, profit as 100000,exemptDistributions as 0
    Then the MRC response code should be 200
    And MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 25000.0                | 23.05            | 1952.05        | 23047.95       |

  Scenario:MR-68_AC4_FALLS WITHIN 1 ** MR YEAR INCLUDES 29/02/2024 (Leap Year) for Yr 23 + PROFITS LESS THAN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-01, profit as 40000,exemptDistributions as 0
    Then the MRC response code should be 200
    And MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 7600.0                 | 19.0             | 0.0            | 7600.0         |

  Scenario:  MR-70 AC1 - SPANS FLAT AND MR RATES +  PROFITS WITH WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2022-06-01,accountingPeriodEnd as 2023-05-31, profit as 60000,exemptDistributions as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 9494.79                | 19.0             | 0.0            | 9494.79        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 2506.85                | 20.25            | 476.3          | 2030.55        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 20.0                     | 19.21            |

  Scenario:  MR-70 AC2 - SPANS FLAT AND MR RATES +  PROFITS LESS THAN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2022-06-01,accountingPeriodEnd as 2023-05-31, profit as 40000,exemptDistributions as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 6329.86                | 19.0             | 0.0            | 6329.86        |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 1270.14                | 19.0             | 0.0            | 1270.14        |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 19.0                     | 19.0             |

  Scenario:  MR-70 AC3 - SPANS FLAT AND MR RATES +  PROFITS GREATER THAN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2022-06-01,accountingPeriodEnd as 2023-05-31, profit as 300000,exemptDistributions as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 47473.97               | 19.0             | 0.0            | 47473.97       |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 12534.25               | 25.0             | 0.0            | 12534.25       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 20.0                     | 20.0             |

  Scenario:  MR-70 AC3 - SPANS FLAT AND MR RATES +  PROFITS GREATER THAN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2022-06-01,accountingPeriodEnd as 2023-05-31, profit as 250000,exemptDistributions as 0
    Then the MRC response code should be 200
    And for the FY1 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 39561.64               | 19.0             | 0.0            | 39561.64       |
    And for the FY2 the MRC service will return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 10445.21               | 25.0             | 0.0            | 10445.21       |
    And the TOTAL will be
      | effectiveTaxRateBeforeMR | effectiveTaxRate |
      | 20.0                     | 20.0             |

  Scenario:MR-49_AC1-ED -- YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES LIE WITHIN 2023 THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 90000,exemptDistributions as 6000
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
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 40000,exemptDistributions as 6000
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
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 290167,exemptDistributions as 6000
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

  @runME
  Scenario:MR-49_AC4-ED - YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE EQUAL TO THE LOWER 2023 THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 44000,exemptDistributions as 6000
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
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 240000,exemptDistributions as 10000
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
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 100000,exemptDistributions as 20000
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 25000.0                | 23.38            | 1625.0         | 23375.0        |

  Scenario:MR-49_AC8- YEAR SPANS FLAT AND MR RATES +  ADJUSTED PROFITS / ED'S AND AUGMENTED FIGURES ARE EQUAL TO THE LOWER 2023
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 40000,exemptDistributions as 20000
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
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-01-01,accountingPeriodEnd as 2023-12-31, profit as 48000,exemptDistributions as 205000
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
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 40000,exemptDistributions as 20000
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 10000.0                | 20.25            | 1900.0         | 8100.0         |

  Scenario:MR-49_AC11 - ONE COMPLETE YEAR WITH MR RATES +  PROFITS BELOW UPPER THRESHOLDS / ED'S AND AUGMENTED FIGURES ARE GREATER THAN THE UPPER 2023
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 230000,exemptDistributions as 30000
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 57500.0                | 25.0             | 0.0            | 57500.0        |

  Scenario:MR-49_AC12 - ONE COMPLETE YEAR WITH MR RATES +  PROFITS / ED'S AND AUGMENTED FIGURES ARE WITHIN MR 2023
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 150000,exemptDistributions as 30000
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 37500.0                | 24.42            | 875.0          | 36625.0        |

  Scenario: Unable to retrieve MRC Service
    When a request is made to GET response from MRC service for /calculatee with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-01, profit as 400000,exemptDistributions as 0
    Then the MRC response code should be 404

