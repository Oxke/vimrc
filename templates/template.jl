lines = readlines("input")
str = lines |> join

# grid = reduce(hcat, map(collect, lines)) |> permutedims
# grid = reduce(hcat, map(split, lines)) |> permutedims

# grid = parse.(Int, grid)
# H, W = size(grid)

# lines = lines .|> x -> split(x, [':', ' '])
# for line in lines
#     global N
#     res, _, parts... = line
#     res = parse(Int, res)
#     parts = parse.(Int, parts)
#
#     # DO STUFF
# end
