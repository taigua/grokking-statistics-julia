discrete_dist = Dict(
    "BLACK" => 0.4,
    "GREY" => 0.3,
    "RED" => 0.15,
    "GREEN" => 0.07,
    "BLUE" => 0.05,
    "YELLOW" => 0.03
)

for (x, p) in discrete_dist
   println("P(X=$x) = $p")
end

#PRINTS:
# P(X=BLACK) = 0.4
# P(X=GREY) = 0.3
# P(X=RED) = 0.15
# P(X=GREEN) = 0.07
# P(X=BLUE) = 0.05
# P(X=YELLOW) = 0.03