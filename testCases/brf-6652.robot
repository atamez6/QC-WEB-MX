*** Settings ***
Documentation        validar presencia de elementos y textos de cada elemento en  LANDING PAGE, LOGIN PAGE, ANONYMOUS PAGE
Resource             /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/keywords/sharedkeywords.robot
Test Setup           Iniciar configuracion test
Test Teardown        Terminar configuracion test
Suite Setup          Iniciar configuracion suitetest
Suite Teardown       Terminar configuracion suitetest



*** Test Cases ***
cv-anonymo
   Abrir landing page
   validar textos y elementos    ${elementos_landing_anonimo}     ${textos_landing_anonimo}
   abrir login page



