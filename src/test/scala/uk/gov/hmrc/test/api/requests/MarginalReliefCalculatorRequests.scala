/*
 * Copyright 2022 HM Revenue & Customs
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package uk.gov.hmrc.test.api.requests

import play.api.libs.ws.StandaloneWSResponse
import uk.gov.hmrc.test.api.client.WsClient
import uk.gov.hmrc.test.api.utils.BaseUris

object MarginalReliefCalculatorRequests extends BaseUris {

  def  getMarginalReliefCalculatorRequests(
    endpoint: String,
    accountingPeriodStart: String,
    accountingPeriodEnd: String,
    profit: String,
    exemptDistributions: String
  ): StandaloneWSResponse = {

    val baseUri         = s"$marginalreliefCalculatorApiUrl/marginal-relief-calculator-backend$endpoint"
    val queryParameters = Map(
      "accountingPeriodStart" -> accountingPeriodStart,
      "accountingPeriodEnd"   -> accountingPeriodEnd,
      "profit"                -> profit
    )
    val headers         = Map(
      "Content-Type" -> "application/json",
      "Accept"       -> "application/vnd.hmrc.1.0+json"
    )

    print("Marginal Relief Calculator baseUri ************************" + baseUri)

    WsClient.get(baseUri, queryParameters = queryParameters, headers = headers)
  }

}
