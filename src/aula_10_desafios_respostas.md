# Aula 10: Desafios

## DESAFIO 1 (intermediário): Desenhando um balão.

O código abaixo desenha um balão verde na tela.

Execute o código para ver seu resultado.

```haskell
import Playground exposing (..)

tamanhoDoFioDoBalao = 50

larguraDoFioDoBalao = 3

corDoBalao = green

raioDoMeuBalao = 60

main =
  picture
   (balao raioDoMeuBalao)


balao raio =
  [ circle corDoBalao raio
  , rectangle lightRed larguraDoFioDoBalao tamanhoDoFioDoBalao
    |> move 0 (-raio - (tamanhoDoFioDoBalao / 2))
  ]
```

Desta vez optei por definir os valores em variáveis, para poder
dar nomes e tornar assim o seu significado mais explícito.  

Eu admito, meu balão não se parece muito um balão, mas... tente
usar sua imaginação! ;)

A parte mais difícil deste código provavelmente é a seguinte linha:
```haskell
|> move 0 (-raio - (tamanhoDoFioDoBalao / 2))
```

Já vimos um código muito parecido com esse [nos desafios da aula 9](./aula_9_desafios.md).
Não se preocupe se ainda não conseguir entendê-lo muito bem. Tudo que
está fazendo é apenas posicionar o fio do balão em sua parte inferior.

Agora altere o código anterior para que o balão tenha a
cor verde (*green*) se o seu raio for inferior a 50 e a cor
vermelha caso seu raio supere este valor.

### Resposta

Precisamos alterar a função *corDoBalao* para que ela receba
o valor do **raio** como parâmetro. Assim, fica fácil altermos
esta função para que ela retorne *gren* caso este valor seja
inferior a 50 e *red* caso seja igual ou superior a este número.

```haskell
import Playground exposing (..)

tamanhoDoFioDoBalao = 50

larguraDoFioDoBalao = 3

corDoBalao raio = 
  if raio < 50 then
    green
  else 
    red

raioDoMeuBalao = 60

main =
  picture
   (balao raioDoMeuBalao)


balao raio =
  [ circle (corDoBalao raio) raio
  , rectangle lightRed larguraDoFioDoBalao tamanhoDoFioDoBalao
    |> move 0 (-raio - (tamanhoDoFioDoBalao / 2))
  ]
```

Uma parte do código que talvez você tenha tido
dificuldades para entender é esta aqui:
```haskell
circle (corDoBalao raio) raio
```

Consegue entender por que temos duas referências ao *raio*
nesta linha?

Na primeira estamos apenas passando o seu valor para a 
função *corDoBalao*, que agora precisa desta informação
para decidir qual será a cor do nosso balão. O retorno da
execução de *(corDoBalao raio)* será uma cor: ou *green* ou
*red*. Este retorno será usado como sendo o primeiro
argumento da função *circle*.  
Já o *raio* que aparece no final da linha é o segundo 
argumento que também será passado para a função *circle*.

Experimente alterar o valor da variável *raioDoMeuBalao*
e veja o que acontece quando este valor é inferior a 50.

## DESAFIO 2 (intermediário): Adicionando mais uma cor.

Altere a sua resposta do exercício anterior para contemplar
uma terceira cor, obedecendo as seguintes regras:

- O balão deve ser verde (*green*) caso tenha um raio
inferior a 50;  
- O balão deve ser da cor amarela (*yellow*) caso tenha um raio
superior ou igual a 50 e inferior a 65;  
- O balão deve ser da cor vermelha (*red*) caso tenha um raio
superior a 65.

Depois de escrever o código, altere o valor de *raioDoMeuBalao*
para que ele fique primeiro verde, depois amarelo e por último
vermelho.

### Resposta

Para resolver este exerício precisamos criar uma condição
dentro da outra. Primeiro verificamos se o valor é
inferior a 50. Se for, já sabemos que a cor é verde.  

Mas caso contrário, precisamos fazer uma segunda
verificação: precisamos saber se é inferior a 65.  
Se neste momento o valor for inferior a 65, sabemos que
ele é um número entre 50 e 65, afinal, já havíamos feito
a primeira validação (se era inferior a 50) antes.  

E se esta segunda validação também for falsa, sabemos que
trata-se de um valor acima de 65 e, portanto, devemos
utilizar a cor vermelha.

Ou, em outra palavras, precisamos fazer um *if* dentro
do nosso *if*:

```haskell
import Playground exposing (..)

tamanhoDoFioDoBalao = 50

larguraDoFioDoBalao = 3

corDoBalao raio = 
  if raio < 50 then
    green
  else 
    if raio < 65 then
      yellow
    else
      red

raioDoMeuBalao = 64

main =
  picture
   (balao raioDoMeuBalao)


balao raio =
  [ circle (corDoBalao raio) raio
  , rectangle lightRed larguraDoFioDoBalao tamanhoDoFioDoBalao
    |> move 0 (-raio - (tamanhoDoFioDoBalao / 2))
  ]
```
  
## E agora?

Este curso ainda está sendo criado e por enquanto possui uma quantidade reduzida de aulas. Novas aulas vão ser publicadas ao longo das próximas semanas!

Gostou da ideia deste projeto? Quer mandar alguma sugestão ou tirar alguma dúvida? Entre em contato com o autor enviando um e-mail para **marcio@segunda.tech**.
