data Estacao = Inverno | Verao | Outono | Primavera
data Temp = Frio | Quente deriving (Eq, Show, Ord)

clima :: Estacao -> Temp
clima Inverno = Frio
clima _ = Quente

type Nome = String
type Idade = Int

data Pessoas = Pessoa Nome Idade deriving (Eq, Show, Ord)

pessoa1 = Pessoa "Jose" 22
pessoa2 = Pessoa "Maria" 23

showPerson :: Pessoas -> String
showPerson ( Pessoa n a ) = n ++ "--" ++ show a

-- Produto

exibirPessoa :: Pessoas -> String
exibirPessoa (Pessoa n i) = n ++ " " ++ show i

type PessoasPar = (Nome, Idade)

exibirPar :: PessoasPar -> String
exibirPar (n,i) = n ++ " " ++ show i

