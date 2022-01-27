*** Settings ***
Documentation        tester, archivo para probar cambios
Resource             ../resources/common_functionalities/tests_keywords.robot
Test Setup            -CONFIGURACIÓN TESTCASE-
Test Teardown        -TERMINAR CONFIGURACIÓN TESTCASE-
Suite Setup          -CONFIGURACIÓN INICIAL SUITETEST-
Suite Teardown       -TERMINAR CONFIGURACIÓN SUITETEST-


*** Test Cases ***
#CV-WEB-ACCESO-VALIDAR LOGOUT
  #  -LOGIN HOME CV-      ${email_valido}    ${pass_valido}
   # -LOGOUT HOME CV-

#CV-WEB-ACCESO-VALIDAR REGISTRO CON CUENTA NUEVA
 #  -ABRIR REGISTER PAGE-
  #  -INGRESAR EMAIL PARA REGISTRO-    ${EMAIL_RANDOM_PYTHON}
   # -INGRESAR PASSWORD PARA REGISTRO-  ${pass_valido_registro}

#CV-WEB-NAVEGACION-VALIDAR ELEMENTOS REGISTER PAGE
 # -ABRIR REGISTER PAGE-
  #-VALIDAR TEXTOS Y ELEMENTOS-     ${elementos_register_page}    ${textos_register_page}
  #-INGRESAR EMAIL PARA REGISTRO-   ${EMAIL_RANDOM_PYTHON}
  #-VALIDAR TEXTOS Y ELEMENTOS-     ${elementos_register_page_pass}   ${textos_elementos_register_page_pass}
  #-INGRESAR PASSWORD PARA REGISTRO-   ${pass_valido_registro}


#CV-MX-WEB-NAVEGACION-VALIDAR PLAN SELECTOR

  # -LOGIN HOME CV-      ${email_gratis}   ${pass_gratis}
 #  Sleep    8
   #-CLICK TICKER PLAN SELECTOR-
   #Sleep   5
   #-VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_plan_selector_page}     ${textos_plan_selector_page}
   #-CERRAR TODOS LOS NAVEGADORES-


#CV-MX-WEB-NAVEGACION-VALIDAR POLITICAS DE PRIVACIDAD
 #   -ABRIR POLITICAS PAGE-
  #  -VALIDAR TEXTOS CON XLSX-         ${politicas_xls}      Sheet1      ${politicas_de_privacidad['politicas_frame']}


CV-MX-WEB-NAVEGACION-TELMEX VALIDAR TEXTO TERMINOS Y PROMOCIONES
    -ABRIR REGISTER PAGE-
    -CLICK TERMINOS Y PROMOCIONES TELMEX-      ${elementos_register_page['reg_terms_promo']}
    -VALIDAR TEXTOS CON XLSX-     ${telmex_texto}      telmex         ${elementos_conocePromos['telmex_texto_promos']}