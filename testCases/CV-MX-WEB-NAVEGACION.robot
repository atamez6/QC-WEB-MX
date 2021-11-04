*** Settings ***
Documentation        validar funcionalidades NAVEGACION (NA_QC)
Resource             /Users/neyraa/Desktop/QC-py/QC-WEB-MX/resources/common_functionalities/common_functionalities.robot
#Test Setup           Iniciar configuracion test
#Test Teardown        Terminar configuracion test
#Suite Setup          Iniciar configuracion suitetest
#Suite Teardown       Terminar configuracion suitetest



*** Test Cases ***
CV-MX-WEB-ACCESO-VALIDAR ELEMENTOS LANDING PAGE
   -ABRIR LANDIND PAGE-
   -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_landing_anonimo}     ${textos_landing_anonimo}
   -CERRAR TODOS LOS NAVEGADORES-

CV-MX-WEB-ACCESO-VALIDAR ELEMENTOS LOGIN PAGE
   -ABRIR LOGIN PAGE-
   -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_login_email}     ${textos_elementos_login_email}
   -INGRESAR EMAIL PARA LOGIN-     ${email_valido}
   -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_login_pass}     ${textos_elementos_login_pass}
   -INGRESAR PASSWORD PARA LOGIN-  ${pass_valido}
   -CERRAR TODOS LOS NAVEGADORES-

CV-MX-WEB-ACCESO-VALIDAR ELEMENTOS REGISTER PAGE
  -ABRIR REGISTER PAGE-
  -VALIDAR TEXTOS Y ELEMENTOS-     ${elementos_register_page}    ${textos_register_page}
  -INGRESAR EMAIL PARA REGISTRO-   ${email_random}
  -VALIDAR TEXTOS Y ELEMENTOS-     ${elementos_register_page_pass}   ${textos_elementos_register_page_pass}
  -INGRESAR PASSWORD PARA REGISTRO-   ${pass_valido_registro}

CV-MX-WEB-NAVEGACION-VALIDAR ELEMENTOS HOME GRATIS PAGE

   -ABRIR LOGIN PAGE-
   -INGRESAR EMAIL PARA LOGIN-     ${email_gratis}
   -INGRESAR PASSWORD PARA LOGIN-  ${pass_gratis}
   Sleep   5
   -CLICK IMAGEN DE PERFIL-
   Sleep    8
   -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_home_page}     ${textos_home_page}
   -CERRAR TODOS LOS NAVEGADORES-

CV-MX-WEB-NAVEGACION-VALIDAR PLAN SELECTOR

   -ABRIR LOGIN PAGE-
   -INGRESAR EMAIL PARA LOGIN-    ${email_gratis}
   -INGRESAR PASSWORD PARA LOGIN-    ${pass_gratis}
   Sleep   5
   -CLICK IMAGEN DE PERFIL-
   Sleep    8
   -CLICK TICKER PLAN SELECTOR-
   Sleep   5
   -VALIDAR TEXTOS Y ELEMENTOS-    ${elementos_plan_selector_page}     ${textos_plan_selector_page}
   -CERRAR TODOS LOS NAVEGADORES-

CV-MX-WEB-NAVEGACION-VALIDAR-QUE-INCLUYE

   -ABRIR LOGIN PAGE-
   -INGRESAR EMAIL PARA LOGIN-    ${email_gratis}
   -INGRESAR PASSWORD PARA LOGIN-    ${pass_gratis}
   Sleep   5
   -CLICK IMAGEN DE PERFIL-
   Sleep    8
   -CLICK TICKER PLAN SELECTOR-
   Sleep   5
   -CLICK PLAN SELECTOR QUE INCLUYE CLARO VIDEO MENSUAL-
   -VALIDAR TEXTOS Y ELEMENTOS-  ${elementos_incluye_CV_page}     ${textos_incluye_CV_page}
   -BACK-
   -CLICK PLAN SELECTOR QUE INCLUYE CLARO VIDEO ANUAL-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_incluye_CV_page}     ${textos_incluye_CV_page}
   -BACK-
   -CLICK PLAN SELECTOR QUE INCLUYE FOX-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_incluye_fox_page}     ${textos_incluye_fox_page}
   -BACK-
   -CLICK PLAN SELECTOR QUE INCLUYE NOGGIN-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_incluye_noggin_page}     ${textos_incluye_noggin_page}
   -BACK-
   -CLICK PLAN SELECTOR QUE INCLUYE EDYE-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_incluye_edye_page}     ${textos_incluye_edye_page}
   -BACK-
   -CLICK PLAN SELECTOR QUE INCLUYE PICARDIA-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_incluye_picardia_page}     ${textos_incluye_picardia_page}
   -BACK-
   -CLICK PLAN SELECTOR QUE INCLUYE KARAOKE-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_incluye_karaoke_page}     ${textos_incluye_karaoke_page}
   -BACK-
   -CLICK PLAN SELECTOR QUE INCLUYE QELLO-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_incluye_qello_page}     ${textos_incluye_qello_page}
   -BACK-
   -CLICK PLAN SELECTOR QUE INCLUYE ATRES-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_incluye_atres_page}     ${textos_incluye_atres_page}
   -BACK-
   -CLICK PLAN SELECTOR QUE INCLUYE HBO-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_incluye_hbo_page}     ${textos_incluye_hbo_page}
   -BACK-
   -CLICK PLAN SELECTOR QUE INCLUYE INDYCAR-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_incluye_indy_page}     ${textos_incluye_indy_page}
   -BACK-
   -CLICK PLAN SELECTOR QUE INCLUYE STARZPLAY-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_incluye_starz_page}     ${textos_incluye_starz_page}
   -BACK-
   -CLICK PLAN SELECTOR QUE INCLUYE RTVE-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_incluye_rtve_page}     ${textos_incluye_rtve_page}
   -CERRAR TODOS LOS NAVEGADORES-

CV-MX-WEB-NAVEGACION-VALIDAR-NODO-CATALOGO
    [Tags]    login
   -ABRIR LOGIN PAGE-
   -INGRESAR EMAIL PARA LOGIN-    ${email_gratis}
   -INGRESAR PASSWORD PARA LOGIN-    ${pass_gratis}
   Sleep   8
   -CLICK IMAGEN DE PERFIL-
   Sleep    5
   -CLICK NODO CATALOGO-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_nodo_catalogo_page}     ${textos_nodo_catalogo_page}
   -CLICK SUBNODO PARAMOUNT-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_nodo_catalogo_paramount_page}     ${textos_nodo_catalogo_paramount_page}
   -CLICK SUBNODO PELICULAS-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_nodo_catalogo_peliculas_page}     ${textos_nodo_catalogo_peliculas_page}
   -CLICK SUBNODO SERIES-
   -VALIDAR TEXTOS Y ELEMENTOS-   ${elementos_nodo_catalogo_series_page}     ${textos_nodo_catalogo_series_page}
   -CERRAR TODOS LOS NAVEGADORES-

