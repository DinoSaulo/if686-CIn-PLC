function num_triang(n)

    local proximo = 0
    local index = 1

    return function ()
        if index > n then
            return nil
        else
            proximo = proximo + index
            index = index + 1
            return proximo
        end
    end
end

for x in num_triang(6) do
    io.write(x, "  ")
end