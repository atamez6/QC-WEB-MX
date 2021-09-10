*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem
Library        Process
Library         Collections

Library         /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/charles_proxy/charles_library.py
Variables      ${path_cv-pom}/loginPage/elementos_login_email.py
Variables      ${path_cv-pom}/loginPage/textos_elementos_login_email.py
Variables      ${path_cv-pom}/loginPage/elementos_login_pass.py
Variables      ${path_cv-pom}/loginPage/textos_elementos_login_pass.py
Variables      ${path_cv-pom}/anonymousLandingPage/elementos-landing-anonimo.py
Variables      ${path_cv-pom}/anonymousLandingPage/textos-landing-anonimo.py
Variables      ${path_cv-pom}/paymentPage/elements_payment_page.py
Variables      ${path_cv-pom}/paymentPage/labels_payment_page.py
Variables      ${path_cv-pom}/paymentPage/textos_promos_labels_payment_page.py
Variables      ${path_cv-pom}/paymentPage/textos_promos_payment_page.py
Variables      ${path_cv-pom}/HomePage/elementos_home_page.py
Variables      ${path_cv-pom}/HomePage/textos_home_page.py
Variables      ${path_cv-pom}/conocelaspromocionesPage/elementos_conocePromos.py

Variables      ${path_cv-pom}/registerPage/elementos-registerPage.py
Variables      ${path_cv-pom}/registerPage/textos-elementos-registerPage.py
Variables      ${path_cv-pom}/terminosyCondicionesPage/elementos_terminosycondiciones.py




*** Keywords ***
Abrir register page
  Open Browser   https://www.clarovideo.com/mexico/register    ${browser}


Abrir login page
  Open Browser       https://www.clarovideo.com/mexico/login     ${browser}

Abrir landing page
  Open Browser   https://www.clarovideo.com/mexico/landing     ${browser}

Abrir payment page
  OPEN BROWSER     https://www.clarovideo.com/mexico/payment    ${browser}

Abrir Home page cv
  OPEN BROWSER      https://www.clarovideo.com/mexico/home     ${browser}

Abrir politicas_de_privacidad page
  OPEN BROWSER      https://www.clarovideo.com/politicas_de_privacidad     ${browser}

Abrir licencia_usuario_final page
  OPEN BROWSER      https://www.clarovideo.com/licencia_usuario_final    ${browser}


ir a payment page
  [Arguments]     ${email}    ${password}
  Open Browser   https://www.clarovideo.com/mexico/login     ${browser}
  Ingresar email para login   ${email}
  Ingresar password para login   ${password}
  wait until page contains element     xpath=//img[@class='img-icon hover ']
  wait until element is visible       xpath=//img[@class='img-icon hover ']
  click element     xpath=//img[@class='img-icon hover ']
  wait until page contains element     xpath=/html/body/div[2]/div/div[2]/header/div
  go to   https://www.clarovideo.com/mexico/payment

click imagen perfil ir a Home page cv
   wait until element is visible        xpath=//img[@class='img-icon hover ']
    click element     xpath=//img[@class='img-icon hover ']



Cerrar Browser
  Close Browser
Cerrar todos los navegadores
  close all browsers

Configurar Directorio screenshots
    Set Screenshot Directory   ${screenshots}

Validar textos y elementos
  [Arguments]    ${e1}   ${e2}
   FOR  ${element}   IN   @{e1}
      Run Keyword And Continue On Failure   Wait Until Element is Visible      ${e1['${element}']}
      Run Keyword And Continue On Failure   element text should be      ${e1['${element}']}     ${e2['${element}']}
      Run Keyword And Continue On Failure   capture element screenshot    ${e1['${element}']}   #filename=${e2['${element}']}.png

   END

validador de texto con txt
     [Arguments]       ${excel_path}     ${e1['${element}']
     wait until element is visible   ${e1['${element}']
     ${saved_from_element}=    get text     ${e1['${element}']
     ${text_from_file} =  Get File     ${excel_path}   encoding=UTF-8    encoding_errors=strict
      should be equal as strings     ${saved_from_element}     ${text_from_file}
     Log     ${saved_from_element}
     Log     ${text_from_file}


validador de texto con selector de plan
   [Arguments]       ${e1}     ${e2}
       FOR   ${e}      IN  @{e1}
         double click element     ${e1['${e}']}
        ${saved_from_element}=        get text      ${e2['${e}']}
        #${path_text}=   Get Dictionary Keys      @{e1['${e}']}
        ${text_from_file} =    Get File      ${textos_payment}/${e}.txt     encoding=UTF-8    encoding_errors=strict
         run keyword and continue on failure    should be equal as strings      ${saved_from_element}      ${text_from_file}
        capture element screenshot    ${e2['${e}']}
         log      ${text_from_file}
         log      ${saved_from_element}
       END



Ingresar email para login
  [Arguments]     ${email}
    Wait Until Element is Visible    ${elementos_login_email['reg_emailtextbox']}
    input text          ${elementos_login_email['reg_emailtextbox']}       ${email}
    click button          ${elementos_login_email['log_siguiente']}

Ingresar password para login
    [Arguments]     ${password}
    Wait Until Element is Visible    ${elementos_login_pass['reg_pass_passtextbox']}
    input text          ${elementos_login_pass['reg_pass_passtextbox']}       ${password}
    click button          ${elementos_login_pass['log_pass_siguiente']}

login CV mx
  [Arguments]     ${email}    ${password}
  Open Browser   https://www.clarovideo.com/mexico/login     ${browser}
  Ingresar email para login   ${email}
  Ingresar password para login   ${password}

run charles and record ecuador
   start_charles_proxy_in_headless_mode_ec
   start_charles_proxy_session_recording

run charles and record
   start_charles_proxy_in_headless_mode
   start_charles_proxy_session_recording

download charles .chls and close it
   stop_charles_proxy_session_recording
   download_charles_proxy_session_recording
   terminate_all_charles_proxy_sessions

close charles
  stop_charles_proxy_session_recording
  terminate_all_charles_proxy_sessions

Login claro video mx
    Open Browser   https://www.clarovideo.com/mexico/login     ${browser}
    Ingresar email para login

Iniciar configuracion suitetest
   run charles and record

Iniciar configuracion suitetest ecuador
   run charles and record ecuador

abrir excel
   [Arguments]   ${excelPATH}
   open excel     ${excelPATH}

Terminar configuracion suitetest
   download charles .chls and close it
   Cerrar todos los navegadores

Iniciar configuracion test
  Configurar Directorio screenshots

Terminar configuracion test
   capture page screenshot
   Cerrar Browser

*** Variables ***
${browser}     chrome
${screenshots}      /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/Resultados/screenshots
${textos_payment}    /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/CV-POM/paymentPage/textosPayment
${path_cv-pom}      /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/CV-POM
