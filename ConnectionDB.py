# This Python file uses the following encoding: utf-8
from PySide2 import QtWidgets


class ConnectionDB:
    def __init__(self):
        pass




class Postgres(object):
"""docstring for Postgres"""
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = object.__new__(cls)
            # normally the db_credenials would be fetched from a config file or the enviroment
            # meaning shouldn't be hardcoded as follow
            db_config = {'dbname': 'demo', 'host': 'localhost',
                     'password': 'postgres', 'port': 5432, 'user': 'postgres'}
            try:
                print('connecting to MySQL database...')
                connection = Postgres._instance.connection = psycopg2.connect(**db_config)
                cursor = Postgres._instance.cursor = connection.cursor()
                cursor.execute('SELECT VERSION()')
                db_version = cursor.fetchone()

            except Exception as error:
                print('Error: connection not established {}'.format(error))
                Postgres._instance = None

            else:
                print('connection established\n{}'.format(db_version[0]))

        return cls._instance

    def __init__(self):
        self.connection = self._instance.connection
        self.cursor = self._instance.cursor

    def query(self, query):
        try:
            result = self.cursor.execute(query)
        except Exception as error:
            print('error execting query "{}", error: {}'.format(query, error))
            return None
        else:
            return result

    def __del__(self):
        self.connection.close()
        self.cursor.close()
