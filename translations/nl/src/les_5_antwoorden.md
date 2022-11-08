# Les 5: Antwoorden van de opdrachten

## OPDRACHT 1 (eenvoudig): Maak meer fruit

### Antwoord

Om deze opdracht op te lossen, hoefden we alleen maar de *fruit* functie nog een paar keer aan te roepen.  

```haskell
import Playground exposing (..)

main =
  picture
    [ stam
    , bladeren
    , fruit 50 50
    , fruit -40 20
    , fruit -50 100
    , fruit 40 130
    , fruit 10 10
    , fruit -10 -50
    , fruit 70 -40
    ]

stam =
  rectangle darkBrown 60 250
    |> move 0 -150

bladeren =
  circle green 150
    |> move 0 50

fruit x y =
  circle red 20
    |> move x y
```

Wat zou er gebeuren als we probeerden fruit buiten de boom 
te tekenen? Op dit moment hebben we geen
manier om dat te blokkeren, maar in een echt systeem zouden we manieren moeten bedenken om dat te voorkomen.

## OPDRACHT 2 (gemiddeld): Het formaat van de bladeren instelbaar maken


Maak in dezelfde code als in opdracht 1 
een parameter voor de *bladeren* functie
om de grootte van de cirkel weer te geven.  
Probeer de grootte van de cirkel te vergroten en te verkleinen.   

👩‍🏫 __Tip__: Als je een waarde doorgeeft die te groot of te klein is, zal jouw boom er waarschijnlijk vreemd uitzien, omdat de bladeren de stam niet raken. Maak je hier voorlopig geen zorgen over.

### Antwoord

Om deze opdracht op te lossen, maken we een nieuwe parameter in de functie *bladeren* aan, genaamd **diameter**. Vervolgens geef je de waarde van deze variabele door bij het aanroepen van de *circle* functie.



```haskell
import Playground exposing (..)

main =
  picture
    [ stam
    , bladeren 150
    , fruit 50 50
    , fruit -40 20
    , fruit -50 100
    , fruit 40 130
    , fruit 10 10
    , fruit -10 -50
    , fruit 70 -40
    ]

stam =
  rectangle darkBrown 60 250
    |> move 0 -150

bladeren diameter =
  circle green diameter
    |> move 0 50

fruit x y =
  circle red 20
    |> move x y
```

## En nu?

Ga nu door met [Les 6](les_6.html), veel succes!
