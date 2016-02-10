#!/bin/bash

TESTDIR=/tmp/apache-test-logs/test-run-`date +%Y-%m-%d-%H-%M-%S`

mkdir -p $TESTDIR
cd $TESTDIR

# Web landing page as http://new.qa.fencepost.com
curl --user fpdevtest:moompq -D http.new.qa.fencepost.com --location-trusted -o /dev/null http://new.qa.fencepost.com

