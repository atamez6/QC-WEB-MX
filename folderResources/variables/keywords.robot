*** Settings ***
Library     SeleniumLibrary
Library             OperatingSystem
*** Keywords ***
Abrir Navegador
  Open Browser   https://www.clarovideo.com/mexico/register    ${browser}
Cerrar Browser
  Close Browser

Configurar Directorio
    Set Screenshot Directory   ${screenshots}


Validar textos y elementos
  [Arguments]    ${a1}   ${a2}
   FOR  ${element}   IN   @{a1}

      Run Keyword And Continue On Failure   Wait Until Element is Visible      ${a1['${element}']}
      Run Keyword And Continue On Failure   element text should be      ${a1['${element}']}     ${a2['${element}']}

   END
