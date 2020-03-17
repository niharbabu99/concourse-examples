#!/bin/bash
source ci-pipeline-git/load-bosh-vars-example/bin/load-bosh-vars.sh
bosh deployments
