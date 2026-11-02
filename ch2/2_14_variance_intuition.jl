import StatsBase: var

temps = [77, 75, 68, 71, 60, 65, 81, 71, 56, 73,
    79, 80, 85, 84, 72, 69, 82, 81, 71, 63,
    75, 83, 80, 80, 88, 76, 79, 73, 80, 81, 82]

# calculate mean
mn = sum(temps) / length(temps)

# sum all the squared differences
squared_diffs = 0
for t in temps
  squared_diffs += (t - mn) ^ 2
end

# take the average of the squared differences
variance = squared_diffs / (length(temps) - 1)

# Variance:  57.65806451612904
println("Variance: ", variance)

# From StatsBase:  57.65806451612904
print("From StatsBase: ", var(temps))