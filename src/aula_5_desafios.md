# Aula 5: Desafios

## DESAFIO 1 (fácil): Crie mais frutas.

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

Altere o código definido acima e crie mais
três frutas em nossa árvore.

## DESAFIO 2 (intermediário): Tamanho de folhas parametrizável.

No mesmo código do desafio 1, crie
um parâmetro para a função *folhas*
que represente o tamanho do círculo.  
Tente aumentar e diminuir o tamanho
do círculo.  
__Dica__: Se você passar um valor muito grande ou muito pequeno
provavelmente sua árvore ficará estranha, já que as folhas não
estarão tocando o tronco. Não se preocupe com esses cenários
por enquanto.

## E agora?

Conseguiu fazer todos os exercícios? Teve dificuldade em algum?

Siga para as [respostas dos desafios](/aula_5_desafios_respostas.html)
para ver a solução.
