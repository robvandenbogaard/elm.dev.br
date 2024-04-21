# Les 4 - Functies aanmaken.

Deze les is meer theoretisch. Maar, wat je vandaag zult leren is essentieel om alles te kunnen begrijpen van de rest van de lessen. Dus, laten we beginnen met begrijpen wat een functie eigenlijk is?!

## Wat leer je in deze les?

1. Wat is een functie?  
  1.1 Wiskundige functies  
  1.2 Functies bij het programmeren  
2. Hoe maak je je eigen functies?  
3. Voordelen van het maken van functies  

## 1 - Wat is een functie?

Naarmate je code groeit, wordt het steeds moeilijker en
lastiger om te (over)zien wat alle code-onderdelen 
betekenen.  
Neem als voorbeeld de code waarmee een bus getekend werd
in de opdracht in les 2. Hoe meer details je in de tekening stopte, 
hoe groter *main* werd.  
Maar wat is dat _main_ eigenlijk? Het is een **functie**.  
In de programmeertaal _Elm_ geldt voor bijna alles
wat we schrijven dat het functies zijn! Dat komt omdat het een
taal is die het **functionele paradigma** volgt. Er zijn
verschillende soorten talen (paradigma's): Object-georiënteerd,
Imperatief, Logisch en ook Functioneel. Elke
paradigma heeft zijn voor- en nadelen. In deze cursus
leer je het **functionele paradigma**.

## 1.1 - Wiskundige functies

Je hebt waarschijnlijk al gehoord over
functies in de wiskundelessen op school. Dingen zoals: 

```haskell
x = y + 2
```

Maar wat betekent _x = y + 2_? Eigenlijk betekent 
het dat overal waar je het
symbool _x_ hebt, we dit kunnen vervangen door _y + 2_,
en vice versa. Als we bijvoorbeeld de volgende
reeks vergelijkingen hebben:

```haskell
x = 5
y = 10
z = x + y
```

Om de waarde van _z_ te vinden, vervangen we
de waarde van _y_ en dan die van _x_.

De oorspronkelijke _z_-functie is:

```haskell
z = x + y
```

We kunnen bijvoorbeeld eerst de waarde van _y_ vervangen:

```haskell
z = x + 10
```

En dan de waarde van _x_:

```haskell
z = 5 + 10
```

We komen dan tot de conclusie dat **15** de enige mogelijke waarde is voor _z_.

## 1.2 Functies bij het programmeren

Bij programmeren (vooral in functionele talen,
zoals *Elm* of <a href='https://www.haskell.org/' target='_blank'>*Haskell*</a>),
is het begrip 'functie' zeer vergelijkbaar.  
In ons vorige voorbeeld hing de waarde van _z_ af van _y_ en _x_.  
We kunnen iets soortgelijks doen met onze functie _main_,
waardoor het afhankelijk wordt van andere, kleinere en eenvoudigere
functies. Dit zorgt ervoor dat de code veel gemakkelijker te begrijpen en te veranderen is.

Vond je het erg verwarrend? Maak je geen zorgen, het zal gemakkelijker te begrijpen zijn met het voorbeeld hieronder.

## 2 - Hoe maak je je eigen functies?

Laten we beginnen met een functie die een boom tekent en
splits het dan op in verschillende kleinere functies.

Originele _main_ functie:

```haskell
import Playground exposing (..)

main =
  picture
    [ rectangle darkBrown 60 250
        |> move 0 -150
    , circle green 150
        |> move 0 50
    ]
```

We kunnen onze boom opsplitsen door de definitie
van zijn bladeren in een andere functie te plaatsen:

```haskell
import Playground exposing (..)

main =
  picture
      [ rectangle darkBrown 60 250
        |> move 0 -150
    , bladeren
    ]

bladeren =
  circle green 150
    |> move 0 50
```

Deze nieuwe code is gelijk aan de vorige. We hebben er alleen net een deel uit gehaald voor een andere functie.

Om **een nieuwe functie** te definiëren, geef je deze gewoon een
naam (elk woord kan, in dit geval _bladeren_) en dan zet je het symbool **=**, op dezelfde manier als bij wiskunde.  
Alles na het gelijkheidsteken zal deel uitmaken van onze nieuwe functie.  

Is de functie eenmaal gedefinieerd, dan kun je het op een of meer plaatsen in de code gebruiken.

Om een functie te gebruiken, schrijf je gewoon zijn naam, net als in wiskunde. In het vorige voorbeeld wordt de functie _bladeren_ gebruikt als onderdeel van de functie _main_.

Het is **zeer** belangrijk om dit concept te begrijpen. Neem een moment om rustig de code hierboven te bekijken om er zeker van te zijn dat je het begrijpt.

🚨 **Let op**: in _Elm_ is de volgorde waarin de functies
worden gedefinieerd niet relevant. Je kunt
de _main_ functie eerst instellen en dan de _bladeren_ functie
of eerst de functie _bladeren_ en dan _main_.

Nu kun je ook de stam van de boom scheiden in een andere functie:  

```haskell
import Playground exposing (..)

main =
  picture
    [ stam
    , bladeren
    ]

stam =
  rectangle darkBrown 60 250
    |> move 0 -150

bladeren =
  circle green 150
    |> move 0 50
```

Probeer je voor te stellen dat het woord _bladeren_, in de 
functie _main_, wordt vervangen door de inhoud die
gedefinieerd is in de functie _bladeren_. En hetzelfde
voor het woord _stam_.

En je kunt een stap verder gaan, als je wilt, en
een _boom_ functie maken:

```haskell
import Playground exposing (..)

main =
  picture
    boom

boom =
  [ stam
  , bladeren
  ]

stam =
  rectangle darkBrown 60 250
    |> move 0 -150

bladeren =
  circle green 150
    |> move 0 50
```

In dit laatste voorbeeld geeft de functie _boom_ 
een lijst weer met geometrische vormen die een
stam en een blad bevatten.

## 3 - Voordelen van het maken van functies

Er zitten twee grote voordelen aan het splitsen van de
codes in verschillende functies.  
Het eerste voordeel is dat het gemakkelijker wordt om
je intenties uit te drukken. Kijk en vergelijk hoe de functie
_main_ omschreven is in het eerste en laatste voorbeeld. 
Deze laatste manier geeft veel duidelijker aan wat je
probeert te tekenen. 

Een ander groot voordeel van op deze manier programmeren, is dat
de _stam_ en _bladeren_ nu **ontkoppeld** zijn.  
Je kunt bijvoorbeeld de functie _stam_ opnieuw gebruiken
om andere soorten bomen te tekenen. Of je kunt een nieuw _stam_ type maken en de _bladeren_ opnieuw gebruiken.  

👩🏫 **Hint**: Bij programmeren is dit een ander zeer belangrijk begrip: **hergebruik van code**.

## En nu?

Nu is het tijd om aan de slag te gaan en nog meer te oefenen!

Ga naar [Les 4 opdrachten](les_4_opdrachten.html) en veel succes met oefenen!
