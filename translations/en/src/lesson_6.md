# Aula 6 - Sua primeira animação.

Esta aula será um pouco mais teórica pois você irá aprender os
fundamentos para conseguir criar animações.

## O que você irá aprender nesta aula?

1. Como criar uma animação.  
  1.1. O que é a função *animation*?  
2. Como rotacionar uma figura de acordo com o tempo.  
  2.1 Entendendo melhor o controle do tempo.  

## 1- Como criar uma animação.

Ao final desta aula você será capaz de entender 
o seguinte código:

```haskell
import Playground exposing (..)

main =
  animation view

view time =
    [ triangle red 100
          |> rotate (spin 8 time)
    ]
```

Mas para isso você precisa conhecer a função _animation_
e saber também como controlar o tempo.

### 1.1- O que é a função *animation*.

*animation* (animação em inglês) é o nome da função que
você deve acionar para que o computador entenda 
que o desenho que quer criar é uma imagem animada.

A função *animation* recebe um parâmetro
diferente do que aprendeu nas aulas anteriores: ela
espera que seja passado como argumento uma função. Ou seja,
é uma função que recebe como parâmetro uma outra função.

🚨 **Importante**: Isso costuma gerar dúvidas. Em *Elm* (e também
*JavaScript*, *Clojure* e muitas outras linguagens de programação) 
isso é algo bastante comum: às vezes as funções vão receber
valores "normais", como números ou textos mas, em outros casos, receberá uma **função** como argumento. Ou seja, *animation* é uma função 
que recebe uma referência dê outra função como argumento. 🤯

No exemplo anterior, a função *animation* está recebendo como
argumento uma referência para a função *view* 
(que significa **vista** ou **ver** em inglês).   
Em *Elm* este costuma ser o nome padrão dado para a função
onde iremos definir o que será exibido na tela.

Perceba que a função *view* recebe um parâmetro chamado *time* 
(que significa **tempo** ou **hora** em inglês).  
Você pode dar qualquer outro nome mas, por convenção,
este é o nome que costumamos usar neste parâmetro.  

Através de uma animação você pode alterar o desenho
ao longo do tempo. Por isso, precisa deste parâmetro
para sabermos qual o valor atual do tempo e, assim,
especificar como o desenho deve ser apresentado.

Pense assim: imagine que você chutou uma bola de futebol
em linha reta. Conhecendo a direção que ela está indo
e a intensidade do seu chute, como poderia saber qual
a posição atual da bola? A resposta é: depende! Depende do
**tempo**. Zero segundos após você chutar, ela ainda estará
encostada em seu pé. Um segundo depois estará um pouco
mais longe. Ou seja, para descobrir onde deve 
desenhar esta bola é necessário saber o tempo decorrido
desde o momento do seu chute.

Voltando para código, a função _view_ será
executada (automaticamente pelo computador) diversas vezes,
e em cada execução o valor da variável _**time**_ será diferente 
(contendo a hora atual no momento daquela execução).  
É isso que permite que na primeira vez que esta função
seja acionada o triângulo seja desenhado de uma forma
e, conforme o valor da hora (_time_) muda, a
forma como nosso triângulo é desenhado também se altera.

Todas as animações deste curso serão feitas seguindo esta
lógica: suas funções vão precisar do tempo (_time_) 
decorrido para saber qual o momento atual da animação.

## 2. Como rotacionar uma figura de acordo com o tempo.  

Você já havia utilizado a função *rotate* antes, para
rotacionar as imagens. Como deve lembrar, ela
recebe um parâmetro com o ângulo que deseja rotacionar
(um número entre -360 e 360). No exemplo anterior o valor
passado como parâmetro é este:

```haskell
rotate (spin 8 time)
```

🚨 **Importante**: A primeira obervação que preciso fazer aqui
é o uso dos parânteses. Se os retirar, seu programa
não vai funcionar. Eles são importantes pois indicam para 
o computador que ele deve dar prioridade em resolver tudo que está dentro dos parânteses para, em seguida, pegar o resultado destas
operações e usar o valor deste resultado como argumento da função
rotate.  

Você pode fazer uma associação com a matemática:  

```haskell
x = 2 * 1 + 1  
y = 2 * (1 + 1)  
```

No exemplo acima,  _**x**_ é igual a 3 e _**y**_ é igual a 4.  
Assim como na matemática, os parânteses são
muito importantes na programação!

Voltando pro o exemplo, primeiro será avaliado o 
valor de _**spin 8 time**_ para em seguida usar este valor
como argumento para a função _rotate_.

*Spin* em inglês significa girar.  
Você consegue imaginar o que ela faz? Pare e reflita um pouco
antes de continuar lendo.

Mais uma vez, como quase tudo em *Elm*, *spin* é uma função.
E como você deve ter observado, ela recebe dois parâmetros.
O primeiro é o **período**, indicando quantos segundos deve
demorar cada rotação da imagem. Quanto menor o valor, mais rápida
será a velocidade de rotação. No exemplo, este valor é 8. 
Isso significa que nosso triângulo irá rodar por completo 1
vez a cada 8 segundos.  
O segundo parâmetro é o tempo decorrido. Em geral você irá apenas
repassar o valor que já recebeu como argumento em sua função.
Quem controla o tempo é o computador e ele repassa esta informação
pra gente.

### 2.1 Entendendo melhor o controle do tempo.

Seu programa começa na função *main*. Mas quem aciona esta função?
O computador! Ou mais tecnicamente falando, a *runtime* do *Elm*.
Mas isso é apenas um detalhe. O que precisa entender é neste exemplo, a função *main* foi definida da seguinte forma:

```haskell
main =
  animation view
```

Sendo que, em algum momento, a função _animation_ irá acionar a função _view_ e, como já víamos antes, a função _view_ recebe 
um parâmetro indicando o tempo (o parâmetro _time_):

```haskell
view time =
```

Você não precisa se preocupar com o controle desta variável, o computador vai fazer este trabalho pra você. Precisa apenas saber 
que irá receber este valor e o que ele representa.

Se toda esta explicação ficou muito confusa, não se preocupe!
Tudo vai ficar mais claro conforme você treina.

## E agora?

Agora chegou a hora de você colocar as mãos na massa
e praticar um pouco!

Siga para os [desafios da Aula 6](/aula_6_desafios.html) e bons estudos.
