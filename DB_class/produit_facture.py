#!/usr/bin/python3

import sqlite3


class PF:

    def __init__(self, db_name):
        self.name = "PF class: produit facture linked"
        self.database_name = db_name
        self.conn = None
        self.PRAGMA = "PRAGMA foreign_keys = ON;"
        self.create_table()

    def connexion(self):
        return sqlite3.connect(self.database_name)

    def create_table(self):
        self.conn = self.connexion()
        self.conn.execute("PRAGMA foreign_keys = ON;")
        self.conn.execute('''CREATE TABLE IF NOT EXISTS produit_facture
                                    (id INTEGER PRIMARY KEY AUTOINCREMENT,
                                    produit_id INTEGER,
                                    facture_id INTEGER,
                                    FOREIGN KEY (produit_id) REFERENCES Produit(id),
                                    FOREIGN KEY (facture_id) REFERENCES Facture(id));''')
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
    pf = PF("../batabase.db")
    t = 2,2

    sql_insert = f"INSERT INTO produit_facture (produit_id,facture_id) VALUES ('{t[0]}','{t[1]}')"
    pf.insert(sql_insert)

    t = "f0001", 3, "facture", "2020-04-04", "2020-04-11", "liquide", 0.02
    update = f"UPDATE Facture set ref='{t[0]}',client_id='{t[1]}',type='{t[2]}',date='{t[3]}',delay='{t[4]}',paiement='{t[5]}',remise='{t[6]}' WHERE id='{2}'"
    #ffac.update(update)

    delete = "DELETE FROM produit_facture WHERE id={}".format(1)
    #fac.delete(delete)

    sql_select = "SELECT * FROM produit_facture"
    select = pf.select(sql_select)
    print(select)
