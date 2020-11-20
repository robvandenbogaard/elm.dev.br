# Aula 7 - Fazendo movimento de onda.

## O que vamos aprender?

1. Como animar uma figura usando movimento ondular.  
1.1 A função *wave*.  

## 1- Animando figura com movimento ondular.

Antes, vamos relembrar como desenhamos um círculo na tela:

```
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue 100 ]
```

Imagine que você queira criar uma animação nesta figura,
fazendo com que ela fique "pulsando" (aumentando e diminuindo
seu diâmetro ao longo do tempo).

No exemplo acima o diâmetro do círculo está fixo em 100. Para
atingir nosso objetivo, precisamos fazer com que este valor
seja variável e mude de acordo com o tempo (aquela variável
*time* que vimos na aula passada).

Uma das formas de fazermos isso é utilizando uma função chamada
*wave* (que significa onda em inglês).

Abra mais uma vez o site <a href="https://elm-lang.org/try">https://elm-lang.org/try</a>,
copie e execute o código a seguir.  
Por enquanto não se preocupe em interpretar todo o código, apenas
veja o resultado para entender melhor qual nosso objetivo.

```
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue (wave 50 100 7 time)
  ]
```

### 1.1 - A função *wave*.

Como você deve ter observado, substituímos o valor do diâmetro
do círculo, que no primeiro exemplo era uma constante com valor 100,
para uma chamada para função *wave* passando 4 parâmetros.  
O resultado desta chamada irá definir o tamanho do diâmetro do nosso
círculo.  

A função *wave* recebe 4 parâmetros. Os 2 primeiros correspondem ao
valor mínimo e o tamanho máximo. Já os 2 últimos parâmetros estão
relacionados com a velocidade que você quer que os valores sejam alterados.  
No nosso exemplo, o valor 7 indica quantos segundos deve demorar o
ciclo total e o *time* é a hora atual (que recebemos como parâmetro
na função *view* e apenas repassamos o mesmo valor).

Agora releia o código anterior e tente entender melhor o que está
acontecendo. Altere os valores 50, 100 e 7 para outros valores
quaisquer e veja o resultado. Mas antes de executar,
tente imaginar como ficará a animação.

## E agora?

Este curso ainda está sendo criado e por enquanto possui uma quantidade
reduzida de aulas. Novas aulas vão ser publicadas ao longo das
próximas semanas!

Gostou da ideia deste projeto? Quer mandar alguma sugestão ou tirar
alguma dúvida? Entre em contato com o autor enviando um e-mail para
**marcio@segunda.tech**.
