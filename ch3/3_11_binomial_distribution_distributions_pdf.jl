using Distributions

binom = Binomial(10, .9)
result = pdf(binom, 7)
println(result) # 0.05739562799999998