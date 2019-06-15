vetor1 = {0,1,0,0,0,0,3,0,0,2}

vetor2 = {0,1,0,0,0,4,3,0,0,0}

function removeZeros(vetor)

    tableReturn = {}

    for _, v in ipairs(vetor) do
        if not (v == 0) then
            table.insert(tableReturn,v)
        end
    end
    return tableReturn
end

-- Letra A

function somaVetor(vetor1, vetor2)
    tableReturn = {}
    if not (#vetor1 == #vetor2) then
        print("tamanhos diferentes, nao pode")
    else
        for i=1,#vetor1 do
            table.insert( tableReturn, (vetor1[i] + vetor2[i]) )
        end
    end

    return tableReturn
end

vetorEsparso1 = removeZeros(vetor1)
vetorEsparso2 = removeZeros(vetor2)

print("VETORES ESPARSADOS")
print("vetor 1 = ")
print(unpack(vetorEsparso1))
print("vetor 2 = ")
print(unpack(vetorEsparso2))
print("---------------------")

x = somaVetor(vetorEsparso1, vetorEsparso2)

print("vetor 1 + vetor 2 = ")
print(unpack(x))
print("---------------------")

-- Letra B

function produtoInternoVetor(vetor1, vetor2)
    tableReturn = {}
    somaFinal = 0
    if not (#vetor1 == #vetor2) then
        print("tamanhos diferentes, nao pode")
    else
        for i=1,#vetor1 do
            table.insert( tableReturn, (vetor1[i] * vetor2[i]) )
        end
    end

    for i=1,#tableReturn do
        somaFinal = somaFinal + tableReturn[i]
    end

    return somaFinal
end

x = produtoInternoVetor(vetorEsparso1, vetorEsparso2)

print("Produto Interno dos vetores esparsos = " .. x)