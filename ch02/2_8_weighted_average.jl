# Three exams and a final score
exam_scores = [85, 90, 88, 92]

# Weighting for each exam
weights = [.2, .2, .2, .4]

# Calculate weighted average
weighted_average = sum(e*w  for (e, w) in zip(exam_scores, weights)) / sum(weights)

# Final grade: 89.4
println("Final grade: ", weighted_average)

# Using StatsBase: 89.4
import StatsBase: mean, weights as wts
println("Using StatsBase: ", mean(exam_scores, wts(weights)))