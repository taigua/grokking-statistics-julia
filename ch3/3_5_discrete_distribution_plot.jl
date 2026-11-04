using CairoMakie

data = Dict(
    "BLACK" => 0.4,
    "GREY" => 0.3,
    "RED" => 0.15,
    "GREEN" => 0.07,
    "BLUE" => 0.05,
    "YELLOW" => 0.03
)

sorted_data = sort(collect(data), by=x->x[2], rev=true)
xs = 1:length(sorted_data)
ys = map(x->x[2], sorted_data)

fig = Figure(size=(600, 480))

ax = Axis(
    fig[1, 1],
    xticks=(xs, map(x->x[1], sorted_data)),
    yticks=0.0:0.05:(ys[1]),
    title="Distribution of Colors",
    titlesize=12,
    xlabel="Colors",
    xlabelsize=10,
    ylabel="Probability",
    ylabelsize=10,
    xticklabelrotation=deg2rad(45),
    xgridvisible=false,
    ygridstyle=:dash,
)

barplot!(ax, xs, ys, color="#002d8b", strokecolor=:black, strokewidth=1)

text!(ax, xs, ys;
    text = string.(round.(ys, digits=2)),
    align = (:center, :bottom),
    offset = (0, 1)
)

save(joinpath("assets", replace(basename(PROGRAM_FILE), ".jl" => ".svg")), fig)
save(joinpath("assets", replace(basename(PROGRAM_FILE), ".jl" => ".png")), fig)

fig