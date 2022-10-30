# Aula 8: Desafios

## DESAFIO 1 (fácil): Movendo na vertical.

Altere o código abaixo para que o quadrado se
mova na vertical (de cima para baixo) variando
sua posição no eixo *y* entre -100 e 100.  
A animação deve demorar 2 segundos para completar
o ciclo.

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ square darkGreen 100 
        |> move -0 0
  ]
```

### Resposta

Basta fixar o eixo *x* sempre no valor 0 e deixar
o eixo *y* variando entre -100 e 100 usando a função *zigzag*.

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ square darkGreen 100 
        |> move 0 (zigzag -100 100 2 time)
  ]
```

## DESAFIO 2 (fácil): Movendo na diagonal.

Altere o código do exercício 1 para que o quadrado
se mova na diagonal. O movimento deve começar no
ponto -100, -100 e terminar em 100, 100.

### Resposta

Existem algumas formas de resolver este exercício.  
A mais simples seria replicarmos a mesma chamada
que usamos no eixo *y* do exercício anterior
para o eixo *x*. Assim, movemos os 2 eixos
sempre da mesma forma, tendo como resultado o
movimento na diagonal.

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ square darkGreen 100 
        |> move (zigzag -100 100 2 time) (zigzag -100 100 2 time)
  ]
```

## DESAFIO 3 (livre): Misture movimentos.

Utilizando as funções *zigzag* e *wave*, desenhe figuras
se movendo pela tela.  
Você pode animar as rodas de um carro, os olhos de um animal,
ou simplesmente desenhar várias figuras se movendo
freneticamente pela tela! Use a imaginação.

### Repostas

Exercícios livres não possuem respostas certas ou erradas!
O importante é praticar e se divertir.

## E agora?

Siga para a [Aula 9](/aula_9.html) e bons estudos!

