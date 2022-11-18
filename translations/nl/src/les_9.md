# Les 9 - Begrijpen wat _Records_ zijn

Wanneer je veel informatie in je programma's hebt, 
moet je beginnen na te denken over hoe je het  organiseert.

Je hebt al geleerd hoe je lijsten kunt maken met de symbolen **[** en **]**. Dit is een manier om te organiseren. Een andere manier is
door gebruik te maken van _Records_.

Deze les is weer vrij theoretisch, maar je moet enkele belangrijke concepten begrijpen om verder te kunnen komen met je Elm-studie.

## Wat leer je in deze les?

1. Wat zijn *Records*.  
2. Hoe maak je een functie die een *Record* als parameter gebruikt.  

## 1 - Wat zijn *Records*  

*Records* is een manier om onze gegevens in de programmeertaal *Elm* te organiseren.

Laten we beginnen met een code die is gemaakt zonder *Records* te gebruiken, om te begrijpen  met wat voor soort problemen we waarschijnlijk te maken zullen krijgen.

Wat we tot nu toe over functies hebben geleerd, is dat we om een ​​functie te maken die
als parameter een punt in de ruimte neemt, we twee
afzonderlijke numerieke argumenten doorgeven: *x* en *y*, zoals in het onderstaande voorbeeld:

```haskell
import Playground exposing (..)

main =
  picture
  [ groeneCirkel 10 20
  ]

groeneCirkel x y =
  circle green 50
    |> move x y
```

Begrijp je wat er in bovenstaande code gebeurt? 
Als je het niet meer precies weet, <a href=./les_4.md>ga terug naar les 4</a> om te
bekijken hoe je een functie met parameters kunt maken.

In dit voorbeeld neemt onze *groeneCirkel* functie twee numerieke parameters aan die we *x* en *y* noemen. In dit geval is dat voldoende en werkt het goed. 
Maar we kunnen het ook op een andere manier doen: we kunnen een structuur (of een *Record*) maken
die een **Punt** voorstelt. Het idee is om in de code nadrukkelijker aan te geven waar 
deze informatie voor staat.

Dus, *Record* is een **gegevensstructuur** met labels. Hieronder volgt een voorbeeld
van een *Record*.

```haskell
{ x = 10, y = 15 }
```

In de taal _Elm_ is alles tussen **{** en **}** een *record*.

## 2 - Hoe maak je een functie die een *Record* als parameter gebruikt

We kunnen nu de vorige code veranderen zodat onze functie _groeneCirkel_ een _Record_ krijgt:

```haskell
import Playground exposing (..)

main =
  picture
  [ groeneCirkel {x = 10, y = 20}
  ]

groeneCirkel {x, y} =
  circle green 50
    |> move x y
```

Als we willen, kunnen we deze waarden ook opslaan in een variabele,
zoals in onderstaand voorbeeld:

```haskell
import Playground exposing (..)

positie = {x = 10, y = 20}

main =
  picture
  [ groeneCirkel positie
  ]

groeneCirkel {x, y} =
  circle green 50
    |> move x y
```

Nu is het iets duidelijker wat de 10 en de 20 betekenen, maar we kunnen een stapje verder gaan.
Het is mogelijk om een naam (een *alias*) aan deze structuur te geven.  

## Een *alias* aanmaken

In de onderstaande code definiëren we wat een Point2D is. We kunnen het elke naam geven die we willen,
maar het moet **verplicht** beginnen met een hoofdletter.

```haskell
type alias Point2D =
  { x : Number 
  , y : Number
  }
```

In deze code leggen we de computer uit dat een Point2D een **gegevensstructuur** is die twee velden bevat: de _x_ en de _y_. Deze keer vertellen we ook aan de computer dat
deze velden gegevens moeten bevatten van het type _Number_ (nummer in het Engels).

De programmeertaal _Elm_ heeft <a href="https://guide.elm-lang.org/types/" target=_blank>
een reeks gegevenstypen</a> die we kunnen gebruiken. Enkele voorbeelden zijn: _Number_, _Int_, _String_, _Bool_, _List_, _Float_. Maar maak je geen zorgen over het onthouden daarvan! Gedurende de hele les zullen we leren wanneer we ze moeten gebruiken.

Bij het maken van een nieuwe *alias* Point2D bepalen  we alleen wat het vertegenwoordigt, maar we maken niet effectief een punt. De taal _Elm_ zal automatisch een nieuwe **functie**, genaamd **Point2D**, beschikbaar stellen, waarvan de  parameters gedefinieerd worden in _alias_, die we een **constructor** noemen (of _Type Constructor_).
Door deze functie te activeren, kunnen we een nieuw punt bouwen:

```haskell
import Playground exposing (..)

type alias Point2D =
  { x : Number 
  , y : Number
  }

positie = Point2D 10 20

main =
  picture
  [ groeneCirkel positie
  ]

groeneCirkel {x, y} =
  circle green 50
    |> move x y
```

In dit voorbeeld krijgt de functie _groeneCirkel_ steeds een _Record_
op een eenvoudigere manier, met behulp van de toetsen. Maar we kunnen verder gaan en deze parameter een naam geven:

```haskell
import Playground exposing (..)

type alias Point2D =
  { x : Number 
  , y : Number
  }

posicao = Point2D 10 20

main =
  picture
  [ groeneCirkel positie
  ]

groeneCirkel punt =
  circle green 50
    |> move punt.x punt.y
```

Nu is het heel duidelijk in onze functie _groeneCirkel_ dat de verwachte parameter een punt is en dat dit punt twee velden (_x_ en _y_) heeft en die beiden getallen zijn. 
Om toegang te krijgen tot deze velden gebruiken we het puntteken ("."). 
Dus, om toegang te krijgen tot het veld _x_, typ je gewoon _point.x_.

## Conclusie

Je vraagt je waarschijnlijk af waarom dit allemaal zo is! Deze nieuwe versie van onze code is groter en misschien een beetje meer
verwarrend. En wij zouden zeggen... je hebt gelijk! In dit voorbeeld maken we een oplossing die eenvoudig was, moeilijker en dit is geen
goede zaak. Maar we moesten dit doen om de concepten aan jou uit te leggen. In andere situaties zal het gebruik van _Records_ de code erg **vereenvoudigen**. Daarom is het heel belangrijk
om dit concept te begrijpen.

## En nu?

Deze les was behoorlijk theoretisch, dus het is nu tijd om aan de slag te gaan en nog meer te oefenen!

Ga naar [Les 9 opdrachten](les_9_opdrachten.html) en veel succes met oefenen!
