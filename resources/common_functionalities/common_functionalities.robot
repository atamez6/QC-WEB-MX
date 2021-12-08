*** Settings ***
Library        SeleniumLibrary     implicit_wait=15s
Library        OperatingSystem
Library        Process
Library        Collections
Library        /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/QC-WEB-MX/resources/charles_proxy/charles_library.py
Library          /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/QC-WEB-MX/resources/common_functionalities/email_random.py
Resource        /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/QC-WEB-MX/resources/common_functionalities/variables.robot
#Resource      /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/common_functionalities/special_functionalities.robot



*** Keywords ***
-ABRIR REGISTER PAGE-
  open browser   https://www.clarovideo.com/mexico/register    ${browser}

-ABRIR LOGIN PAGE-
   OPEN BROWSER    https://www.clarovideo.com/mexico/login       ${browser}

-ABRIR LANDIND PAGE-
  open browser   https://www.clarovideo.com/mexico/landing     ${browser}


-LOGIN HOME CV-
   [Arguments]                       ${email}   ${password}
  -ABRIR LOGIN PAGE-
  -INGRESAR EMAIL PARA LOGIN-        ${email}
  -INGRESAR PASSWORD PARA LOGIN-     ${password}
  -CLICK IMAGEN DE PERFIL-
   wait until page contains element     xpath=//i[@name='search']

-LOGOUT HOME CV-
#eleementos del menu dropdown de perfil home CV
   select from list by value      xpath=//*[@class='nav_profileMenu--span nav_profileMenu--padding']   'Cerrar Sesión'
   click element      xpath=//a[normalize-space()='Cerrar Sesión']


-VALIDAR USUARIO VALIDO CV-
   [Arguments]                       ${email}   ${password}
  -ABRIR LOGIN PAGE-
  -INGRESAR EMAIL PARA LOGIN-        ${email}
  -INGRESAR PASSWORD PARA LOGIN-     ${password}
  -CLICK IMAGEN DE PERFIL-
   wait until page contains element     xpath=//i[@name='search']

-VALIDAR USUARIO NO VALIDO CV-
   [Arguments]                       ${email}   ${password}
  -ABRIR LOGIN PAGE-
  -INGRESAR EMAIL PARA LOGIN-        ${email}
  -INGRESAR PASSWORD PARA LOGIN-     ${password}
   wait until page contains element    xpath=//div[@class='_l88cd _2hS3x']


-ABRIR PAYMENT PAGE-
  [Arguments]                        ${email}    ${password}
  -ABRIR HOME CV-
   go to   https://www.clarovideo.com/mexico/payment

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
  [Arguments]                        ${EMAIL_RANDOM}
   wait until element is visible     ${elementos_register_page['reg_emailtextbox']}
   input text                        ${elementos_register_page['reg_emailtextbox']}       ${EMAIL_RANDOM}
   click element                      ${elementos_register_page['reg_terms_check']}
   click button                      ${elementos_register_page['reg_siguiente']}

-INGRESAR PASSWORD PARA REGISTRO-
  [Arguments]                        ${pass_valido}
   wait until element is visible     ${elementos_register_page_pass['reg_passfield']}
   input text                        ${elementos_register_page_pass['reg_passfield']}       ${pass_valido}
   click button                      ${elementos_register_page_pass['reg_siguiente']}
   wait until page contains element     xpath=//i[@name='search']


-CLICK IMAGEN DE PERFIL-
   # wait until element is visible     xpath=//div[contains(@class,'image-grid-container')]//div[1]//div[1]//img[1]
    wait until page contains element    xpath=//div[contains(@class,'image-grid-container')]//div[1]//div[1]//img[1]
    click element                     xpath=//div[contains(@class,'image-grid-container')]//div[1]//div[1]//img[1]


-CERRAR NAVEGADOR-
    close browser

-CERRAR TODOS LOS NAVEGADORES-
    close all browsers

-CONFIGURAR DIRECTORIO SCREENSHOTS-
    set screenshot directory         ${screenshots-folder}

-ABRIR CHARLES-
    start_charles_proxy_in_headless_mode
    Sleep   5
    start_charles_proxy_session_recording

-TERMINAR CHARLES-
    download_charles_proxy_session_recording
    stop_charles_proxy_session_recording

    #convert_recorded_session_file
    Sleep   8
    terminate_all_charles_proxy_sessions

-CONFIGURACIÓN INICIAL SUITETEST-
    #-ABRIR CHARLES-
    set selenium timeout   10

-TERMINAR CONFIGURACIÓN SUITETEST-
    #-TERMINAR CHARLES-
    -CERRAR TODOS LOS NAVEGADORES-

-CONFIGURACIÓN TESTCASE-
   -CONFIGURAR DIRECTORIO SCREENSHOTS-

-TERMINAR CONFIGURACIÓN TESTCASE-
     capture page screenshot
    -CERRAR NAVEGADOR-

-EMAIL_RANDOM
    ${EMAIL_RANDOM}=    email_random_python

-VALIDAR TEXTOS Y ELEMENTOS-
  [Arguments]    ${a1}    ${a2}
   FOR  ${element}   IN   @{a1}
      scroll element into view    ${a1['${element}']}
      Run Keyword And Continue On Failure   Wait Until Element is Visible      ${a1['${element}']}
      Run Keyword And Continue On Failure   element text should be      ${a1['${element}']}    ${a2['${element}']}
      #Run Keyword And Continue On Failure   capture element screenshot    ${a1['${element}']}

   END

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

-CLICK TICKER PLAN SELECTOR-
  wait until page contains element    ${elementos_home_page['home_ticker']}
  click element   ${elementos_home_page['home_ticker']}

-CLICK PLAN SELECTOR QUE INCLUYE CLARO VIDEO MENSUAL-
  scroll element into view    ${elementos_plan_selector_page['claro_mensual_btn_incluye?']}
  wait until page contains element    ${elementos_plan_selector_page['claro_mensual_btn_incluye?']}
  click element   ${elementos_plan_selector_page['claro_mensual_btn_incluye?']}


-BACK-
   go back

-CLICK PLAN SELECTOR QUE INCLUYE CLARO VIDEO ANUAL-
  scroll element into view    ${elementos_plan_selector_page['claro_anual_btn_incluye?']}
  wait until page contains element    ${elementos_plan_selector_page['claro_anual_btn_incluye?']}
  click element   ${elementos_plan_selector_page['claro_anual_btn_incluye?']}

-CLICK PLAN SELECTOR QUE INCLUYE FOX-
  scroll element into view    ${elementos_plan_selector_page['fox_btn_incluye?']}
  wait until page contains element    ${elementos_plan_selector_page['fox_btn_incluye?']}
  click element   ${elementos_plan_selector_page['fox_btn_incluye?']}

-CLICK PLAN SELECTOR QUE INCLUYE NOGGIN-
  scroll element into view    ${elementos_plan_selector_page['noggin_btn_incluye?']}
  wait until page contains element    ${elementos_plan_selector_page['noggin_btn_incluye?']}
  click element   ${elementos_plan_selector_page['noggin_btn_incluye?']}

-CLICK PLAN SELECTOR QUE INCLUYE EDYE-
  scroll element into view    ${elementos_plan_selector_page['edye_btn_incluye?']}
  wait until page contains element    ${elementos_plan_selector_page['edye_btn_incluye?']}
  click element   ${elementos_plan_selector_page['edye_btn_incluye?']}

-CLICK PLAN SELECTOR QUE INCLUYE PICARDIA-
  scroll element into view    ${elementos_plan_selector_page['picardia_btn_incluye?']}
  wait until page contains element    ${elementos_plan_selector_page['picardia_btn_incluye?']}
  click element   ${elementos_plan_selector_page['picardia_btn_incluye?']}

-CLICK PLAN SELECTOR QUE INCLUYE KARAOKE-
  scroll element into view    ${elementos_plan_selector_page['karaoke_btn_incluye?']}
  wait until page contains element    ${elementos_plan_selector_page['karaoke_btn_incluye?']}
  click element   ${elementos_plan_selector_page['karaoke_btn_incluye?']}

-CLICK PLAN SELECTOR QUE INCLUYE QELLO-
  scroll element into view    ${elementos_plan_selector_page['qello_btn_incluye?']}
  wait until page contains element    ${elementos_plan_selector_page['qello_btn_incluye?']}
  click element   ${elementos_plan_selector_page['qello_btn_incluye?']}

-CLICK PLAN SELECTOR QUE INCLUYE ATRES-
  scroll element into view    ${elementos_plan_selector_page['atres_btn_incluye?']}
  wait until page contains element    ${elementos_plan_selector_page['atres_btn_incluye?']}
  click element   ${elementos_plan_selector_page['atres_btn_incluye?']}

-CLICK PLAN SELECTOR QUE INCLUYE HBO-
  scroll element into view    ${elementos_plan_selector_page['hbo_btn_incluye?']}
  wait until page contains element    ${elementos_plan_selector_page['hbo_btn_incluye?']}
  click element   ${elementos_plan_selector_page['hbo_btn_incluye?']}

-CLICK PLAN SELECTOR QUE INCLUYE INDYCAR-
  scroll element into view    ${elementos_plan_selector_page['indycar_btn_incluye?']}
  wait until page contains element    ${elementos_plan_selector_page['indycar_btn_incluye?']}
  click element   ${elementos_plan_selector_page['indycar_btn_incluye?']}

-CLICK PLAN SELECTOR QUE INCLUYE STARZPLAY-
  scroll element into view    ${elementos_plan_selector_page['starzplay_btn_incluye?']}
  wait until page contains element    ${elementos_plan_selector_page['starzplay_btn_incluye?']}
  click element   ${elementos_plan_selector_page['starzplay_btn_incluye?']}

-CLICK PLAN SELECTOR QUE INCLUYE RTVE-
  scroll element into view    ${elementos_plan_selector_page['rtve_btn_incluye?']}
  wait until page contains element    ${elementos_plan_selector_page['rtve_btn_incluye?']}
  click element   ${elementos_plan_selector_page['rtve_btn_incluye?']}




