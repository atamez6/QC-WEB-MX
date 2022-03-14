#!/bin/bash
cd  /Users/neyraa/Desktop/QC-py/QC-WEB-MX
networksetup -connectpppoeservice "Mexico-Global-UAT"
sleep 4

declare -a tests=(CV-MX-WEB-NAVEGACION CV-MX-WEB-ACCESO CV-MX-WEB-NA)
declare -a tests=(tester)
killall -9 charles
killall -9 Charles
for testname in "${tests[@]}"
do

  declare  fecha=$(date +"%m_%d_%Y_%H:%M:%S")
  export   TESTNAME="$testname"
  #pabot --processes 1   --outputdir   Resultados/${fecha}   testCases/CV-MX-WEB-ACCESO.robot
  robot --outputdir   Resultados/${TESTNAME}${fecha}   testCases/${TESTNAME}.robot
done

networksetup -setwebproxystate Wi-Fi off
networksetup -setsecurewebproxystate Wi-Fi off
networksetup -disconnectpppoeservice "Mexico-Global-UAT"
