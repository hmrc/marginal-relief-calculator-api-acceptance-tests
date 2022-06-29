Feature:  Basic MR calculation for single financial year with MR rate

  Scenario:MR-68_AC1 _1 COMPLETE YEAR + PROFITS LIES WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-31, profit as 100000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 25000.0                | 22.75            | 2250.0         | 22750.0        |

  Scenario:MR-68_AC2_FALLS WITHIN 1 MR YEAR + PROFITS WITH WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-02-01, profit as 100000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 25000.0                | 23.35            | 1654.11        | 23345.89       |

  Scenario:MR-68_AC3-FALLS WITHIN 1 ** MR YEAR INCLUDES 29/02/2024 (Leap Year) for Yr 23 + PROFITS WITH WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-01, profit as 100000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 25000.0                | 23.05            | 1952.05        | 23047.95       |

  Scenario:MR-68_AC4_FALLS WITHIN 1 ** MR YEAR INCLUDES 29/02/2024 (Leap Year) for Yr 23 + PROFITS LESS THAN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-01, profit as 40000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 200
    And MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 7600.0                 | 19.0             | 0.0            | 7600.0         |

  Scenario:  MR-70 AC1 - SPANS FLAT AND MR RATES +  PROFITS WITH WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2022-06-01,accountingPeriodEnd as 2023-05-31, profit as 60000,exemptDistributions as 0,associatedCompanies as 0
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
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2022-06-01,accountingPeriodEnd as 2023-05-31, profit as 40000,exemptDistributions as 0,associatedCompanies as 0
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
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2022-06-01,accountingPeriodEnd as 2023-05-31, profit as 300000,exemptDistributions as 0,associatedCompanies as 0
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
    When a request is made to GET response from MRC service for /calculate with query params accountingPeriodStart as 2022-06-01,accountingPeriodEnd as 2023-05-31, profit as 250000,exemptDistributions as 0,associatedCompanies as 0
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

  Scenario: Unable to retrieve MRC Service
    When a request is made to GET response from MRC service for /calculatee with query params accountingPeriodStart as 2023-04-01,accountingPeriodEnd as 2024-03-01, profit as 400000,exemptDistributions as 0,associatedCompanies as 0
    Then the MRC response code should be 404