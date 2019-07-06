# Resumo Haskell - 1ª Unidade

## Funções básicas da prelude com Haskell

### - Concatenador de listas ( ++ )

Utilizado para unir duas ou mais listas.

#### Exemplos

```
[4,0,0,2] ++ [8,9,2,2] --> [4,0,0,2,8,9,2,2]
```

### - null (Foldable t => t a -> Bool)

Varifica se uma lista é vazia.

#### Exemplos

```
null [4,0,0,2] --> False
-- ou
null [] --> True
```

### - tail ([a] -> [a])

Devolve a cauda de uma lista.

#### Exemplos

```
tail [4,0,0,2] --> [0,0,2]
```

### - init ([a] -> [a])

Devolve uma lista sem o ultimo elemento.

#### Exemplos

```
init [4,0,0,2] --> [4,0,0]
```

### - head ([a] -> a)

Devolve o primeiro item da lista.

#### Exemplos

```
head [4,0,0,2] --> 4
```

### - length ([a] -> a)

Devolve o o tamanho da lista

#### Exemplos

```
length [4,0,0,2] --> 4
```

### - drop (Int -> [a] -> [a])

Devolve uma lista sem os n primeiros elementos.

#### Exemplos

```
drop 2 [4,0,0,2] --> [0,2]
```

### - take (Int -> [a] -> [a])

Devolve os N primeiros elementos de uma lista.

#### Exemplos

```
drop 2 [4,0,0,2] --> [4,0]
```

### - reverse ([a] -> [a])

Devolve o inverso de uma lista.

#### Exemplos

```
reverse [4,0,0,2] --> [2,0,0,4]
```

### - replicate (Int -> a -> [a])

Devolve uma lista com o elemento passado repetido N vezes.

#### Exemplos

```
replicate 3 "Eu odeio PLC" --> ["Eu odeio PLC","Eu odeio PLC","Eu odeio PLC"]
```

### - splitAt (Int -> [a] -> ([a], [a]))

Devolve uma tupla com o elemento passado separado após o subelemento N.

#### Exemplos

```
splitAt 3 "Eu odeio PLC" --> ("Eu ","odeio PLC")
```

### - not, and, or (Not => Bool -> Bool | and && or => Foldable t => t Bool -> Bool)

Se você precisar de uma explicação para essas funções, você não merece essar pagando PLC.

#### Exemplos

```
not True --> False
and [True,True,False, True] --> False
or [True,True,False, True] -> True
```

### - map ((a -> b) -> [a] -> [b])

Receberá uma função e uma lista e irá aplicar uma função em todos os valores da lista e devolver uma lista com os resultados obtidos.

#### Exemplos

```
vendas :: Int -> Int
vendas 0 = 4
vendas 1 = 0
vendas 2 = 0
vendas 3 = 2

map vendas [0..2] --> [4,0,0]
-- ou
map (*2) [0..3] --> [0,2,4,6]
```

### - filter ((a -> Bool) -> [a] -> [a])

Devolve uma lista caso o presente elemento aplicado na função recebida retorne True

#### Exemplos

```
frase :: String -> Bool
frase "Eu" = True
frase "amo" = False
frase "odeio" = True
frase "PLC" = True

filter (frase) ["Eu", "amo", "odeio", "PLC"] --> ["Eu", "odeio", "PLC"]
```

### - zip ([a] -> [b] -> [(a,b)])

Retorna a junção das duas listas em uma ou mais tuplas, ou seja, retorna as listas compactadas.

#### Exemplos

```
zip [1,2] ['a','b'] --> [(1,'a'),(2,'b')]
zip [1,2,3,4] ['a','b'] --> [(1,'a'),(2,'b')]
```

### - unzip ([(a, b)] -> ([a], [b]))

Retorna a descompactação da lista.

#### Exemplos

```
unzip [(1,'a'),(2,'b')] --> ([1,2],"ab")
```

## Operadores básicos de Haskell

### - if-then-else

Funcionamento igual ao if e else de todas as outras linguagens.

#### Exemplos

```
if_par :: Int -> Bool
if_par n = if (mod n 2 == 0) then
                True
            else
                False
```

### - case

Funciona basicamente como um switch.

#### Exemplos

```
case_par :: Int -> Bool
case_par n = case (mod n 2 == 0) of
                True -> True
                False -> False
```

### - where

Executará uma função que utilizará argumentos que serão definidos no where.

#### Exemplos

```
somaQuadrado :: Int -> Int -> Int
somaQuadrado x y = quadrx + quadry
                    where
                        quadrx =  x * x
                        quadry =  y * y
```

## Processos que o professor da cadeira cobra com Haskell

### - Funções lambda

Funções anônimas utilizadas quando queremos utilizar funções uma unica vez.
Geralmente elas são passadas para funções de ordem superior
Um sinal do indício de uma função lambda é o `\`

#### Exemplos

```
(\x -> (x*x)) 10 --> 100

f_lambda()
```

### - Compactação de listas

Cria uma lista e vai adicionando os elementos nela caso a mesma retorne True para a função passada, e no final retorna a lista.

#### Exemplos

```
vendas :: Int -> Int
vendas 0 = 4
vendas 1 = 0
vendas 2 = 0
vendas 3 = 2
vendas 4 = 8

-- Esta função adiciona um True em uma lista caso a função retorne 0
zeroVendasA :: Int -> [Bool]
zeroVendasA num = [ True |  x <- [0..num], (vendas x) == 0]
```

```
ehPar :: Int -> Bool
par x = mod x 2 == 0

-- retorna uma lista com os elementos pares maiores do que 5 até 10
lista = [ x | x <- [0..10], ehPar x, x > 5] -- [6,8,10]
```