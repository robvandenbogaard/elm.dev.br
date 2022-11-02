# Les 2: Antwoorden van de opdrachten

Open het volgende adres in een ander tabblad in uw browser:
<a href='https://elm-lang.org/try' target='_blank'>htts://elm-lang.org/try</a>.

Kopieer hieronder het antwoord op elke oefening en
probeer de code te begrijpen voordat je op *Rebuild* drukt.  

## Opdracht 1 (eenvoudig): De grootte van een cirkel veranderen.

Verander de waarde van de cirkelgrootte in een willekeurig getal.  
Het kan een kleine waarde zijn zoals 1 of 2, of een grote waarde zoals 999999999.  
Klik dan op *Rebuild* en zie het resultaat!

### Antwoord

Deze opdracht was best gemakkelijk, nietwaar?! Het enige dat je moest doen, was de waarde van de grootte van de cirkel veranderen.

```haskell
import Playground exposing (..)

main =
  picture
    [ circle green 5 ]
```

## Opdracht 2 (eenvoudig): De kleur van de cirkel veranderen.

Verander de kleurwaarde van de cirkel in de kleur van jouw voorkeur.  
Vergeet niet dat je de naam van de kleuren in het Engels moet schrijven. Als je moeite hebt met Engels, kijk dan hieronder op de lijst met beschikbare kleuren.

### Lijst met kleuren:
red, orange, yellow, green, blue, purple, brown,
lightRed, lightOrange, lightYellow, lightGreen,
lightBlue, lightPurple, lightBrown, darkRed,
darkOrange, darkYellow, darkGreen, darkBlue,
darkPurple, darkBrown, white, lightGrey, grey,
darkGrey, lightCharcoal, charcoal, darkCharcoal,
black, lightGray, gray and darkGray.

### Antwoord

Deze was ook vrij gemakkelijk. Je hoefde alleen maar de eerste parameter van de cirkel (*circle*) naar een andere kleur te wijzigen.

```haskell
import Playground exposing (..)

main =
  picture
    [ circle red 5 ]
```

## Opdracht 3 (uitdagend): Maak 2 cirkels, de één binnen de ander.

Onze tekening (*picture*) heeft momenteel slechts één
cirkel. Probeer een tweede cirkel van
een andere kleur en een beetje kleiner dan de eerste toe te voegen.

👩‍🏫 __Tips__:  
- Vergeet niet dat de symbolen **[** en **]** een
lijst aangeven. Dus de tweede cirkel moet
binnen deze symbolen vallen.  
- Zie de lijst als vergelijkbaar met een boodschappenlijstje. Maar in plaats van
voedsel, bevat onze lijst geometrische vormen.  
- Gebruik een komma om aan te geven dat je een tweede cirkel maakt binnen de lijst van
geometrische vormen.  
- Let op de volgorde! Als de kleinste cirkel
voor de grootste in de lijst staat, komt hij achter de grootste te staan en kun je hem niet zien. Als je meer dan één geometrische figuur wilt tekenen,
scheidt dan elk figuur met een komma. In het voorbeeld hieronder hebben we een rode cirkel binnen een groene cirkel geplaatst.    
Vergeet niet dat de symbolen **[** en **]** een lijst aangeven.  

### Antwoord

```haskell
import Playground exposing (..)

main =
  picture
    [ circle green 100
    , circule red 50
    ]
```

Je moet bovenstaande code kunnen lezen en als volgt interpreteren:  
Ons programma (*main*) is gedefinieerd als een
tekening (*picture*) met een lijst (aangegeven
door de symbolen **[** en **]**) van twee figuren die in dit geval twee cirkels zijn.

## Opdracht 4 (uitdagend): Maak 4 cirkels, de één binnen de ander.

Vergelijkbaar met de vorige opdracht, maar deze keer moeten er 4 cirkels zijn: de ene binnen de andere, met verschillende maten en kleuren.

### Antwoord

Als je moeite had met oefeningen 3 en 4,
waarom probeer je dan nu niet oefening 4 te doen voordat je het antwoord ziet, en nu je het antwoord op oefening 3 hebt gezien?  
Zie het antwoord hieronder.

Voordat je de onderstaande code uitvoert, kun je je voorstellen wat het op het scherm zal tekenen?

```haskell
import Playground exposing (..)

main =
  picture
    [ circle black 200
    , circle green 150
    , circle yellow 100
    , circle red 50
    ]
```

## En nu?

Ga nu door met [Les 3](/les_3.html), veel succes!
