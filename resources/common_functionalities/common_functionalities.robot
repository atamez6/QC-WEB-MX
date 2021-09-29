*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem
Library        Process
Library        Collections
Library        /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/charles_proxy/charles_library.py
Resource      /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/common_functionalities/variables.robot
Resource      /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/common_functionalities/special_functionalities.robot

*** Keywords ***
-ABRIR REGISTER PAGE-
  open browser   https://www.clarovideo.com/mexico/register    ${browser}

-ABRIR LOGIN PAGE-
  open browser    https://www.clarovideo.com/mexico/login       ${browser}

-ABRIR LANDIND PAGE-
  open browser   https://www.clarovideo.com/mexico/landing     ${browser}


-ABRIR HOME CV-
   [Arguments]                       ${email}   ${password}
  -ABRIR LOGIN PAGE-
  -INGRESAR EMAIL PARA LOGIN-        ${email}
  -INGRESAR PASSWORD PARA LOGIN-     ${password}
  -CLICK IMAGEN DE PERFIL-
   wait until page contains element     xpath=//i[@name='search']


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

-CLICK IMAGEN DE PERFIL-
    wait until element is visible    xpath=//img[@class='img-icon hover']
    click element                    xpath=//img[@class='img-icon hover']

-HACER LOG OUT-
    close browser

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
    -ABRIR CHARLES-

-TERMINAR CONFIGURACIÓN SUITETEST-
    -TERMINAR CHARLES-
    -CERRAR TODOS LOS NAVEGADORES-

-CONFIGURACIÓN TESTCASE-
   -CONFIGURAR DIRECTORIO SCREENSHOTS-

-TERMINAR CONFIGURACIÓN TESTCASE-
     capture page screenshot
    -CERRAR NAVEGADOR-





-VALIDAR TEXTOS Y ELEMENTOS-
   [Arguments]    ${elementos}   ${textos}
    FOR  ${element}   IN   @{elementos}
       Run Keyword And Continue On Failure   wait until element is visible      ${elementos['${element}']}
       Run Keyword And Continue On Failure   element text should be      ${elementos['${element}']}     ${textos['${element}']}
       Run Keyword And Continue On Failure   capture element screenshot    ${elementos['${element}']}
    END





