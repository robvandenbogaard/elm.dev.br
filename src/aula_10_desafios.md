# Aula 10: Desafios

## DESAFIO 1 (intermediário): Desenhando um balão.

O código abaixo desenha um balão verde na tela.

Execute o código para ver seu resultado.

```
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
```
|> move 0 (-raio - (tamanhoDoFioDoBalao / 2))
```

Já vimos um código muito parecido com esse [nos desafios da aula 9](./aula_9_desafios.md).
Não se preocupe se ainda não conseguir entendê-lo muito bem. Tudo que
está fazendo é apenas posicionar o fio do balão em sua parte inferior.

Agora altere o código anterior para que o balão tenha a
cor verde (*green*) se o seu raio for inferior a 50 e a cor
vermelha caso seu raio supere este valor.

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

## E agora?

Conseguiu fazer todos os exercícios? Teve dificuldade em algum?

Siga para as [respostas dos desafios](/aula_10_desafios_respostas.html)
para ver a solução.

