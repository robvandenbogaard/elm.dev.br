s## Aula 4: Desafios

## DESAFIO 1 (fácil): Termine de desenhar o carro.

Abaixo temos um trecho incompleto de um
código para desenhar um carro.  
Escreva as três funções que estão faltando
para desenhar o carro.

```haskell
import Playground exposing (..)

main =
  picture
    carro

carro =
  [ carroceria
  , rodaFrontal
  , rodaTraseira
  ]
```

## DESAFIO 2 (fácil): Desenhe frutas na árvore.

O código abaixo representa uma árvore sem frutas.

```haskell
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

Adione mais algumas funções para representar
4 frutas na árvore. As frutas podem ser simples
esferas vermelhas.  

👩‍🏫 __Dica__: A forma mais fácil é criar 4 novas
funções: fruta1, fruta2, fruta3 e fruta4. Na próxima aula vamos ver uma forma melhor
para resolver este tipo de problema.  

## E agora?

Conseguiu fazer todos os exercícios? Teve dificuldade em algum?

Siga para as [respostas dos desafios](/aula_4_desafios_respostas.html)
para ver a solução.
