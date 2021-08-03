*** Settings ***
Documentation      validar textos register page y terminos
Library            SeleniumLibrary
Library             OperatingSystem
Resource        /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/folderResources/variables/keywords.robot
Variables       /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/folderResources/pageObjects/terminosyCondiciones/elementos_terminosycondiciones.py
Variables       /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/folderResources/pageObjects/registerPage/elementos-registerPage.py
Variables       /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/folderResources/pageObjects/registerPage/textos-elementos-registerPage.py
Variables      /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/folderResources/pageObjects/conocelaspromociones/elementos_conocePromos.py
*** Test Cases ***
Preconditions
  [Tags]   runbrowser
  Abrir Navegador
  Configurar Directorio
TestCase-cvwebregpage
    [Tags]     runbrowser      cvwebregpage

    Validar textos y elementos     ${elementos_register_page}   ${textos_register_page}
    capture page screenshot
    Cerrar Browser


TestCase-cvwebterminospage
   [Tags]    runbrowser   cvwebterminospage
    Abrir Navegador
    wait until element is visible    ${elementos_register_page['reg_terms_link']}
    click element                   ${elementos_register_page['reg_terms_link']}
    wait until element is visible   ${elementos_terminosycondiciones['texto_terminos']}
    ${textoterminos} =    get text   ${elementos_terminosycondiciones['texto_terminos']}
    ${textoficialterminos} =  Get File        /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/folderResources/pageObjects/terminosyCondiciones/terminosycondicionesMX2021.txt     encoding=UTF-8    encoding_errors=strict
    should be equal as strings  ${textoterminos}    ${textoficialterminos}
    LOG      ${textoterminos}
    Log   ${textoficialterminos}
    capture page screenshot
    Cerrar Browser

TestCase-cvwebconocepromospagetelmex
     [Tags]      runbrowser     cvwebconocepromospage
     Abrir Navegador
      wait until element is visible      ${elementos_register_page['reg_terms_promo']}
      click element                     ${elementos_register_page['reg_terms_promo']}
      wait until element is visible     ${elementos_conocePromos['telmex_texto_promos']}
     ${textotelmex_promos}=    get text     ${elementos_conocePromos['telmex_texto_promos']}
     ${textooficialtelmex_promos} =  Get File     /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/folderResources/pageObjects/conocelaspromociones/textopromocionesTELMEX.txt   encoding=UTF-8    encoding_errors=strict
      should be equal as strings     ${textotelmex_promos}   ${textooficialtelmex_promos}
     Log     ${textotelmex_promos}
     Log     ${textooficialtelmex_promos}
     Cerrar Browser

TestCase-cvwebconocepromospagetelcel

     [Tags]      runbrowser     cvwebconocepromospage
     Abrir Navegador
      wait until element is visible      ${elementos_register_page['reg_terms_promo']}
      click element                     ${elementos_register_page['reg_terms_promo']}
      wait until element is visible     ${elementos_conocePromos['telcel_texto_promos']}
     ${textotelcel_promos}=    get text     ${elementos_conocePromos['telcel_texto_promos']}
     ${textooficialtelcel_promos} =  Get File     /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/folderResources/pageObjects/conocelaspromociones/textopromocionesTELCEL.txt   encoding=UTF-8    encoding_errors=strict
      should be equal as strings      ${textotelcel_promos}   ${textooficialtelcel_promos}
     Log     ${textotelcel_promos}
     Log    ${textooficialtelcel_promos}
      Cerrar Browser






*** Variables ***
${browser}   chrome
${screenshots}    /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/screenshots