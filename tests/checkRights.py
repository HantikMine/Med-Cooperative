from selenium.webdriver.common.by import By
from config import *

def checkRights(driver):
    try:
        driver.get(HOST_IP+"/auth/logout")
        driver.get(HOST_IP+"/cards")
        if "Для доступа к этой странице необходимо пройти процедуру аутентификации." in driver.find_element(By.XPATH, "/html/body/main/div/div").text:
            return True
        else:
            return False
    except:
        return False