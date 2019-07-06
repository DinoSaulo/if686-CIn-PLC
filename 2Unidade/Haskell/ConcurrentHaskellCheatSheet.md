# Monads
what the fuck is a monad anyway?
# Nova abordagem: Compilação de códigos .hs e 'main'
## Imports úteis para concorrência e IO
```haskell
import Control.Concurrent.STM
import Control.Concurrent.STM.TVar
import Control.Concurrent
import Control.Monad
import System.IO
```

## Compilando
Agora é mais conveniente trabalhar com códigos compilados em Haskell, já que podemos definir um bloco main e trabalhar com itens executados sequencialmente (já veremos como).

Para compilar um código em Haskell:
```
ghc -o meuexecutavel meucodigo.hs
```

Após isso, é possível executar com:
```
./meuexecutável
```
(No Linux. Outras plataformas: usem linux.)

## public static void main?
Agora podemos criar um bloco 'main' que será executado automaticamente ao iniciar o código compilado, da seguinte forma:
```haskell
main = do
    let meuArray = [1,2,3,4,5]
    putStrLn (show (meuArray!!2) )
```
O bloco 'do' é extremamente útil e será utilizado extensivamente em haskell concorrente, pois permite a execução de comandos sequenciais. Antes, se tentávamos executar comandos sequencialmente sem o uso de um bloco 'do', a linguagem considerava a próxima linha como a continuação dos argumentos da função da linha acima, e não uma nova linha de comandos.

## Iniciando as threads
Para criarmos Threads, podemos usar a sintaxe a seguir:
```haskell
main = do
    forkIO (funcao1 arg1 arg2)
    forkIO (funcao2 arg1)
    forkIO (funcao3)
```

Cada comando ```forkIO``` cria uma nova thread que executará o método passado como argumento.

# Código Thread-Safe em Haskell
## IO
## MVars
Mutable Variables (Variáveis Mutáveis) são uma abordagem em haskell para memória compartilhada em concorrência. Podem ser vistas como uma fila bloqueante de tamanho 1. Quando uma thread vai manipular uma MVar, é necessário que ele 'retire' o valor e o tome para si, de forma que outra thread que tente obter esse valor será bloqueada. Quando o valor for devolvido (sendo modificado ou não) a thread bloqueada será automaticamente notificada de que pode retomar a execução e retirar a MVar para uso.

### Funções para MVar:
```haskell
-- Retira a MVar e retorna uma operação de IO contendo seu valor. Se a MVar estiver vazia, bloqueia até que algum valor seja adicionado
takeMVar :: MVar a -> IO a
-- Coloca o valor na MVar. Se Já houver valor na MVar, bloqueia até que esteja vazia.
putMVar :: MVar a -> a -> IO ()
-- Cria nova MVar vazia
newEmptyMVar :: IO (MVar a)
-- Cria nova MVar, mas permite inicialização.
newMVar :: a −> IO (MVar a)
-- Apenas lê a MVar mas mantém seu valor. No entanto, bloqueia se estiver vazia (nada para ler)
readMVar :: MVar a −> IO a
-- Checa se MVar está vazia
isEmptyMVar :: MVar a −> IO Bool
-- Versões não-bloqueantes de take e put.
tryTakeMVar :: MVar a −> IO (Maybe a)
tryPutMVar :: MVar a −> a −> IO Bool
```
## TVars, STM
STM - Software Transactional Memory é uma implementação de Haskell de memória transacional, que nos ajuda em concorrência de modo a não precisarmos fazer uso de meios bloqueantes entre threads. A forma mais simples de ver a memória transacional é relacionando ao funcionamento das transações de um banco de dados convencional - se a transação é bem sucedida e consistente, ele realiza um "COMMIT" e grava na tabela do banco. Caso haja alguma inconsistência a transação não é executada pela "metade". É feito um "ROLLBACK" e as mudanças já feitas não são aplicadas.

Isso pode ser feito em Haskell com TVars, isto é, Transactional Variables. 

### Funções sobre TVars
```haskell
readTVar :: TVar a -> STM a
writeTVar :: TVar a -> a -> STM ()
newTVar :: a -> STM (TVar a)
retry :: STM a -- Usado para reiniciar a transação caso haja alguma inconsistência
orElse :: STM a -> STM a -> STM a
```


## O método atomically()
Variáveis transacionais e seus métodos podem ser utilizados **apenas** através do método ```atomically```, que é util principalmente por 2 motivos
1) O método atomically transforma de STM() para IO(), permitindo um retorno nos métodos mais flexível.
2) O método atomically **garante** a atomicidade da transação (embora internamente, os comandos possam não ser executados atomicamente, o resultado visível é que foram) de forma que se houver inconsistência no meio da transação, ela é reiniciada desde o início até que se complete com consistência.

### Exemplo de uso - Semáforo Simples retornando STM():
```haskell
lock :: TVar Bool -> STM()
lock myLock = 
    do 
        myLock <- readTVar(myLock)
        if myLock
        then writeTVar(myLock False)
        else retry


unlock :: TVar Bool -> STM()
unlock myLock = do( writeTVar myLock True )
```

Nesse caso é importante lembrar de utilizar estes métodos ```lock``` e ```unlock``` que retornam STM() **apenas** dentro de blocos ```atomically```.

### Ou então, este exemplo de Semáforo Simples que retorna IO():
```haskell
lock :: TVar Bool -> IO()
lock myLock = 
    atomically (
        do 
            myLock <- readTVar(myLock)
            if myLock
            then writeTVar(myLock False)
            else retry
    )


unlock :: TVar Bool -> IO()
unlock myLock = atomically( do( writeTVar myLock True ) )
```
# Exemplo de BlockingQueue