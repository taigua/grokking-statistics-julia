using StatsBase: sample, weights

discrete_dist = Dict(
    "BLACK" => 0.4,
    "GREY" => 0.3,
    "RED" => 0.15,
    "GREEN" => 0.07,
    "BLUE" => 0.05,
    "YELLOW" => 0.03
)

sp = sample(keys(discrete_dist) |> collect, weights(values(discrete_dist) |> collect))

println(sp)