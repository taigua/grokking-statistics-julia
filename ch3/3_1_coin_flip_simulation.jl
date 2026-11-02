heads, tails = 0, 0
p = 0.5 # probability of event (heads)

for _ in 1:1000
    if rand() < p
        global heads += 1
    else
        global tails += 1
    end
end

# Should roughly be 500 heads, 500 tails
println("HEADS: $heads, TAILS: $tails")