using Distributions
using Printf

n = 10  #A
p = 0.9  #B

binom = Binomial(n, p)

ks = collect(0:10)  #C
ys = pdf.(binom, ks)  #D

for (k, y) in zip(ks, ys)  #E
    @printf("The probability of %d/%d successes is %.4f\n", k, n, y)  #F
end

#A Set number of trials to 10
#B Set probability of success to 0.9
#C Generate array of possible success counts from 0 to n
#D Calculate binomial probability for each k
#E Iterate through k and y values in pairs
#F Print probability of each success count formatted to four decimal places

using CairoMakie

fig = Figure(size=(800, 600))

ax = Axis(
    fig[1, 1],
    title="Binomial Distribution (n=10, p=0.9)",
    titlesize=12,
    xlabel="Number of Successes",
    ylabel="Probability",
    xgridvisible=false,
    ygridstyle=:dash,
    xticks=ks,
    yticks=0.0:0.05:(maximum(ys)+0.05),
)

barplot!(ax, ks, ys, color="#002d8b", strokecolor=:black, strokewidth=1)
text!(ax, ks, ys;
    text=string.(round.(ys, digits=3)),
    align=(:center, :bottom),
    offset=(0, 1)
)

save(joinpath("assets", replace(basename(PROGRAM_FILE), ".jl" => ".svg")), fig)
save(joinpath("assets", replace(basename(PROGRAM_FILE), ".jl" => ".png")), fig)

fig