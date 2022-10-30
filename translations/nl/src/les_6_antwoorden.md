# Aula 6: Resposta dos desafios

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

### Resposta

Para que o triângulo gire 2x mais rápido, basta dividir pela
metade o primeiro parâmetro do método *spin*. Lembre-se: o primeiro
parâmetro indica quantos segundos vai demorar para que a figura
faça uma rotação completa. Logo, quanto menor o tempo, mais rápido
será a velocidade de rotação da figura.

Código com rotação 2x mais rápida:

```haskell
import Playground exposing (..)

main =
  animation view

view time =
    [ triangle red 100
          |> rotate (spin 4 time)
    ]
```

Código com rotação 2x mais devagar:

```haskell
import Playground exposing (..)

main =
  animation view

view time =
    [ triangle red 100
          |> rotate (spin 16 time)
    ]
```

## DESAFIO 2 (intermediário): mais formas geométricas.

No mesmo código do desafio 1, adicione ao fundo do triângulo um
quadrado amarelo. O quadrado deve girar 2x mais lento que o triângulo.

A nossa função *view* define uma lista de formas geométricas.
Para adicionarmos um quadrado ao fundo do triângulo, basta
declarmos um *square* no inicio da lista de formas geométricas.  
Como queremos que ele rotacione na metade da velocidade, precisamos
aplicar a transformação através da função *rotate* de forma similar
ao que fizemos com o triângulo, mas passando um valor maior para a
função *spin*, para que o intervalor de rotação seja maior.  
Lembre-se que em uma lista, separamos os elementos através da vírgula.

### Resposta

Vamos quebrar a resposta em 2 partes. Primeiro vamos adicionar o
quadrado (*square* em inglês) ao fundo da imagem sem animação:

```haskell
import Playground exposing (..)

main =
  animation view

view time =
    [ square yellow 300
    , triangle red 100
          |> rotate (spin 16 time)
    ]
```

Agora vamos completar o desafio, rotacionando nosso quadrado:

```haskell
import Playground exposing (..)

main =
  animation view

view time =
    [ square yellow 300
          |> rotate (spin 16 time)
    , triangle red 100
          |> rotate (spin 8 time)
    ]
```

## DESAFIO 3 (avançado): rotacionando no sentido horário.

Até agora nossas animações estão girando no sentido anti-horário
(para esquerda). Altere o código do desafio 2 para que o triângulo 
gire no sentido horário (para direita) e o quadrado continue
girando no sentido anti-horário.

👩‍🏫 __Dicas__: 
  - Lembre-se que a função *rotate* pode receber valores positivos
  ou negativos. Valores positivos fazem com que a figura seja rotacionado
  no sentido anti-horário e valore negativos no sentido horário.  
  - Para girar no sentido anti-horário o resultado do valor *(spin 8 time)* 
  precisa ser negativo.

### Resposta

Existem algumas formas de resolver este problema. Talvez a mais simples
seja partirmos do valor 360 (graus) e subtraírmos deste valor o resultado
da operação *(spin 8 time)*.  
Desta forma, quando o valor da operação *(spin 8 time)* for 0, vamos transformar
este resultado em 360. E quando ele for 360, vamos transforma-lo em 0.
Quando for 180, transformaremos em -180, e assim por diante.  

Lembre-se de colocar um novo parênteses para que o valor seja calculado primeiro,
caso contrário irá receber uma mensagem de erro.

```haskell
import Playground exposing (..)

main =
  animation view

view time =
    [ square yellow 300
          |> rotate (spin 16 time)
    , triangle red 100
          |> rotate (360 - (spin 8 time))
    ]
```

## E agora?

Siga para a [Aula 6](/aula_6.html) e bons estudos!
