#!/usr/bin/env bash

environment="local"

tags="not @wip and not @ignore"

if [ $# -gt 0 -a "$1" != "$environment" ]; then
  environment="$1"
  tags="not @wip and not @ignore"
fi

echo "*** running on $environment for tags '$tags' ***"
sm --start MARGINAL_RELIEF_CALCULATOR_BACKEND --appendArgs '{"MARGINAL_RELIEF_CALCULATOR_BACKEND": [
"-Dcalculator-config.fy-configs.0.year=2022",
"-Dcalculator-config.fy-configs.0.main-rate=0.19",
"-Dcalculator-config.fy-configs.1.year=2023",
"-Dcalculator-config.fy-configs.1.lower-threshold=50000",
"-Dcalculator-config.fy-configs.1.upper-threshold=250000",
"-Dcalculator-config.fy-configs.1.small-profit-rate=0.19",
"-Dcalculator-config.fy-configs.1.main-rate=0.25",
"-Dcalculator-config.fy-configs.1.marginal-relief-fraction=0.015",
"-Dcalculator-config.fy-configs.2.year=2024",
"-Dcalculator-config.fy-configs.2.lower-threshold= 50000",
"-Dcalculator-config.fy-configs.2.upper-threshold= 250000",
"-Dcalculator-config.fy-configs.2.small-profit-rate=0.19",
"-Dcalculator-config.fy-configs.2.main-rate=0.25",
"-Dcalculator-config.fy-configs.2.marginal-relief-fraction=0.015"]}'
sleep 10s
status_code=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost:7100/ping/ping)
if [[ "$status_code" -ne 200 ]]; then
  echo "ping endpoint response error $status_code.
  MRC Service does not look like it is running.
  No tests will be executed. Build failure!"
  exit 1
fi
sleep 2
sbt scalafmtCheckAll scalafmtSbtCheck
sbt -Denvironment="$environment" -Dcucumber.options="--tags '$tags'" clean 'testOnly uk.gov.hmrc.test.api.cucumber.runner.MarginalReliefCalculatorApiTestRunner'
