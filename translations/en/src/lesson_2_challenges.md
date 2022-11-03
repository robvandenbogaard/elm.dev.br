# Aula 2: Desafios

Para fixar o conhecimento é preciso praticar.

Nesta seção são propostos alguns desafios para você
tentar fazer sozinho. É **muuuito** importante que você tente
resolve-los antes de ver as respostas!

Antes de mais nada, abra o seguinte endereço em uma
outra aba em seu navegador:
<a href='https://elm-lang.org/try' target='_blank'>htts://elm-lang.org/try</a>.  

Copie e execute o mesmo código que vimos durante a aula 2:

```haskell
import Playground exposing (..)

main =
  picture
    [ circle green 100 ]
```

Agora tente alterar o código para atender os desafios
propostos abaixo. E não tenha medo de errar! Experimente,
teste, explore, erre. O pior que pode acontecer é
aparecer uma mensagem de erro.

## DESAFIO 1 (fácil): Mudando tamanho do círculo.

Altere o valor do tamanho do círculo para um
número que quiser.  
Pode ser um valor pequeno como 1 ou 2, ou um número
bem grande como 9999999.  
Em seguida clique em *Rebuild* e veja o resultado!

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

## DESAFIO 3 (avançado): Crie 2 círculos, um dentro do outro.

Nosso desenho (*picture*) atualmente tem apenas um
círculo. Tente adicionar um segundo círculo de
outra cor e um pouco menor que o primeiro.

👩‍🏫 __Dicas__:
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

## DESAFIO 4 (avançado): Crie 4 círculos, um dentro do outro.

Bastante similar ao desafio anterior, mas desta vez
devem ser 4 círculos, um dentro do outro, com
tamanhos e cores diferentes.

## E agora?

Conseguiu fazer todos os exercícios? Teve dificuldade em algum?

Siga para as [respostas dos desafios](/aula_2_desafios_respostas.html)
para ver a solução.
