using CSV, DataFrames
using Chain
import StatsBase: median, percentile, iqr

# Load the dataset
df = CSV.read(download("https://raw.githubusercontent.com/thomasnield/" *
             "training-data-repository/refs/heads/main/TORNADO_TRX.csv"),
             DataFrame)

# Group by TOR_F_SCALE and calculate mean, median, standard deviation for TOR_WIDTH
grouped_stats = @chain df begin
    select(:TOR_F_SCALE, :TOR_WIDTH)
    groupby(:TOR_F_SCALE)
    combine(:TOR_WIDTH .=> [x -> percentile(x, 25), median, x -> percentile(x, 75), iqr] .=> [:p25, :median, :p75, :iqr])
    sort(:TOR_F_SCALE)
end

# Round the results for readability
transform!(grouped_stats, 
    names(grouped_stats, Number) .=> (x -> round.(x, digits=2)), 
    renamecols=false)

# Print the results
println("TOR_WIDTH Statistics by TOR_F_SCALE:")
println(grouped_stats)
# TOR_WIDTH Statistics by TOR_F_SCALE:
#   TOR_F_SCALE     p25  median     p75    iqr
# 0         EF0    30.0    50.0   100.0   70.0
# 1         EF1    80.0   150.0   300.0  220.0
# 2         EF2   200.0   400.0   792.5  592.5
# 3         EF3   400.0   700.0  1387.5  987.5
# 4         EF4  1000.0  1320.0  1575.0  575.0
# 5         EFU    20.0    30.0    50.0   30.0