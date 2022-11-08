# Les 5 - Parameters doorgeven.

## Wat leer je in deze les??

1. Parameters doorgeven.  
2. Software bibliotheken (libraries).  
3. Hoe maak je je eigen functies met parameters?  
4. Parameters op naam.  

## 1 - Parameters doorgeven

Zoals je in andere lessen hebt kunnen lezen: bijna alles
in *Elm* zijn **functies**. Dit omvat ook de woorden
*circle*, *triangle*, *square*, en andere.  
Als we bijvoorbeeld typen:

```haskell
circle yellow 100
```

*circle* is de naam van een functie die
twee **parameters** heeft: een kleur en een diameter.
Dus, wanneer we een cirkel maken, moeten we 2
argumenten (in volgorde) doorgeven.

Deze *circle*-functie is gedefinieerd
binnen *Playground*, dat een bibliotheek van *Elm* is.


## 2 - Software bibliotheken (libraries)

Bij het ontwikkelen van *software* kom je
verschillende problemen tegen die andere mensen al eerder zijn tegengekomen en hebben opgelost. 
In deze gevallen kun je reeds bestaande oplossingen hergebruiken,
waardoor jouw werk gemakkelijker wordt.  
Bijvoorbeeld: het tekenen van een element op het scherm is een
terugkerende taak en wordt gebruikt voor verschillende programma's. 
Daarom heeft een andere ontwikkelaar dit probleem al opgelost
en kun je zijn of haar werk hergebruiken om jouw programma's te ontwikkelen.  
Deze set code, geschreven door andere mensen, noemen we **bibliotheken** (libraries). Tot nu toe hebben we één bibliotheek gebruikt, de *Playground*. Deze bevat functies die we kunnen gebruiken
om figuren op het scherm te tekenen en te animeren.

## 3 - Hoe maak je je eigen functies met parameters?

De functies die je definieert in jouw codes, kunnen ook parameters hebben.  
Kijk naar het onderstaande voorbeeld en probeer te
begrijpen wat er gebeurt. Geef speciaal
aandacht aan de definitie van de functie _fruit_.

```haskell
import Playground exposing (..)

main =
  picture
    [ stam
    , bladeren
    , fruit 50 50
    , fruit -40 20
    , fruit -50 100
    , fruit 40 130
    ]

stam =
  rectangle darkBrown 60 250
    |> move 0 -150

bladeren =
  circle green 150
    |> move 0 50

fruit x y =
  circle red 20
    |> move x y
```

Het eindresultaat is hetzelfde als van de uitdaging 
uit de vorige les: een boom met fruit. Maar de code is
kleiner en eenvoudiger.  
Bovendien is het nu gemakkelijker om nieuw 
fruit aan je boom te tekenen!

De functie *fruit* gedefinieerd
in de bovenstaande code is nu afhankelijk van twee parameters:
_**x**_ en _**y**_.
Dit betekent dat wanneer je deze functie gebruikt, je twee argumenten (waarden) moet doorgeven.

👩🏫 **Tip**: In sommige programmeertalen
moeten we expliciet specificeren
welk type elke variabele is. In *Elm* is dit niet nodig. De
taal is slim genoeg om uit te zoeken dat _**x**_ en _**y**_, in dit geval, getallen zijn.

Merk ook op dat we binnen de *fruit* functie
de waarden van _**x**_ en _**y**_ doorgeven aan 
een andere functie op de volgende regel: 

```haskell
move x y
```

Dat wil zeggen, *move* is ook een functie met parameters.
In feite verwachten de meeste functies in _Elm_ 
ten minste 1 parameter.

## 4 - Parameters op naam

Hoewel de namen van de parameters in het vorige voorbeeld 
uit slechts één karakter (_**x**_ en _**y**_) bestaan, kun je langere en meer betekenisvolle namen kiezen. Een voorbeeld hiervan zou kunnen zijn:

```haskell
fruit positieX positieY =
 circle red 20
   |> move positieX positieY
```

Maar in dit specifieke geval waren de vorige namen (_**x**_ en _**y**_) misschien al duidelijk genoeg.

🚨 **Belangrijk**: goede namen geven aan onze variabelen en
functies is een van de moeilijkste taken in het programmeren! 
Dus, denk lang en goed na voordat je een naam kiest en verander hem, 
indien nodig, naar een meer beschrijvende naam wanneer
je vindt dat de code verwarrend wordt.

## En nu?

Nu is het tijd om aan de slag te gaan en nog meer te oefenen!

Ga naar [Les 5 opdrachten](les_5_opdrachten.html) en veel succes met oefenen!
