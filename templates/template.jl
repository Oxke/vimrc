function parse_input(lines=nothing, str=nothing, grid=nothing, W=nothing, H=nothing)
    lines = readlines("input")
    str = lines |> join

    # grid = reduce(hcat, map(collect, lines)) |> permutedims
    # H, W = size(grid)

    return lines, str, grid, W, H
end

function main(lines, str, grid, W, H)
    lines
end

main(parse_input()...) |> println
