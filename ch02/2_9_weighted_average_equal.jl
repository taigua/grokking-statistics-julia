# Three exams and a final score
exam_scores = [85, 90, 88, 92]

# Weighting for each exam
weights = [1, 1, 1, 1]

# Calculate weighted average
weighted_average = sum(e*w for (e, w) in zip(exam_scores, weights)) / sum(weights)

# Final grade:  88.75
println("Final grade: ", weighted_average)

# Average from NumPy:  88.75
import StatsBase: mean
println("Average from StatsBase: ", mean(exam_scores))