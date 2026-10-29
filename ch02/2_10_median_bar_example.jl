import StatsBase: mean, median

bar_tabs = [7, 18, 19, 20, 21, 22, 25, 120, 1500]

mn = mean(bar_tabs)
med = median(bar_tabs)

println("Mean: ", mn)     # Mean:  194.666
println("Median: ", med)  # Median:  21.0