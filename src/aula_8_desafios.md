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

## DESAFIO 2 (fácil): Movendo na diagonal.

Altere o código do exercício 1 para que o quadrado
se mova na diagonal. O movimento deve começar no
ponto -100, -100 e terminar em 100, 100.

## DESAFIO 3 (livre): Misture movimentos.

Utilizando as funções *zigzag* e *wave*, desenhe figuras
se movendo pela tela.  
Você pode animar as rodas de um carro, os olhos de um animal,
ou simplesmente desenhar várias figuras se movendo
freneticamente pela tela! Use a imaginação.

## E agora?

Conseguiu fazer todos os exercícios? Teve dificuldade em algum?

Siga para as [respostas dos desafios](/aula_8_desafios_respostas.html)
para ver a solução.

