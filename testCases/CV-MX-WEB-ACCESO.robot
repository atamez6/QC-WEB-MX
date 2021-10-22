*** Settings ***
Documentation        validar funcionalidades ACCESO (NA_QC)
Resource             /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/common_functionalities/common_functionalities.robot
#Test Setup           Iniciar configuracion test
#Test Teardown        Terminar configuracion test
Suite Setup          -CONFIGURACIÓN INICIAL SUITETEST-
Suite Teardown       -TERMINAR CONFIGURACIÓN SUITETEST-


*** Test Cases ***

CV-MX-WEB-ACCESO-VALIDAR LOGIN CON USUARIO CORRECTO
   -VALIDAR USUARIO VALIDO CV-   ${email_valido}   ${pass_valido}
   -CERRAR TODOS LOS NAVEGADORES-

CV-MX-WEB-ACCESO-VALIDAR LOGIN CON PASSWORD INCORRECTO
   -VALIDAR USUARIO NO VALIDO CV-   ${email_valido}   ${pass_novalido}
   -CERRAR TODOS LOS NAVEGADORES-

CV-MX-WEB-ACCESO-VALIDAR LOGOUT
    -LOGIN HOME CV-      ${email_valido}    ${pass_valido}
     -LOGOUT HOME CV-

CV-MX-WEB-ACCESO-VALIDAR REGISTRO CON CUENTA NUEVA
    -ABRIR REGISTER PAGE-
    -INGRESAR EMAIL PARA REGISTRO-   ${email_random1}
    -INGRESAR PASSWORD PARA REGISTRO-  ${pass_valido_registro} 


