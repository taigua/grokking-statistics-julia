import StatsBase: std

temps = [77, 75, 68, 71, 60, 65, 81, 71, 56, 73,
    79, 80, 85, 84, 72, 69, 82, 81, 71, 63,
    75, 83, 80, 80, 88, 76, 79, 73, 80, 81, 82]

function variance(data)
    # calculate mean
    mn = sum(data) / length(data)

    # sum all the squared differences
    squared_diffs = 0
    for x in data
        squared_diffs += (x - mn) ^ 2
    end

    # take the average of the squared differences
    squared_diffs / (length(data) - 1)
end

# just take the square root of variance
standard_deviation(data) = sqrt(variance(data))

# Standard Deviation:  7.5932907567226104
print("Standard Deviation: ", standard_deviation(temps))

# From StatsBase:  7.5932907567226104
print("From StatsBase: ", std(temps))