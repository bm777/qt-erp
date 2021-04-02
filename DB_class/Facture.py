#!/usr/bin/python3

import sqlite3


class Facture:

    def __init__(self, db_name):
        self.name = "Facture class"
        self.database_name = db_name
        self.conn = None
        self.create_table()

    def connexion(self):
        return sqlite3.connect(self.database_name)

    def create_table(self):
        self.conn = self.connexion()
        self.conn.execute('''CREATE TABLE IF NOT EXISTS Facture
                                    (id INTEGER PRIMARY KEY AUTOINCREMENT,
                                    ref CHAR(50) NOT NULL,
                                    client_id INTEGER,
                                    type CHAR(50),
                                    date CHAR(50),
                                    delay CHAR(50),
                                    paiement CHAR(50),
                                    remise REAL,
                                    FOREIGN KEY (client_id) REFERENCES Client (id));''')
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
    fac = Facture("../batabase.db")
    t = "f0001", 2, "facture", "2020-04-04", "2020-04-11", "liquide", 0.02

    sql_insert = f"INSERT INTO Facture (ref,client_id,type,date,delay,paiement,remise) VALUES ('{t[0]}','{t[1]}','{t[2]}','{t[3]}',{t[4]},'{t[5]}','{t[6]}')"
    fac.insert(sql_insert)

    t = "f0001", 3, "facture", "2020-04-04", "2020-04-11", "liquide", 0.02
    update = f"UPDATE Facture set ref='{t[0]}',client_id='{t[1]}',type='{t[2]}',date='{t[3]}',delay='{t[4]}',paiement='{t[5]}',remise='{t[6]}' WHERE id='{2}'"
    fac.update(update)

    delete = "DELETE FROM Facture WHERE id={}".format(1)
    fac.delete(delete)

    sql_select = "SELECT * FROM Facture"
    select = fac.select(sql_select)
    print(select)
