# Aula 2 - Desenhando na tela.

## O que você irá aprender nesta aula?

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

A palavra *import* significa importar em inglês. Esta linha é
necessária pois permite que você tenha acesso aos códigos 
que estão definidos no *Playground*. Na Aula 5 explicarei mais 
em detalhes mas, sem ela, não seria possível desenhar na tela. 
Por isso, todos os programas neste curso vão começar com esta linha.

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

Em seguida pressione *Rebuild* e veja o resultado da execução conforme imagem abaixo.  

![Desenhando um circulo](/resources/elm-lang-try-circulo.png)

Mas o que está acontecendo?!

## 3- O que é o *main*?

A palavra *main* em inglês significa principal.
É através dela que você indica para o computador
onde começa o seu programa.  
Portanto, todos os seus programas vão precisar
ter essa linha:

```haskell
main =
```

E todo o restante representa o que quer que
o computador faça para você.  

🚨 __Atenção__: não pode ter nenhum espaço antes da
palavra *main*. 

## 4- O que é o *picture*?

A palavra *picture* em inglês significa desenho.
É através dela que você indica para o computador
que quer desenhar algo na tela.  
Em seguida é criada uma **lista** (representada pelos
símbolos **[** e **]**) de formas geométricas, que 
vão formar o desenho (*picture*). Neste exemplo, o desenho 
é formado por apenas uma forma geométrica: um círculo.

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

Para representar em *Elm*, por exemplo, o conjunto de
números entre zero e dez, escrevemos:  
```haskell
[ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
```
E uma lista pode ser muito grande, pode ter apenas um
elemento ou pode até mesmo ser vazia!

#### Outros exemplos de listas:

Uma lista vazia:  
```haskell
[]
```
Uma lista com um único elemento:  
```haskell
[ 1 ]
```

Uma lista com 3 elementos:  
```haskell
[ 8, 13, 311839 ]
```

Outra lista com 3 elementos:  
```haskell
[ "Batata", "Cenoura", "Abóbora" ]
```

Ao longo deste curso vamos criar muitas listas!

## 5- O que é o *circle*?

Uma lista de formas geométricas pode ter círculos,
retângulos, hexágonos entre muitas outras formas. 
No exemplo anterior, foi utilizado um círculo (*circle*
em inglês). Para desenhar um círculo é preciso
informar 2 **parâmetros**:  
O primeiro parâmetro representa sua cor. No
exemplo, foi utilizada a cor verde (*green*).  
O segundo indica o diâmetro do círculo. Neste caso, 100.

## E agora?

Agora chegou a hora de você colocar as mãos na massa
e praticar um pouco!

Siga para os [desafios da Aula 2](/aula_2_desafios.html) e bons estudos!
