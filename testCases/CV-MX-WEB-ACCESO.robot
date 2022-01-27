*** Settings ***
Documentation        MÉXICO- Validar funcionalidades de ACCESO (NA_QC)
Resource             ../resources/common_functionalities/tests_keywords.robot
Test Setup            -CONFIGURACIÓN TESTCASE-
Test Teardown        -TERMINAR CONFIGURACIÓN TESTCASE-
Suite Setup          -CONFIGURACIÓN INICIAL SUITETEST-
Suite Teardown       -TERMINAR CONFIGURACIÓN SUITETEST-


*** Test Cases ***

CV-WEB-ACCESO-VALIDAR LOGIN CON USUARIO CORRECTO
   -VALIDAR USUARIO CV-    ${email_valido}   ${pass_valido}
   -CERRAR TODOS LOS NAVEGADORES-

CV-WEB-ACCESO-VALIDAR LOGIN CON PASSWORD INCORRECTO
   -VALIDAR USUARIO CV-    ${email_valido}   ${pass_novalido}
   -CERRAR TODOS LOS NAVEGADORES-

CV-WEB-ACCESO-VALIDAR LOGOUT
    -LOGIN HOME CV-      ${email_valido}    ${pass_valido}
     -LOGOUT HOME CV-

CV-WEB-ACCESO-VALIDAR REGISTRO CON CUENTA NUEVA
    -ABRIR REGISTER PAGE-
    -INGRESAR EMAIL PARA REGISTRO-    ${email_random_python}
    -INGRESAR PASSWORD PARA REGISTRO-  ${pass_valido_registro} 


