# Aula 5: Resposta dos desafios

## DESAFIO 1 (fácil): Crie mais frutas.

### Resposta

Para resolvermos este desafio, bastava chamarmos
a função *fruta* mais algumas vezes.  

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
    , fruta 10 10
    , fruta -10 -50
    , fruta 70 -40
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

O que aconteceria se tentassemos desenhar
frutas fora da árvore? Por enquanto não temos nenhuma
forma de bloquear isso, mas em um sistema real, teríamos
que pensar em formas de evitar que isso acontecesse.

## DESAFIO 2 (intermediário): Tamanho de folhas parametrizável.

No mesmo código do desafio 1, crie
um parâmetro para a função *folhas*
que represente o tamanho do círculo.  
Tente aumentar e diminuir o tamanho
do círculo.  
__Dicas__: Se você passar um valor muito grande ou muito pequeno
provavelmente sua árvore ficará estranha. Não se preocupe com
esses cenários por enquanto.

### Resposta

Para resolver este desafio, criei um novo parâmetro na função *folhas*
chamado diametro. Em seguida, repassei o valor desta variável
ao acionar a função *circle*.

```
import Playground exposing (..)

main =
  picture
    [ tronco
    , folhas 150
    , fruta 50 50
    , fruta -40 20
    , fruta -50 100
    , fruta 40 130
    , fruta 10 10
    , fruta -10 -50
    , fruta 70 -40
    ]

tronco =
  rectangle darkBrown 60 250
    |> move 0 -150

folhas diametro =
  circle green diametro
    |> move 0 50

fruta x y =
  circle red 20
    |> move x y
```

## E agora?

Siga para a [Aula 6](/aula_6.html) e bons estudos!
