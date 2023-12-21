import pytest
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time, sys
from selenium.webdriver.common.by import By

from config import HOST_IP

from login import login
from checkRights import checkRights
from addDrug import addDrug
from deleteDrug import deleteDrug
from findDrug import findDrug

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

   result_login = login(driver=driver)
   assert result_login == True, "Ошибка аутентификации."

   result_addDrug = addDrug(driver=driver)
   assert result_addDrug == True, "Ошибка добавления лекарства."

   result_findDrug = findDrug(driver=driver)
   assert result_findDrug == True, "Ошибка поиска лекарства."

   result_checkRights = checkRights(driver=driver)
   assert result_checkRights == True, "Ошибка неавторизованного доступа."

   driver.close()
   driver.quit()