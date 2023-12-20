from selenium.webdriver.common.by import By
from config import *

def authorization(driver):
    data = {
            'login': LOGIN,
            'password': PASSWORD,
        }
    result_login = login(driver, data=data)
    if not result_login:
        return False
    
    return True


def login(driver, data):
    try:
        driver.get(HOST_IP+"/auth/login")
        input_username = driver.find_element(By.XPATH, "/html/body/main/div/form/div[1]/input")
        input_password = driver.find_element(By.XPATH, "/html/body/main/div/form/div[2]/input")
        input_username.send_keys(data['login'])
        input_password.send_keys(data['password'])
        driver.find_element(By.XPATH, "/html/body/main/div/form/button").click()
        if "Вы успешно авторизованы" in driver.find_element(By.XPATH, "/html/body/main/div/div").text:
            return True
        else:
            return False
    except:
        return False