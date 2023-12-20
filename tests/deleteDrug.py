from selenium.webdriver.common.by import By
from config import *

def deleteDrug(driver):
    try:
        driver.get(HOST_IP+"/drugs")
        all_rows = driver.find_elements(By.XPATH, "/html/body/main/div/table/tbody/tr")
        driver.find_element(By.XPATH, "/html/body/main/div/table/tbody/tr["+str(len(all_rows))+"]/td[6]/button").click()
        driver.find_element(By.XPATH, "/html/body/main/div/div[2]/div/div/div[3]/label").click()
        if "успешно удалено" in driver.find_element(By.XPATH, "/html/body/main/div/div[1]").text:
            return True
        else:
            return False
    except:
        return False