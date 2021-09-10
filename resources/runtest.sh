#!/bin/bash
declare  fecha=$(date +"%m_%d_%Y_%H:%M:%S")

cd /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX
pabot --processes 1  --outputdir   Resultados/${fecha}   testCases/brf-6652.robot
