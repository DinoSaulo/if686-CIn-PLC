tabela = {
    clattes = {
        nome = "Cesar",
        sobrenome = "Lattes",
        ano_nascimento = 1924,
        ano_falecimento = 2005,
        area = "fisica",
        contribuicao = "meson pi"
    },

    jpalis = {
        nome = "Jacob",
        sobrenome = "Palis",
        ano_nascimento = 1940,
        ano_falecimento = 0000,
        contribuicao = "sistemas dinamicos"
    }
}

function removeDuplicados(test)
    local hash = {}
    local res = {}

    for _,v in ipairs(test) do
        if (not hash[v]) then
            res[#res+1] = v
            hash[v] = true
        end
    end
    return res
end

function getKeys(tabelinha)

    tableReturn = {}

    for k, v in pairs(tabelinha) do
        for k2, v2 in pairs(v) do
            table.insert(tableReturn,k2)
        end
    end

    finalTable = removeDuplicados(tableReturn)

    return unpack(finalTable)
end

print(getKeys(tabela))