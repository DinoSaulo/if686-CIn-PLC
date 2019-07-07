-- 1

--Esta é uma expressão do tipo função lamba, que apresenta como caracteristicas receber uma função como argumento, como feito no (\x -> length x)

-- 2

data Mobile = Pendente Int | Barra Mobile Mobile -- eh um tipo recursivo

-- A

mobTeste0 = Pendente 5
mobTeste1 = Barra (Barra (Pendente 5) (Pendente 10)) (Barra (Pendente 5) (Pendente 10)) -- peso total = 30
mobTeste2 = Barra (Barra (Barra (Pendente 5) (Pendente 10)) (Barra (Pendente 5) (Pendente 10))) (Barra (Barra (Pendente 5) (Pendente 10)) (Barra (Pendente 5) (Pendente 10))) -- peso total = 60
mobTeste3 = Barra (Barra (Barra (Pendente 5) (Pendente 10)) (Barra (Pendente 5) (Pendente 10))) (Barra (Pendente 5) (Pendente 10)) -- peso total = 45

peso :: Mobile -> Int
peso (Pendente p) = p
peso (Barra mob1 mob2) = peso mob1 + peso mob2

-- B

size :: Mobile -> Int
size (Pendente n)    = 1
size (Barra x z) = size x + size z + 1

balanceado :: Mobile  -> Bool
balanceado (Pendente _ ) = True
balanceado (Barra l r) =
    let diff = abs (size l - size r) in
    diff <= 1 && balanceado l && balanceado r

-- Outra resolução
balanceado2 :: Mobile  -> Bool
balanceado2 (Pendente _) = True
balanceado2 (Barra m1 m2) = peso m1 == peso m2 && balanceado m1 && balanceado m2

-- 3

-- Em outro arquivo
