#!/usr/bin/python3

import sqlite3

class User:
    def __init__(self, db_name):
        self.name = "User class"
        self.database_name = db_name
        self.conn = None
        self.create_table()

    def connexion(self):
        return  sqlite3.connect(self.database_name)

    def create_table(self):
        self.conn = self.connexion()
        self.conn.execute('''CREATE TABLE IF NOT EXISTS User
                                    (id INTEGER PRIMARY KEY AUTOINCREMENT,
                                    username CHAR(50) NOT NULL,self.PRAGMA = "PRAGMA foreign_keys = ON;"
                                    password CHAR(50),
                                    email CHAR(50),
                                    name CHAR(50),
                                    tel CHAR(50));''')
        self.conn.close()



    def insert(self, sql):
        self.conn = self.connexion()
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
        self.conn.execute(sql)
        self.conn.commit()
        self.conn.close()

    def delete(self, sql):
        self.conn = self.connexion()
        self.conn.execute(sql)
        self.conn.commit()
        self.conn.close()


if __name__ == "__main__":
    user = User("../batabase.db")
    t = "bm7", "pass", "mail@gmail.com", "Ali Belal", "612345678"
    sql_insert = f"INSERT INTO User (username, password, email, name, tel) VALUES ('{t[0]}','{t[1]}','{t[2]}','{t[3]}','{t[4]}')"
    user.insert(sql_insert)

    t = "bm7", "password", "mail@gmail.com", "Ali Belal", "612345678", 2
    update = f"UPDATE User set username='{t[0]}',password='{t[1]}',email='{t[2]}',name='{t[3]}' WHERE id={t[5]}"
    user.update(update)

    delete = "DELETE FROM User WHERE id={}".format(6)
    user.delete(delete)

    sql_select = "SELECT * FROM User"
    select = user.select(sql_select)
    print(select)