*** Settings ***
Documentation     Suite prueba para landing page anonima, valida existencia de elementos y texto de elementos
Library           SeleniumLibrary
Library             OperatingSystem
Resource        /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/folderResources/variables/keywords.robot
Variables         /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/folderResources/pageObjects/anonymousLanding/elementos-landing-anonimo.py
Variables         /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/folderResources/pageObjects/anonymousLanding/textos-landing-anonimo.py
 
*** Test Cases ***
Preconditions
   [Tags]   runbrowser
  Abrir Navegador

TestCase-cvwebanlan Validar elementos y textos landing anonima MX
   [Tags]    runbrowser    cvwebanlan
   Validar textos y elementos    ${elementos_landing_anonimo}    ${textos_landing_anonimo}





Close testing session
  [Tags]  runbrowser    cvwebanlan
  Cerrar Browser



*** Variables ***
${browser}  chrome


