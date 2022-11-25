# Les 10 - True, False en condities

## Wat leer je in deze les?

1. Waar zijn condities (voorwaarden) voor?
2. Condities gebruiken.
3. De code leesbaarder maken.

## 1 - Waar zijn condities (voorwaarden) voor?

Stel je voor dat je een 2D platformspel ontwikkelt, vergelijkbaar met die in de afbeelding hieronder.

![Imagem do jogo SuperTux](/resources/supertux.png)

De spelregels leggen bepaalde voorwaarden op. Bijvoorbeeld:

**Als** de speler een munt aanraakt, **dan:**  
&nbsp;&nbsp;&nbsp;&nbsp;verdwijnt de munt **en**  
&nbsp;&nbsp;&nbsp;&nbsp;moet het aantal munten dat de speler heeft met 1 worden verhoogd.  
**Anders:**   
&nbsp;&nbsp;&nbsp;&nbsp;moet de munt getoond blijven **en**  
&nbsp;&nbsp;&nbsp;&nbsp;moet het aantal munten hetzelfde blijven.

Wij kunnen het bovenstaande voorbeeld in 3 delen opsplitsen:  
1. De **conditie (voorwaarde)**, die WAAR (*True* in het Engels) of ONWAAR (*False* in het Engels) kan zijn; 
2. De gevolgen als die conditie **waar** is en;  
3. De gevolgen als de conditie **onwaar** is.

Zonder voorwaarden zou het onmogelijk zijn onze regels toe te passen en de hoofdpersoon zou dan nooit winnen of verliezen. Dus, ons spel zou dan erg saai zijn!

## 2 - Condities gebruiken

De eenvoudigste manier om een conditie te creëren is door *if* te gebruiken 
(dit betekent **als** in het Engels).

Stel dat we een conditie moeten maken om te weten of ons spel moet doorgaan of niet. De regel zou dan moeten zijn: **Als** de speler meer had
0 levens heeft, **dan** moet het spel doorgaan. **Anders** moeten we het spel stoppen.

Om onze uitvoering te vereenvoudigen, doen we het volgende: als de conditie aangeeft dat het spel moet doorgaan, dan verschijnt er een groene cirkel op het scherm. Als het spel niet
moet doorgaan, tonen we een rode cirkel.

Laten we beginnen met het tekenen van een rode cirkel in het midden van het scherm:

```haskell
import Playground exposing (..)

main =
  picture [
    circle red 100
  ]
```

Voorlopig tekenen we altijd een rode cirkel.  
Nu moeten we een **conditie** toevoegen. Maar, laten we eerst een variabele aanmaken
waar we het aantal levens van de speler bepalen:

```haskell
import Playground exposing (..)

hoeveelheidLevens = 1

main =
  picture [
    circle red 100
  ]
```

Klaar! Nu hebben we alles wat we nodig hebben om onze conditie te maken.
Als *hoeveelheidLevens* een waarde groter dan 1 bevat, tekenen we
een groene cirkel. Anders een rode cirkel.

```haskell
import Playground exposing (..)

hoeveelheidLevens = 1

main =
  picture [ 
    if hoeveelheidLevens > 0 then
      circle green 100 
    else 
      circle red 100
  ]
```

Merk op dat telkens wanneer we een voorwaarde (*if*) definiëren, we ook het woord *then* (wat **dan** betekent in het Engels) zetten. En, tot slot definiëren we een tweede blok, met behulp van
het woord *else* (**anders** in het Engels). 

Het soort inhoud dat wordt gedefinieerd tussen de woorden *then*
en *else*, en de inhoud die wordt gedefinieerd vanaf het woord *else*
moet hetzelfde zijn. In dit geval zijn beide een figuur.

Probeer de waarde van *hoeveelheidLevens* te veranderen in 0 of -1 en
voer het programma opnieuw uit.

## 3 - De code leesbaarder maken

In ons voorbeeld kan het voor iemand anders gemakkelijk zijn om naar de volgende regel code te kijken en direct te begrijpen wat we bedoelen:

```haskell
if hoeveelheidLevens > 0 then
```

Maar het is meer gebruikelijk dat onze conditionele  regels veel complexer zijn dan dat. En het is heel belangrijk dat andere mensen begrijpen wat de aanleiding was voor het maken van die conditie.

In deze scenario's wordt aanbevolen om dit deel van de code **los te trekken**
en in een functie te plaatsen. Zo kunnen we duidelijker maken wat de werkelijke bedoeling van die conditie is, zoals in het onderstaande voorbeeld.

```haskell
import Playground exposing (..)

hoeveelheidLevens = 1

spelerLeeftNog =
  hoeveelheidLevens > 0

main =
  picture [ 
    if spelerLeeftNog then
      circle green 100 
    else 
      circle red 100
  ]

```

In dit laatste voorbeeld zal de functie *spelerLeeftNog* het resultaat *True* weergeven als *hoeveelheidLevens* groter is dan 0 en
*False* in elk ander geval.

Er zijn verschillende manieren om deze code te ordenen. Dit is er slechts één van.

## En nu?

Deze les was behoorlijk theoretisch, dus het is nu tijd om aan de slag te gaan en nog meer te oefenen!

Ga naar [Les 10 opdrachten](les_10_opdrachten.html) en veel succes met oefenen!
