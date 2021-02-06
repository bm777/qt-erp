# This Python file uses the following encoding: utf-8
from PySide2 import QtWidgets
from PySide2.QtCore import QObject, Signal, Slot, Property


class Worker(QObject):

    # ++++++++++++++++++++ signals
    data = Signal(str)

    def __init__(self):
        QObject.__init__(self)
        self._data = "data from worker"

    def setData(self, tmp):
        if(self._data != tmp):
            self._data = tmp
            self.data.emit(str(tmp))
    def getData(self):
        return self._data

    # ++++++++++++++++++++++ property
    prop_data = Property(str, fget=getData, fset=setData, notify=data)


    @Slot(str)
    def loadData(self, link=""):
        tmp = "1+2"+(1+2)
        self.data.emit(str(tmp))
