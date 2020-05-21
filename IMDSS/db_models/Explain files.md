"""
@Louise
Explain files which manual storage into mysql.
"""
----
## 檔案名稱TPR_DATA 1
* 醫院提供之病患生理監測記錄檔
* 此為原始檔，處理後資料存於db_models_tpr_data
* 用於病人資料視覺化中病患生理圖表、血壓資料
* 各欄位意義參考CH_TOR.txt檔案
----
##檔案名稱ni_PtMARec
* 醫院提供之給藥記錄檔
* 此為原始檔
* 用於病人資料視覺化中藥物使用情形
* 需與檔案ni_PtOrderUD一同對照使用
* 各欄位意義參考ni_PtMARec.doc檔案
----
##檔案名稱ni_PtOrderUD
* 醫院提供之UD醫囑
* 此為原始檔
* 用於病人資料視覺化中藥物使用情形
* 需與檔案ni_PtMARec一同對照使用
* 各欄位意義參考ni_PtOrderUD.doc檔案
----
##檔案名稱test_emr
* 存學長已處理好之病歷xml資料
* 用於emr頁面之病歷
* 各欄位意義
 * Patient_ID      病人編號
 * ChartNo         病歷編號
 * AdmissionDate   X
 * ERDate          X 
 * NoteType        病歷類別(住院病歷、病程紀錄等)
 * DateTime        病歷時間
 * Serial          病歷行號
 * Content         病歷內容
 * Id              唯一識別值