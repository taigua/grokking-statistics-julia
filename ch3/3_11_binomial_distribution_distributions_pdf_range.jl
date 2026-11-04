using Distributions

d = Binomial(10, .9)
result = sum(pdf.(d, 0:8))
println(result) # 0.2639010709