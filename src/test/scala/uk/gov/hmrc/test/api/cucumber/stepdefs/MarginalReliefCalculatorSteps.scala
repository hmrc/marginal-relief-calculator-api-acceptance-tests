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

package uk.gov.hmrc.test.api.cucumber.stepdefs
import cucumber.api.scala.{EN, ScalaDsl}
import io.cucumber.datatable.DataTable
import org.scalatest.Matchers
import org.scalatest.concurrent.Eventually
import play.api.libs.json.Json
import play.api.libs.ws.StandaloneWSResponse
import uk.gov.hmrc.test.api.models.{DualYearCalculationSummary, MarginalRateYear, SingleYearCalculationSummary}
import uk.gov.hmrc.test.api.requests.MarginalReliefCalculatorRequests.getMarginalReliefCalculatorRequests
import uk.gov.hmrc.test.api.utils.ScenarioContext

class MarginalReliefCalculatorSteps extends ScalaDsl with EN with Eventually with Matchers {
  When(
    "a request is made to GET response from MRC service for (.*) with query params accountingPeriodStart as (.*),accountingPeriodEnd as (.*), profit as (.*),exemptDistributions as (.*),associatedCompanies as (.*)"
  ) {
    (
      endPoint: String,
      accountingPeriodStart: String,
      accountingPeriodEnd: String,
      profit: String,
      exemptDistributions: String,
      associatedCompanies: String
    ) =>
      val response = getMarginalReliefCalculatorRequests(
        endPoint,
        accountingPeriodStart,
        accountingPeriodEnd,
        profit,
        exemptDistributions,
        associatedCompanies
      )
      ScenarioContext.set("response", response)
      println(s"RESPONSE --> ${response.body}")
  }
  Then("the MRC response code should be (.*)") { expectedCode: String =>
    val response: StandaloneWSResponse = ScenarioContext.get("response")
    response.body.contains(expectedCode)
  }

  And("MRC response contains") { (dataTable: DataTable) =>
    val asMapTransposed                = dataTable.transpose().asMap(classOf[String], classOf[String])
    val response: StandaloneWSResponse = ScenarioContext.get("response")
    val responseBody                   = Json.parse(response.body).as[SingleYearCalculationSummary].details

    if (asMapTransposed.containsKey("taxRateBeforeMR")) {
      responseBody.taxRateBeforeMR.toString shouldBe asMapTransposed.get("taxRateBeforeMR").toString
    }
    if (asMapTransposed.containsKey("corporationTaxBeforeMR")) {
      responseBody.corporationTaxBeforeMR.toString shouldBe asMapTransposed.get("corporationTaxBeforeMR").toString
    }
    if (asMapTransposed.containsKey("adjustedDistributions")) {
      responseBody.adjustedDistributions.toString shouldBe asMapTransposed.get("adjustedDistributions").toString
    }
    if (asMapTransposed.containsKey("taxRate")) {
      responseBody.taxRate.toString shouldBe asMapTransposed.get("taxRate").toString
    }
    if (asMapTransposed.containsKey("year")) {
      responseBody.year.toString shouldBe asMapTransposed.get("year").toString
    }
    if (asMapTransposed.containsKey("adjustedUpperThreshold")) {
      responseBody.adjustedUpperThreshold.toString shouldBe asMapTransposed.get("adjustedUpperThreshold").toString
    }
    if (asMapTransposed.containsKey("adjustedLowerThreshold")) {
      responseBody.adjustedLowerThreshold.toString shouldBe asMapTransposed.get("adjustedLowerThreshold").toString
    }
    if (asMapTransposed.containsKey("corporationTax")) {
      responseBody.corporationTax.toString shouldBe asMapTransposed.get("corporationTax").toString
    }
    if (asMapTransposed.containsKey("adjustedProfit")) {
      responseBody.adjustedProfit.toString shouldBe asMapTransposed.get("adjustedProfit").toString
    }
  }
  And("for the FY1 the MRC service will return") { (dataTable: DataTable) =>
    val asMapTransposed                = dataTable.transpose().asMap(classOf[String], classOf[String])
    val response: StandaloneWSResponse = ScenarioContext.get("response")
    val responseBody                   = Json.parse(response.body).as[DualYearCalculationSummary].year1
    if (asMapTransposed.containsKey("year")) {
      responseBody.year.toString shouldBe asMapTransposed.get("year").toString
    }
    if (asMapTransposed.containsKey("corporationTax")) {
      responseBody.corporationTax.toString shouldBe asMapTransposed.get("corporationTax").toString
    }
    if (asMapTransposed.containsKey("taxRate")) {
      responseBody.taxRate.toString shouldBe asMapTransposed.get("taxRate").toString
    }
    if (asMapTransposed.containsKey("adjustedProfit")) {
      responseBody.adjustedProfit.toString shouldBe asMapTransposed.get("adjustedProfit").toString
    }
  }

  And("for the FY2 the MRC service will return") { (dataTable: DataTable) =>
    val asMapTransposed                = dataTable.transpose().asMap(classOf[String], classOf[String])
    val response: StandaloneWSResponse = ScenarioContext.get("response")
    val responseBody                   = Json.parse(response.body).as[DualYearCalculationSummary].year2
    if (asMapTransposed.containsKey("taxRateBeforeMR")) {
      responseBody.taxRateBeforeMR.toString shouldBe asMapTransposed.get("taxRateBeforeMR").toString
    }
    if (asMapTransposed.containsKey("corporationTaxBeforeMR")) {
      responseBody.corporationTaxBeforeMR.toString shouldBe asMapTransposed.get("corporationTaxBeforeMR").toString
    }
    if (asMapTransposed.containsKey("adjustedDistributions")) {
      responseBody.adjustedDistributions.toString shouldBe asMapTransposed.get("adjustedDistributions").toString
    }
    if (asMapTransposed.containsKey("taxRate")) {
      responseBody.taxRate.toString shouldBe asMapTransposed.get("taxRate").toString
    }
    if (asMapTransposed.containsKey("year")) {
      responseBody.year.toString shouldBe asMapTransposed.get("year").toString
    }
    if (asMapTransposed.containsKey("adjustedUpperThreshold")) {
      responseBody.adjustedUpperThreshold.toString shouldBe asMapTransposed.get("adjustedUpperThreshold").toString
    }
    if (asMapTransposed.containsKey("adjustedLowerThreshold")) {
      responseBody.adjustedLowerThreshold.toString shouldBe asMapTransposed.get("adjustedLowerThreshold").toString
    }
    if (asMapTransposed.containsKey("corporationTax")) {
      responseBody.corporationTax.toString shouldBe asMapTransposed.get("corporationTax").toString
    }
    if (asMapTransposed.containsKey("adjustedProfit")) {
      responseBody.adjustedProfit.toString shouldBe asMapTransposed.get("adjustedProfit").toString
    }
  }
}
