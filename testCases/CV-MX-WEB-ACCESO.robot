*** Settings ***
Documentation        validar funcionalidades ACCESO (NA_QC)
Resource             /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/common_functionalities/common_functionalities.robot
#Test Setup           Iniciar configuracion test
#Test Teardown        Terminar configuracion test
#Suite Setup          Iniciar configuracion suitetest
#Suite Teardown       Terminar configuracion suitetest


*** Test Cases ***
cv-anonymo
   -ABRIR LANDIND PAGE-
   -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_landing_anonimo}     ${textos_landing_anonimo}
   -cerrar todos los navegadores-

#cv- no permittirr acceso on usuario y password no existente

#cv- ingreso con usuario valido

#cv-registro


