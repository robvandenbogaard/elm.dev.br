# Les 9: Opdrachten

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

Door een *type alias* te gebruiken, leggen we eerst aan de
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

Ten slotte moet uw *main*-functie de functies *linkerOog* en *rechterOog* activeren om de plaatjes op het scherm te tekenen.

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

## OPDRACHT 3 (vrij): de rest van het gezicht tekenen

Creëer andere functies voor andere delen van het gezicht. Bijvoorbeeld: neus, oor,
mond, wenkbrauw... gebruik je fantasie!

## En nu?

Is het je gelukt om alle oefeningen te doen? Had je moeite met een van hen?

Ga naar [antwoorden van de opdrachten](les_9_antwoorden.html) om de oplossing te zien.
