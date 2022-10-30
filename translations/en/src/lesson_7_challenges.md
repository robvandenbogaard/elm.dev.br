# Aula 7: Desafios

## DESAFIO 1 (fácil): alterando a velocidade.

Leia o código abaixo e tente imaginar o que irá aparecer na tela. 
E o que significam os valores 10, 100 e 12?

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue (wave 10 100 12 time)
  ]
```

Agora altere o código acima para que o círculo pulse 4 vezes mais rápido.  
Em seguida, altere-o para que pulse 4 vezes mais lento que o código original.  

## DESAFIO 2 (fácil): Adicione um círculo dentro do outro.

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue (wave 10 100 10 time)
  ]
```

Inclua no código acima um novo círculo vermelho que fique estático/parado.  
Este novo círculo deve ficar sob o círculo azul e deve ter um diâmetro
igual a 200.

## DESAFIO 2 (Intermediário): Crie 2 círculos pulsando.

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue (wave 20 80 2 time)
  ]
```

Altere o código acima para atender os seguintes critérios:  
- Mova o circulo para a esquerda em 200 unidades.  
- Crie um novo círculo azul com a mesma ondulação deste e o
mova para direita em 200 unidades.  

O resultado final esperado são dois círculos pulsando no
mesmo ritmo, um ao lado do outro. Talvez dê para imaginarmos
isso como sendo a animação de dois olhos piscando?

## DESAFIO 3 (Avançado): Crie um triângulo entre os círculos.

Complemente o código do desafio 2 e crie um triângulo amarelo
estático/parado entre os dois círculos. 

Se imaginarmos que os círculos são 2 olhos, o triânulo seria
como se fosse um nariz! Ele deve obedecer as seguintes regras:  
- Deve ser na cor amarela.  
- Deve ter um diâmetro igual a 50.  
- Deve ficar 75 unidades para baixo no eixo vertical (eixo y)
em relação ao centro e bem no meio (0 unidades) no eixo vertical.  
- Deve ficar rotacionado de forma que a parte de cima seja
plana e a parte de baixo forme um ângulo.

O resultado final esperado são dois círculos pulsando no
mesmo ritmo, um ao lado do outro e um triângulo amarelo
simulando um nariz. Ou talvez o bico de um pássado!
Use sua imaginação :)

## DESAFIO 4 (Avançado/livre): Desenhe a figura de uma animal.

Ao longo das aulas aprendemos como desenhar triângulos, círculos,
retângulos e quadrados. Aprendemos também como rotacioná-los,
posicioná-los na tela e hoje aprendemos nossa primeira forma
de animação: movimento de ondulação (*wave*).

Use este conhecimento todo que você adquiriu até o momento e
tente desenhar a figura de um animal qualquer na tela. 

Se estiver sem inspiração, você pode tentar: desenha um pássaro,
um macaco, um cachorro, um gato... não se preocupe em deixar
o desenho perfeito. O importante é treinar!

## E agora?

Conseguiu fazer todos os exercícios? Teve dificuldade em algum?

Siga para as [respostas dos desafios](/aula_6_desafios_respostas.html)
para ver a solução.

