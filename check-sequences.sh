#!/bin/bash

archivedir=/usr/pentaho/etl_data/mpq/archive

ls -1 $archivedir/GEN_* | sed -e "s/.*GEN_/GEN_/" | tail -1
ls -1 GEN_* | head -1

ls -1 $archivedir/DTC_0* | sed -e "s/.*DTC_0/DTC_0/" | tail -1
ls -1 DTC_0* | head -1

ls -1 $archivedir/DTQ_0* | sed -e "s/.*DTQ_0/DTQ_0/" | tail -1
ls -1 DTQ_* | head -1
