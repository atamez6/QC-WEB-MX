*** Settings ***
Library        SeleniumLibrary     implicit_wait=10s
Library        OperatingSystem
Library        Process
Library        Collections
#Library        /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/charles_proxy/charles_library.py
Resource      /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/common_functionalities/variables.robot
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
  [Arguments]                        ${email}
   wait until element is visible     ${elementos_register_page['reg_emailtextbox']}
   input text                        ${elementos_register_page['reg_emailtextbox']}       ${email}
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
    start_charles_proxy_session_recording

-TERMINAR CHARLES-
    stop_charles_proxy_session_recording
    download_charles_proxy_session_recording
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


-VALIDAR TEXTOS Y ELEMENTOS-
  [Arguments]    ${a1}    ${a2}
   FOR  ${element}   IN   @{a1}
      Run Keyword And Continue On Failure   Wait Until Element is Visible      ${a1['${element}']}
      Run Keyword And Continue On Failure   element text should be      ${a1['${element}']}    ${a2['${element}']}
      Run Keyword And Continue On Failure   capture element screenshot    ${a1['${element}']}

   END






