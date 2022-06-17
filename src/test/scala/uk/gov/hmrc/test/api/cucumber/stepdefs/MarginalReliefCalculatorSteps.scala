package uk.gov.hmrc.test.api.cucumber.stepdefs
import cucumber.api.scala.{EN, ScalaDsl}
import io.cucumber.datatable.DataTable
import org.scalatest.Matchers
import org.scalatest.concurrent.Eventually
import play.api.libs.json.Json
import play.api.libs.ws.StandaloneWSResponse
import uk.gov.hmrc.test.api.models.MRCCaluationSummary
import uk.gov.hmrc.test.api.requests.MarginalReliefCalculatorRequests.{getMarginalReliefCalculatorRequests, marginalreliefCalculatorApiUrl}
import uk.gov.hmrc.test.api.utils.ScenarioContext

class MarginalReliefCalculatorSteps extends ScalaDsl with EN with Eventually with Matchers {
  When("a request is made to GET response from MRC service") { (a: String,b: String,c: String) =>
     val response = getMarginalReliefCalculatorRequests("/calculate",a,b,c)
    ScenarioContext.set("response", response)
    println(response)
  }

  When("a request is made to an invalid MRC endpoint") { (a: String,b: String,c: String) =>
    val response = getMarginalReliefCalculatorRequests("/calculatee",a,b,c)
    ScenarioContext.set("response", response)
  }

  Then("the MRC response code should be (.*)") { expectedCode: String =>
    val response: StandaloneWSResponse = ScenarioContext.get("response")
    response.body.contains(expectedCode)
  }

  And("the MRC hello world response body should be (.*)") { message: String =>
    val response: StandaloneWSResponse = ScenarioContext.get("response")
    response.status should be (message)
  }
    And("the MRC service wilL return"){ (dataTable: DataTable) =>
      val asMapTransposed                = dataTable.transpose().asMap(classOf[String], classOf[String])
      val response: StandaloneWSResponse = ScenarioContext.get("response")
      val responseBody = Json.parse(response.body).as[MRCCaluationSummary]

      if (asMapTransposed.containsKey("effectiveTaxRateBeforeMR")) {
        responseBody.effectiveTaxRateBeforeMR.toString shouldBe asMapTransposed.get("effectiveTaxRateBeforeMR").toString
      }
      if (asMapTransposed.containsKey("corporationTaxBeforeMR")) {
        responseBody.corporationTaxBeforeMR.toString shouldBe asMapTransposed.get("corporationTaxBeforeMR").toString
      }
      if (asMapTransposed.containsKey("effectiveTaxRate")) {
        responseBody.effectiveTaxRate.toString shouldBe asMapTransposed.get("effectiveTaxRate").toString
      }
      if (asMapTransposed.containsKey("marginalRelief")) {
        responseBody.marginalRelief.toString shouldBe asMapTransposed.get("marginalRelief").toString
      }
      if (asMapTransposed.containsKey("corporationTax")) {
        responseBody.corporationTax.toString shouldBe asMapTransposed.get("corporationTax").toString
      }
    }

}     