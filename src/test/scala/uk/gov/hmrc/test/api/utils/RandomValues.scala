package uk.gov.hmrc.test.api.utils

import scala.util.Random

trait RandomValues {
  def getRandomAffinityGroup: String = {
    val possibleAffinityGroups = Seq("Individual", "Organisation")
    val random                 = new Random
    val randomIndex            = random.nextInt(possibleAffinityGroups.length)
    possibleAffinityGroups(randomIndex)
  }
}
