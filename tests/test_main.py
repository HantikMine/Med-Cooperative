import pytest
from selenium import webdriver 
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time, sys
from selenium.webdriver.common.by import By

from auth import authorization
from config import HOST_IP


def test_main():
   options = webdriver.ChromeOptions()

   options.add_argument('--no-sandbox')
   options.add_experimental_option("excludeSwitches", ["enable-logging"])
   options.add_argument("--remote-debugging-port=9222")
   options.add_argument('--headless')
   options.add_argument("--disable-dev-shm-usage")
   driver = webdriver.Chrome(service=Service('/usr/bin/chromedriver'), options=options)

   driver.maximize_window()
   driver.implicitly_wait(60)
   
   driver.get(HOST_IP)

   result_authorization = authorization(driver=driver)
   assert result_authorization == True, "Ошибка в авторизации."

   driver.close()
   driver.quit()