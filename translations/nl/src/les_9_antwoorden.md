# Les 9: Antwoorden van de opdrachten

## OPDRACHT 1 (eenvoudig): het concept van de Boom abstraheren

Kijk naar onderstaande code en probeer te begrijpen wat er gebeurt.

```haskell
import Playground exposing (..)

type alias Boom =
  { hoogte : Number 
  , breedte : Number
  , straalKruin: Number
  }

mijnBoom = Boom 150 40 75

main =
  picture (tekenBoom mijnBoom)

-- Deze functie is niet compleet.
tekenBoom boom =
  [ circle green boom.straalKruin
  ]
```

Kun je je bedenken wat er gebeurt als je deze code uitvoert?

oor een *type alias* te gebruiken, leggen we eerst aan de
computer uit wat een boom is. 
In dit geval wordt een boom gevormd door 3 velden: hoogte, breedte en straalKruin. De eerste twee velden 
vertegenwoordigen informatie van de stam en de laatste van de kroon/bladeren.  
Met deze informatie kunnen we, vanuit deze structuur,
bomen tekenen die lijken op degene die we hebben gedaan in
<a href="./les_3_antwoorden.html">les 3</a> en
<a href="./les_4.html">les 4</a> van deze cursus. 

Zoals je misschien hebt gemerkt, is de _tekenBoom_ functie onvolledig en tekenen we alleen de kroon/bladeren van onze boom.

Voordat je verder gaat, open je het volgende adres in een
in een ander tabblad van jouw browser:
<a href='https://elm-lang.org/try' target='_blank'>htts://elm-lang.org/try</a>
en voer de hierboven gedefinieerde code uit.

Verander nu de _tekenBoom_ functie zodat die ook
de stam van onze boom tekent.

### Antwoord

Er zijn verschillende manieren om deze uitdaging op te lossen. Het moeilijkste deel
heeft niets te maken met programmeren, maar met wiskunde! :)

We moeten bepalen waar we de rechthoek tekenen die de stam van onze boom voorstelt,
en deze keer komt deze waarde tot stand via parameters.  
Het tekenen van de rechthoek is het makkelijke deel:

```haskell
import Playground exposing (..)

type alias Boom =
  { hoogte : Number 
  , breedte : Number
  , straalKruin: Number
  }

mijnBoom = Boom 150 40 75

main =
  picture (tekenBoom mijnBoom)

tekenBoom boom =
  [ circle green boom.straalKruin
  , rectangle darkBrown boom.breedte boom.hoogte
  ]
```

Maar, als we deze code uitvoeren, zien we dat de stam bovenop de bladeren wordt getekend. We moeten het naar beneden verplaatsen zodat het tegen de rand van de cirkel aan staat.

Hier had je verschillende strategieën kunnen toepassen. Wij kiezen ervoor om het exacte punt te berekenen waar de cirkel eindigt om de stam naar deze plek te verplaatsen. Daarvoor moeten we 2 waarden toevoegen: de straal van de cirkel plus de helft van de hoogte van de stam. Op deze manier zal de stam precies aan het einde van de bladeren staan:

```haskell
import Playground exposing (..)

type alias Boom =
  { hoogte : Number 
  , breedte : Number
  , straalKruin: Number
  }

mijnBoom = Boom 150 40 75

main =
  picture (tekenBoom mijnBoom)

tekenBoom boom =
  [ circle green boom.straalKruin
  , rectangle darkBrown boom.breedte boom.hoogte
    |> move 0 -(boom.straalKruin + (boom.hoogte / 2))
  ]
```

## OPDRACHT 2 (moeilijk): ogen tekenen

Laten we een aanpak bedenken om ogen op het scherm te tekenen met behulp van parameters.  

Je moet een functie met de naam *oog* maken die een *Record* als parameter ontvangt. 
Maak hiervoor een *type-alias* aan met de naam *Positie*
met daarin de velden *x* en *y*, beiden van het type *Number*. 

De functie *oog* moet een lijst van cirkels opleveren die staan voor een oog op het scherm. 
Ons oog zal uit minstens twee cirkels bestaan,
de ene in de andere. Gebruik je fantasie om het te tekenen!

Maak vervolgens 2 andere functies genaamd *linkerOog* en *rechterOog*.
Deze functies moeten de *oog*-functie activeren door de
positie langs te gaan. Het linkeroog wordt getekend vanuit het punt _(-100, 20)_ en het
rechteroog vanuit het punt _(100, 20)_.

en slotte moet uw *main*-functie de functies *linkerOog* en *rechterOog* activeren om de plaatjes op het scherm te tekenen.

👩‍🏫 **Hint**: zowel de functies *linkerOog* en *rechterOog* geven een lijst met plaatjes. Het zal nodig zijn om deze twee lijsten samen te voegen tot één lijst
voordat de functie *main* wordt aangeroepen (die een enkele lijst met plaatjes verwacht).
Hiervoor kun je het symbool **++** gebruiken. Voorbeeld:

```haskell
kleineGetallen = [1,2,3]
groteGetallen = [100,101,102]
lijstMetGetallen = kleineGetallen ++ groteGetallen
```
In bovenstaande code zal *lijstMetGetallen* de volgende lijst bevatten: [1,2,3,100,101,102].

Probeer de opdracht op te lossen. Als het je veel moeite kost, kun je de structuur volgen die we hieronder gemaakt hebben:

```haskell
import Playground exposing (..)

type alias Positie =
  -- stel hier de x- en y-velden in

linkerOog = 
  -- hier moet je de oogfunctie activeren (denk aan de haakjes!)

rechterOog =
  -- hier moet je de oogfunctie opnieuw activeren

main =
  -- Geef als parameter van de functie *picture* het resultaat van de samenvoeging van de functies linkerOog + rechterOog door.

oog positie =
  [ 
-- teken hier een oog met minstens 2 cirkels.
  ]
```

### Antwoord

Er zijn oneindig veel manieren om deze opdracht op te lossen! Het belangrijkste is om te blijven oefenen. Hieronder zie je als voorbeeld ons antwoord staan. Daarin worden voor elk oog 3 cirkels gebruikt om een oog te maken.

```haskell
import Playground exposing (..)

type alias Positie =
  { x : Number
  , y : Number
  }

linkerOog = 
  oog (Positie -100 20)

rechterOog =
  oog (Positie 100 20)
main =
  picture (linkerOog ++ rechterOog)

oog positie =
  [ circle gray 50 
    |> move positie.x positie.y
  , circle black 20
    |> move (positie.x - 10) (positie.y - 5)
  , circle white 5
    |> move (positie.x - 15) (positie.y - 8)
  ]
```

## OPDRACHT 3 (vrij): de rest van het gezicht tekenen

Creëer andere functies voor andere delen van het gezicht. Bijvoorbeeld: neus, oor,
mond, wenkbrauw... gebruik je fantasie!

### Antwoord

Vrije oefeningen hebben geen goede of foute antwoorden!
Het belangrijkste is om te oefenen en plezier te hebben.

## En nu?

Deze cursus is nog volop in ontwikkeling en heeft voorlopig een beperkt aantal lessen. Gedurende de hele cursus zullen nieuwe lessen worden gepubliceerd in komende weken!

Vond je het idee van dit project leuk? Wil je een suggestie sturen of meenemen
Nog vragen? Neem contact op met de auteur door een e-mail te sturen naar
**marcio@segunda.tech**.
