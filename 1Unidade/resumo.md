# Resumo Haskell - 1ª Unidade

## Funções básicas da prelude com Haskell

### Concatenador de listas ( ++ )

Utilizado para unir duas ou mais listas

#### Exemplos

```
[4,0,0,2] ++ [8,9,2,2] --> [4,0,0,2,8,9,2,2]
```

### null (Foldable t => t a -> Bool)

Varifica se uma lista é vazia

#### Exemplos

```
null [4,0,0,2] --> False
-- ou
null [] --> True
```

### map :: (a -> b) -> [a] -> [b]

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


### zip :: [a] -> [b] -> [(a,b)]

Retornaá a junção das duas listas em uma ou mais tuplas

#### Exemplos

```
zip [1,2] ['a','b'] --> [(1,'a'),(2,'b')]
zip [1,2,3,4] ['a','b'] --> [(1,'a'),(2,'b')]
```

### if-then-else

Funcionamento igual ao if e else de todas as outras linguagens

#### Exemplos

```
if_par :: Int -> Bool
if_par n = if (mod n 2 == 0) then
                True
            else
                False
```

### case



#### Exemplos

```
case_par :: Int -> Bool
case_par n = case (mod n 2 == 0) of
                True -> True
                False -> False
```

### where



#### Exemplos

```
somaQuadrado :: Int -> Int -> Int
somaQuadrado x y = quadrx + quadry
                    where
                        quadrx =  x * x
                        quadry =  y * y
```

### Funções lambda

Funções anônimas utilizadas quando queremos utilizar funções uma unica vez.
Geralmente elas são passadas para funções de ordem superior
Um sinal do indício de uma função lambda é o `\`

#### Exemplos

```
(\x -> (x*x)) 10 --> 100

f_lambda()
```