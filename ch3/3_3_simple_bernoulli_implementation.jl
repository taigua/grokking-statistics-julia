bernoulli = Dict(0 => .30, 1 => .70)

for (x, p) in bernoulli
    println("P(X=$x) = $p")
end