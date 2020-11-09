# Aula 2: Resposta dos desafios

Abra o seguinte endereço em uma outra aba em seu navegador:
[https://elm-lang.org/try](htts://elm-lang.org/try).  

Copie a resposta de cada exercício abaixo e
tente entendê-las antes de pressionar *Compile*.  

## DESAFIO 1 (fácil): Mudando tamanho do círculo.

Este desafio era muito fácil né?! Bastava alterar
o valor do tamanho do círculo.

```
import Playground exposing (..)

main =
  picture
    [ circle green 5 ]
```

## DESAFIO 2 (fácil): Mudando a cor do círculo.

Este também era bem fácil. Bastava mudar o
primeiro parâmetro do círculo (*circle*) para outra
cor.

```
import Playground exposing (..)

main =
  picture
    [ circle red 5 ]
```

Altere o valor da cor do círculo para sua cor
preferida.

### Lista de cores disponíveis.
red, orange, yellow, green, blue, purple, brown,
lightRed, lightOrange, lightYellow, lightGreen,
lightBlue, lightPurple, lightBrown, darkRed,
darkOrange, darkYellow, darkGreen, darkBlue,
darkPurple, darkBrown, white, lightGrey, grey,
darkGrey, lightCharcoal, charcoal, darkCharcoal,
black, lightGray, gray e darkGray.

## DESAFIO 3 (avançado): Crie 2 círculos, um dentro do outro.

Para desenhar mais de uma figura geométrica,
separamos cada uma com uma virgula. No exemplo
abaixo temos um círculo vermelho dentro de um
verde.

```
import Playground exposing (..)

main =
  picture
    [ circle green 100
    , circule red 50
    ]
```

## DESAFIO 4 (avançado): Crie 4 círculos, um dentro do outro.

Caso tenha tido dificuldades nos exercícios 3 e 4,
agora que já viu a resposta do 3, que tal tentar
fazer o 4 antes de ver sua resposta?

Antes de executar o código abaixo, você é capaz
de imaginar o que ele irá desenhar na tela?

```
import Playground exposing (..)

main =
  picture
    [ circle black 200
    , circle green 150
    , circle yellow 100
    , circle red 50
    ]
```

## E agora?

Siga para a [Aula 3](/aula_3.html) e bons estudos!
