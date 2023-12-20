from selenium.webdriver.common.by import By
from config import *

def addDrug(driver):
    try:
        driver.get(HOST_IP+"/drugs")
        driver.find_element(By.XPATH, "/html/body/main/div/div[1]/div/div/a").click()
        input_name = driver.find_element(By.ID, "inputName")
        input_method = driver.find_element(By.ID, "inputMethod")
        input_assumption = driver.find_element(By.ID, "inputAssumption")
        input_sideeffects = driver.find_element(By.ID, "inputSideeffects")

        input_name.send_keys(TESTDRUG)
        input_method.send_keys(TESTDRUG)
        input_assumption.send_keys(TESTDRUG)
        input_sideeffects.send_keys(TESTDRUG)

        driver.find_element(By.XPATH, "/html/body/main/div/form/div[5]/button").click()

        if "успешно добавлено" in driver.find_element(By.XPATH, "/html/body/main/div/div[1]").text:
            return True
        else:
            return False
    except:
        return False