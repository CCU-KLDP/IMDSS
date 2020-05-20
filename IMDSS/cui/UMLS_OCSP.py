"""
@Louise
Adjust from Chia-yi code. To get the txt file after using metamap.
"""
# coding: UTF-8

# In[ ]:


'''
此程式碼目的為將取得的病歷文本，丟進MetaMap的網頁中，並爬取其回饋的結果，存成txt。

說明：執行"Y"為初始執行，"N"為從暫存檔執行。
會先將DATA資料夾中的文本取得檔案的欄位內容(可自行修改)，並將其存進暫存檔UMLS_TEMP資料夾中，
再從暫存檔丟進METAMAP網頁中，並取得其回饋結果，存成txt檔至UMLS_RESULT資料夾中。

操作注意：(1)如要文本有修改需要初始化執行，請先確定UMLS_TEMP資料夾中是空的，執行後請按"Y"，開始初始化執行程式。不然預設都會先從暫存檔中取得文本。
(2)如執行後發現程式無法操作chromedriver瀏覽器，請去下載資料夾中chromedriver.exe的最新版本。

Credit By Chia-yi Bella Lin 
Program in Python 3

'''

import os,pandas as pd, numpy as np
from bs4 import BeautifulSoup
from selenium import webdriver
from time import sleep
from random import randint
from textstat.textstat import textstat


####################################################
'''
基本工作環境設置
'''

info={'url1':'https://ii.nlm.nih.gov/Interactive/UTS_Required/metamap.shtml','url2':'https://ii.nlm.nih.gov/Interactive/UTS_Required/metamap.shtml','username': '需輸入UMLS帳號','password': '需輸入UMLS密碼'}
Path=os.getcwd() + '\\IMDSS\\cui' + '/'
DataFolder=Path+'DATA/'
ResultFolder=Path+'UMLS_RESULT/'

TempFolder=Path+'UMLS_TEMP/'
'''
TempFolder=Path+'UMLS_RERUN/'
'''
d = os.path.dirname(ResultFolder)
if not os.path.exists(d):
    os.makedirs(d)
d = os.path.dirname(TempFolder)
if not os.path.exists(d):
    os.makedirs(d)
    
print('####Basic Setting is Completed####')
####################################################
'''
依照檔名前三碼進行分類資料(可自行新增陣列)
'''
'''
FileList={'A01':[],'D03':[]}
'''
FileList={'D02':[]}

os.listdir(DataFolder)
'''
for index in os.listdir(DataFolder):
    FileList[index[:3]].append(index)
'''
for index in os.listdir(DataFolder):
    if 'txt' in index:
        print ('skip ConsoleList.txt')
    else:
        FileList[index[:3]].append(index)
    
    
print('#### Classifying is Completed ####')
####################################################
'''
整合資料, 取出要使用的資料欄位並整理
假如字母數超過10000個字(len(text)), 則分為各個欄位不同筆
分析結束之後依照RegisterID作為primary key進行群組即可
'''

def Arrage():
    for index in os.listdir(DataFolder):
        f=pd.read_csv(DataFolder+index, encoding='UTF-8')
        f=f.replace(np.nan,'', regex=True)
        templist=list()
        if 'D02' in index:
            for i in range(0,len(f)):
                cnt=0
                obj=f.loc[i]
                t1=obj.PresentIllness.replace('@',',')

                cnt+=len(t1)
           
                ''' 欄位名稱可自行隨檔案的欄位名稱作更動 '''
                if cnt<10000:
                    templist.append({'RegisterID':obj.RegisterID,'inputtext':t1})
                elif cnt==0:
                    continue
                else:
                    templist.append({'RegisterID':obj.RegisterID,'inputtext':t1})

        else:
            print('***Please check the file, the RegisterID is not belong to the following list***')
            print('***[list] D02***')
        pd.DataFrame(templist).to_csv(TempFolder+'tempfile_'+index, encoding='UTF-8')
        print('***',index,' is done!***')
####################################################
'''
使用者登入
'''

def Login(username,password):
    driver.get(info['url1'])
    if driver.execute_script('return document.readyState;')=='complete':
        driver.find_element_by_id("username").send_keys(username)
        driver.find_element_by_id("password").send_keys(password)
        driver.find_element_by_name("submit").click()
####################################################   
'''
丟入分析, 錯誤處理如下
1) 分析中間如有錯誤直接進行重爬
2) 帳號暫時無法使用則隨機休息15-20秒再進行重新登入
3) 若在登入程序中發生錯誤, 隨機休息3-10秒再重新登入
'''

def SubmitText(index,RegisterID,InputText):
    fn=ResultFolder+'{}.txt'.format(RegisterID)
    while 1:
        try:
            driver.get(info['url2'])
        except TimeoutException:
            continue
        
        if driver.execute_script('return document.readyState;')=='complete':
            if driver.current_url == 'https://ii.nlm.nih.gov/Interactive/UTS_Required/metamap.shtml':
                try:
                    driver.find_element_by_name("InputText").send_keys(InputText)
                    driver.find_element_by_css_selector("button.all_show_hide").click()
                    sleep(1)
                    driver.find_element_by_name("CB100").click()
                    driver.find_element_by_name("NEGEX").click()
                    driver.find_element_by_name("WSD").click()
                    sleep(1)
                    driver.find_element_by_css_selector("input[type=\"button\"]").click()                
                    if driver.execute_script('return document.readyState;')=='complete' and driver.current_url == 'https://ii.nlm.nih.gov/cgi-bin/II/Interactive/UTS_Required/interactiveLocal.pl':
                        
                        soup = BeautifulSoup(driver.page_source, "html.parser")
                        
                        if os.path.exists(fn):
                            f=open(fn,'a', encoding='UTF-8')
                            f.write('\n')
                        else:
                            f=open(fn,'w', encoding='UTF-8')
                            
                        f.write(soup.select('pre')[-1].text)
                        f.close()
                        break
                except:
                    print('index in',index,'and RegisterID=',RegisterID,'occured!')
                    break
            elif 'https://utslogin.nlm.nih.gov/cas/login' in driver.current_url:
                try:
                    Login(info['username'],info['password'])
                except:
                    print('###Error Occur###')
                    sleep(randint(3, 10))
            else:
                sleep(randint(15, 20))
####################################################       
'''
主程式所在, 步驟如下:
1) 程式會詢問是否要初始化檔案(執行欄位整合子程式[Arrage()]), 如果輸入「y」才進行初始化(note: case-sensitive)
2) 產生模擬器(google driver)
3) 讀取檔案(格式規定UTF-8)
4) 進行分析 
5) 寫出檔案(格式規定UTF-8)
'''
if __name__ == '__main__':
    if input('initialize data?(y/n)')=='y':
        Arrage()
        print('###TempData is created###')

    options = webdriver.ChromeOptions()
    options.add_argument('--lang=en')
    driver = webdriver.Chrome(executable_path=Path + 'chromedriver',chrome_options=options)
    '''
    如果有發生錯誤, 在checker裡面以文字型態放RegisterID(如['123.xml','234.xml'])
    將僅針對checker所指定的RegisterID進行爬取, 其餘跳過
    若checker內部長度為0, 指沒有任何錯誤指定, 將爬取所有的資料
    '''
    checker=[]       
    for index in os.listdir(TempFolder):
        print('***Now is',index,'running***')
        f=pd.read_csv(TempFolder+index, encoding='UTF-8')
        templist=list()
        for i in range(0,len(f)):
            obj=f.loc[i]
            RegisterID=obj.RegisterID
           
            inputtext=obj.inputtext.replace('\t','')
            if (RegisterID not in checker) and len(checker)!=0:
                print('***skip***')
                continue
            print(' ',(i+1),RegisterID)
            SubmitText((i+1),RegisterID,inputtext)

