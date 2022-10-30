# Aula 7 - Fazendo movimentos de onda.

## O que você irá aprender nesta aula?

1. Como animar uma figura usando movimento ondular.  
1.1 A função *wave*.  

## 1- Como animar uma figura usando movimento ondular.

Antes, vamos relembrar como desenhar um círculo na tela:

```haskell
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
atingir seu objetivo, é preciso fazer com que este valor
seja variável e mude de acordo com o tempo (aquela variável
_time_ que vimos na aula passada).

Uma das formas de implementar isso é utilizando uma função chamada
_wave_ (que significa onda em inglês).

Abra mais uma vez o site <a href="https://elm-lang.org/try">https://elm-lang.org/try</a>,
copie e execute o código a seguir.  
Por enquanto não se preocupe em interpretar tudo, apenas
veja o resultado para entender melhor o comportamento desta função.

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue (wave 50 100 7 time)
  ]
```

### 1.1 - A função _wave_.

Como você deve ter observado, agora é acionada a função _wave_ e 
o resultado desta chamada irá definir o tamanho do diâmetro do círculo.  

A função _wave_ recebe 4 parâmetros. Os 2 primeiros correspondem ao
valor mínimo e o tamanho máximo do diâmetro. Já os 2 últimos parâmetros estão
relacionados com a velocidade que o este valor deve ser alterado.  
Neste exemplo, o valor 7 indica quantos segundos deve demorar o
ciclo total da animação (ou seja, o intervalo de tempo que
deve transcorrer para que o valor varie entre o mínimo e o máximo
e volte até o valor mínimo novamente). Já o _time_ é apenas a hora atual (que 
recebemos como parâmetro na função _view_ e repassamos o mesmo valor).

O valor de _time_ será atualizado automaticamente e a função 
_view_ será acionada muitas e muitas vezes, cada vez com um valor diferente
para a variável _time_. Mas você não precisa se preocupar com ela:
basta repassa-la como parâmetro para a função _wave_ e ela saberá
retornar qual deve ser o tamanho do circulo para o momento atual. 

Agora releia o código anterior e tente entender melhor o que está
acontecendo. Altere os valores 50, 100 e 7 para outros valores
quaisquer e veja o resultado. Mas antes de executar,
tente imaginar como ficará a animação.

## E agora?

Agora chegou a hora de você colocar as mãos na massa
e praticar mais um pouco!

Siga para os [desafios da Aula 7](/aula_7_desafios.html) e bons estudos.
