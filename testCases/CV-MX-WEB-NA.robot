*** Settings ***
Documentation        MÉXICO- suitetest Regression (NA)
Resource             ../resources/common_functionalities/tests_keywords.robot
Test Setup            -CONFIGURACIÓN TESTCASE-
Test Teardown        -TERMINAR CONFIGURACIÓN TESTCASE-
Suite Setup          -CONFIGURACIÓN INICIAL SUITETEST-
Suite Teardown       -TERMINAR CONFIGURACIÓN SUITETEST-


*** Test Cases ***
CV-WEB-NAVEGACION-VALIDAR ELEMENTOS LANDING PAGE
   -ABRIR LANDIND PAGE-
   -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_landing_anonimo}     ${textos_landing_anonimo}
   -CERRAR TODOS LOS NAVEGADORES-

CV-WEB-NAVEGACION-VALIDAR ELEMENTOS LOGIN PAGE
   -ABRIR LOGIN PAGE-
   -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_login_email}     ${textos_elementos_login_email}
   -INGRESAR EMAIL PARA LOGIN-     ${email_valido}
   -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_login_pass}     ${textos_elementos_login_pass}
   -INGRESAR PASSWORD PARA LOGIN-  ${pass_valido}
   -CERRAR TODOS LOS NAVEGADORES-

CV-WEB-NAVEGACION-VALIDAR ELEMENTOS REGISTER PAGE
  -ABRIR REGISTER PAGE-
  -VALIDAR TEXTOS Y ELEMENTOS-     ${elementos_register_page}    ${textos_register_page}


CV-WEB-ACCESO-VALIDAR LOGIN CON USUARIO CORRECTO
   -VALIDAR USUARIO CV-    ${email_valido}   ${pass_valido}
   -CERRAR TODOS LOS NAVEGADORES-

CV-WEB-ACCESO-VALIDAR LOGIN CON PASSWORD INCORRECTO
   -VALIDAR USUARIO CV-    ${email_valido}   ${pass_novalido}
   -CERRAR TODOS LOS NAVEGADORES-

CV-WEB-ACCESO-VALIDAR LOGOUT
    -LOGIN HOME CV-      ${email_valido}    ${pass_valido}
    -LOGOUT HOME CV-

#CV-WEB-ACCESO-VALIDAR REGISTRO CON CUENTA NUEVA
 #   -ABRIR REGISTER PAGE-
  #  -INGRESAR EMAIL PARA REGISTRO-    ${email_random_python}
   # -INGRESAR PASSWORD PARA REGISTRO-  ${pass_valido_registro}


