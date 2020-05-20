"""
@Louise
Store cui from txt to MYSQL.
"""

import MySQLdb

conn=MySQLdb.connect(
    host='140.123.173.62',
    port=3306,
    user='test_mysql',
    passwd='yJMxVnm3bwPW5CiF',
    db='test_mysql_ver2',
    charset='utf8'
     )

cur=conn.cursor()

#cur.execute('create table emr_cui(id int AUTO_INCREMENT PRIMARY KEY, EmrId varchar(50), CuiList varchar(20000))')

emrName = "檔名"
f = open('C:\\路徑\\IMDSS-Project\\IMDSS\\cui\\UMLS_RESULT\\'+ emrName +'.txt', 'r', encoding="utf-8")

str1 = 'C'
cuilist = ""
for line in f.readlines():
    if line.startswith(str1, 9) == True:
        cui = line[9:17]
        cuilist = cuilist + cui + ','

cur.execute('insert into emr_cui(EmrId,CuiList) values(%s,%s)',(emrName,cuilist))

f.close()
cur.close()
conn.commit()
conn.close()
 