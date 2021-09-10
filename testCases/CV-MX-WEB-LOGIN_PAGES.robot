*** Settings ***
Documentation        validar presencia de elementos y textos de cada elemento en  LANDING PAGE, LOGIN PAGE, ANONYMOUS PAGE
Resource             /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/keywords/sharedkeywords.robot
Test Setup           Iniciar configuracion test
Test Teardown        Terminar configuracion test
Suite Setup          Iniciar configuracion suitetest
Suite Teardown       Terminar configuracion suitetest



*** Test Cases ***

CV-WEB-MX- VALIDAR ELEMENTOS Y TEXTOS LOGIN PAGE-EMAIL PAGE
   Abrir login page
   validar textos y elementos      ${elementos_login_email}      ${textos_elementos_login_email}


CV-WEB-MX- VALIDAR ELEMENTOS Y TEXTOS LOGIN PAGE-PASSWORD PAGE
    Abrir login page
    ingresar email para login       testqc01_990@gmail.com
    Validar textos y elementos      ${elementos_login_pass}       ${textos_elementos_login_pass}


CV-WEB-MX- VALIDAR FUNCION LOGIN
    Abrir login page
    login CV mx    testqc01_990@gmail.com   Claro123
    click imagen perfil ir a Home page cv


