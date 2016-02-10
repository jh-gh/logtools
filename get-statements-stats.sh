#!/bin/bash

cd /var/log/fencepost

grep DefaultErrorHandler fencepost-error.2015-09*.log  fencepost-error.2015-10*.log fencepost-error.log | grep "Read timed out" >/home/jh1038/logs/statements-errors.txt
grep GetStatementsRequest fencepost-message.2015-09*.log fencepost-message.2015-10*.log  fencepost-message.log >/home/jh1038/logs/statements-requests.txt

chown jh1038 /home/jh1038/logs/*

