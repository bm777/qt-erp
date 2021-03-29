#!/usr/bin/python

import MySQLdb


# Open database connection
ip = "localhost"
username = "root"
password = "plok"
db_name = "gsf_db"
db = MySQLdb.connect(ip, username ,password, db_name )

# prepare a cursor object using cursor() method
cursor = db.cursor()

# Drop table if it already exist using execute() method.
#cursor.execute("DROP TABLE IF EXISTS PRODUIT")

# Create table as per requirement
sql = """CREATE TABLE PRODUIT (
         REF  CHAR(20) NOT NULL,
         DESCRIPTION  CHAR(20),
         PRIX INT,  
         TAUX FLOAT,
         REMARQUE CHAR(20) )"""


cursor.execute(sql)

# disconnect from server
db.close()