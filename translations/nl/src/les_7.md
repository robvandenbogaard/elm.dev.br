# Les 7 - Golfbewegingen maken.

## Wat leer je in deze les?

1. Hoe animeer je een figuur met behulp van golfbewegingen.  
1.1 De *wave* functie.  

## 1 - Hoe animeer je een figuur met behulp van golfbewegingen.

Laten we ons eerst eens herinneren hoe je een cirkel op het scherm tekent:

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue 100 ]
```

Stel je voor dat je een animatie wilt maken op deze figuur,
waardoor hij gaat "pulseren" (vergroten en verkleinen van de diameter
gedurende de tijd).

In bovenstaand voorbeeld is de diameter van de cirkel vastgesteld op 100. Om je doel ("pulseren") te bereiken, moet je ervoor zorgen dat de waarde van de diameter variabel kan zijn in plaats van vast, en gedurende de tijd kan veranderen (met behulp van die variabele _time_ die we in les 6 zagen).

Een van de manieren om dit toe te passen (implementeren), is het gebruik van een functie genaamd _wave_ (wat in het Engels golf betekent).

Open de <a href="https://elm-lang.org/try">https://elm-lang.org/try</a> website opnieuw,
kopieer en voer de volgende code uit.  
Maak je voor nu geen zorgen over het interpreteren van alles. Bekijk  gewoon het resultaat om het gedrag van deze functie beter te begrijpen.

```haskell
import Playground exposing (..)

main =
  animation view

view time =
  [ circle blue (wave 50 100 7 time)
  ]
```

### 1.1 - De _wave_ functie.

Zoals je misschien hebt gemerkt, wordt nu de functie _wave_ aangeroepen en het resultaat van deze oproep bepaalt de grootte van de diameter van de cirkel.  

De functie _wave_ heeft 4 parameters. De eerste 2 parameters komen overeen met de minimale waarde en de maximale grootte van de diameter. De laatste twee parameters hangen samen met de snelheid waarmee deze waarde moet veranderen.   
In dit voorbeeld geeft de waarde 7 aan hoeveel seconden de
totale cyclus van de animatie duurt (dat is: het tijdsinterval dat
moet verstrijken zodat de waarde varieert tussen het minimum en maximum en weer terug naar de minimumwaarde).  
De _time_ is gewoon de huidige tijd (die we als parameter krijgen in de _view_ functie en die we dezelfde waarde doorgeven).

De waarde van _time_ wordt automatisch bijgewerkt en de functie
_view_ wordt steeds opnieuw aangeroepen, elke keer met een andere waarde voor de variabele _time_. Maar je hoeft je daar geen zorgen over te maken:
geef _time_ gewoon door als een parameter aan de _wave_- functie en het zal weten wat de grootte van de cirkel op dit moment moet zijn. 

Herlees nu de vorige code en probeer beter te begrijpen wat er gebeurt. Verander de waarden 50, 100 en 7 naar andere waarden
en bekijk het resultaat. Maar voordat je de code uitvoert (via Rebuild), probeer je eerst voor te stellen hoe de animatie eruit zal zien.

## En nu?

Nu is het tijd om aan de slag te gaan en nog meer te oefenen!

Ga naar [Les 7 opdrachten](les_7_opdrachten.html) en veel succes met oefenen!
