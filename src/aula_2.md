# Aula 2

## O que vamos aprender?
1. O que é um *import*?
2. Desenhar uma esfera.
3. O que é o *main*?
4. O que é o *picture*?
5. O que é o *circle*?

## 1- O que é um *import*?

A primeira linha de todos os programas que vamos
escrever neste curso será:  

`import Playground exposing (..)`

A palavra *import* (importar em inglês), serve
para importar os códigos do *Playground*.  
Mas o que isso significa? Por enquanto não se preocupe
com isso, mas ela é necessária pois
vai permitir que a gente desenhe na tela :)  
Todos os nossos programas neste curso vão começar
com esta linha.

## 2- Desenhar uma esfera.

Hora de programar!  
Vamos desenhar um círculo na tela?  
Abra novamente o site [https://elm-lang.org/try](https://elm-lang.org/try)
em uma outra aba de seu navegador e cole o código abaixo.

```
import Playground exposing (..)

main =
  picture
    [ circle green 100 ]
```

Em seguida pressione *Compile* e veja o resultado da execução conforme imagem abaixo.  

![Desenhando um circulo](/resources/elm-lang-try-circulo.png)

Fácil né?! Mas o que está acontecendo?!

## 3- O que é o *main*?

A palavra *main* em inglês significa principal.
É através dela que indicamos para o computador
onde começa nosso programa.  
Portanto, todos os nossos programas vão precisar
ter essa linha: 

```
main =
```

E todo o restante representa o que queremos que
o computador faça pra gente.  
__Dica__: não pode ter nenhum espaço antes da
palavra *main*. Ela deve obrigatoriamente ser a
primeira palavra da linha.

## 4- O que é o *picture*?

A palavra *picture* em inglês significa desenho.
É através dela que expressamos para o computador
que queremos desenhar algo na tela.  
Em seguida criamos uma LISTA (representada pelos
simbolos **[** e **]**) de formas geométricas, que 
vão formar nosso desenho (*picture*). Neste exemplo
nosso desenho é formado por apenas uma forma
geométrica: um círculo.

## 5- O que é o *circle*?

A lista de formas geométricas pode ter círculos,
retângulos, hexágonos entre muitas outras formas. 
No nosso exemplo, utilizamos um círculo (*circle*
em inglês). Para desenharmos um círculo precisamos
informar 2 **parâmetros**:  
O primeiro parâmetro representa sua cor. No nosso
exemplo, usamos a cor verde (*green*).  
O segundo parâmetro indica o tamanho do círculo.
Neste caso, 100.

## E agora?

Agora chegou a hora de você colocar as mãos na massa
e praticar um pouco!

Siga para os [desafios da Aula 2](/aula_2_desafios.html) e bons estudos!
