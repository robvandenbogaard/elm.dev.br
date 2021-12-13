# Aula 9 - Entendendo o que são os *Records*.

Quando temos muitas informações em nossos programas, precisamos
começar a nos preocupar em como organiza-las.

Já aprendemos a criar listas usando os símbolos **[** e
**]**. Esta é uma das formas de organizarmos. Outra é
através dos *Records*.

Esta aula será bastante teórica e um pouco difícil. Mas
você precisa entender alguns conceitos importantes para
conseguir dar continuidade aos seus estudos.

## O que vamos aprender?

1. O que são os *Records*.  
2. Criando uma função que recebe um *Record*.

## 1- O que são os *Records*.  

*Record* é uma forma de organizar nossos dados na linguagem
de programação *Elm*. 

Vamos partir de um código criado sem o uso de *Records* para
entender o tipo de problemas que possivelmente vamos enfrentar.

Com o que aprendemos até agora, para criar uma função que
recebe como parâmetro um ponto no espaço, passamos dois
argumentos numéricos separados: *x* e *y*, como no exemplo abaixo:

```haskell
import Playground exposing (..)

main =
  picture
  [ circuloVerde 10 20
  ]

circuloVerde x y =
  circle green 50
    |> move x y
```

Você consegue entender o que está acontecendo no código acima?  
Caso tenha dificuldades, <a href=./aula_4.md>volte para a aula 4</a> para
revisar como criar uma função parametrizada.

Neste exemplo nossa função *circuloVerde* recebe dois parâmetros numéricos
que chamamos de *x* e *y*. Neste caso isso é suficiente e funciona bem. Mas
podemos fazer de uma outra maneira: podemos criar uma estrutura (ou um *Record*)
que representa um **Ponto**. A ideia é deixar mais explícito no código o que 
essa informação representa.

Então *Record* é uma **estrutura de dados** com rótulos. Abaixo temos um exemplo
de um *Record*.

```haskell
{ x = 10, y = 15 }
```

Na linguagem _Elm_, tudo que estiver entre **{** e **}** é um *record*.

## 2. Criando uma função que recebe um _Record_.

Podemos agora alterar o código anterior para que nossa função
_circuloVerde_ receba um _Record_:

```haskell
import Playground exposing (..)

main =
  picture
  [ circuloVerde {x = 10, y = 20}
  ]

circuloVerde {x, y} =
  circle green 50
    |> move x y
```

Se preferirmos, podemos também armazenar estes valores em uma variável,
como no exemplo abaixo:

```haskell
import Playground exposing (..)

posicao = {x = 10, y = 20}

main =
  picture
  [ circuloVerde posicao
  ]

circuloVerde {x, y} =
  circle green 50
    |> move x y
```

Agora ficou um pouco mais claro o que significa o 10 e o 20, mas podemos
dar um passo além. É possível dar um nome (um *alias*) para
esta estrutura.

## Criando um *alias*.

No código abaixo definimos o que é um Ponto2D. Podemos dar um qualquer nome,
mas ele deve começar **obrigatóriamente** com uma letra maiúscula.  

```haskell
type alias Ponto2D =
  { x : Number 
  , y : Number
  }
```

Neste código, explicamos para o computador que um Ponto2D é uma **estrutura de dados**
que contém dois campos: o _x_ e o _y_. Desta vez também avisamos o computador que
estes campos devem armazer dados do tipo _Number_ (número em inglês).

A linguagem de programação _Elm_ possui <a href="https://guide.elm-lang.org/types/" target=_blank>
uma série de tipos de dados</a> que podemos utilizar. Alguns exemplos são: _Number_, _Int_, _String_,
_Bool_, _List_, _Float_, entre outras. Mas não se preocupe em decorar isso! Ao longo do curso
vamos aprender quando utilizá-las.

Ao criar um novo *alias* Ponto2D apenas definirmos o que ele representa, mas ainda não
criamos um ponto efetivamente. A linguagem _Elm_ automatizamente disponibilizará
uma nova **função** chamada **Ponto2D** (esperando os respectivos parâmetros definidos no _alias_), 
que chamamos de **construtor** (ou _Type Constructor_ - Construtor de Tipos em inglês).
Acionando esta função podemos construir um novo ponto:

```haskell
import Playground exposing (..)

type alias Ponto2D =
  { x : Number 
  , y : Number
  }

posicao = Ponto2D 10 20

main =
  picture
  [ circuloVerde posicao
  ]

circuloVerde {x, y} =
  circle green 50
    |> move x y
```

Neste exemplo a função _circuloVerde_ continua recebendo um _Record_
de forma mais simples, usando as chaves. Mas podemos ir além e
dar um mome para este parâmetro:

```haskell
import Playground exposing (..)

type alias Ponto2D =
  { x : Number 
  , y : Number
  }

posicao = Ponto2D 10 20

main =
  picture
  [ circuloVerde posicao
  ]

circuloVerde ponto =
  circle green 50
    |> move ponto.x ponto.y
```

Agora ficou muito claro na nossa função _circuloVerde_ que
o parâmetro esperado é um ponto e que este ponto
possui dois campos (_x_ e _y_) e que ambos são números. 
Para acessar estes campos utilizamos o símbolo de ponto final. 
Logo, para acessar o campo _x_ basta digitar _ponto.x_.

## Conclusão

É provável que você esteja se perguntando o por que disso
tudo! Esta nova versão do nosso código é maior e talvez um pouco mais
confusa. E eu diria que... você está certa! Neste exemplo,
complicamos uma solução que era simples e isso não é uma
boa prática. Mas precisei fazer isso para explicar
os conceitos pra você. Em outras situações o uso de _Records_
irá **simplificar** muito o código. Por isso é muito importante
entender este conceito.

## E agora?

Esta aula foi bastante teórica, então chegou a hora de você
colocar as mãos na massa e praticar mais um pouco!

Siga para os [desafios da Aula 9](/aula_9_desafios.html) e bons estudos.
