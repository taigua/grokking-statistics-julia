using Distributions
using CairoMakie

α, β = 7, 3  # successes, failures

xs = range(0, 1, 50) |> collect
d = Beta(α, β)
ys = pdf.(d, xs)

fig = Figure()
ax = Axis(fig[1, 1],
    xlabel="Success Rate",
    ylabel="Probability of that Success Rate",
    yticks=0:0.5:(maximum(ys)+0.5))
lines!(ax, xs, ys)

save(joinpath("assets", replace(basename(PROGRAM_FILE), ".jl" => ".svg")), fig)
save(joinpath("assets", replace(basename(PROGRAM_FILE), ".jl" => ".png")), fig)

fig
