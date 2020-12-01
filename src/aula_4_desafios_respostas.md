# Aula 4: Resposta dos desafios

## DESAFIO 1 (fácil): Termine de desenhar o carro.

Escreva as três funções que estão faltando
para desenhar o carro.

### Resposta

```
import Playground exposing (..)

main =
  picture
    carro

carro =
  [ carroceria
  , rodaFrontal
  , rodaTraseira
  ]

carroceria =
  rectangle darkGreen 450 150

rodaFrontal =
  circle darkRed 60
    |> move -100 -100

rodaTraseira =
  circle darkRed 60
     |> move 100 -100
```

## DESAFIO 2 (fácil): Desenhe frutas na árvore.

### Resposta

```
import Playground exposing (..)

main =
  picture
    [ tronco
    , folhas
    , fruta1
    , fruta2
    , fruta3
    , fruta4
    ]

tronco =
  rectangle darkBrown 60 250
    |> move 0 -150

folhas =
  circle green 150
    |> move 0 50

fruta1 =
  circle red 20
    |> move 50 50

fruta2 =
  circle red 20
    |> move -40 20

fruta3 =
  circle red 20
    |> move -50 100

fruta4 =
  circle red 20
    |> move 40 130
```

Fácil né? Mas talvez você esteja se perguntando:
Quando devemos criar uma nova função?  
Perceber quando é uma boa ideia "quebrar" uma
função em diversas pequenas funções é algo que
aprendemos com a experiência.  
Em geral, é uma boa ideia "quebrar" uma função
em outras menores quando o código começa a
ficar confuso e torna-se difícil distinguir
qual parte do código faz o que.

Em breve vamos aprender a resolver este mesmo
tipo de problema de formas mais elegantes,
reaproveitando melhor o código.

## E agora?

Siga para a [Aula 5](/aula_5.html) e bons estudos!
