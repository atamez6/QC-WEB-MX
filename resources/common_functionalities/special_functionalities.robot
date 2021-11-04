*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem
Library        Process
Library        Collections
#Library        /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/charles_proxy/charles_library.py
Resource       /Users/neyraa/Desktop/QC-py/QC-WEB-MX/resources/common_functionalities/variables.robot

*** Keywords ***
-IR A POLITICAS DE PRIVACIDAD-
  go to  https://www.clarovideo.com/politicas_de_privacidad   ${browser}

-IR A LICENCIA DE USUARIO FINAL-
  go to  https://www.clarovideo.com/licencia_usuario_final    ${browser}


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

-ABRIR EXCEL-
   [Arguments]   ${excelPATH}
   open excel     ${excelPATH}