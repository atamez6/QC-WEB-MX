*** Variables ***
#variables globales
${browser}              chrome
${browser-chrome}       chrome
${browser-firefox}      firefox
${browser-safari}       safari
${email_valido}         s_tamezaa@globalhitss.com
${email_novalido}       ss_tamezaa@globalhitss.com
${pass_valido}          Claro123!
${pass_valido_registro}    Claro123
${pass_novalido}        Claro123
${email_gratis}         abc0000000000000023@gmail.com
${pass_gratis}          Claro123

#DirPaths
${localpath}                /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/QC-WEB-MX
${screenshots-folder}      ${localpath}/Resultados/screenshots
${textos_payment}          ${localpath}/resources/CV-POM/paymentPage/textosPayment
${path_cv-pom}             ${localpath}/resources/CV-POM
${politicas_xls}                          ${localpath}/testData/politicasMx.xls



#urls
${url_register_page}            https://www.clarovideo.com/mexico/register
${url_login_page}               https://www.clarovideo.com/mexico/login
${url_landing_page}             https://www.clarovideo.com/mexico/landing
${url_payment_page}             https://www.clarovideo.com/mexico/payment
${url_politicas_page}           https://www.clarovideo.com/politicas_de_privacidad
${url_licenciaUsuario_page}     https://www.clarovideo.com/licencia_usuario_final

*** Settings ***
#importar variables de elementos web desde diccionanarios .py
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
Variables      ${path_cv-pom}/registerPage/textos-elementos-registerPage-pass.py
Variables      ${path_cv-pom}/registerPage/elementos-registerPage-pass.py
Variables      ${path_cv-pom}/profilesPage/elementos_profile_page.py
Variables      ${path_cv-pom}/HomePage/profile_menu_page.py
Variables      ${path_cv-pom}/PoliticasPrivacidadPage/politicas_de_privacidad.py


#importar variables de funciones .py
Variables      ${localpath}/resources/common_functionalities/email_random.py