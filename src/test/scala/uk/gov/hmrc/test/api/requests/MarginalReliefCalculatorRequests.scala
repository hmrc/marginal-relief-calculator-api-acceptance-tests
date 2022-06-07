package uk.gov.hmrc.test.api.requests

import play.api.libs.ws.StandaloneWSResponse
import uk.gov.hmrc.test.api.client.WsClient
import uk.gov.hmrc.test.api.utils.BaseUris

object MarginalReliefCalculatorRequests extends BaseUris {

  //Used by hello world only
  def getMarginalReliefCalculatorRequests(endpoint: String): StandaloneWSResponse = {

    val baseUri = s"$marginalreliefCalculatorApiUrl/marginal-relief-calculator$endpoint"
    val headers = Map(
      "Content-Type" -> "application/json",
      "Accept"       -> "application/vnd.hmrc.1.0+json"
    )

    print("Marginal Relief Calculator baseUri ************************" + baseUri)

    WsClient.get(baseUri, headers = headers)
  }

}