﻿"""
@Louise
Explain DB data which is usable.
"""
----
## db_models patient
* 已建十名病人
* 僅80000154 Adam Lee有資料
----
## db_models department
* 已建五個科別
* 僅Chest Medicine胸腔內科 / Neurology 神經內科 有評估表
----
## db_models doctor
* 已建六名醫生 先依tprdata紀錄者建立 均為021胸腔內科醫師

----
## tpr_data
* chtor_pat_no改為80000154 
* chtor_cre_dt欄位 1080919~1080927改為1080925~1081003
                 1060717~1060723 改為1081004~1081010
* chtor_cre_dt七碼為108年09月25日
* chtor_cre_ti六碼為時間124939為12:49:39
(住院編碼/伺服器儲存時間未改)
----
##ni_PtMARec
* exeDt欄位 20190214…~20190222…改為20190925~20191010
* saveDt欄位 20190214…~20190222…改為20190925~20191010
* 前8碼為日期 後6碼為時間
----
## ni_PtOrderUD
* PT_NO改為80000154

----
## mri_mri data
* 病人80000154 醫師05340
* 路徑images/mri/檔名.jpg
----
## db_models emr data
* 存含有xml tag的病歷
* EmrId
 * 病摘-入院病摘   ：WA1
 * 病摘-Progress note：WA2
 * 病摘-Problem List ：WA3
 * 病摘-Special note ：WA4
 * 門診病歷：A01    
 * 急診病歷：A01 			     
 * 住院會診：A03
 * 急診會診：A04
 * 出院病摘：D02
 * 手術記錄：D03
----
##db_models xsl data
* 存含有tag的xsl檔


