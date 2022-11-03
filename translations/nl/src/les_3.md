# Les 3 - Elementen positioneren.

## Wat leer je in deze les?

1. Hoe teken je andere geometrische figuren.  
2. Een geometrische vorm positioneren.  
  2.1 De vorm verplaatsen.  
  2.2 De vorm draaien.  

## 1 - Hoe teken je andere geometrische figuren.

Naast cirkels kunnen we ook tekenen:  
- Driehoeken (*triangle*)  
- Vierkanten (*square*)  
- Rechthoeken (*rectangle*)  
- Ovalen (*oval*)  
- Vijfhoeken (*pentagon*)  
- Zeshoeken (*hexagon*)  
- Octagons (*octagon*)  
- Polygonen (*polygon*)  

Naast het tekenen van statische afbeeldingen kunnen we ook animaties maken! Maar dit wordt in een andere les behandeld. 😉   
Vandaag gaan we leren hoe we driehoeken, vierkanten en rechthoeken moeten tekenen.    

Eerst gaan we een programma maken dat
een vierkant in een cirkel tekent, een driehoek
binnen dit vierkant en tenslotte een kleine rechthoek.  

Open nogmaals een tabblad met de *site*
<a href='https://elm-lang.org/try' target='_blank'>https://elm-lang.org/try</a> in jouw browser. Plak de onderstaande code en druk op *Rebuild* om het resultaat te zien..

```haskell
import Playground exposing (..)

main =
  picture
    [ circle blue 200
    , square green 250
    , triangle red 120
    , rectangle yellow 70 30
    ]
```

Merk op dat in het geval van de cirkel de tweede parameter 
de grootte van de straal is. Voor het vierkant is de tweede
parameter de lengte van de zijden (denk eraan dat
de zijden van een vierkant altijd even lang
zijn, dus we hoeven maar één getal door te geven).

In het geval van de driehoek, wordt een driehoek gelijkzijdig getekend (alle zijden even lang).
Maar, het getal in de tweede parameter is **niet** de lengte
van de zijden, maar de **radius** (straal), dat wil zeggen de afstand
tussen het middelpunt van de driehoek en de drie punten die
de driehoek vormen (vergelijkbaar met de straal van een cirkel).  
Twijfel je? Verander de grootte van de driehoek maar eens en maak deze gelijk als die van de cirkel. Kijk eens wat er gebeurt?

Merk ook op dat de rechthoek, naast de kleur,
twee numerieke parameters heeft.  
Zoals je misschien al geraden hebt, staat
het eerste getal voor de breedte van de
rechthoek en het tweede getal voor de hoogte ervan.

## 2 - Een geometrische vorm positioneren.

### 2.1 -  Het verplaatsen van de vorm.

Je hebt misschien gemerkt dat elke geometrische vorm 
die tot nu toe getekend is, precies in het midden van het scherm verschijnt, toch? Op deze manier is het moeilijk 
om nog leukere dingen te tekenen, zoals een boom of een auto. 
Om complexe tekeningen te maken, moeten we de elementen **positioneren** op het scherm. Om dat te doen, 
plaats je net nadat je een geometrische vorm hebt opgegeven, 
het **|> symbool**. Dit geeft aan dat we
een **transformatie** willen toepassen 
(iets met de vorm willen doen). Vervolgens kun je de computer vertellen dat je de vorm wilt verplaatsen met behulp van de *move* functie.   

Om iets te verplaatsen, moet je twee parameters opgeven: 
de waarde van de verplaatsing op de *x*-as (het eerste getal) 
en de waarde van de verplaatsing op de *y*-as (het tweede getal).  
De waarde op de *x*-as zal de vorm rechts van het midden van het scherm plaatsen (als de waarde positief is) of links van het midden 
(als de waarde negatief is).  
De waarde op de *y*-as zal de vorm omlaag plaatsen
(als de waarde negatief is) of omhoog (als de waarde positief is).   

🚨 __Let op__: het punt 0,0 ligt precies in de
het midden van het scherm. Dit is precies het punt vanaf waar
we de geometrische vormen verplaatsen.

In het onderstaande voorbeeld zijn twee cirkels getekend,
de ene naast de andere. Kijk goed naar de
code en probeer het te begrijpen. Daarna 
kopieer je de code naar een ander tabblad van je
browser en klik op *Rebuild* om het resultaat te bekijken.

```haskell
import Playground exposing (..)

main =
 picture
   [ circle blue 100
       |> move -100 0
   , circle red 100
       |> move 100 0
   ]
```

Probeer de waarden te veranderen en bekijk het
resultaat.

### 2.2 De geometrische vorm draaien.

Naast het bewegen langs de *x*- en *y*-assen
kunnen we vormen ook roteren.  
We kunnen de driehoek bijvoorbeeld
een beetje scheef maken.
Dit biedt ons meer vrijheid bij het tekenen.  
Het roteren van een vorm lijkt heel erg op
wat we deden om een vorm te verplaatsen. We gebruiken
het symbool **|>** gevolgd door het woord
*rotate*.  

De *rotate* heeft maar één parameter nodig. Dit betreft een getal tussen 0 en 360 dat staat voor de graad van de hoek. Deze waarde kan ook negatief zijn.  
Positieve waarden draaien het figuur TEGEN de klok in. 
Negatieve waarden met de klok mee.  
Kun jij onderstaande code lezen? Probeer je voor te stellen wat er getekend gaat worden..

Kopieer de code in het andere tabblad van je browser
en klik op *Rebuild* om het resultaat te zien.

```haskell
import Playground exposing (..)

main =
  picture
   [ triangle green 100
       |> move -100 0
       |> rotate 45
   , triangle red 100
       |> move 100 0
       |> rotate -45
   ]
```

Makkelijk, hè? Probeer de getallen te veranderen en kijk wat er gebeurt.

## En nu?

Nu is het tijd om aan de slag te gaan en nog meer te oefenen!

Ga naar [Les 3 opdrachten](/les_3_opdrachten.html) en veel succes met oefenen!
