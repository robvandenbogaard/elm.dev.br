# Aula 2 - Desenhando na tela.

## O que vamos aprender?
1. O que é um *import*?  
2. Desenhar uma esfera.  
3. O que é o *main*?  
4. O que é o *picture*?  
   4.1 Mas o que é uma lista?  
5. O que é o *circle*?  

## 1- O que é um *import*?

A primeira linha de todos os programas que vamos
escrever neste curso será:  

```haskell
import Playground exposing (..)
```

A palavra *import* (importar em inglês), serve
para importar os códigos do *Playground*.  
Por enquanto não se preocupe com isso, mas ela é necessária pois
vai permitir que a gente desenhe na tela.  
Todos os nossos programas neste curso vão começar
com esta linha.

## 2- Desenhar uma esfera.

Hora de programar!  
Vamos desenhar um círculo na tela?  
Abra novamente o site <a href='https://elm-lang.org/try' target='_blank'>https://elm-lang.org/try</a>
em uma outra aba de seu navegador e cole o código abaixo.

```haskell
import Playground exposing (..)

main =
  picture
    [ circle green 100 ]
```

Em seguida pressione *Compile* e veja o resultado da execução conforme imagem abaixo.  

![Desenhando um circulo](/resources/elm-lang-try-circulo.png)

Fácil né? Mas o que está acontecendo?!

## 3- O que é o *main*?

A palavra *main* em inglês significa principal.
É através dela que indicamos para o computador
onde começa nosso programa.  
Portanto, todos os nossos programas vão precisar
ter essa linha:

```haskell
main =
```

E todo o restante representa o que queremos que
o computador faça pra gente.  
__Dica__: não pode ter nenhum espaço antes da
palavra *main*. 

## 4- O que é o *picture*?

A palavra *picture* em inglês significa desenho.
É através dela que expressamos para o computador
que queremos desenhar algo na tela.  
Em seguida criamos uma **lista** (representada pelos
símbolos **[** e **]**) de formas geométricas, que 
vão formar nosso desenho (*picture*). Neste exemplo
nosso desenho é formado por apenas uma forma
geométrica: um círculo.

### 4.1- Mas o que é uma lista?

Quando vou ao supermercado, escrevo uma lista
de produtos que quero comprar. Algo como:  
- 5Kg de arroz  
- 1Kg de feijão  
- 3 batatas grandes  
- 2 mangas  

O conceito de lista na programação é muito similar: é
apenas uma estrutura para organizar e relacionar um conjunto
de dados.

Para representarmos em *Elm*, por exemplo, o conjunto de
números entre zero e dez, escrevemos:  
[ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]

E uma lista pode ser muito grande, pode ter apenas um
elemento ou pode até mesmo ser vazia!

#### Outros exemplos de listas:

Uma lista vazia:  
[]

Uma lista com um único elemento:  
[ 1 ]

Uma lista com 3 elementos:  
[ 1, 2, 3 ]

Ao longo deste curso vamos criar muitas listas.

## 5- O que é o *circle*?

Uma lista de formas geométricas pode ter círculos,
retângulos, hexágonos entre muitas outras formas. 
No nosso exemplo, utilizamos um círculo (*circle*
em inglês). Para desenharmos nosso círculo precisamos
informar 2 **parâmetros**:  
O primeiro parâmetro representa sua cor. No nosso
exemplo, usamos a cor verde (*green*).  
O segundo parâmetro indica o diâmetro do círculo.
Neste caso, 100.

## E agora?

Agora chegou a hora de você colocar as mãos na massa
e praticar um pouco!

Siga para os [desafios da Aula 2](/aula_2_desafios.html) e bons estudos!
