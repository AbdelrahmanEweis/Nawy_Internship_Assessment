import pandas as pd
def transform_date_format(dates):
    date_series = pd.Series(dates)
    new_dates = []
    for date in dates:
        if '/' not in date and '-' not in date:
            continue
        new_date = pd.to_datetime(date, errors='coerce')
        new_dates.append(new_date)
    date_series = pd.Series(new_dates)
    formatted_dates = date_series.dt.strftime('%Y%m%d').tolist()
    return formatted_dates

dates = ["2010/02/20", "19/12/2016", "11-18-2012", "20130720"]
print(transform_date_format(dates))