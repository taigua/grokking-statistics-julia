p = 0.9  #A

outcomes = Dict((key, 0) for key in 0:10)  #B

for _ in 1:10000  #C
    successes = 0
    for _ in 1:10  #D
        if rand() < p  #E
            successes += 1  #E
        end        
    end
    outcomes[successes] += 1
end

for (k, v) in outcomes  #F
    println("Experiments with $k successes: $v")  #F
end

#A probability of event
#B start each outcome at 0
#C We run 10,0000 experiments
#D Each experiment does 10 trials
#E simulate a weighted coin flip
#F Show outcomes of experiments

# ===========================================
# APPEND THE PLOT BELOW
# ===========================================

using CairoMakie

fig = Figure(size=(800, 600))

xs = collect(keys(outcomes))
ys = [count/10000 for count in values(outcomes)]

ax = Axis(
    fig[1, 1],
    title="Distribution of Successes in 10 Trials\n(p=0.9, 10000 experiments)",
    titlesize=12,
    xlabel="Number of Successes",
    ylabel="Proportion of Experiments",
    xgridvisible=false,
    ygridstyle=:dash,
    xticks=xs,
    yticks=0.0:0.05:(maximum(ys) + 0.05),
)

barplot!(ax, xs, ys, color="#002d8b", strokecolor=:black, strokewidth=1)
text!(ax, xs, ys;
    text = string.(round.(ys, digits=3)),
    align = (:center, :bottom),
    offset = (0, 1)
)

save(joinpath("assets", replace(basename(PROGRAM_FILE), ".jl" => ".svg")), fig)
save(joinpath("assets", replace(basename(PROGRAM_FILE), ".jl" => ".png")), fig)

fig