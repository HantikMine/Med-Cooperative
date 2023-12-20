from selenium.webdriver.common.by import By
from config import *

def findDrug(driver):
    driver.implicitly_wait(1)
    try:
        driver.get(HOST_IP+"/drugs")
        input_drug = driver.find_element(By.ID, "inputDrug")
        input_drug.send_keys(TESTDRUG)
        driver.find_element(By.XPATH, "/html/body/main/div/div[1]/form/div/div[2]/button").click()
        elems = driver.find_elements(By.XPATH, "/html/body/main/div/table/tbody/tr")
        if len(elems)!=0:
            return True
        else:
            return False
    except:
        return False