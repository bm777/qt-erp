#!/usr/bin/python3

import sqlite3


class Client:

    def __init__(self, db_name):
        self.name = "Client class"
        self.database_name = db_name
        self.conn = None
        self.create_table()

    def connexion(self):
        return sqlite3.connect(self.database_name)

    def create_table(self):
        self.conn = self.connexion()
        self.conn.execute('''CREATE TABLE IF NOT EXISTS Client
                                    (id INTEGER PRIMARY KEY AUTOINCREMENT,
                                    ref CHAR(50) NOT NULL,
                                    nom CHAR(50),
                                    type CHAR(50),
                                    PO CHAR(50),
                                    ville CHAR(50),
                                    tel CHAR(50),
                                    email CHAR(50),
                                    site CHAR(50),
                                    remarques TEXT);''')
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
    clt = Client("../batabase.db")
    t = "clt-1", "Ali", "personal", "PO:18", "Yaounde", "+237655586947", "mail@gmail.com", "itl.com", "quite"

    sql_insert = "INSERT INTO Client (ref,nom,type,PO,ville,tel,email,site,remarques) VALUES ('{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(t[0],t[1],t[2],t[3],t[4],t[5],t[6],t[7],t[8])
    #clt.insert(sql_insert)

    t = "clt-1", "Ali", "personal", "PO:11", "Yaounde", "+237655586947", "mail@gmail.com", "itl.com", "quite"
    update = f"UPDATE Client set ref='{t[0]}',nom='{t[1]}',type='{t[2]}',PO='{t[3]}',ville='{t[4]}',tel='{t[5]}',email='{t[6]}',site='{t[7]}',remarques='{t[8]}' WHERE id='{2}'"
    #clt.update(update)

    delete = "DELETE FROM Client WHERE id={}".format(1)
    #clt.delete(delete)

    sql_select = "SELECT * FROM Client"
    select = clt.select(sql_select)
    print(select)
