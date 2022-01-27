*** Settings ***
Library        Selenium2Library       implicit_wait=20s
Library        OperatingSystem
Library        Process
Library        Collections
Library       ../../resources/charles_proxy/charles_library.py
Resource       ../common_functionalities/variables.robot

Library           String
Library	       ExcelLibrary

*** Keywords ***
# Charles Keywords
-ABRIR CHARLES-
    start_charles_proxy_in_headless_mode
    Sleep   4

-INICIAR GRABACION CHARLES-
    start_charles_proxy_session_recording

-DETENER GRABACION CHARLES-
   stop_charles_proxy_session_recording

-DESCARGAR SESION CHARLES-
    download_charles_proxy_session_recording

-CERRAR CHARLES-
     terminate_all_charles_proxy_sessions

#Suites and tests configurations
-CERRAR TODOS LOS NAVEGADORES-
    close all browsers

-CONFIGURAR DIRECTORIO SCREENSHOTS-
    set screenshot directory         ${screenshots-folder}

-CONFIGURACIÓN INICIAL SUITETEST-
    -ABRIR CHARLES-
    -INICIAR GRABACION CHARLES-

-TERMINAR CONFIGURACIÓN SUITETEST-
   -DESCARGAR SESION CHARLES-
   -DETENER GRABACION CHARLES-
    -CERRAR TODOS LOS NAVEGADORES-
    -CERRAR CHARLES-

-CONFIGURACIÓN TESTCASE-
   -CONFIGURAR DIRECTORIO SCREENSHOTS-

-TERMINAR CONFIGURACIÓN TESTCASE-
     capture page screenshot



# Excel Keywords
-ABRIR EXCEL-
   [Arguments]   ${excelPATH}
   open excel     ${excelPATH}


#Functions
-VALIDAR TEXTOS Y ELEMENTOS-
  [Arguments]    ${a1}    ${a2}
   FOR  ${element}   IN   @{a1}
      Run Keyword And Continue On Failure   Wait Until Element is Visible      ${a1['${element}']}
      Run Keyword And Continue On Failure   element text should be      ${a1['${element}']}    ${a2['${element}']}
      Run Keyword And Continue On Failure   capture element screenshot    ${a1['${element}']}
   END

-VALIDAR TEXTOS CON XLSX-
   [Arguments]       ${excel_path}        ${sheet_name}    ${sheet_name2}    ${e1['elemento']}
   wait until element is visible   ${e1['elemento']}
   capture element screenshot     ${e1['elemento']}
   Open excel     ${excel_path}
   ${texto_frame_privacidad} =   get text   ${e1['elemento']}
   ${texto_excel_privacidad}=    Read Cell Data By Coordinates     ${sheet_name}   0    0
   Run Keyword And Continue On Failure     should be equal as strings      ${texto_frame_privacidad}    ${texto_excel_privacidad}    collapse_spaces=True     strip_spaces=True
   log  ${texto_frame_privacidad}
   log   ${texto_excel_privacidad}

#funciones para reparar
validador de texto con selector de plan
   [Arguments]       ${e1}     ${e2}
       FOR   ${e}      IN  @{e1}
         double click element     ${e1['${e}']}
        ${saved_from_element}=        get text      ${e2['${e}']}
        #${path_text}=   Get Dictionary Keys      @{e1['${e}']}
        ${text_from_file} =    Get File      ${textos_payment}/${e}.txt     encoding=UTF-8    encoding_errors=strict
         run keyword and continue on failure    should be equal as strings      ${saved_from_element}      ${text_from_file}    collapse_spaces=True     strip_spaces=True
        capture element screenshot    ${e2['${e}']}
         log      ${text_from_file}
         log      ${saved_from_element}
       END