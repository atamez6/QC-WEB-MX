*** Variables ***
${browser}          chrome
${browser-chrome}   chrome
${browser-firefox}  firefox
${browser-safari}   safari
${screenshots-folder}      /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/Resultados/screenshots
${textos_payment}    /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/CV-POM/paymentPage/textosPayment
${path_cv-pom}      /Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/CV-POM

*** Settings ***
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