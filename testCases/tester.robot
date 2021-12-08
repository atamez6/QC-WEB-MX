*** Settings ***
Documentation        validar funcionalidades ACCESO (NA_QC)
Resource              /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/QC-WEB-MX/resources/common_functionalities/common_functionalities.robot
#Test Setup           Iniciar configuracion test
#Test Teardown        Terminar configuracion test
Suite Setup          -CONFIGURACIÓN INICIAL SUITETEST-
Suite Teardown       -TERMINAR CONFIGURACIÓN SUITETEST-

*** Test Cases ***
CV-MX-WEB-ACCESO-VALIDAR ELEMENTOS LANDING PAGE
   -ABRIR CHARLES-

   -ABRIR LANDIND PAGE-
   -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_landing_anonimo}     ${textos_landing_anonimo}

   -CERRAR TODOS LOS NAVEGADORES-
   -TERMINAR CHARLES-