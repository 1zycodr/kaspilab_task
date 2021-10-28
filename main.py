from db import DbService
from reports import show
from constants import DATA_FILES, DATA_TABLES
from streamlit import cli as stcli
import pandas as pd
import sys


def load_data_from_files():
    """
    Loading data into pandas dataframes from files
    :return: dict
    """
    data = {
        key: pd.read_csv(data)
        for key, data in DATA_FILES.items()
    }
    return data


def load_data_from_db():
    """
    Loading data into pandas dataframes from database
    :return: dict
    """
    db = DbService()

    data = {
        table: db.execute(f"SELECT {','.join(columns)} FROM {table};").fetchall()
        for table, columns in DATA_TABLES.items()
    }

    return data


def get_values(dataframe: pd.DataFrame):
    """
    Returns formatted for sql insertion data
    :param dataframe: pandas.Dataframe
    :return: str
    """
    values = [
        '(' + ','.join([
            f'"{value}"' if isinstance(value, str)
            else 'NULL' if value is None or str(value) == 'nan'
            else str(value)
            for value in row
        ]) + ')'
        for row in dataframe.values.tolist()
    ]

    return ','.join(values)


def save_data_to_db(data):
    """
    Saves data to the database
    :param data: dict
    :return:
    """
    db = DbService()

    queries = [
        f"INSERT INTO {table} ({','.join(columns)}) "
        f"VALUES {get_values(data[table])}"
        for table, columns in DATA_TABLES.items()
    ]

    for query in queries:
        db.execute(query)


def start_interface():
    """
    Starting console interface
    :return:
    """
    while True:
        print('[1] - Load data from files to db')
        print('[2] - Reports')
        print('[3] - Exit')

        while (opt := input('Choose option (1-3): ')) \
                      not in ('1', '2', '3'):
            pass

        if opt == '1':
            print('Loading data...')
            data = load_data_from_files()
            print('Saving data...')
            save_data_to_db(data)
            print('Saved!')
        elif opt == '2':
            sys.argv = ["streamlit", "run", "reports.py"]
            sys.exit(stcli.main())
        elif opt == '3':
            exit(0)


def main():
    DbService()
    start_interface()


if __name__ == '__main__':
    main()
