# Aula 9: Desafios

## DESAFIO 1 (fácil): abstraindo o conceito de Árvore.

Observe o código abaixo e tente entender o que está acontecendo.

```haskell
import Playground exposing (..)

type alias Arvore =
  { altura : Number 
  , largura : Number
  , raioCopa: Number
  }

minhaArvore = Arvore 150 40 75

main =
  picture (desenharArvore minhaArvore)

-- Esta função está incompleta.
desenharArvore arvore =
  [ circle green arvore.raioCopa
  ]
```

Você consegue imaginar o que vai acontecer se executarmos este código?

Utilizando um *type alias* estamos primeiro explicando para o
computador o que é uma árvore. Neste caso, uma árvore é formada
por 3 campos: altura, largura e raioCopa. Os dois primeiros
representam informações do tronco e o último da copa/folhas.  
Com estas informações somos capazes de, a partir desta estrutura,
desenharmos árvores parecidas com as que fizemos na
<a href="./aula_3_desafios_respostas.html">aula 3</a>e 
<a href="./aula_4.html">aula 4</a> deste curso.

Como deve ter observado, a função desenharArvore está incompleta e
estamos desenhando apenas a copa/folhas de nossa árvore.

Antes de continuar, abra o seguinte endereço em uma
outra aba em seu navegador:
<a href='https://elm-lang.org/try' target='_blank'>htts://elm-lang.org/try</a>
e execute o código definido mais acima.

Agora altere a função desenharArvore para que ela desenhe também
o tronco de nossa árvore.

### Resposta

Existem várias várias formas de resolver este desafio. A parte mais difícil
não tem a ver com programação, mas com matemática! :)

Precisamos definir onde será desenhado o retângulo que representa o tronco
de nossa árvore e, dessa vez, este valor é parametrizado. Desenhar o
retângulo é a parte fácil:

```haskell
import Playground exposing (..)

type alias Arvore =
  { altura : Number 
  , largura : Number
  , raioCopa: Number
  }

minhaArvore = Arvore 100 20 50

main =
  picture (desenharArvore minhaArvore)

desenharArvore arvore =
  [ circle green arvore.raioCopa
  , rectangle darkBrown arvore.largura arvore.altura
  ]
```

Mas se executarmos este código, vamos ver que o tronco é desenhado
em cima das folhas. Precisamos move-lo para baixo para que fique
na borda do círculo.

Aqui, você poderia ter adotado diferentes estratégias. Eu optei por
calcular o ponto exato onde termina o círculo para mover meu
tronco até este local. Para isso, preciso somar 2 valores: o raio do
círculo mais metade da altura do tronco. Desta forma, o tronco
ficará posicionado exatamente no final das folhas:

```haskell
import Playground exposing (..)

type alias Arvore =
  { altura : Number 
  , largura : Number
  , raioCopa: Number
  }

minhaArvore = Arvore 150 40 75

main =
  picture (desenharArvore minhaArvore)

desenharArvore arvore =
  [ circle green arvore.raioCopa
  , rectangle darkBrown arvore.largura arvore.altura
    |> move 0 -(arvore.raioCopa + (arvore.altura / 2))
  ]
```

## DESAFIO 2 (difícil): desenhando olhos.

Vamos criar formas de desenhar olhos na tela de forma parametrizada.  

Você deve criar uma funcao chamada *olho* que irá receber como
parâmetro um *record* chamado *posicao*. Este record deve ser
definido através de um *type alias* chamado *Posicao* e de deve
conter os campos *x* e *y*, ambos do tipo *Number*.  

A função *olho* deve retornar uma lista de circulos, que representam
um olho na tela. Nosso olho será composto por pelo menos 2 círculos,
um dentro do outro. Use sua imaginação para desenha-lo!

Em seguida, crie 2 outras funções chamadas *olhoEsquerdo* e *olhoDireito*.
Estas funções devem acionar a função *olho* passando a posição dos
olhos. O olho esquerdo deve ser desenhado a partir do ponto (-100, 20) e o
olho direito a partir do ponto (100, 20).

Por último, a sua função *main* deve acionar as função *olhoEsquerdo* e
*olhoDireito* para desenhar as figuras na tela.

**Dica**: ambas as funções *olhoEsquerdo* e *olhoDireito* retornam uma
lista de figuras. Será necessário juntas estas duas listas em uma só
antes de acionar a função *main* (que espera uma única lista de figuras).
Para fazer isso você pode usar o simbolo **++**. Exemplo: 

```haskell
numerosPequenos = [1,2,3]
numerosGrandes = [100,101,102]
listaDeNumeros = numerosPequenos ++ numerosGrandes

```
No código acima, *listaDeNumeros* irá conter a seguinte lista: [1,2,3,100,101,102]

Agora tente resolver o exercício. Caso tenha muita dificuldade, você pode seguir
a estrutura criada abaixo. Mas antes de olhar o código, tente resolver sozinha! ;)

```haskell
import Playground exposing (..)

type alias Posicao =
  -- defina aqui os campos x e y

olhoEsquerdo = 
  -- aqui você deve acionar a função olho (lembre-se dos parânteses!)

olhoDireito =
  -- aqui você deve acionar a função olho novamente

main =
  -- Passe como parâmetro da função picture o resultado da concatenação 
  -- do resultado das função olhoEsquero e olhoDireito.
  picture

olho posicao =
  [ -- desenhe aqui um olho usando pelo menos 2 círculos.
  ]
```

### Resposta

Existem infinitas formas de resolver este exercício! O importante
é praticar. Abaixo deixo como o exemplo a minha resposta. Nela, usei
3 círculos para representar cada olho.  

```haskell
import Playground exposing (..)

type alias Posicao =
  { x : Number
  , y : Number
  }

olhoEsquerdo = 
  olho (Posicao -100 20)

olhoDireito =
  olho (Posicao 100 20)
main =
  picture (olhoEsquerdo ++ olhoDireito)

olho posicao =
  [ circle gray 50 
    |> move posicao.x posicao.y
  , circle black 20
    |> move (posicao.x - 10) (posicao.y - 5)
  , circle white 5
    |> move (posicao.x - 15) (posicao.y - 8)
  ]
```

## DESAFIO 3 (livre): desenhando o restante do rosto.

Crie outras função para demais partes do rosto. Por exemplo: nariz, orelha,
boca, sombrancelha... use a imaginação!

### Repostas

Exercícios livres não possuem respostas certas ou erradas!
O importante é praticar e se divertir.

## E agora?

Este curso ainda está sendo criado e por enquanto possui uma quantidade
reduzida de aulas. Novas aulas vão ser publicadas ao longo das
próximas semanas!

Gostou da ideia deste projeto? Quer mandar alguma sugestão ou tirar
alguma dúvida? Entre em contato com o autor enviando um e-mail para
**marcio@segunda.tech**.
