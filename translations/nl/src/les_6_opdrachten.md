# Les 6: Opdrachten

## OPDRACHT 1 (eenvoudig): verander de snelheid

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

## OPDRACHT 2 (gemiddeld): meer geometrische vormen

Voeg in dezelfde code als in opdracht 1 een
geel vierkant toe. Het vierkant moet 2x langzamer draaien dan de driehoek.

## OPDRACHT 3 (uitdagend): met de klok meedraaien

Tot nu toe draaien onze animaties tegen de klok in
(naar links). Verander de code van opdracht 2 zodat de driehoek 
met de klok mee draait (naar rechts) en het vierkant gewoon verder draait, tegen de klok in.

👩‍🏫 __Tips__:  
- Onthoud dat de functie *rotate* zowel positieve waarden als negatieve waarden kan ontvangen. Positieve waarden zorgen ervoor dat het figuur tegen de klok in wordt gedraaid en negatieve waarden zorgen ervoor dat het figuur met de klok mee draait.  
- Om tegen de klok in te draaien, moet het resultaat van de *(spin 8 time)* waarde negatief zijn.

## En nu?

Is het je gelukt om alle oefeningen te doen? Had je moeite met een van hen?

Ga naar [antwoorden van de opdrachten](les_6_antwoorden.html) om de oplossing te zien.

