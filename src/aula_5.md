# Aula 5 - Passagem de parâmetros.

## O que vamos aprender?

1. Passagem de parâmetro.
2. O que é uma biblioteca de software?
3. Criando nossas próprias funções parametrizadas.
4. Nomeando parâmetros.

## 1- Passagem de parâmetro.

Como já disse em outras aulas, quase tudo 
em *Elm* são **funções**. Isso inclui as palavras
*circle*, *triangle*, *square*, entre outras.  
Quando digitamos por exemplo:

```
circle yellow 100
```

*circle* é o nome de uma função, que tem
dois **parâmetros**: a cor e um diâmetro.
Por isso, sempre que vamos criar um
círculo, precisamos passar estes 2
parâmetros (em ordem).

Esta função *circle* está definida
dentro do *Playground*, que é uma
biblioteca do *Elm*.  

## 2- O que é uma biblioteca de software?

Ao desenvolvermos um *software*, vamos nos deparar
com vários problemas que já foram
enfrentados e solucionados por outras pessoas.  
Nestes casos, podemos reutilizar as soluções pré-existentes,
facilitando assim nosso trabalho.  
Por exemplo: desenhar um elemento na tela é uma tarefa
recorrente, necessária para vários programas diferentes.  
Por isso, outra pessoa desenvolvedora já solucionou este
problema e podemos nos aproveitar do trabalho dela para
desenvolvermos o nosso programa.  
Este conjunto de código (no caso do *Elm*, um
conjunto de **funções**) escritas por outras pessoas
é o que chamamos de **bibliotecas**. Até agora utilizamos
uma biblioteca, chamada *Playground*,
que contém funções que podemos utilizar
para desenhar e animar coisas na tela.

## 3- Criando nossas próprias funções parametrizadas

As funções que definimos em nossos
códigos também podem receber parâmetros.  
Observe o exemplo abaixo e tente
entender o que está acontecendo:

```
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
com frutas. Mas agora o código está
muito menor e mais simples.  
Além disso, agora é muito mais fácil
criar novas frutas em nossa árvore!

Na função *frutas* definida
no código acima, temos dois parâmetros:
*x* e *y*.  
Isso significa que sempre que formos
utilizar esta função, vamos ter que
passar estes 2 parâmetros.

Em algumas linguagens de programação,
precisamos especificar explicitamente
qual o tipo de cada variável.  
Em *Elm*, isso não é necessário. A
linguagem é esperta o suficiente para
descobrir que *x* e *y*, neste caso, são
números.

Note que dentro da função *fruta*
repassamos os valores de *x* e *y* para 
outra função na seguinte linha: 

```
move x y
```

## 4- Nomeando parâmetros

Embora em nosso exemplo o nome dos
parâmetros sejam apenas um caracter,
eles podem ser grandes e mais
expressivos. Poderia ser, por exemplo:

```
fruta posicaoX posicaoY =
 circle red 20
   |> move posicaoX posicaoY
```

Dar bons nomes para nossas variáveis
é algo muito importante na programação.

## E agora?

Agora chegou a hora de você colocar as mãos na massa
e praticar mais um pouco!

Siga para os [desafios da Aula 5](/aula_5_desafios.html) e bons estudos.
