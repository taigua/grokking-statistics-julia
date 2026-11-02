using CairoMakie

p = 0.7  # A
x = [0, 1]  # B
probabilities = [1 - p, p]  # C

fig = Figure(size = (800, 480))
ax = Axis(fig[1, 1],
    title = "Bernoulli Distribution: MacBook Water Damage Recovery",
    titlegap = 20,
    xlabel = "Outcome (0 = Not Recovered, 1 = Recovered)",
    ylabel = "Probability",
    xticks = (x, ["Not Recovered\n(0)", "Recovered\n(1)"]),    
    xgridvisible = false,
    ygridvisible = true,
    ygridstyle = :dash,
    ygridcolor = (:black, 0.15),
    limits = (nothing, nothing, 0, 0.85) 
)

colors = ["#a0b4dc", "#002d8b"]

barplot!(ax, x, probabilities,
    color = colors,
    width = 0.4,
    strokewidth = 1.5,
    strokecolor = :black
)

text!(ax, x, probabilities;
    text = string.(round.(probabilities, digits=2)),
    align = (:center, :bottom),
    offset = (0, 6),
    font = :bold
)

save(joinpath("assets", replace(basename(PROGRAM_FILE), ".jl" => ".svg")), fig)
save(joinpath("assets", replace(basename(PROGRAM_FILE), ".jl" => ".png")), fig)

fig