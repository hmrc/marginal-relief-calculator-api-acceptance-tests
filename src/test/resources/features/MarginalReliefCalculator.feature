Feature:  Basic MR calculation for single financial year with MR rate

  Scenario:  MR-68 AC1  1 COMPLETE YEAR + PROFITS LIES WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params 2023-04-01, 2024-03-31, 100000
    Then the MRC response code should be 200
    And  MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 25000.0                | 22.75            | 2250.0         | 22750.0        |

  Scenario: MR-68 AC2 - FALLS WITHIN 1 MR YEAR + PROFITS WITH WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params 2023-04-01, 2024-02-01, 100000
    Then the MRC response code should be 200
    And MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 25000.0                | 23.35            | 1654.11        | 23345.89       |

  Scenario:  MR-68 AC3 - FALLS WITHIN 1 ** MR YEAR INCLUDES 29/02/2024 (Leap Year) for Yr 23 + PROFITS WITH WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params 2023-04-01, 2024-03-01, 100000
    Then the MRC response code should be 200
    And MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 25000.0                | 23.05            | 1952.05        | 23047.95       |

  Scenario: MR-68 AC4 - FALLS WITHIN 1 ** MR YEAR INCLUDES 29/02/2024 (Leap Year) for Yr 23 + PROFITS LESS THAN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params 2023-04-01, 2024-03-01, 40000
    Then the MRC response code should be 200
    And MRC response contains
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 7600.0                 | 19.0             | 0.0            | 7600.0         |
  @wip
  Scenario:  MR-70 AC1 - SPANS FLAT AND MR RATES +  PROFITS WITH WITHIN MR THRESHOLDS
    When a request is made to GET response from MRC service for /calculate with query params 2022-06-01, 2024-05-31, 60000
    Then the MRC response code should be 200
    And for the FY1 the MRC service wilL return
     | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 19.0                     | 9494.79               | 20.25            | 2850.0         | 12150.0        |
    And for the FY2 the MRC service wilL return
      | effectiveTaxRateBeforeMR | corporationTaxBeforeMR | effectiveTaxRate | marginalRelief | corporationTax |
      | 25.0                     | 15000.0                | 20.25            | 2850.0         | 12150.0        |

  Scenario: Unable to retrieve hello world response from MRC Service
    When a request is made to GET response from MRC service for /calculatee with query params 2023-04-01, 2024-03-01, 100000
    Then the MRC response code should be 404

