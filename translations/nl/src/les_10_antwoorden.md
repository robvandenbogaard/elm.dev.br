# Les 10: Antwoorden van de opdrachten

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
Maak je geen zorgen als je het nog steeds niet goed begrijpt. Het enige dat je doet is gewoon het touwtje van de ballon aan de onderkant plaatsen.

Verander nu de vorige code zodat de ballon de
kleur groen (*green*) krijgt als zijn straal (radius) kleiner is dan 50 en de kleur
rood als zijn straal deze waarde overschrijdt.

### Antwoord

We moeten de functie *kleurBallon* veranderen zodat deze de waarde van de **radius** als parameter krijgt. Dit maakt het gemakkelijk om
deze functie te veranderen zodat deze *green* teruggeeft als het
minder dan 50 is en *rood* als het gelijk is aan of groter is dan dit getal.

```haskell
import Playground exposing (..)

lengteBallonDraad  = 50

dikteBallonDraad = 3

kleurBallon radius = 
  if radius < 50 then
    green
  else 
    red

radiusVanMijnBallon = 60

main =
  picture
   (ballon radiusVanMijnBallon)


ballon radius =
  [ circle (kleurBallon radius) radius
  , rectangle lightRed dikteBallonDraad lengteBallonDraad
    |> move 0 (-radius - (lengteBallonDraad / 2))
  ]
```

Een stukje code dat je misschien
moeilijk te begrijpen vindt, is deze:
```haskell
circle (kleurBallon radius) radius
```

Kun je zien waarom we twee verwijzingen naar *radius* hebben op deze regel?

In eerste instantie geven we de waarde gewoon door aan de functie *kleurBallon*, die deze informatie nu nodig heeft om te beslissen welke kleur onze ballon zal krijgen. De uitkomst van *(kleurBallon radius)* zal een kleur zijn: ofwel *green* of
*red*. Deze uitkomst wordt gebruikt als het **eerste** argument van de functie *circle*.
De *radius* die aan het einde van de regel verschijnt, is het **tweede**
argument dat ook wordt doorgegeven aan de functie *circle*.

Probeer de waarde van de variabele *radiusVanMijnBallon* te wijzigen
en kijk wat er gebeurt als deze waarde kleiner is dan 50.


## OPDRACHT 2 (gemiddeld): Nog een kleur toevoegen

Wijzig je antwoord van de vorige opdracht om een derde kleur toe te voegen, volgens de volgende regels:

1. De ballon moet groen (*green*) gekleurd zijn als hij een straal heeft van minder dan 50;  
2. De ballon moet geel (*yellow*) gekleurd zijn als hij een straal heeft van 50 of meer, en minder dan 65;  
3. De ballon moet rood (*red*) gekleurd zijn als hij een straal heeft van meer dan 65.  

Wijzig na het schrijven van de code de waarde van *radiusVanMijnBallon* zodat het eerst groen wordt, dan geel en tenslotte rood.

### Antwoord

Om deze opdracht op te lossen, moeten we een conditie  creëren binnen de andere conditie.  
1. Eerst controleren we of de waarde van de straal  **minder dan 50** is. Als dat zo is, weten we al dat de kleur groen is. Zo niet, dan moeten we een ​​tweede controle doen:  
2. We moeten weten of de waarde van de straal minder is dan 65. 
Als op dit moment de waarde minder is dan 65, weten we dat het **een getal tussen de 50 en 65** is. Dat  hadden we immers al gecheckt bij de eerste controle/validatie (als het minder dan 50 is). De kleur is dan geel. 
3. En als deze tweede validatie ook onwaar is, weten we dat de straal **een waarde boven de 65** heeft. In dat geval moeten we de rode kleur gebruiken.

Of, met andere woorden, we moeten een *if* maken 
binnen onze *if*:

```haskell
import Playground exposing (..)

lengteBallonDraad = 50

dikteBallonDraad = 3

kleurBallon radius = 
  if radius < 50 then
    green
  else 
    if radius < 65 then
      yellow
    else
      red

radiusVanMijnBallon = 64

main =
  picture
   (ballon radiusVanMijnBallon)


ballon radius =
  [ circle (kleurBallon radius) radius
  , rectangle lightRed dikteBallonDraad lengteBallonDraad
    |> move 0 (-radius - (lengteBallonDraad / 2))
  ]
```

Let op het inspringen van de _ifs_. De tweede is iets verder naar rechts
en indien nodig kunnen we andere geneste _ifs_ toevoegen. Maar wees hier voorzichtig mee want dit kan ervoor zorgen dat onze code erg moeilijk te begrijpen wordt.
  
## En nu?

Deze cursus is nog steeds in ontwikkeling en heeft voorlopig een beperkt aantal lessen. De komende weken worden er nieuwe lessen gepubliceerd!

Vond je het idee van dit project leuk? Wil je een suggestie sturen of een vraag stellen?
Neem contact met de auteur op door een e-mail te sturen naar **marcio@segunda.tech** of zoek hem op
op twitter: [@marciofrayze](https://twitter.com)
