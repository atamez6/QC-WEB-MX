modificar rutas=>



-runtest.sh
(cambiar path de projecto y nombre de la vpn)
cd  /Users/tusuario/Desktop/carpeta/robotFramework/auto_py/QC-WEB-MX/QC-WEB-MX
networksetup -connectpppoeservice "uat-mx"

declare -a tests=(CV-MX-WEB-NAVEGACION CV-MX-WEB-ACCESO CV-MX-WEB-NA) **añadir los nombres de los casos nuevos


-Charles
local_machine_url_requests_proxy ( colocar ip local de charles)
charles_proxy_application_path(path de la app charles) ej "/Users/tuusuario/Library/charles/Contents/MacOS/"
charles_proxy_configuration_file_path (ruta del com.xk72.charles.config,preferentemente usar el que esta en el proyecto)
charles_local_path(/ruta de tu proyecto/QC-WEB-MX/QC-WEB-MX/Resultados/charles_traces/




-Variables .robot
${localpath}                /Users/tusuario/Desktop/carpeta/robotFramework/auto_py/QC-WEB-MX/QC-WEB-MX (personalizar con path de proyecto)
ajustar usuarios/pass  si es necesario


-plugins y paquetes
.robotframework plugin (vallerio angelini) en pycharm
.selenium2library
.brew to install pip
pip install requests
pip install robotframework-excellibrary-xwfintech==0.0.3
