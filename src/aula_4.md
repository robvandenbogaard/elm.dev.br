# Aula 4 - Criando funções.

Esta aula será mais teórica, mas o que vamos
aprender hoje é fundamental para entender todo
o resto que está por vir. Então, bora entender
o que é uma função?

## O que vamos aprender?

1. O que é uma funcão?  
  1.1 Funções matemáticas  
  1.2 Funções na programação  
2. Como criar nossas próprias funções?  
3. Vantagens de criar funções  

## 1- O que é uma função?

Conforme nosso código cresce, vai ficando cada
vez mais difícil identificar o que significa
cada uma de suas partes.  
Por exemplo: no código que desenhamos um ônibus
no desafio da aula 2, quanto mais detalhes
colocávamos no desenho, maior
ficava o *main*.  
Mas afinal, o que é esse _main_? Ela é uma **função**.  
Na linguagem de programação _Elm_, quase tudo
que escrevemos são funcões! Isso por que ela é uma
linguagem que segue o **paradigma funcional**. Existem
vários tipos (paradigmas) de linguagens: Orientadas à Objetos,
Imperativas, Lógicas e também as Funcionais.

## 1.1- Funções matemáticas

Provavelmente você já deve ter ouvindo falar em
funções nas aulas de matemáticas na escola. Coisas como:  

```haskell
x = y + 2
```

Mas o que significa _x = y + 2_? Essencialmente
significa que em qualquer lugar que tiver o
simbolo _x_, podemos substitui-lo por _y + 2_,
e vice versa. Por exemplo, se tivermos o seguinte
conjunto de equações:

```haskell
x = 5
y = 10
z = x + y
```

Para descobrirmos o valor de _z_, substituímos
o valor de _y_ e em seguida o de _x_.

Sendo a função _z_ original:

```haskell
z = x + y
```

Podemos primeiro substituir o valor de _y_:

```haskell
z = x + 10
```

E em seguida o valor de _x_:

```haskell
z = 5 + 10
```

Assim chegamos a conclusão que _z_ é igual a **15**.

## 1.2 Funções na programação

Em programação (em especial em linguagens funcionais,
como *Elm* ou <a href='https://www.haskell.org/' target='_blank'>*Haskell*</a>),
o conceito de funcão é muito parecido.  
A função matemática _z_ depende de _y_ e de _x_, certo?  
Podemos fazer algo similar com nossa função _main_,
tornando-a dependente de outras funções menores e
mais simples. Isso deixará nosso código muito mais
fácil de ler e alterar depois.

Achou confuso? Vai ficar mais fácil de entender com o
exemplo a seguir.

## 2- Como criar nossas próprias funções?

Vamos partir inicialmente da nossa árvore para
então decompô-la em várias funções.

Função _main_ original:

```haskell
import Playground exposing (..)

main =
  picture
    [ rectangle darkBrown 60 250
        |> move 0 -150
    , circle green 150
        |> move 0 50
    ]
```

Podemos decompor nossa árvore colocando a definição
de suas folhas em uma outra função:

```haskell
import Playground exposing (..)

main =
  picture
      [ rectangle darkBrown 60 250
        |> move 0 -150
    , folhas
    ]

folhas =
  circle green 150
    |> move 0 50
```

Este novo código é equivalente ao anterior.

Para **definirmos uma nova função**, basta darmos um
nome para ela (uma palavra qualquer, neste caso,
_folhas_) seguida do simbolo **=**, da mesma forma
que na matemática.  
Tudo que estiver depois do símbolo de igual
fará parte da nossa nova função.  
Mas isso apenas **define** a função. Precisamos em
seguida utilizá-la em um ou mais lugares
do código.

Para utilizar uma função, assim como na matemática, 
basta escrever seu nome. No nosso exemplo 
a função _folhas_ é utilizada como parte da função _main_.

É **muito** importante enteder este conceito. Analise com 
calma o código acima para ter certeza que compreendeu.

**Dica**: em _Elm_, a ordem em que as funções
são definidas é irrelevante. Você pode definir
primeiro a função _main_ e depois a função _folhas_
ou primeiro a função _folhas_ e depois a _main_.

Agora vamos separar o tronco de nossa árvore em
uma outra função:

```haskell
import Playground exposing (..)

main =
  picture
    [ tronco
    , folhas
    ]

tronco =
  rectangle darkBrown 60 250
    |> move 0 -150

folhas =
  circle green 150
    |> move 0 50
```

Tente imaginar que a palavra _folhas_, dentro
da função _main_, será substituida pelo conteúdo
definido logo abaixo na função _folhas_. E o mesmo
para a palavra _tronco_.

E podemos dar um passo além, se quisermos, e
criar a função _arvore_:

```haskell
import Playground exposing (..)

main =
  picture
    arvore

arvore =
  [ tronco
  , folhas
  ]

tronco =
  rectangle darkBrown 60 250
    |> move 0 -150

folhas =
  circle green 150
    |> move 0 50
```

Neste último exemplo a função _arvore_ retorna
uma lista de formas geométricas contendo um
tronco e uma folha.

## 3- Vantagens de criar funções

Existem duas grandes vantagens em dividirmos
nossos códigos em várias funções.  
A primeira é que torna mais fácil de
expressarmos nossas intenções. Observe a função
_main_ que definimos inicialmente e a compare com
a função _main_ de nosso último código. Desta última 
forma ficou muito mais explícito o que estamos
tentando desenhar.  

Outra grande vantagem de programar assim é que
agora o _tronco_ e _folhas_ estão **desacoplados**.  
Posso, por exemplo, reutilizar a função _tronco_
para desenhar outros tipos de árvores ou criar
um novo tipo de _tronco_ e reaproveitar as _folhas_.  
Em programação este é outro conceito muito importante:
**Reaproveitamento de códigos**.

## E agora?

Agora chegou a hora de você colocar as mãos na massa
e praticar um pouco!

Siga para os [desafios da Aula 4](/aula_4_desafios.html) e bons estudos.
