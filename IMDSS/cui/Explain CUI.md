“””
@Louise
Explain how to get cui
“””
----
## get cui步驟
1. 將各EMR文字存入資料夾DATA中的檔案(手動)
 * A01 -- 未讀”處置”
 * WA1 -- 內容過長分兩份,未讀”Laboratory Data”
 * WA2 -- 未讀”檢驗表格” 
 * D02 -- 內容過長,多為重複性資料,整筆未讀
2. 執行UMLS_OCSP，得到從METAMAP回饋之CUI結果
3. 資料夾UMLS_RESULT會得到各EMR之CUI結果的txt檔
 * 出現????為中文無法讀取
4. 執行get_cui，將CUI 10碼存入資料庫
