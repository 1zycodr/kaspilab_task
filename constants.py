DATA_FILES = {
    'data': 'data/Data.csv',
    'info': 'data/Info.csv',
    'processed': 'data/Processed.csv',
}

DATA_TABLES = {
    'data': (
        '`key`', '`index`', '`date`', 'open', 'high',
        'low', 'close', 'adjclose', 'volume',
    ),
    'info': (
        'region', 'exchange', '`index`', 'currency',
    ),
    'processed': (
        '`key`', '`index`', '`date`', 'open', 'high',
        'low', 'close', 'adjclose', 'volume', 'closeUSD',
    ),
}