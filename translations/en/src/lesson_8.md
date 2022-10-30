# Aula 8 - Fazendo movimentos de zigzag.

## O que você irá aprender nesta aula?

1. Como animar uma figura usando movimento de zigzag.  
1.1 A função *zigzag*.  

## 1- Como animar uma figura usando movimento de zigzag.  

Vamos partir do desenho de um círculo na tela,
deslocando-o um pouco para esquerda.

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue 100 
        |> move -200 0
  ]
```

Imagine que você queira criar uma animação nesta figura,
fazendo com que ela fique fazendo "zigzag" (alternando
sua direção).

No exemplo acima a posição do círculo está fixa em -200 no
eixo horizontal e 0 no vertial.  
Para fazer o movimento de "zigzag", este valor precisa ser
alterado conforme o tempo passa (aquela variável
_time_ que você conheceu na aula passada).

Para, por exemplo, criar uma animação onde o círculo fique
se movendo da esquerda para direita, é necessário variar sua posição na
horizontal. Ou seja, substituir o valor -200 por um
valor que se altere de forma linear ao longo do tempo. E a função **zigzag** cumpre 
justamente esta tarefa.

### 1.1 - A função _zigzag_.

_zigzag_ é uma função parecida com a _wave_. Ela também recebe quatro
parâmetros, sendo que os dois primeiros indicam os valores mínimo
e máximo e o terceiro indica a quantidade de segundos que a animação deve 
demorar para completar.

Agora que você já conhece a função _zigzag_ e sua finalidade, consegue
imaginar como seria o código para que um círculo fique se movendo
da esquerda para direita entre a posição -200 e 200 em um intervalo
de 5 segundos?

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue 100 
        |> move (zigzag -200 200 5 time) 0
  ]
```

Mais uma vez, você não podem esquecer os parênteses, já que
o primeiro parâmetro da função _move_ deve ser o resultado
da função _zigzag_. Para isso, é preciso indicar para o computador
(através do uso dos parênteses) que você quer primeiro processar e calcular
o valor da função *zigzag* para em seguida processar a função *move*.

E aí? Já está começando a imaginar as possibilidades para criar
animações mais complexas e quem sabe até jogos com essas funções? 😃

## E agora?

Agora chegou a hora de você colocar as mãos na massa
e praticar mais um pouco!

Siga para os [desafios da Aula 8](/aula_8_desafios.html) e bons estudos.
