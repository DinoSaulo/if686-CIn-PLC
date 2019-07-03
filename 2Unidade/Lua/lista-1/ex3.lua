-- A partir da execução do codigo Lua abaixo, defina a sequência do que sera impresso.

function f1 ( a )
    print ("f1", a )
    coroutine.yield (2* a )
    f2 (a)
    return a *7
end

function f2 ( a )
    print ("f2", a )
    return coroutine.yield (3* a )
end

co1 = coroutine.create ( function (a , b )
    print (" co1 ", a , b )
    local r = f1 ( a +1)
    print ( r )
    print (a , b )
    local r , s = coroutine.yield ( a +b , a - b )
    print ("co1", coroutine.resume ( co2 , a +1 , b +1))
    return b , "fim co1 "
end )

co2 = coroutine.create ( function (a , b )
    print (" co2 ", a , b )
    print ("co2", coroutine.resume ( co3 , a +1 , b +1))
    return b , " fim co2 "
end )

co3 = coroutine.create ( function (a , b )
    print (" co3 ", a , b )
    coroutine.yield (b *57)
    local r , s = coroutine.yield ( a +b , a - b )
    print (" co3 ", r , s )
    print (" co3 ", a +1 , b +1)
end )

--print (" main ", coroutine.resume ( co1 , 6 , 14))
--print (" main ", coroutine.resume ( co1 ))
print (" main ", coroutine.resume ( co1 , "x", "y"))

--[[
    -> print 1
        Irá criar uma corrotina passando o identificador da corrotina co1 e 6 e 14 como argumentoss
        Criará a corrotina com uma função passando a e b como argumentos e inprimirá co1 juntamente com os valores das de a e b
        Irá definir uma variável como a função f1 passando a+1 (6+1 = 7) como argumento e logo em seguida irá executa-la
        A função inicialmente imprime "f1" em seguida imprime valor de a (7)
        logo em seguida a corrotina é suspensa e retona 2 * a (14)
        Então, ela irá imprimir os argumentos repassados no print, como o "main ", true e 14

    -> print 2
        Irá criar uma corrotina passando o identificador da corrotina co1 e nenhum argumento
        Criará a corrotina com uma função sem passar argumentos e imprimirá co1 juntamente com dois nil, pois não há variáveis a e b
        E dará um erro pois logo em seguida irá tentar definir uma variável como a função f1 passando a+1 (nil+1 = erro)
        Então, ela irá imprimir os argumentos repassados no print, como o "main ", false e o erro
        
    -> print 3
        Irá criar uma corrotina passando o identificador da corrotina co1 e 'x' e 'y' como argumentos
        Criará a corrotina com uma função sem passar argumentos e imprimirá co1 juntamente com o x e y
        E dará um erro pois logo em seguida irá tentar definir uma variável como a função f1 passando a+1 ('x'+1 = erro)
        Então, ela irá imprimir os argumentos repassados no print, como o "main ", false e o erro
]]