using CSV, DataFrames, CairoMakie
import StatsBase: mean, median, std, percentile
using Chain

df = CSV.read(download("https://raw.githubusercontent.com/thomasnield/" *
             "training-data-repository/refs/heads/main/TORNADO_TRX.csv"),
             DataFrame)

tor_width = df[:, :TOR_WIDTH]

println("MEAN: ", mean(tor_width))          # MEAN:  215.18971962616823
println("MEDIAN: ", median(tor_width))      # MEDIAN:  100.0
println("ST DEV: ", std(tor_width))         # ST DEV:  315.83093225491433

println("25th PCT: ", percentile(tor_width, 25)) # 25th PCT:  50.0
println("75th PCT: ", percentile(tor_width, 75)) # 75th PCT:  250.0

@chain df begin
    select(:TOR_F_SCALE)
    groupby(:TOR_F_SCALE)
    combine(nrow => :n)
    sort(:n, rev=true)
end
# TOR_F_SCALE   n
# EF1           1250
# EF0           1047
# EFU           497
# EF2           323
# EF3           86
# EF4           7

f = Figure()
ax = Axis(f[1, 1]; title="Histogram of Tornado Width",
    xlabel="Width", ylabel="Frequency")
hist!(ax, tor_width; bins=60)
f
