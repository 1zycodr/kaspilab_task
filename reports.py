from db import DbService
import pandas as pd
import streamlit as st


def load_processed():
    """
    Loading data from V_PROCESSED view
    :return: pd.DataFrame
    """
    db = DbService()

    data = db.execute(f"SELECT * FROM V_PROCESSED").fetchall()
    data = pd.DataFrame(data)

    return data


def show():
    """
    Loading data and presenting interface
    :return:
    """
    data = load_processed()
    regions = {}

    try:
        for region in data['region'].unique():
            regions[region] = {}
            for year, info in data[data['region'] == region].groupby('year'):
                regions[region][year] = {}
                for month, val in info.groupby('month'):
                    regions[region][year][month] = {}
                    regions[region][year][month]['open'] = float(
                        val['open'].max()
                    )
                    regions[region][year][month]['low'] = float(
                        val['low'].min()
                    )

        start_streamlit(regions)
    except KeyError:
        print('You should load data to the db before!')
        st.write('exit')
        st.stop()


def start_streamlit(regions):
    """
    Starting streamlit web interface
    :param regions: dict
    :return:
    """
    region = st.selectbox('Выберите регион', regions.keys())
    year = st.selectbox('Выберите год', regions[region].keys())

    open_data = [
        (item[0], item[1]['open'])
        for item in regions[region][int(year)].items()
    ]

    low_data = [
        (item[0], item[1]['low'])
        for item in regions[region][int(year)].items()
    ]

    open_df = pd.DataFrame(
        open_data,
        columns=['date', 'open']
    )

    open_df = open_df.rename(
        columns={'date': 'index'}
    ).set_index('index')

    low_df = pd.DataFrame(
        low_data,
        columns=['date', 'low']
    )

    low_df = low_df.rename(
        columns={'date': 'index'}
    ).set_index('index')

    st.line_chart(open_df, use_container_width=True)
    st.line_chart(low_df, use_container_width=True)


if __name__ == '__main__':
    show()
