# Les 2 - Tekenen op het scherm.

## Wat leer je in deze les?

1. Wat is een *import*?  
2. Teken een bol.  
3. Wat is *main*?  
4. Wat is *picture*?  
  4.1 Maar wat is een lijst?  
5. Wat is *circle*?  

## 1- Wat is een *import*?

De eerste regel van alle computerprogramma's die we in deze cursus zullen
schrijven, zal zijn:  

```haskell
import Playground exposing (..)
```

Het woord *import* betekent importeren (binnenbrengen) in het Engels. Deze regel is nodig omdat het je toegang geeft tot de codes die zijn gedefinieerd in *Playground*. In les 5 wordt dit meer in detail uitgelegd, maar zonder dat zou het niet mogelijk zijn om op het scherm te tekenen.
Daarom beginnen alle computerprogramma's in deze cursus met deze regel.

## 2- Teken een rondje.

Tijd om te programmeren!  
Zullen we een cirkel op het scherm tekenen?  
Open de website opnieuw <a href='https://elm-lang.org/try' target='_blank'>https://elm-lang.org/try</a>
in een ander tabblad van jouw browser en plak de onderstaande code in het linkerscherm.

```haskell
import Playground exposing (..)

main =
  picture
    [ circle green 100 ]
```

Druk vervolgens op *Rebuild* en bekijk het resultaat. Lijkt het op onderstaande afbeelding?

![Een cirkel tekenen](/resources/elm-lang-try-circulo.png)

Maar wat gebeurt er eigenlijk?!

## 3- Wat is *main*?

Het woord *main* betekent voornaamst, of hoofdzaak in het Engels.
Hiermee vertel je de computer waar je programma begint.  
Dus al jouw programma's moeten deze regel hebben:

```haskell
main =
```

En al het andere staat voor wat je wilt dat de
de computer voor jou doet.  

🚨 __Let op__: er mag géén spatie staan vóór het woord *main*. 

## 4- Wat is *picture*?

Het woord *picture* betekent tekening in het Engels.
Daarmee geef je de computer aan dat je iets op het scherm wilt tekenen.  
Een **lijst** (weergegeven door de symbolen **[** en **]**) van geometrische vormen, vormt de tekening (*picture*). In dit voorbeeld bestaat de tekening 
uit slechts één geometrische vorm: een cirkel.

### 4.1- Maar wat is een lijst?

Als ik naar de supermarkt ga, schrijf ik een lijst op van producten die ik wil kopen. Zoiets als:  
- 5Kg rijst  
- 1Kg bonen  
- 3 grote aardappelen  
- 2 mango's  

Het begrip 'lijst' in programmeren lijkt er sterk op: het is
gewoon een structuur om een reeks van gegevens te ordenen en met elkaar in verband te brengen.

Om in *Elm* bijvoorbeeld de verzameling van
getallen tussen nul en tien weer te geven, schrijven we  
```haskell
[ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
```
Een lijst kan heel lang zijn. Hij kan ook maar één
element bevatten of het kan zelfs leeg zijn!

#### Andere voorbeelden van lijsten:

Een lege lijst: 
```haskell
[]
```

Een lijst met één element:  
```haskell
[ 1 ]
```

Een lijst met 3 elementen:  
```haskell
[ 8, 13, 311839 ]
```

Nog een lijst met 3 elementen:  
```haskell
["Aardappel", "Wortel", "Pompoen"... ]
```

Tijdens deze cursus zullen we veel lijsten maken!

## 5- Wat is *circle*?

Een lijst van geometrische vormen kan cirkels,
rechthoeken, zeshoeken en vele andere vormen hebben. 
In het vorige voorbeeld werd een cirkel (*circle* in het Engels) gebruikt. Om een cirkel te tekenen moet je 2 **parameters** invoeren:  
De eerste parameter staat voor de kleur. In het voorbeeld werd de kleur groen (*green*) gebruikt.  
De tweede parameter geeft de diameter van de cirkel aan. In dit geval is het 100.

## En nu?

Nu is het tijd om aan de slag te gaan en een beetje te oefenen!

Ga naar [Les 2 opdrachten](/les_2_opdrachten.html) en veel succes met oefenen!
