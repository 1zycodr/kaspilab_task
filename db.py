import pymysql


class DbService:
    """
    Singleton database service
    """
    _instance = None
    _connection = None
    _cursor = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = object.__new__(cls)
            cls._connection = pymysql.connect(
                host='127.0.0.1',
                user='dbuser',
                password='Fks#23pq17$Dbvr',
                db='kaspi',
                charset='utf8mb4',
                cursorclass=pymysql.cursors.DictCursor
            )
            cls._cursor = cls._connection.cursor()
        return cls._instance

    def execute(self, query: str) -> pymysql.cursors.DictCursor:
        self._cursor.execute(query)
        self._connection.commit()
        return self._cursor

    def close(self):
        if self._cursor is not None:
            self._cursor.close()

        if self._connection is not None:
            self._connection.close()


if __name__ == '__main__':
    print('You should not run this module directly!')
