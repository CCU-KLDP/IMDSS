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

#cur.execute('create table emr_cui_word(id int AUTO_INCREMENT PRIMARY KEY, EmrId varchar(50), Cui varchar(10), WordList varchar(20000))')

emrName = "WA2_1080926105745"
f = open('C:\\Users\\Louise\\IMDSS-Project\\IMDSS\\cui\\UMLS_RESULT\\'+ emrName +'.txt', 'r', encoding="utf-8")

str1 = 'C'

for line in f.readlines():
    if line.startswith(str1, 9) == True:
        cui = line[9:17]
        wordlist = line[18:]
        cur.execute('insert into emr_cui_word(EmrId,Cui,WordList) values(%s,%s,%s)',(emrName,cui,wordlist))

f.close()
cur.close()
conn.commit()
conn.close()
 