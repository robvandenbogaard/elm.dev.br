# Aula 10 - True, False e condicionais.

## O que vamos aprender?

1. Pra que servem as condicionais?
2. Usando condicionais.
3. Tornando o código mais legível.

## 1- Pra que servem as condicionais?

Imagine que você esteja desenvolvendo um jogo de plataforma 2D, parecido com
o da imagem abaixo.

![Imagem do jogo SuperTux](/resources/supertux.png)

As regras de um jogo vão impor certas condições. Por exemplo:

**Se** a jogadora encostar em uma moeda, **então**  
a moeda deve desaparecer e  
a quantidade de moedas que a jogadora possui deve ser incrementado em 1.  
**Senão**    
a moeda deve continuar aparecendo e  
a quantidade de moedas deve permanecer a mesma.

Podemos separar o exemplo acima em 3 partes:  
- A **condição**, que pode ser Verdadeira (*true* em inglês) ou Falsa (*false* em inglês); 
- As consequências caso aquela condição seja **verdadeira** e;  
- As consequências caso a condição seja **falsa**.

Sem as condicionais seria inviável aplicarmos as nossas regras e
a personagem principal nunca iria perder ou ganhar. Assim, nosso jogo
seria muito chato!

# 2- Usando condicionais.

A forma mais simples de criarmos uma condição é utilizando o *if*
(que significa **se**, em inglês).

Vamos supor que precisamos fazer uma condição para saber se nosso jogo
deve ou não continuar. A regra deve ser: **Se** a jogadora tive mais
de 0 vidas, **então** o jogo deve continuar. **Senão**, devemos interromper
o jogo.

Para simplificar nossa implementação caso a condição indique que o
jogo deve continuar exibiremos um círculo verde na tela. Caso não
deva continuar, exibiremos um círculo vermelho.

Vamos começar desenhando um círculo vermelho no centro da tela:

```haskell
import Playground exposing (..)

main =
  picture [
    circle red 100
  ]
```

Por enquanto desenhamos sempre um círculo vermelho. Precisamos agora
adicionar uma **condição**. Mas antes, vamos criar uma variável
onde iremos definir qual a quantidade de vidas da jogadora:

```haskell
import Playground exposing (..)

quantidadeDeVidas = 1

main =
  picture [
    circle red 100
  ]
```

Pronto! Agora temos tudo que precisamos para criar nossa condicional.
Caso a *quantidadeDeVidas* contenha um valor maior que 1, desenhamos
um cículo verde. Caso contrário, um cículo vermelho.

```haskell
import Playground exposing (..)

quantidadeDeVidas = 1

main =
  picture [ 
    if quantidadeDeVidas > 0 then
      circle green 100 
    else 
      circle red 100
  ]
```

Note que sempre que definirmos uma condição (*if*) colocamos 
em seguida a palavra *then* (que significa **então**
em inglês) e por último, definimos um segundo bloco, utilizando
a palavra *else* (**senão** em inglês).  

O tipo do conteúdo que é definido entre as palavras *then*
e *else* e o conteúdo definido a partir da palavra *else*
precisam ser iguais. Neste caso, ambos são uma figura.

Experimente mudar o valo da *quantidadeDeVidas* para 0 ou -1 e
execute o programa novamente.

## 3- Tornando o código mais legível.

No nosso exemplo talvez seja fácil uma outra pessoa olhar
a seguinte linha de código e entender nossa intenção:

```haskell
if quantidadeDeVidas > 0 then
```

Mas é comum que nossas regras condicionais fiquem bem mais
complexas que isso. E é muito importante que outras pessoas 
entendam o que motivou a criação daquela condição.

Nestes cenários é recomendado **extrairmos** esta parte do código
para uma função. Assim, podemos deixar mais explicito qual
a real intenção daquela condição, como no exemplo abaixo.

```haskell
import Playground exposing (..)

quantidadeDeVidas = 1

jogadoraAindaPossuiVidas =
  quantidadeDeVidas > 0

main =
  picture [ 
    if jogadoraAindaPossuiVidas then
      circle green 100 
    else 
      circle red 100
  ]

```

Neste último exemplo, a função *jogadoraAindaPossuiVidas* irá
retornar *true* caso *quantidadeDeVidas* seja superior a 0 e
*false* caso contrário.

Existem várias formas de organizar este código. Esta é apenas
uma delas.

## E agora?

Esta aula foi bastante teórica, então chegou a hora de você
colocar as mãos na massa e praticar mais um pouco!

Siga para os [desafios da Aula 10](/aula_10_desafios.html) e bons estudos.
