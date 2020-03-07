import mysql.connector
from mysql.connector import Error
import IMDSS.config as cfg

try:
    connection = mysql.connector.connect(host=cfg.db['host'],
                                         database=cfg.db['name'],
                                         user=cfg.db['user'],
                                         password=cfg.db['password'])
    if connection.is_connected():
        db_Info = connection.get_server_info()
        print("Connected to MySQL Server version ", db_Info)
        cursor = connection.cursor()
        cursor.execute("select database();")
        record = cursor.fetchone()
        print("You're connected to database: ", record)

except Error as e:
    print("Error while connecting to MySQL", e)
finally:
    if (connection.is_connected()):
        cursor.close()
        connection.close()
        print("MySQL connection is closed")