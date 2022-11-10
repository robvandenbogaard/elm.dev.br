# Les 6: Antwoorden van de opdrachten

## OPDRACHT 1 (eenvoudig): verander de snelheid.

```haskell
import Playground exposing (..)

main =
  animation view

view time =
    [ triangle red 100
          |> rotate (spin 8 time)
    ]
```

Verander de hierboven gedefinieerde code zodat de driehoek 2x sneller draait.  
Verander het dan zodat het 2x langzamer draait.

### Antwoord

Om de driehoek 2x sneller te laten draaien, halveer je de eerste parameter van de *spin* methode. Onthoud: de eerste
parameter geeft aan hoeveel seconden het duurt om het figuur een volledige rotatie te laten maken. Dus, hoe korter de tijd, hoe sneller de draaisnelheid van het figuur is.

Code met 2x snellere rotatie:

```haskell
import Playground exposing (..)

main =
  animation view

view time =
    [ triangle red 100
          |> rotate (spin 4 time)
    ]
```

Code met 2x langzamere rotatie:

```haskell
import Playground exposing (..)

main =
  animation view

view time =
    [ triangle red 100
          |> rotate (spin 16 time)
    ]
```

## OPDRACHT 2 (gemiddeld): meer geometrische vormen.

Voeg in dezelfde code als in opdracht 1 een
geel vierkant toe. Het vierkant moet 2x langzamer draaien dan de driehoek.

Onze *view*-functie definieert een lijst met geometrische vormen.
Om een ​​vierkant aan de onderkant van de driehoek toe te voegen, hoef je alleen een *square* aan het begin van de lijst met geometrische vormen aan te brengen.  
Omdat we willen dat het vierkant op halve snelheid draait, hebben we het volgende nodig: pas de transformatie via de functie *rotate* toe op een vergelijkbare manier als wat we met de driehoek hebben gedaan. Maar, we geven een grotere waarde door aan de
*spin* functie, zodat het rotatie-interval groter is.
Onthoud dat we in een lijst de elementen scheiden met een komma.

### Antwoord

We gaan het antwoord in 2 delen splitsen. Laten we eerst het vierkant (*square* in het Engels) onderaan de afbeelding toevoegen, zonder animatie:

```haskell
import Playground exposing (..)

main =
  animation view

view time =
    [ square yellow 300
    , triangle red 100
          |> rotate (spin 16 time)
    ]
```

Laten we nu de opdracht afmaken door ons vierkant te laten draaien:

```haskell
import Playground exposing (..)

main =
  animation view

view time =
    [ square yellow 300
          |> rotate (spin 16 time)
    , triangle red 100
          |> rotate (spin 8 time)
    ]
```

## OPDRACHT 3 (uitdagend): met de klok meedraaien.

Tot nu toe draaien onze animaties tegen de klok in
(naar links). Verander de code van opdracht 2 zodat de driehoek 
met de klok mee draait (naar rechts) en het vierkant verder gaat,
draaiend tegen de klok in.

👩‍🏫 __Tips__:  
- Onthoud dat de functie *rotate* zowel positieve waarden als negatieve waarden kan ontvangen. Positieve waarden zorgen ervoor dat de afbeelding tegen de klok in wordt gedraaid en negatieve waarden zorgen ervoor dat de afbeelding met de klok mee draait.  
- Om tegen de klok in te draaien, moet het resultaat van de *(spin 8 time)* waarde negatief zijn.

### Antwoord

Er zijn een paar manieren om dit probleem op te lossen. Misschien wel de eenvoudigste manier is uitgaan van de waarde 360 ​​(graden) en van deze waarde het resultaat van de bewerking *(spin 8 time)* aftrekken.
Op deze manier zullen we, wanneer de waarde van de bewerking *(spin 8 time)* 0 is, dit resultaat transformeren naar 360. En als het 360 is, transformeren we het naar 0.
Wanneer de waarde 180 is, maken we er -180 van, enzovoort.  

Vergeet niet om nieuwe haakjes te plaatsen zodat de waarde eerst wordt berekend, anders krijg je een foutmelding.

```haskell
import Playground exposing (..)

main =
  animation view

view time =
    [ square yellow 300
          |> rotate (spin 16 time)
    , triangle red 100
          |> rotate (360 - (spin 8 time))
    ]
```

## En nu?

Ga nu door met [Les 7](les_7.html), veel succes!
