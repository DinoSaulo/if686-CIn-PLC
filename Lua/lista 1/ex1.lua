-- Escreva uma funcao que recebe um array e imprime todos os elementos que ha nele.
-- Considere o uso da funcao table.unpack e avalia vantagens e desvantagens do usodela para a implementação solicitada.


-- função que imiprime todos os elementos do array

function printArray(array)
    for i=0,#array do
        print(array[i])
    end
end

arrayA = { 'a', 'b', 'c', 'd', 'e', 0 }
arrayA[0] = 2;

printArray(arrayA)

-- Utilizando a função unpack

print( unpack(arrayA))

--[[

  - Vantagens
    1 - Irá retornar os elementos do array (tabela) separadamente, tem um funcionamento equivalente a um "return list[i], list[i+1], ···, list[j]"
    2 - a função unpack também apresenta algumas funcionalidades como definir o início ou o final da lista que será desempacotada, através de unpack(list, x, y), onde x representa a posição inicial e  y a posição final, exemplo abaixo
    3 - Código mais limpo e com menos funções
  - Desvantagens
    1 - Desempacotamento em um único sentido, ou seja, caso queira desempacotar a lista reversamente não é possível
    2 - Conflito de versões do LUA - a função table.unpack() só foi definida apartir da versão 5.2 + , versões ateriores a isso utilizam apenas o unpack()
    3 - Qualquer chave com valor zero ou negativo (que não faz sentido) não é considerada parte da tabela.
--]]

print( unpack( arrayA, 2, 4, 1 ) )
