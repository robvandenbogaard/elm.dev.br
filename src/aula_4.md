# Aula 4 - Criando funções.

Esta aula será mais teórica, mas o que vamos
aprender hoje é fundamental para entender todo
o resto que está por vir. Então, bora entender
o que é uma função??

## O que vamos aprender?

1. O que é uma funcão?  
  1.1 Funções matemáticas  
  1.2 Funções na programação  
2. Como criar nossas próprias funções?  
3. Vantagens ao utilizamos funções  

## 1- O que é uma função?

Conforme nosso código cresce, vai ficando cada
vez mais difícil identificarmos o que significa
cada uma de suas partes.  
Por exemplo, no código que desenhamos um ônibus
no desafio da aula 2. Quanto mais detalhes
colocávamos no desenho, maior
ficava o *main*.  
Mas afinal, o que é esse *main*? Ela é uma **função**.  
Na linguagem de programação *Elm*, quase tudo
que escrevemos são funcões! Isso por que ela é uma
linguagem que segue o **paradigma funcional**. Existem
vários tipos (paradigmas) de linguagens: Orientadas à Objetos,
Imperativas, Lógicas e também as Funcionais.

## 1.1- Funções matemáticas

Provavelmente você já deve ter ouvindo falar em
funções nas aulas de matemáticas na escola. Coisas como:  

```
x = y + 2
```

Mas o que significa *x = y + 2*? Essencialmente
significa que em qualquer lugar que tiver o
simbolo *x*, podemos substitui-lo por *y + 2*,
e vice versa. Por exemplo, se tivermos o seguinte
conjunto equações:

```
x = 5
y = 10
z = x + y
```

Para descobrirmos o valor de *z*, substituímos
o valor de *y* e em seguida o de *x*.

Função *z* original:

```
z = x + y
```

Substituindo o valor de *y*:

```
z = x + 10
```

Substituindo o valor de *x*:

```
z = 5 + 10
```

Assim chegamos a conclusão que *z* é igual a 15.

## 1.2 Funções na programação

Em programação (em especial em linguagens funcionais,
como *Elm* ou <a href='https://www.haskell.org/' target='_blank'>*Haskell*</a>),
o conceito de funcão é muito parecido.  
A função matemática *z* depende de *y* e de *x*, certo?  
Podemos fazer algo similar com nossa função *main*,
tornando-a dependente de outras funções menores e
mais simples. Isso deixará nosso código muito mais
fácil de ler e alterar depois.

Achou confuso? Vai ficar mais fácil de entender com o
exemplo a seguir.

## 2- Como criar nossas próprias funções?

Vamos partir inicialmente da nossa árvore para
então decompô-la em várias funções.

Função main original:

```
import Playground exposing (..)

main =
  picture
    [ rectangle darkBrown 60 250
        |> move 0 -150
    , circle green 150
        |> move 0 50
    ]
```

Podemos decompor nossa árvore, colocando a definição
de suas folhas em uma outra função:

```
import Playground exposing (..)

main =
  picture
    [ rectangle darkBrown 60 250
        |> move 0 -150
    , folhas
    ]

folhas =
  circle green 150
    |> move 0 50
```

Este novo código é equivalente ao anterior.

Para definirmos uma nova função, basta darmos um
nome para ela (uma palavra qualquer, neste caso,
*folhas*) seguida do simbolo **=**, da mesma forma
que na matemática.  
Tudo que estiver depois do símbolo de igual
fará parte da nossa nova função.  
Mas isso apenas **define** a função. Precisamos em
seguida utilizá-la um ou mais lugares
do código.

Para utilizar uma função, assim como na matemática, 
basta colocarmos seu nome. No nosso exemplo, 
a função *folhas* é utilizada como parte da função *main*.

É **muito** importante enteder este conceito!  
Analise com calma o código acima para ter certeza
que compreendeu.

__Dica__: em *Elm*, a ordem em que as funções
são definidas é irrelevante. Você pode definir
primeiro a função main e depois a função folhas
ou primeiro a função folha e depois a main.

Agora vamos separar o tronco de nossa árvore em
uma outra função:

```
import Playground exposing (..)

main =
  picture
    [ tronco
    , folhas
    ]

tronco =
  rectangle darkBrown 60 250
    |> move 0 -150

folhas =
  circle green 150
    |> move 0 50
```

Tente imaginar que a palavra *folhas*, dentro
da função *main*, será substituida pelo conteúdo
definido logo abaixo na função folhas. E o mesmo
para a palavra *tronco*.

Podemos dar um passo além, se quisermos, e
criarmos a função *arvore*:

```
import Playground exposing (..)

main =
  picture
    arvore

arvore =
  [ tronco
  , folhas
  ]

tronco =
  rectangle darkBrown 60 250
    |> move 0 -150

folhas =
  circle green 150
    |> move 0 50
```

Neste último exemplo a função *arvore* retorna
uma lista de formas geométricas, contendo um
tronco e uma folha.

## 3- Vantagens ao utilizarmos funções

Existem 2 grandes vantagens em dividirmos
nossos códigos em várias funções.  
A primeira é que torna mais fácil de
expressarmos nossas intenções. Observe a função
*main* que definimos inicialmente e a compare com
a função *main* de nosso último código. Desta nova
forma fica muito mais explícito o que estamos
tentando desenhar.  

Outra grande vantagem de programar assim é que
agora o tronco e as folhas estão **desacopladas**.  
Posso, por exemplo, reutilizar a função *tronco*
para desenhar outros tipos de árvores! Ou criar
um novo tipo de tronco e reaproveitar as folhas.  
Em programação, este é outro tema muito importante:
Reaproveitamento de códigos.

## E agora?

Agora chegou a hora de você colocar as mãos na massa
e praticar um pouco!

Siga para os [desafios da Aula 4](/aula_4_desafios.html) e bons estudos.
