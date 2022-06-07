package uk.gov.hmrc.test.api.utils

import uk.gov.hmrc.test.api.conf.TestConfiguration

trait BaseUris {
  val marginalreliefCalculatorApiUrl: String =
    TestConfiguration.url("marginal-relief-calculator")
}