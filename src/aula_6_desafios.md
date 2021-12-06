# Aula 6: Desafios

## DESAFIO 1 (fácil): alterando a velocidade.

```haskell
import Playground exposing (..)

main =
  animation view

view time =
    [ triangle red 100
          |> rotate (spin 8 time)
    ]
```

Altere o código definido acima para que o triângulo gire 2x mais rápido.  
Em seguida altere-o para que gire 2x mais lento.

## DESAFIO 2 (intermediário): mais formas geométricas.

No mesmo código do desafio 1, adicione ao fundo do triângulo um
quadrado amarelo. O quadrado deve girar 2x mais lento que o triângulo.

## DESAFIO 3 (avançado): rotacionando no sentido horário.

Até agora nossas animações estão girando no sentido anti-horário
(para esquerda). Altere o código do desafio 2 para que o triângulo 
gire no sentido horário (para direita) e o quadrado continue
girando no sentido anti-horário.

__DICAS__: 
  - Lembre-se que a função *rotate* pode receber valores positivos
  ou negativos. Valores positivos fazem com que a figura seja rotacionado
  no sentido anti-horário e valore negativos no sentido horário.  
  - Para girar no sentido anti-horário o resultado do valor *(spin 8 time)*
  precisa ser negativo.

## E agora?

Conseguiu fazer todos os exercícios? Teve dificuldade em algum?

Siga para as [respostas dos desafios](/aula_6_desafios_respostas.html)
para ver a solução.

