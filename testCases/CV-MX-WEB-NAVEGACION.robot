*** Settings ***
Documentation        validar funcionalidades NAVEGACION (NA_QC)
Resource             /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/QC-WEB-MX/resources/common_functionalities/common_functionalities.robot
#Test Setup           Iniciar configuracion test
#Test Teardown        Terminar configuracion test
#Suite Setup          Iniciar configuracion suitetest
#Suite Teardown       Terminar configuracion suitetest



*** Test Cases ***
CV-MX-WEB-ACCESO-VALIDAR ELEMENTOS LANDING PAGE
   -ABRIR LANDIND PAGE-
   -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_landing_anonimo}     ${textos_landing_anonimo}
   -CERRAR TODOS LOS NAVEGADORES-

CV-MX-WEB-ACCESO-VALIDAR ELEMENTOS LOGIN PAGE
   -ABRIR LOGIN PAGE-
   -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_login_email}     ${textos_elementos_login_email}
   -INGRESAR EMAIL PARA LOGIN-     ${email_valido}
   -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_login_pass}     ${textos_elementos_login_pass}
   -INGRESAR PASSWORD PARA LOGIN-  ${pass_valido}
   -CERRAR TODOS LOS NAVEGADORES-

CV-MX-WEB-ACCESO-VALIDAR ELEMENTOS REGISTER PAGE
  -ABRIR REGISTER PAGE-
  -VALIDAR TEXTOS Y ELEMENTOS-     ${elementos_register_page}    ${textos_register_page}
  -INGRESAR EMAIL PARA REGISTRO-   ${email_random}
  -VALIDAR TEXTOS Y ELEMENTOS-     ${elementos_register_page_pass}   ${textos_elementos_register_page_pass}
  -INGRESAR PASSWORD PARA REGISTRO-   ${pass_valido_registro}
