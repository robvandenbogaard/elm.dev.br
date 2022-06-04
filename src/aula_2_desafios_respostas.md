# Aula 2: Resposta dos desafios

Abra o seguinte endereço em uma outra aba em seu navegador:
<a href='https://elm-lang.org/try' target='_blank'>htts://elm-lang.org/try</a>.  

Copie a resposta de cada exercício abaixo e
tente entendê-las antes de pressionar *Rebuild*.  

## DESAFIO 1 (fácil): Mudando tamanho do círculo.

Altere o valor do tamanho do círculo para um
número que quiser.  
Pode ser um valor pequeno como 1 ou 2, ou um número
bem grande como 9999999.  
Em seguida clique em *Rebuild* e veja o resultado!

### Resposta

Este desafio era muito fácil né?! Bastava alterar
o valor do tamanho do círculo.

```haskell
import Playground exposing (..)

main =
  picture
    [ circle green 5 ]
```

## DESAFIO 2 (fácil): Mudando a cor do círculo.

Altere o valor da cor do círculo para sua cor
preferida. Lembre-se que o nome das cores deve ser
em inglês. Se tiver dificuldades com inglês, consulte a lista
de cores disponíveis abaixo.

### Lista de cores:
red, orange, yellow, green, blue, purple, brown,
lightRed, lightOrange, lightYellow, lightGreen,
lightBlue, lightPurple, lightBrown, darkRed,
darkOrange, darkYellow, darkGreen, darkBlue,
darkPurple, darkBrown, white, lightGrey, grey,
darkGrey, lightCharcoal, charcoal, darkCharcoal,
black, lightGray, gray e darkGray.

### Resposta

Este também era bem fácil. Bastava mudar o
primeiro parâmetro do círculo (*circle*) para outra
cor.

```haskell
import Playground exposing (..)

main =
  picture
    [ circle red 5 ]
```

## DESAFIO 3 (avançado): Crie 2 círculos, um dentro do outro.

Nosso desenho (*picture*) atualmente tem apenas um
círculo. Tente adicionar um segundo círculo de
outra cor e um pouco menor que o primeiro.

__Dicas__:
- Lembre-se que os símbolos **[** e **]** indicam uma
lista. Então o segundo círculo deve estar
dentro destes símbolos.
- Pense na lista como sendo algo similar à lista
de compras no supermercado, mas ao invés de
alimentos, nossa lista vai guardar formas
geométricas.
- Utilize uma vírgula para indicar que quer
criar um segundo círculo dentro da lista de
formas geométricas.
- Cuidado com a ordem! Se o círculo menor ficar
antes do maior na lista, ele ficará atrás do
maior e não será possível visualiza-lo.
Para desenhar mais de uma figura geométrica,
separamos cada figura com uma vírgula. No exemplo
abaixo temos um círculo vermelho dentro de um
verde.  
Lembre-se que os símbolos **[** e **]** indicam uma lista.  

### Resposta

```haskell
import Playground exposing (..)

main =
  picture
    [ circle green 100
    , circule red 50
    ]
```

Você deve ser capaz de ler o código acima e interpreta-lo da
seguinte maneira:  
A nosso programa (*main*) é definido com sendo um
desenho (*picture*) que contêm uma lista (indicada
pelos símbolos **[** e **]**) de duas figuras que, neste caso,
são dois círculos.

## DESAFIO 4 (avançado): Crie 4 círculos, um dentro do outro.

Bastante similar ao desafio anterior, mas desta vez
devem ser 4 círculos, um dentro do outro, com
tamanhos e cores diferentes.

### Resposta

Caso tenha tido dificuldades nos exercícios 3 e 4,
agora que já viu a resposta do 3, que tal tentar
fazer o 4 antes de ver a resposta? Em seguida veja
a resposta abaixo.

Antes de executar o código abaixo, você é capaz
de imaginar o que ele irá desenhar na tela?

```haskell
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
