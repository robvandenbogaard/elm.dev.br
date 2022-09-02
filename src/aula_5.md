# Aula 5 - Passagem de parâmetros.

## O que você irá aprender nesta aula?

1. Passagem de parâmetro.  
2. Bibliotecas de software.  
3. Como criar suas próprias funções parametrizadas.  
4. Parâmetros nomeados.  

## 1- Passagem de parâmetro

Como já disse em outras aulas, quase tudo 
em *Elm* são **funções**. Isso inclui as palavras
*circle*, *triangle*, *square*, entre outras.  
Quando digitamos por exemplo:

```haskell
circle yellow 100
```

*circle* é o nome de uma função que tem
dois **parâmetros**: uma cor e um diâmetro.
Por isso, sempre que vamos criar um
círculo, precisamos passar 2
argumentos (em ordem).

Esta função *circle* está definida
dentro do *Playground*, que é uma
biblioteca do *Elm*.  

## 2- Bibliotecas de software

Ao desenvolvermos um *software* vamos nos deparar
com vários problemas que outras pessoas já 
enfrentaram e solucionaram.  
Nestes casos podemos reutilizar as soluções pré-existentes,
facilitando assim nosso trabalho.  
Por exemplo: desenhar um elemento na tela é uma tarefa
recorrente e utilizada para vários programas diferentes.  
Por isso, outra pessoa desenvolvedora já solucionou este
problema e podemos nos aproveitar do trabalho dela para
desenvolvermos o nosso programa.  
Este conjunto de código escrito por outras pessoas
é o que chamamos de **bibliotecas**. Até agora utilizamos
uma biblioteca, a *Playground*,
que contém funções que podemos utilizar
para desenhar e animar figuras na tela.

## 3- Como criar suas próprias funções parametrizadas

As funções que definimos em nossos
códigos também podem ter parâmetros.  
Observe o exemplo abaixo e tente
entender o que está acontecendo:

```haskell
import Playground exposing (..)

main =
  picture
    [ tronco
    , folhas
    , fruta 50 50
    , fruta -40 20
    , fruta -50 100
    , fruta 40 130
    ]

tronco =
  rectangle darkBrown 60 250
    |> move 0 -150

folhas =
  circle green 150
    |> move 0 50

fruta x y =
  circle red 20
    |> move x y
```

O resultado final é o mesmo que tínhamos
no desafio da aula passada: uma árvore
com frutas. Mas o código está
menor e mais simples.  
Além disso, agora é mais fácil criar novas 
frutas em nossa árvore!

Na função *frutas* definida
no código acima, temos dois parâmetros:
*x* e *y*.  
Isso significa que sempre que formos
utilizar esta função, vamos ter que
passar 2 argumentos (valores).

Em algumas linguagens de programação
precisamos especificar explicitamente
qual o tipo de cada variável.  
Em *Elm* isso não é necessário. A
linguagem é esperta o suficiente para
descobrir que *x* e *y*, neste caso, são
números.

Observe também que dentro da função *fruta*
repassamos os valores de *x* e *y* para 
outra função na seguinte linha: 

```haskell
move x y
```

## 4- Parâmetros nomeados

Embora em nosso exemplo o nome dos
parâmetros sejam apenas um caracter,
eles podem ser grandes e mais
expressivos. Poderia ser, por exemplo:

```haskell
fruta posicaoX posicaoY =
 circle red 20
   |> move posicaoX posicaoY
```

🚨 **Importante**: dar bons nomes para nossas variáveis e
funções é uma das tarefas mais difíceis na programação! 
Por isso, reflita bastante antes de escolher um nome e, 
se necessário, troque por um mais descritivo sempre que
achar que o código está ficando confuso.

## E agora?

Agora chegou a hora de você colocar as mãos na massa
e praticar mais um pouco!

Siga para os [desafios da Aula 5](/aula_5_desafios.html) e bons estudos.
