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

emrName = "D02_1081003154945"
f = open('C:\\DATA\\School\\專題\\整合後data\\'+ emrName +'.txt', 'r', encoding="utf-8")

sequence = 1
for line in f.readlines():
    cur.execute('insert into db_models_emr_data(EmrId,Sequence,Emrcontent) values(%s,%s,%s)',(emrName,sequence,line))
    sequence += 1

f.close()
cur.close()
conn.commit()
conn.close()