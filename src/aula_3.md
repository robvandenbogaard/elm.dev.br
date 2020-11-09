# Aula 3

## O que vamos aprender?
1. Como desenhar outras figuras geométricas.
2. Posicionar uma forma geométrica.  
  2.1 Movendo a forma geométrica.  
  2.2 Rotacionando a forma geométrica.

## 1- Como desenhar outras figuras geométricas.

Além de círculos, podemos desenhar:
- Triagulos (triangle)
- Quadrados (square)
- Retangulos (rectangle)
- Ovais (oval)
- Pentagonos (pentagon)
- Hexagonos (hexagon)
- Octagonos (octagon)
- Polígonos (polygon)

É possível desenhar também imagens estáticas e
animadas, mas isso será abordado em outra aula ;)  
Hoje vamos aprender a desenhar triângulos,
quadrados e retângulos.  
Primeiro vamos fazer um programa que desenha
um círculo com um quadrado dentro, um triângulo
dentro do quadrado e por último um pequeno
retângulo.  

Mais uma vez, abra uma aba em seu navegador o site
[https://elm-lang.org/try](https://elm-lang.org/try),
cole o código abaixo e pressione *Compile* para ver o resultado.

```
import Playground exposing (..)

main =
  picture
    [ circle blue 200
    , square green 250
    , triangle red 120
    , rectangle yellow 70 30
    ]
```

Note que no caso do círculo, o segundo PARÂMETRO
é o tamanho do RAIO. Já no quadrado, o segundo
parâmetro é o tamanho dos lados (lembre-se que
os lados de um quadrado tem sempre o mesmo
tamanho, por isso precisamos passar apenas um
número).

No caso do triângulo, será desenhado um triângulo
equilatero (todos os lados de tamanhos iguais).
Mas o número do segundo parâmetro NÃO é o tamanho
dos lados, mas sim o RAIO, ou seja, a distância
entre o centro do triângulo e os 3 pontos que
formam o triângulo (similar ao raio do círculo).  
Ficou em dúvida? Altere o tamanho do triângulo
para ser igual ao do círculo e veja o que
acontece!

Note também que o retângulo recebe, além da cor,
dois parâmetros numéricos.  
Consegue imaginar o que significam?  
O primeiro número representa a largura do
retângulo e o último sua altura.

## 2 - Posicionar uma forma geométrica.

### 2.1 - Movendo a forma geométrica.

Você deve ter reparado que toda forma geométrica
que desenhamos até agora aparecem bem no meio
da tela, certo? Apenas com isso fica difícil
de desenharmos coisas mais legais, como uma
árvore ou um carro. Para fazer desenhos
complexos temos que posicionar os elementos
na tela. Para isso, basta logo depois de
declarar uma forma geométrica, colocar o
simbolo **|>**, que indica que queremos
aplicar uma transformação. Em seguida, podemos
pedir para o computador MOVER a forma geométrica
com a operação *move* (mover em inglês).  
Para mover algo precisamos passar dois
PARÂMETROS: o valor do deslocamento no eixo
x e o valor do deslocamento no eixo y.  
O valor do eixo x vai deslocar a forma
geométrica para direita do centro da tela
(caso o valor seja positivo) ou para
esquerda (caso o valor seja negativo).  
O valor de y irá desloca-la
para baixo (caso valor seja negativo)
ou para cima (caso positivo).  
__Dica__: o ponto 0,0 encontra-se bem no
meio da tela e é a partir dele que
vamos deslocar as formas geométricas.
Ficou confusa? Tente alterar os valores
e veja o resultado!

No exemplo abaixo, desenhamos dois círculos,
um ao lado do outro. Veja com atenção o
código e tente entendê-lo. Em seguida,
copie o código para a outra aba de seu
navegador e clique em *Compile* para ver o
resultado.

```
import Playground exposing (..)

main =
 picture
   [ circle blue 100
       |> move -100 0
   , circle red 100
       |> move 100 0
   ]
```

Experimente alterar os valores e veja o
resultado.

### 2.2 Rotacionando a forma geométrica.

Além de mover nos eixos x e y, podemos
também rotacionar as formas.  
Podemos fazer com que o triângulo fique
um pouco torto, por exemplo.
Assim temos mais liberdade na hora de
desenhar!  
Rotacionar uma forma é muito similar ao
que fizemos para mova-las. Utilizamos
o simbolo **|>** seguido da palavra
*rotate* (rotacionar em inglês).  
O *rotate* recebe apenas um parâmetro,
que é um número entre 0 e 360, que
representa o grau do ângulo.
Este valor também pode ser negativo.  
Valores positivos rotacionam a figura
no sentido ANTI-horário. Negativos,
no sentido horário.  
Você consegue ler o código abaixo
e tentar imaginar o que será desenhado?

Copie o código para a outra aba de seu
navegador e clique em *Compile* para ver o
resultado.

```
import Playground exposing (..)

main =
  picture
   [ triangle green 100
       |> move -100 0
       |> rotate 45
   , triangle red 100
       |> move 100 0
       |> rotate -45
   ]
```

Fácil né?! Experimente mudar os número e veja o que acontece.

## E agora?

Agora chegou a hora de você colocar as mãos na massa
e praticar um pouco!

Siga para os [desafios da Aula 3](/aula_3_desafios.html) e bons estudos!
