*** Settings ***
Documentation        validar presencia de elementos y textos de cada elemento en REGISTER PAGE, T&C PAGE, PROMOTIONS_TELMEX, PROMOTIONS_TELCEL
Resource             /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/keywords/sharedkeywords.robot
Test Setup           Iniciar configuracion test
Test Teardown        Terminar configuracion test
Suite Setup          Iniciar configuracion suitetest
Suite Teardown       Terminar configuracion suitetest

*** Test Cases ***
CV-WEB-MX- VALIDAR ELEMENTOS Y TEXTOS REGISTER PAGE
    Abrir register page
    Validar textos y elementos     ${elementos_register_page}   ${textos_register_page}


CV-WEB-MX- VALIDAR ELEMENTOS Y TEXTOS REGISTER PAGE-T&C FRAME
    Abrir register page
    click element                   ${elementos_register_page['reg_terms_link']}
    wait until element is visible   ${elementos_terminosycondiciones['texto_terminos']}
    ${textoterminos} =    get text   ${elementos_terminosycondiciones['texto_terminos']}
    ${textoficialterminos} =  Get File         /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/CV-POM/terminosyCondicionesPage/terminosycondicionesMX2021.txt      encoding=UTF-8    encoding_errors=strict
    should be equal as strings  ${textoterminos}    ${textoficialterminos}
    LOG      ${textoterminos}
    Log      ${textoficialterminos}


CV-WEB-MX- VALIDAR ELEMENTOS Y TEXTOS REGISTER PAGE-TELMEX FRAME
      Abrir register page
      wait until element is visible      ${elementos_register_page['reg_terms_promo']}
      click element                     ${elementos_register_page['reg_terms_promo']}
      wait until element is visible     ${elementos_conocePromos['telmex_texto_promos']}
     ${textotelmex_promos}=    get text     ${elementos_conocePromos['telmex_texto_promos']}
     ${textooficialtelmex_promos} =  Get File     /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/CV-POM/conocelaspromocionesPage/textopromocionesTELMEX.txt   encoding=UTF-8    encoding_errors=strict
      should be equal as strings     ${textotelmex_promos}   ${textooficialtelmex_promos}
     Log     ${textotelmex_promos}
     Log     ${textooficialtelmex_promos}


CV-WEB-MX- VALIDAR ELEMENTOS Y TEXTOS REGISTER PAGE-TELCEL FRAME
      Abrir register page
      wait until element is visible      ${elementos_register_page['reg_terms_promo']}
      click element                     ${elementos_register_page['reg_terms_promo']}
      wait until element is visible     ${elementos_conocePromos['telcel_texto_promos']}
     ${textotelcel_promos}=    get text     ${elementos_conocePromos['telcel_texto_promos']}
     ${textooficialtelcel_promos} =  Get File       /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/CV-POM/conocelaspromocionesPage/textopromocionesTELCEL.txt     encoding=UTF-8    encoding_errors=strict
      should be equal as strings      ${textotelcel_promos}   ${textooficialtelcel_promos}
     Log     ${textotelcel_promos}
     Log    ${textooficialtelcel_promos}







