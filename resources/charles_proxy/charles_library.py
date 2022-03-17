import os
import time


from datetime import datetime

<<<<<<< HEAD
charles_proxy_application_path = "/Users/at/Library/charles/Contents/MacOS/"
local_machine_url_requests_proxy = "http://192.168.1.68:8888"
=======
charles_proxy_application_path = "/Users/Library/charles/Contents/MacOS/"
local_machine_url_requests_proxy = "http://192.168.1.66:8888"
>>>>>>> 56a4e31570bfcef936bc4ebd4c8e743f7d83a175
charles_proxy_start_recording_url = "http://control.charles/recording/start"
charles_proxy_stop_recording_url = "http://control.charles/recording/stop"
charles_proxy_download_recording_url = "http://control.charles/session/download"
charles_proxy_configuration_file_path = "/Users/neyraa/Desktop/QC-py/QC-WEB-MX/resources/charles_proxy/com.xk72.charles.config"
charles_local_path = "/Users/neyraa/Desktop/QC-py/QC-WEB-MX/Resultados/charles_traces/"


def start_charles_proxy_in_headless_mode():

    os.system("charles" + " -headless -config " + charles_proxy_configuration_file_path + " &")
    time.sleep(4)


def start_charles_proxy_session_recording():
    start = os.system("curl -v -x " + local_machine_url_requests_proxy + " " + charles_proxy_start_recording_url)
    return start


def stop_charles_proxy_session_recording():
    stop = os.system("curl -v -x " + local_machine_url_requests_proxy + " " + charles_proxy_stop_recording_url)
    return stop


def download_charles_proxy_session_recording():
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    #current_time = os.system("export TESTNAME")
    test_suite_name = os.environ["TESTNAME"]
    downloaded_session_chls = "{charles_local_path}{test_suite_name}{current_time}".format(current_time=current_time,test_suite_name=test_suite_name,charles_local_path=charles_local_path)
    download_charles = os.system("curl -v -x " + local_machine_url_requests_proxy + " " + charles_proxy_download_recording_url + " --output " + downloaded_session_chls + ".chls")
    return download_charles


def terminate_all_charles_proxy_sessions():
    os.system("killall -9 charles")
    os.system("killall -9 charles *")
    os.system("networksetup -setwebproxystate Wi-Fi off")
    os.system("networksetup -setsecurewebproxystate Wi-Fi off")
