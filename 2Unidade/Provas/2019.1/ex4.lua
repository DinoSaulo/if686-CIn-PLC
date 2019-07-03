-- Aluno Saulo Alexandre de Barros (SAB2)
function newpoly(lista, x)

    final = 0
    arraynumeros = {}

    for i,v in pairs(lista) do
        arraynumeros[i] = v
    end
    
    final = ( arraynumeros[1] * x * x ) +  ( arraynumeros[2] * x ) + arraynumeros[3] 

    return final

end

listaComOsPolinomios = {3,0,1}

function f(x)
    return newpoly(listaComOsPolinomios, x)
end

print(f(0)) --> 1
print(f(5)) --> 76
print(f(10)) --> 301