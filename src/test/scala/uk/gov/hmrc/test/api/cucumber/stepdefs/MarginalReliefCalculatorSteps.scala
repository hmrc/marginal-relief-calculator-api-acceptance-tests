package uk.gov.hmrc.test.api.cucumber.stepdefs
import cucumber.api.scala.{EN, ScalaDsl}
import org.scalatest.concurrent.Eventually
import org.scalatest.matchers.must.Matchers
import org.scalatest.matchers.should.Matchers.convertToAnyShouldWrapper
import play.api.libs.ws.StandaloneWSResponse
import uk.gov.hmrc.test.api.requests.MarginalReliefCalculatorRequests.getMarginalReliefCalculatorRequests
import uk.gov.hmrc.test.api.utils.ScenarioContext

class MarginalReliefCalculatorSteps extends ScalaDsl with EN with Eventually with Matchers {
  When("a request is made to get response from MRC service hello world endpoint") { () =>
    val response = getMarginalReliefCalculatorRequests("/hello-world")
    ScenarioContext.set("response", response)
  }

  When("a request is made to an invalid MRC endpoint") { () =>
    val response = getMarginalReliefCalculatorRequests("/helloo-world")
    ScenarioContext.set("response", response)
  }

  Then("the MRC response code should be (.*)") { message: String =>
    val response: StandaloneWSResponse = ScenarioContext.get("response")
    response.body.equals(message)
  }

  And("the MRC hello world response body should be (.*)") { expectedCode: Int =>
    val response: StandaloneWSResponse = ScenarioContext.get("response")
    response.status should be(expectedCode)
  }

}