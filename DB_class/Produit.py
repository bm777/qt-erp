#!/usr/bin/python3

import sqlite3

import DB_class


class Produit:
    def __init__(self, db_name):
        self.name = "Product class"
        self.database_name = db_name
        self.PRAGMA = "PRAGMA foreign_keys = ON;"
        self.conn = None
        self.create_table()

    def connexion(self):
        return  sqlite3.connect(self.database_name)

    def create_table(self):
        self.conn = self.connexion()
        self.conn.execute('''CREATE TABLE IF NOT EXISTS Produit
                                    (id INTEGER PRIMARY KEY AUTOINCREMENT,
                                    ref CHAR(50) NOT NULL,
                                    description TEXT,
                                    prix INT,
                                    taux REAL,
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
        self.conn.execute(self.PRAGMA)
        self.conn.execute(sql)
        self.conn.commit()
        self.conn.close()

    def delete(self, sql):
        self.conn = self.connexion()
        self.conn.execute(sql)
        self.conn.commit()
        self.conn.close()


if __name__ == "__main__":
    pdt = Produit("../batabase.db")
    sql_insert = "INSERT INTO Produit (ref, description, prix, taux, remarques) VALUES ('{}','{}',{},{},'{}')".format("pdt-15","desc",15000,19.25,"quite")
    pdt.insert(sql_insert)

    update = "UPDATE Produit set description='{}',prix={},taux={},remarques='{}' WHERE ref='{}'".format("desciption",1200,19.26,"rmq","pdt-15")
    v = pdt.update(update)
    print(v)

    delete = "DELETE FROM Produit WHERE id={}".format(1)
    #pdt.delete(delete)

    sql_select = "SELECT * FROM Produit"
    select = pdt.select(sql_select)
    print(select)
