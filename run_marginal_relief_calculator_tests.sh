#!/usr/bin/env bash

environment="local"

tags="not @wip and not @ignore"

if [ $# -gt 0 -a "$1" != "$environment" ]; then
  environment="$1"
  tags="not @wip and not @ignore"
fi
echo "*** running on $environment for tags '$tags' ***"
sleep 20
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
