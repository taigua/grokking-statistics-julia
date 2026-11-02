using CSV, DataFrames

df = CSV.read(download("https://raw.githubusercontent.com/thomasnield/" *
             "training-data-repository/refs/heads/main/TORNADO_TRX.csv"),
             DataFrame)

describe(df)