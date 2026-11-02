import StatsBase: mode

group_sizes = [2, 4, 2, 3, 6, 2, 5, 4, 2, 3, 2]
md = mode(group_sizes)
ct = count(==(md), group_sizes)

# MODE: 2, COUNT: 5
println("MODE: $md, COUNT: $ct")