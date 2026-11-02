using StatsBase: mean

collie_weights = [51.2, 53.1, 53.1, 53.9, 59.0,
    59.3, 60.2, 61.1, 67.2, 67.6]

collie_weight_mean = mean(collie_weights)

# Collie Weight Mean (lbs): 58.57000000000001
println("Collie Weight Mean (lbs): ", collie_weight_mean)