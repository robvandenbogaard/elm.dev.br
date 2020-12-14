# Aula 9 - Entendendo o que são os *Records*.

Quando temos muitas informações no sistema, precisamos
começar a nos preocupar em como organiza-las.

Já aprendemos a criar listas usando os símbolos **[** e
**]**. Esta é uma das formas de organizarmos. Outra é
através dos *Records*.

## O que vamos aprender?

1. O que são os *Records*.  
2. Criando uma função que recebe um *Record*.

## 1- O que são os *Records*.  

*Record* é uma forma de organizarmos nossos dados no linguagem
de programação *Elm*. 

Com o que aprendemos até agora, se quisermos criar uma função que
receba como parâmetro um ponto no espaço, estávamos passando dois
argumentos numéricos separados: *x* e *y*, como no exemplo abaixo:

```
import Playground exposing (..)

main =
  picture
  [ circuloverde 10 20
  ]

circuloverde x y =
  circle green 50
    |> move x y
```

Você consegue entender o que está acontecendo no código acima?  
Caso tenha dificuldades, <a href=./aula_4.md>volte para a aula 4</a> para
revisar como criar uma função parametrizada.

No exemplo acima nossa função *circuloVerde* recebe dois parâmetros numéricos
que chamamos de *x* e *y*. Neste caso isso é suficiente e funciona bem. Mas
podemos fazer de uma outra maneira: podemos criar uma estrutura (ou um *Record*)
que representa um **Ponto**. A ideia é deixar mais explícito no código o que 
essa informação representa.

Então *record* é uma **estrutura de dados** com rotulos. Abaixo temos um exemplo
de um *record*.

```
{ x = 10, y = 15 }
```

Na linguagem *Elm*, tudo que estiver entre **{** e **}** é um *record*.

## 2. Criando uma função que recebe um *Record*.

Podemos agora alterar o código anterior para que nossa função
*circuloVerde* receba um *record*:

```
import Playground exposing (..)

main =
  picture
  [ circuloverde {x = 10, y = 20}
  ]

circuloverde {x, y} =
  circle green 50
    |> move x y
```

Se preferirmos, podemos também armazenar estes valores em uma variável,
como no exemplo abaixo:

```
import Playground exposing (..)

posicao = {x = 10, y = 20}

main =
  picture
  [ circuloverde posicao
  ]

circuloverde {x, y} =
  circle green 50
    |> move x y
```

Agora ficou um pouco mais claro o que significa o 10 e o 20, mas podemos
dar um passo além. É possível criarmos um nome (um *alias*) para
esta estrutura.

## Criando um *alias*.

No código abaixo definimos o que é um Ponto2D. Poderíamos dar um qualquer nome,
mas ele deve começar **obrigatóriamente** com uma letra maiúscula.  

```
type alias Ponto2D =
  { x : Number 
  , y : Number
  }
```

Neste código, explicamos para o computador que um Ponto2D é uma **estrutura de dados**
que contém dois campos: o *x* e o *y*. Desta vez também avisamos o computador que
estes campos devem armazer dados do tipo *Number* (número em inglês).

A linguagem de programação *Elm* possui <a href="https://guide.elm-lang.org/types/" target=_blank>
uma série de tipos de dados</a> que podemos utilizar. Alguns exemplos são: *Number*, *Int*, *String*,
*Bool*, *List*, *Float*, entre outras. Mas não se preocupe em decorar isso! Ao longo do curso
vamos aprender quando utilizá-las, juntos.

Ao criarmos um novo *alias* Ponto2D, apenas definirmos o que ele representa e ainda não
criamos um ponto efetivamente. Mas a linguagem *Elm* automatizamente disponibilizará
uma nova função chamada Ponto2D (esperando os respectivos parâmetros definidos no *alias*), 
que chamamos de **construtor** (ou *Type Constructor* - Construtor de Tipos em inglês).
Acionando esta função podemos construir um novo ponto:

```
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

Neste exemplo a função *circuloVerde* continua recebendo o *record*
de forma mais simples, usando as chaves. Mas podemos dar um passo
além: podemos dar mome para este parâmetro:

```
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

Agora ficou muito claro na nossa função *circuloVerde* que
o parâmetro esperado é um ponto e que este ponto
possui dois campos: *x* e *y*. Para acessarmos estes
campos utilizamos o símbolo de ponto final. Logo,
para acessarmos o campo *x*, basta digitarmos *ponto.x*.

## Conclusão

É provável que você esteja se perguntando o por que disso
tudo! Esta nova versão do nosso código é maior e talvez um pouco mais
confusa. E eu diria... você está certa! Neste exemplo,
complicamos uma solução que era simples e isso não é uma
boa prática! Mas precisei fazer isso para explicar
os conceitos pra você. Em outras situações o uso de *records*
irá simplificar muito o código. Por isso, é muito importante
discutirmos e aprendermos este conceito.

## E agora?

Esta aula foi bastante teórica, então chegou a hora de você
colocar as mãos na massa e praticar mais um pouco!

Siga para os [desafios da Aula 9](/aula_9_desafios.html) e bons estudos.
