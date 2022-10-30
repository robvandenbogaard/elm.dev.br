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

Você consegue imaginar o que vai acontecer ao executar este código?

Utilizando um *type alias* estamos primeiro explicando para o
computador o que é uma árvore. Neste caso uma árvore é formada
por 3 campos: altura, largura e raioCopa. Os dois primeiros
representam informações do tronco e o último da copa/folhas.  
Com estas informações somos capazes de, a partir desta estrutura,
desenharmos árvores parecidas com as que fizemos na
<a href="./aula_3_desafios_respostas.html">aula 3</a>e 
<a href="./aula_4.html">aula 4</a> deste curso.

Como deve ter observado, a função _desenharArvore_ está incompleta e
estamos desenhando apenas a copa/folhas de nossa árvore.

Antes de continuar, abra o seguinte endereço em uma
outra aba em seu navegador:
<a href='https://elm-lang.org/try' target='_blank'>htts://elm-lang.org/try</a>
e execute o código definido mais acima.

Agora altere a função _desenharArvore_ para que ela desenhe também
o tronco de nossa árvore.

## DESAFIO 2 (difícil): desenhando olhos.

Vamos criar uma maneira de desenhar olhos na tela de forma parametrizada.  

Você deve criar uma função chamada *olho* que irá receber como
parâmetro um *Record*. Para isso, crie um *type alias* chamado *Posicao* 
contendo os campos *x* e *y*, ambos do tipo *Number*.  

A função *olho* deve retornar uma lista de círculos que representará
um olho na tela. Nosso olho será composto por pelo menos 2 círculos,
um dentro do outro. Use sua imaginação para desenha-lo!

Em seguida crie 2 outras funções chamadas *olhoEsquerdo* e *olhoDireito*.
Estas funções devem acionar a função *olho* passando a posição dos
olhos. O olho esquerdo deve ser desenhado a partir do ponto _(-100, 20)_ e o
olho direito a partir do ponto _(100, 20)_.

Por último a sua função *main* deve acionar as funções *olhoEsquerdo* e
*olhoDireito* para desenhar as figuras na tela.

👩‍🏫 **Dica**: ambas as funções *olhoEsquerdo* e *olhoDireito* retornam uma
lista de figuras. Será necessário juntar estas duas listas em uma só
antes de acionar a função *main* (que espera uma única lista de figuras).
Para fazer isso você pode usar o simbolo **++**. Exemplo: 

```haskell
numerosPequenos = [1,2,3]
numerosGrandes = [100,101,102]
listaDeNumeros = numerosPequenos ++ numerosGrandes
```
No código acima, *listaDeNumeros* irá conter a seguinte lista: [1,2,3,100,101,102]

Teste resolver o exercício. Caso tenha muita dificuldade você pode seguir
a estrutura criada abaixo:

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

## DESAFIO 3 (livre): desenhando o restante do rosto.

Crie outras função para demais partes do rosto. Por exemplo: nariz, orelha,
boca, sombrancelha... use a imaginação!

## E agora?

Conseguiu fazer todos os exercícios? Teve dificuldade em algum?

Siga para as [respostas dos desafios](/aula_9_desafios_respostas.html)
para ver a solução.
