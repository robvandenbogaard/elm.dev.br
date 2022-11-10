# Les 6 - Je eerste animatie

Deze les is meer theoretisch, omdat je de
basisprincipes leert om animaties te kunnen maken.

## Wat leer je in deze les?

1. Hoe maak je een animatie.  
  1.1. wat is de *animation* functie?  
2. Hoe draai je een figuur volgens de tijd.  
  2.1 Een beter begrip krijgen van het beheersen van de tijd. 

## 1- Hoe maak je een animatie

Aan het einde van deze les zul je in staat zijn om de volgende code te begrijpen:

```haskell
import Playground exposing (..)

main =
  animation view

view time =
    [ triangle red 100
          |> rotate (spin 8 time)
    ]
```

Maar daarvoor moet je de _animation_ functie kennen en ook weten hoe je de tijd moet beheersen.

### 1.1 - Wat is de *animation* functie?

*animation* is de naam van de functie 
die je moet activeren zodat de computer begrijpt 
dat de tekening die je wilt maken een geanimeerde afbeelding is.

De *animation* functie ontvangt een andere soort parameter dan wat je in de vorige lessen hebt geleerd: het verwacht dat een functie als argument wordt doorgegeven. Met andere woorden, het is een functie die een andere functie als parameter neemt.

🚨 **Belangrijk**: Dit roept vaak vragen op. In *Elm* (en ook
*JavaScript*, *Clojure* en vele andere programmeertalen) 
is dit heel gebruikelijk: soms ontvangen functies
"normale" waarden, zoals getallen of tekst, maar in andere gevallen ontvangt het een **functie** als argument. Dat wil zeggen, *animation* is een functie die een verwijzing naar een andere functie als argument neemt. 🤯

In het vorige voorbeeld krijgt de *animation*-functie als
argument een verwijzing naar de *view* functie 
(view betekent in het Engels **zicht** of **zien**).   
In *Elm* is dit meestal de standaardnaam voor de
functie waar we definiëren wat er op het scherm komt.

Merk op dat de *view* functie een parameter krijgt met de naam *time*. 
(wat staat voor **tijd**).  
Je kunt het elke andere naam geven, maar volgens afspraak is dit 
de naam die we gewoonlijk voor deze parameter gebruiken.  

Via een animatie kun je je tekening na een tijdje veranderen. 
Daarom heb je deze *time*-parameter nodig
om de huidige waarde van de tijd te kennen en dus
aan te geven hoe de tekening moet worden weergegeven.

Zie het zo: stel je voor dat je een voetbal in een rechte lijn trapt. Als je weet in welke richting de bal gaat en wat de intensiteit van je trap is, hoe weet je dan de huidige positie van de bal? Het antwoord is: dat hangt ervan af! Het hangt af van de **tijd**. Nul seconden nadat je de bal schopt, raakt het nog steeds je voet. Een seconde later ben je een stukje verder weg. Met andere woorden, om uit te vinden waar je deze bal kan tekenen, is het nodig dat je de verstreken tijd weet vanaf het moment dat je er tegenaan trapte.

Terug naar de code. De functie _view_ wordt
meerdere keren (automatisch door de computer) uitgevoerd,
en bij elke uitvoering zal de waarde van de variabele _**time**_ anders zijn (met daarin de huidige tijd op het moment van die uitvoering).  
Dit is wat er gebeurt als deze functie de eerste keer wordt opgeroepen: de driehoek wordt in één richting getekend
en, als de waarde van de tijd (_time_) verandert, dan
verandert ook de manier waarop onze driehoek wordt getekend.

Alle animaties in deze cursus worden gemaakt volgens deze zelfde
logica: hun functies zullen de verstreken tijd nodig hebben (_time_) 
om het huidige moment van de animatie te kennen.

## 2. Hoe draai je een figuur volgens de tijd  

Je hebt de *rotate* functie eerder gebruikt om een afbeelding te laten draaien. Zoals jij je misschien herinnert, 
krijgt de functie *rotate* een parameter met de hoek die je wilt draaien (een getal tussen -360 en 360). In het vorige voorbeeld is de waarde, die als parameter is doorgegeven, ddeze:

```haskell
rotate (spin 8 time)
```

🚨 **Belangrijk**: De eerste opmerking die ik hier moet maken
betreft het gebruik van haakjes. Als je deze haakjes verwijdert, zal je programma niet werken. Ze zijn belangrijk omdat ze de computer vertellen dat hij prioriteit moet geven aan het oplossen van alles binnen de haakjes om vervolgens het resultaat van deze
bewerkingen te krijgen en de waarde van dit resultaat te gebruiken als argument voor de *rotate* functie. 

Je kunt een verband leggen met wiskunde: 

```haskell
x = 2 * 1 + 1  
y = 2 * (1 + 1)  
```

In bovenstaand voorbeeld is _**x**_ gelijk aan 3 en _**y**_ gelijk aan 4.  
Net als in de wiskunde zijn haakjes
erg belangrijk bij het programmeren!

Terug naar het voorbeeld, eerst zal de 
waarde van _**spin 8 time**_ worden bepaald en daarna zal die waarde gebruikt worden als een argument voor de _rotate_ functie.

*Spin* betekent in het Engels draaien.
Kun je je voorstellen wat het doet? Stop en denk hier even over na voordat je verder leest.

Nogmaals, zoals bijna alles in *Elm*, is *spin* een functie.
En zoals je misschien hebt gemerkt, zijn er twee parameters nodig.  
De eerste parameter is de **periode**. Deze geeft aan hoeveel seconden elke rotatie van het beeld moet nemen. Hoe lager de waarde, hoe sneller zal de rotatiesnelheid zijn. 
In het voorbeeld is deze waarde 8. Dit betekent dat onze driehoek 1 keer volledig ronddraait per elke 8 seconden.  
De tweede parameter is de verstreken tijd. Hier zul je in het algemeen gewoon de waarde doorgeven die je al als argument doorkreeg in je functie.
De computer controleert de tijd en geeft deze informatie door
aan ons.

### 2.1 - Een beter begrip krijgen van het beheersen van de tijd

Je programma begint met de *main* functie. Maar wie activeert deze functie?
De computer! Of meer technisch gesproken, de *Elm* *runtime*.
Maar dat is slechts een detail. Wat je moet begrijpen is dat in dit voorbeeld de *main* functie als volgt is gedefinieerd:

```haskell
main =
  animation view
```

Op een bepaald moment zal de _animation_ -functie de _view_ -functie activeren en, zoals we eerder hebben gezien, ontvangt de functie _view_ een parameter die de tijd aangeeft (de _time_ parameter):

```haskell
view time =
```

Je hoeft je geen zorgen te maken over het beheersen van deze variabele, dat doet de computer voor je. Je moet alleen weten 
wie deze waarde zal ontvangen en wat hij vertegenwoordigt.

Als deze hele uitleg te verwarrend was, maak je dan geen zorgen!
Alles wordt duidelijker als je oefent.

## En nu?

Nu is het tijd om aan de slag te gaan en nog meer te oefenen!

Ga naar [Les 6 opdrachten](les_6_opdrachten.html) en veel succes met oefenen!