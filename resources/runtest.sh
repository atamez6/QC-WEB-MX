#!/bin/bash
declare  fecha=$(date +"%m_%d_%Y_%H:%M:%S")
export   TESTNAME=tester.robot
cd  /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/QC-WEB-MX
networksetup -connectpppoeservice "uat-mx"
sleep 7
#pabot --processes 1   --outputdir   Resultados/${fecha}   testCases/CV-MX-WEB-ACCESO.robot
robot --outputdir   Resultados/${fecha}   testCases/${TESTNAME}
