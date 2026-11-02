using StatsBase: sample

sp = sample([0, 1], weights([.30, .70]))

# prints 0 or 1
println(sp)