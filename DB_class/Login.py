#!/usr/bin/python3

import sqlite3
import time

class Login:
    def __init__(self, db_name):
        self.name = "Login class"
        self.database_name = db_name
        self.conn = None
        self.PRAGMA = "PRAGMA foreign_keys = ON;"
        self.create_table()

    def time_now(self):
        return f"{time.gmtime().tm_year}-{time.gmtime().tm_mon}-{time.gmtime().tm_mday} {time.gmtime().tm_hour}:{time.gmtime().tm_min}:{time.gmtime().tm_sec}"

    def connexion(self):
        return  sqlite3.connect(self.database_name)

    def create_table(self):
        self.conn = self.connexion()
        self.conn.execute(self.PRAGMA)
        self.conn.execute('''CREATE TABLE IF NOT EXISTS Login
                                    (id INTEGER PRIMARY KEY AUTOINCREMENT,
                                    user_id INTEGER,
                                    date CHAR(50) NOT NULL,
                                    FOREIGN KEY (user_id) REFERENCES User(id));''')
        self.conn.close()



    def insert(self, sql):
        self.conn = self.connexion()
        self.conn.execute(self.PRAGMA)
        self.conn.execute(sql)
        self.conn.commit()
        self.conn.close()

    def select(self, sql):
        data = []
        self.conn = self.connexion()
        cursor = self.conn.execute(sql)
        tmp = [d for d in cursor]
        for item in tmp:
            data.append([i for i in item])
        self.conn.commit()
        self.conn.close()
        return data

    def update(self, sql):
        self.conn = self.connexion()
        self.conn.execute(self.PRAGMA)
        self.conn.execute(sql)
        self.conn.commit()
        self.conn.close()

    def delete(self, sql):
        self.conn = self.connexion()
        self.conn.execute(self.PRAGMA)
        self.conn.execute(sql)
        self.conn.commit()
        self.conn.close()


if __name__ == "__main__":
    log = Login("../batabase.db")
    t = 2, log.time_now()
    sql_insert = f"INSERT INTO Login (user_id, date) VALUES ('{t[0]}','{t[1]}')"
    log.insert(sql_insert)

    t = 4, log.time_now()
    update = f"UPDATE Login set user_id='{t[0]}', date='{t[1]}' WHERE id={1}"
    log.update(update)

    delete = "DELETE FROM Login WHERE id={}".format(6)
    log.delete(delete)

    sql_select = "SELECT * FROM Login"
    select = log.select(sql_select)
    print(select)
