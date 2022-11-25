# Les 10: Opdrachten

## OPDRACHT 1 (gemiddeld): Teken een ballon

De onderstaande code tekent een groene ballon op het scherm.

Voer de code uit om het resultaat te zien.

```haskell
import Playground exposing (..)

lengteBallonDraad = 50

dikteBallonDraad = 3

kleurBallon = green

radiusVanMijnBallon = 60

main =
  picture
   (ballon radiusVanMijnBallon)


ballon radius =
  [ circle kleurBallon radius
  , rectangle lightRed dikteBallonDraad lengteBallonDraad
    |> move 0 (-radius - (lengteBallonDraad / 2))
  ]
```

Deze keer hebben we ervoor gekozen om de waarden in variabelen te definiëren, zodat we ze namen kunnen geven en zo hun betekenis explicieter kunnen maken.

Toegegeven, de ballon lijkt niet echt op een ballon, maar... probeer maar een beetje je fantasie te gebruiken! ;)

Het moeilijkste deel van deze code is waarschijnlijk de volgende regel:
```haskell
|> move 0 (-radius - (lengteBallonDraad / 2))
```

We hebben al eerder code gezien die hier sterk op lijkt [in les 9 opdrachten](./les_9_opdrachten.md).
Maak je geen zorgen als je het nog steeds niet goed begrijpt. Al wat je doet is gewoon het touwtje van de ballon aan de onderkant plaatsen.

Verander nu de vorige code zodat de ballon de
kleur groen (*green*) krijgt als zijn straal (radius) kleiner is dan 50 en de kleur
rood als zijn straal deze waarde overschrijdt.

## OPDRACHT 2 (gemiddeld): Nog een kleur toevoegen

Wijzig je antwoord van de vorige opdracht om een derde kleur toe te voegen, volgens de volgende regels:

- De ballon moet groen (*green*) gekleurd zijn als hij een straal heeft van minder dan 50;  
- De ballon moet geel (*yellow*) gekleurd zijn als hij een straal heeft van 50 of meer, en minder dan 65;  
- De ballon moet rood (*red*) gekleurd zijn als hij een straal heeft van meer dan 65.  

Wijzig na het schrijven van de code de waarde van *radiusVanMijnBallon* zodat het eerst groen wordt, dan geel en tenslotte rood.

## En nu?

Is het je gelukt om alle oefeningen te doen? Had je moeite met een van hen?

Ga naar [antwoorden van de opdrachten](les_10_antwoorden.html) om de oplossing te zien.

