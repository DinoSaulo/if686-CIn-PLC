-- Aluno Saulo Alexandre de Barros (SAB2)
function newpoly(lista, x)

    final = 0
    arraynumeros = {}

    for i,v in pairs(lista) do
        arraynumeros[i] = v
    end

    return function (x)
            return (arraynumeros[1] * x * x ) +  ( arraynumeros[2] * x ) + arraynumeros[3]
    end

end

-- utilizando closures
f = newpoly({3,0,1})

print(f(0)) --> 1
print(f(5)) --> 76
print(f(10)) --> 301