*** Settings ***
Library        Selenium2Library       implicit_wait=20s
Library        OperatingSystem
Library        Process
Library        Collections
Library       ../../resources/charles_proxy/charles_library.py
Variables        ../common_functionalities/email_random.py
Resource       ../common_functionalities/variables.robot
Resource      ../common_functionalities/libraries_keywords.robot



*** Keywords ***
-CLICK ELEMENTO-
    [Arguments]   ${elemento}
    click element     ${elemento}

-ABRIR REGISTER PAGE-
  open browser    ${url_register_page}    ${browser}

-ABRIR LOGIN PAGE-
   OPEN BROWSER   ${url_login_page}     ${browser}




-ABRIR LANDIND PAGE-
  open browser     ${url_landing_page}    ${browser}

-ABRIR POLITICAS PAGE-
  open browser      ${url_politicas_page}    ${browser}

-ABRIR PAYMENT PAGE-
   -LOGIN HOME CV-
   go to   ${url_payment_page}

-LOGIN HOME CV-
   [Arguments]                       ${email}   ${password}

  -ABRIR LOGIN PAGE-
  -INGRESAR EMAIL PARA LOGIN-        ${email}
  -INGRESAR PASSWORD PARA LOGIN-     ${password}
   Sleep   20
  -CLICK IMAGEN DE PERFIL-
  -VALIDAR CARGA HOME-


-LOGOUT HOME CV-
   mouse down       ${profile_menu_page['close_session_inMenu']}
   click element       ${profile_menu_page['close_session_button']}


-VALIDAR USUARIO CV-
   [Arguments]                       ${email}   ${password}
  -ABRIR LOGIN PAGE-
  -INGRESAR EMAIL PARA LOGIN-        ${email}
  -INGRESAR PASSWORD PARA LOGIN-     ${password}


-VALIDAR USUARIO NO VALIDO CV-
   [Arguments]                       ${email}   ${password}
  -ABRIR LOGIN PAGE-
  -INGRESAR EMAIL PARA LOGIN-        ${email}
  -INGRESAR PASSWORD PARA LOGIN-     ${password}
   wait until page contains element    xpath=//div[@class='_l88cd _2hS3x']




-INGRESAR EMAIL PARA LOGIN-
  [Arguments]                        ${email}
   wait until element is visible     ${elementos_login_email['reg_emailtextbox']}
   input text                        ${elementos_login_email['reg_emailtextbox']}       ${email}
   click button                      ${elementos_login_email['log_siguiente']}

-INGRESAR PASSWORD PARA LOGIN-
    [Arguments]                      ${password}
    wait until element is visible    ${elementos_login_pass['reg_pass_passtextbox']}
    input text                       ${elementos_login_pass['reg_pass_passtextbox']}    ${password}
    click button                     ${elementos_login_pass['log_pass_siguiente']}

-INGRESAR EMAIL PARA REGISTRO-
   [Arguments]          ${EMAIL_RANDOM}
   wait until element is visible     ${elementos_register_page['reg_emailtextbox']}
   input text                        ${elementos_register_page['reg_emailtextbox']}       ${EMAIL_RANDOM}
   click element                      ${elementos_register_page['reg_terms_check']}
   click button                      ${elementos_register_page['reg_siguiente']}

-INGRESAR PASSWORD PARA REGISTRO-
  [Arguments]                        ${pass_valido}
   wait until element is visible     ${elementos_register_page_pass['reg_passfield']}
   input text                        ${elementos_register_page_pass['reg_passfield']}       ${pass_valido}
   click button                      ${elementos_register_page_pass['reg_siguiente']}



-CLICK IMAGEN DE PERFIL-
    Sleep   7
    wait until page contains element      ${elementos_profile_page['selectProfile_1_image']}
    click element                        ${elementos_profile_page['selectProfile_1_image']}


-VALIDAR CARGA HOME-
    Sleep   7
    wait until page contains element        ${elementos_home_page['home_lupa']}


-IR A POLITICAS DE PRIVACIDAD-
  go to   ${url_politicas_page}

-IR A LICENCIA DE USUARIO FINAL-
  go to   ${url_licenciaUsuario_page}


-CLICK TERMINOS Y PROMOCIONES TELMEX-
    [Arguments]           ${elemento}
    wait until page contains element     ${elemento}
     click element     ${elemento}


-CLICK NODO CATALOGO-
  wait until page contains element    ${elementos_home_page['home_nodo_catalogo']}
  click element   ${elementos_home_page['home_nodo_catalogo']}

-CLICK SUBNODO PARAMOUNT-
  scroll element into view    ${elementos_nodo_catalogo_page['catalogo_subnodo_paramount']}
  wait until page contains element    ${elementos_nodo_catalogo_page['catalogo_subnodo_paramount']}
  click element   ${elementos_nodo_catalogo_page['catalogo_subnodo_paramount']}

-CLICK SUBNODO PELICULAS-
  scroll element into view    ${elementos_nodo_catalogo_page['catalogo_subnodo_peliculas']}
  wait until page contains element    ${elementos_nodo_catalogo_page['catalogo_subnodo_peliculas']}
  click element   ${elementos_nodo_catalogo_page['catalogo_subnodo_peliculas']}

-CLICK SUBNODO SERIES-
  scroll element into view    ${elementos_nodo_catalogo_page['catalogo_subnodo_series']}
  wait until page contains element    ${elementos_nodo_catalogo_page['catalogo_subnodo_series']}
  click element   ${elementos_nodo_catalogo_page['catalogo_subnodo_series']}






