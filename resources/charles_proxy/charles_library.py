import sysconfig
import os
import time
import psutil
import requests

from datetime import datetime

charles_proxy_application_path= "/Users/at/Library/charles/Contents/MacOS/"
local_machine_url_requests_proxy = {'http': 'http://127.0.0.1:8888/'}
charles_proxy_start_recording_url = "http://control.charles/recording/start"
charles_proxy_stop_recording_url = "http://control.charles/recording/stop"
charles_proxy_download_recording_url = "http://control.charles/session/download"

def start_charles_proxy_in_headless_mode():
    current_working_directory = os.getcwd()

    charles_proxy_configuration_file_path = "/Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/resources/charles_proxy/com.xk72.charles.config"
    os.system("Charles" + " -headless -config " + charles_proxy_configuration_file_path + " &")
    time.sleep(4)


def start_charles_proxy_session_recording():
    start = requests.get(charles_proxy_start_recording_url, proxies=local_machine_url_requests_proxy)
    return start

def stop_charles_proxy_session_recording():
    stop = requests.get(charles_proxy_stop_recording_url, proxies=local_machine_url_requests_proxy)
    return stop

def download_charles_proxy_session_recording():
    current_working_directory = os.getcwd()
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    original_raw_charles_proxy_session_file_path = "/Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/Resultados/charles_traces/{current_time}.chls".format(current_time=current_time)
    download = requests.get(charles_proxy_download_recording_url, proxies=local_machine_url_requests_proxy)
    open(original_raw_charles_proxy_session_file_path, 'ab').write(download.content)

    #os.system("curl -o claro_video.chls http://control.charles/session/download")


def convert_recorded_session_file():
    current_working_directory = os.getcwd()
    original_raw_charles_proxy_session_file_path = "/Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/Resultados/session.chls"
    converted_json_charles_proxy_session_file_path = "/Users/at/Desktop/AT-auto/robotFramework/auto_py/QC-WEB-MX/Resultados/session.chlsj"
    os.system(charles_proxy_application_path + " Charles" + " convert" + " " + original_raw_charles_proxy_session_file_path + " " + converted_json_charles_proxy_session_file_path)

def terminate_all_charles_proxy_sessions():
    os.system("killall -9 Charles")
    os.system("killall -9 Charles *")
    os.system("networksetup -setwebproxystate Wi-Fi off")
    os.system("networksetup -setsecurewebproxystate Wi-Fi off")
