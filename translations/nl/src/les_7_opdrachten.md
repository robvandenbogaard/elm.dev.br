# Les 7: Opdrachten

## OPDRACHT 1 (eenvoudig): Het veranderen van de snelheid

Lees onderstaande code en probeer je voor te stellen wat er op het scherm zal verschijnen.
En, wat betekenen de waarden 10, 100 en 12?

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue (wave 10 100 12 time)
  ]
```

Verander nu bovenstaande code zodat de cirkel 4 keer zo snel pulseert.  
Verander het dan zodat het 4 keer langzamer pulseert dan in de originele code.  

## OPDRACHT 2 (eenvoudig): Voeg een cirkel in een andere

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue (wave 10 100 10 time)
  ]
```

Neem in de bovenstaande code een nieuwe rode cirkel op die statisch/stil is.
Deze nieuwe cirkel moet onder de blauwe cirkel liggen ​​en een diameter van 200 hebben.

## OPDRACHT 3 (gemiddeld): Maak 2 cirkels die pulseren

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue (wave 20 80 2 time)
  ]
```

Wijzig de bovenstaande code om aan de volgende criteria te voldoen:  
- Verplaats de cirkel 200 eenheden naar links.  
- Maak een nieuwe blauwe cirkel met dezelfde golf (wave) als deze en plaats hem 200 eenheden naar rechts.  

Het verwachte eindresultaat is: twee cirkels die op hetzelfde moment pulseren in hetzelfde ritme, de ene naast de andere. Misschien kunnen we dit voor ons zien als de animatie van twee knipperende ogen?

## OPDRACHT 4 (uitdagend): Maak een driehoek tussen de cirkels

Vul de code van opdracht 2 aan en maak een statische/stilstaande gele driehoek tussen de twee cirkels. 

Als we ons voorstellen dat de cirkels 2 ogen zijn, dan zou de driehoek een neus kunnen zijn! De driehoek moet aan de volgende regels voldoen:  
- Hij moet geel van kleur zijn.  
- Hij moet een diameter van 50 hebben.  
- Hij moet 100 eenheden naar beneden op de verticale as (y-as).
ten opzichte van het centrum en rechts in het midden (0 eenheden) op de verticale as.  
- Hij moet zo worden gedraaid dat de bovenkant 
plat is en de onderkant een hoek/punt vormt.

Het verwachte eindresultaat is: twee cirkels die op hetzelfde moment pulseren in hetzelfde ritme, de ene naast de andere én een gele driehoek die een neus zou kunnen voorstellen. Of misschien de snavel van een vogel! Gebruik je fantasie :)

## OPDRACHT 5 (uitdagend/vrij): Maak een tekening van een dier

Tijdens de lessen hebben we geleerd hoe we driehoeken, cirkels, rechthoeken en vierkanten kunnen tekenen. We hebben ook geleerd hoe we ze moeten draaien, positioneren (een plek geven) op het scherm en vandaag leerden we een eerste animatievorm: de golfbeweging (*wave*).

Gebruik alle kennis die je tot nu toe hebt opgedaan en
probeer een afbeelding van een dier op het scherm te tekenen.

Als je geen inspiratie hebt, kun je proberen het volgende te tekenen: een vogel, een aap, een hond, een kat... 
Maak je er geen zorgen over dat je de perfecte tekening moet maken. Het belangrijkste is dat je oefent!

## En nu?

Is het je gelukt om alle oefeningen te doen? Had je moeite met een van hen?

Ga naar [antwoorden van de opdrachten](les_7_antwoorden.html) om de oplossing te zien.

