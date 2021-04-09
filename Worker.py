# This Python file uses the following encoding: utf-8
from PySide2 import QtWidgets
from PySide2.QtCore import QObject, Signal, Slot, Property
from PySide2.QtCore import *
from DB_class import Produit
from DB_class import Client
from DB_class import Facture
from DB_class import PF
#from DB_class.Produit import Produit
#from DB_class.Client import Client
#from DB_class.User import User
#from DB_class.Facture import Facture
#from DB_class.produit_facture import PF


class Worker(QObject):
    # ++++++++++++++++++++ signals
    produit = Signal(list)

    def __init__(self):
        QObject.__init__(self)
        self._data = "data from worker"
        self.path = "/home/bm7/qt/project/qt-erp/batabase.db"

    def setProduit(self, tmp):
        if (self._data != tmp):
            self._data = tmp
            # self.data.emit(str(tmp))

    def getProduit(self):
        return self._data

    # ++++++++++++++++++++++ property
    prop_data = Property(str, fget=getProduit, fset=setProduit, notify=produit)

    # product functions
    @Slot(result="QVariantList")
    def select_produit(self):
        pdts = Produit(self.path)
        sql_select = "SELECT * FROM Produit"
        select = pdts.select(sql_select)
        return select

    @Slot(str, str, str, str, str, result=bool)
    def update_produit(self, ref, desc, prix, tva, rmq):
        pdt = Produit(self.path)
        update = f"UPDATE Produit set description='{desc}',prix={prix},taux={tva},remarques='{rmq}' WHERE ref='{ref}'"
        pdt.update(update)
        return True

    @Slot(str, result=int)
    def produit_last_id(self, sql):
        pdt = Produit(self.path)
        if (len(pdt.select(sql)) != 0):
            last_id = pdt.select(sql)[-1][0]
        else:
            last_id = 0
        return last_id

    @Slot(int, result=str)
    def produit_name(self, id):
        pdt = Produit(self.path)
        sql = f"SELECT description FROM Produit WHERE id={id}"
        result = pdt.select(sql)
        return result

    @Slot(str, str, str, str, str, result=bool)
    def insert_produit(self, ref, desc, prix, tva, rmq):
        pdt = Produit(self.path)
        sql_insert = f"INSERT INTO Produit (ref, description, prix, taux, remarques) VALUES ('{ref}','{desc}',{prix},{tva},'{rmq}')"
        pdt.insert(sql_insert)
        return True

    # client functions
    @Slot(result="QVariantList")
    def select_client(self):
        clts = Client(self.path)
        sql_select = "SELECT * FROM Client"
        select = clts.select(sql_select)
        return select

    @Slot(str, str, str, str, str, str, str, str, str, result=bool)
    def update_client(self, ref,nom,type,po,ville,tel,email,site,rmq):
        clt = Client(self.path)
        update = f"UPDATE Client set nom='{nom}',type='{type}',PO='{po}',ville='{ville}',tel='{tel}',email='{email}',site='{site}',remarques='{rmq}' WHERE ref='{ref}'"
        clt.update(update)
        return True

    @Slot(str, str, str, str, str, str, str, str, str, result=bool)
    def insert_client(self, ref,nom,type,po,ville,tel,email,site,rmq):
        clt = Client(self.path)
        sql_insert = f"INSERT INTO Client (ref,nom,type,PO,ville,tel,email,site,remarques) VALUES ('{ref}','{nom}','{type}','{po}','{ville}','{tel}','{email}','{site}','{rmq}')"
        clt.insert(sql_insert)
        return True

    # client functions
    @Slot(result="QVariantList")
    def select_facture(self):
        fac = Facture(self.path)
        sql_select = "SELECT * FROM Facture"
        select = fac.select(sql_select)
        return select

    @Slot(str, str, str, str, str, str, str, result=bool)
    def update_facture(self, ref, client_id, type, date, delay, paiement, remise):
        fac = Facture(self.path)
        update = f"UPDATE Facture set client_id='{client_id}',type='{type}',date='{date}',delay='{delay}',paiement='{paiement}',remise={float(remise)} WHERE ref='{ref}'"
        fac.update(update)
        return True

    @Slot(str, str, str, str, str, str, str, result=bool)
    def insert_facture(self, ref, client_id, type, date, delay, paiement, remise):
        fact = Facture(self.path)
        sql_insert = f"INSERT INTO Facture (ref,client_id,type,date,delay,paiement,remise) VALUES ('{ref}','{client_id}','{type}','{date}',{delay},'{paiement}',{float(remise)})"
        fact.insert(sql_insert)
        return True

    @Slot(int, int, int, result=bool)
    def update_pf(self, facture_id, produit_id, n):
        pf = PF(self.path)
        update = f"UPDATE produit_facture set produit_id={produit_id},n={n} WHERE facture_id={facture_id}"
        pf.update(update)
        return True

    @Slot(int, int, int, result=bool)
    def insert_pf(self, facture_id, produit_id, n):
        pf = PF(self.path)
        sql_insert = f"INSERT INTO produit_facture (produit_id,facture_id, n) VALUES ({facture_id},{produit_id},{n})"
        pf.insert(sql_insert)
        return True

    @Slot(str, result=int)
    def select_facture_id(self, ref):
        pf = PF(self.path)
        select = f"SELECT id FROM Facture WHERE ref='{ref}'"
        result = pf.select(select)

        return result

    @Slot(int, result="QVariantList")
    def select_pf(self, facture_id):
        pf = PF(self.path)
        select = f"SELECT * FROM produit_facture WHERE facture_id={facture_id}"
        result = pf.select(select)
        print(facture_id, result)
        return result

    @Slot(int, int, result=bool)
    def delete_pf(self, facture_id, produit_id):
        pf = PF(self.path)
        select = f"DELETE FROM produit_facture WHERE facture_id={facture_id} AND produit_id={produit_id}"
        pf.delete(select)
        return True
