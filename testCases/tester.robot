*** Settings ***
Documentation        validar funcionalidades ACCESO (NA_QC)
Resource             ../resources/common_functionalities/common_functionalities.robot
#Test Setup
Test Teardown        -TERMINAR CONFIGURACIÓN TESTCASE-
#-Suite Setup          -CONFIGURACIÓN INICIAL SUITETEST-
#-Suite Teardown       -TERMINAR CONFIGURACIÓN SUITETEST-


*** Test Cases ***

CV-MX-WEB-ACCESO-VALIDAR LOGIN CON USUARIO CORRECTO
   -LOGIN HOME CV-   ${email_valido}   ${pass_valido}
   #-LOGOUT HOME CV-
   #-CERRAR TODOS LOS NAVEGADORES-