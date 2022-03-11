*** Settings ***
Documentation        MÉXICO- suitetest Regression (NA)
Resource             ../resources/common_functionalities/tests_keywords.robot
Resource             ../resources/common_functionalities/libraries_keywords.robot
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

CV-WEB-NAVEGACION-VALIDAR ELEMENTOS HOME
      [Tags]     LAN1
    -LOGIN HOME CV-      ${email_gratis}    ${pass_gratis}
    Sleep     8
    -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_home_page}     ${textos_home_page}

CV-WEB-NAVEGACION-VALIDAR ELEMENTOS CATALOGO

    -LOGIN HOME CV-      ${email_gratis}    ${pass_gratis}
    Sleep     8
    -CLICK NODO CATALOGO-
    -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_nodo_catalogo_page}     ${textos_nodo_catalogo_page}

CV-WEB-NAVEGACION-VALIDAR ELEMENTOS PARAMOUNT

    -LOGIN HOME CV-      ${email_gratis}    ${pass_gratis}
    Sleep     8
    -CLICK NODO CATALOGO-
    -CLICK SUBNODO PARAMOUNT-
    -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_nodo_catalogo_paramount_page}     ${textos_nodo_catalogo_paramount_page}


CV-WEB-NAVEGACION-VALIDAR ELEMENTOS PELICULAS

    -LOGIN HOME CV-      ${email_gratis}    ${pass_gratis}
    Sleep     8
    -CLICK NODO CATALOGO-
    -CLICK SUBNODO PELICULAS-
    -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_nodo_catalogo_peliculas_page}     ${textos_nodo_catalogo_peliculas_page}

CV-WEB-NAVEGACION-VALIDAR ELEMENTOS SERIES

    -LOGIN HOME CV-      ${email_gratis}    ${pass_gratis}
    Sleep     8
    -CLICK NODO CATALOGO-
    -CLICK SUBNODO PELICULAS-
    -CLICK SUBNODO SERIES-
    -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_nodo_catalogo_series_page}     ${textos_nodo_catalogo_series_page}