+++
date = '2025-04-13T20:26:14Z'
draft = false
title = 'Om at blive rekursivt beruset med monoider'
+++

> **Disclaimer:** Jeg er *ikke* mixolog. Dette er *ikke* professionel cocktailrådgivning!

> **Lyt i stedet:** Nogen lavede et podcast-afsnit om blogindlægget: [Haskell Weekly, Episode 26: Recursive Monoids][rec-monoid-podcast].

[rec-monoid-podcast]: https://haskellweekly.news/episode/26.html

Jeg læste engang, at man kunne modellere cocktails som [monoider][monoid-wiki].

[monoid-wiki]: https://en.wikipedia.org/wiki/Monoid

Det er et virkelig cool eksempel på funktionsorienteret modellering, som jeg gerne vil uddybe.

Lennart Kolmodin skrev engang, at dansetrinene i Tango også danner en monoid.

Først vil jeg demonstrere min uvidenhed og antage, at cocktailopskrifter er frie kommutative monoider over ingredienser:

[fcm]: https://ncatlab.org/nlab/show/free+commutative+monoid

- Rækkefølgen hvori du tilføjer ingredienser har ingen betydning,
- Hvis du kombinerer to cocktails, får du en anden cocktail,
- Identitetscocktailen er den tomme cocktail uden ingredienser.

Dernæst vil jeg genfortælle en rekursiv cocktailopskrift, som jeg lærte om da jeg studerede datalogi.

## Superdrinks

Den kommer fra en DIKU-revysketch fra 2002: [Superdrinks][dikurevy-github]; æren tilfalder Uffe Christensen, Uffe Friis Lichtenberg, Jonas Ussing, Niels H. Christensen, Torben Æ. Mogensen, Jørgen Elgaard Larsen, som enten var medforfattere eller opførte sketchen.

[dikurevy-github]: https://github.com/dikurevy/Public-Archive/blob/bb88d10bb88b69687f4448b83eeebcf526a81892/2002/sketches/RekursivDrink.tex

En superdrinks består af:

- 1 del gin,
- 2 dele citron,
- 3 dele superdrinks.

Ifølge sketchen er der masser af dårlige måder at materialisere denne drink på. En særligt katastrofal måde er gennem approksimation: tag 1 del gin, 2 dele citron og 3 dele af hvad der er din nuværende bedste tilnærmelse af superdrinks. Gentag denne proces tilstrækkeligt mange gange, og du vil have en gradvist mere nøjagtig superdrinks.

Rekursivt kan man opstille metoden som:

```
superdrinks(n) = 1 × gin
               + 2 × lemon
               + 3 × superdrinks (n-1)
```

Hvad angår `superdrinks(0)`, kunne det være vand. Men det kunne også være gin!

Prøver vi at sætte konkrete tal på `n`'s plads kommer følgende ud:

```
superdrinks(1) = 1 × gin + 2 × lemon + 3 × superdrinks(0)

superdrinks(2) = 1 × gin + 2 × lemon + 3 × superdrinks(1)
               = 1 × gin
               + 2 × lemon
               + 3 × (1 × gin + 2 × lemon + 3 × superdrinks(0))
               = 4 × gin + 8 × lemon + 9 × superdrinks(0)
```

Forholdet mellem antallet af dele af hver ingrediens kan udtrykkes i lukket form, der eliminerer rekursion:

```
superdrinks(n) = (3ⁿ - 1)/2 × gin
               + (3ⁿ - 1) × lemon
               + 3ⁿ × superdrinks(0)
```

Du kan finde den lukkede form enten ved at genkende, at serien 3 × 3 × ... med n forekomster er 3ⁿ, at der altid er én del citron mindre end superdrinks(0), og at der altid er halvt så meget gin som det; eller du kan løse deres [rekurrensrelation][rr]; eller du kan udvide de tre talserier ved brug af en funktion,

[rr]: https://en.wikipedia.org/wiki/Recurrence_relation

```haskell
> let superdrinks (gin, lemon, super) = (1 + 3*gin, 2 + 3*lemon, 3*super)
> unzip3 $ take 6 $ iterate superdrinks (0,0,1)
([0,1,4,13,40,121],[0,2,8,26,80,242],[1,3,9,27,81,243])
```

og slå dem op [en](https://oeis.org/search?q=1%2C4%2C13%2C40%2C121), [efter](https://oeis.org/search?q=2%2C8%2C26%2C80%2C242), [en](https://oeis.org/search?q=3%2C9%2C27%2C81%2C243) på [OEIS.org](https://oeis.org/).

## Det er på tide at blive [schwifty][schwifty]!

[schwifty]: https://www.youtube.com/watch?v=I1188GO4p1E

Inden det bliver for abstrakt, skal vi til at kode.

Et godt sprog at programmere med monoider er selvfølgelig [Haskell](https://www.haskell.org/), som er relativt moderne.

Følgende ingredienser er nok til at lave gin-tonic og superdrinks:

```haskell
data Ingredient = Gin | Tonic | Lemon
  deriving (Eq, Ord, Show)
```

En cocktail er ethvert sæt ingredienser og deres multiplicitet:

```haskell
newtype Cocktail = Cocktail (Map Ingredient Natural)
  deriving (Eq, Ord, Show)

emptyCocktail :: Cocktail
emptyCocktail = Cocktail Map.empty
```

For nemheds skyld er her nogle hjælpefunktioner,

```haskell
parts :: Natural -> Ingredient -> Cocktail
parts n ingredient =
  Cocktail (Map.singleton ingredient n)

combine :: Cocktail -> Cocktail -> Cocktail
combine (Cocktail c1) (Cocktail c2) =
  Cocktail (Map.unionWith (+) c1 c2)
```

En konsekvens af denne modellering er:

```haskell
> let gintonic = combine (1 `parts` Gin) (2 `parts` Tonic)
> let double_gintonic = combine gintonic gintonic
> double_gintonic
Cocktail (fromList [(Gin,2),(Tonic,4)])
> gintonic == double_gintonic
False
```

Kombinerer jeg en opskrift for gin-tonic med sig selv, får jeg ikke en opskrift for gin-tonic. 🤔

Da jeg modellerer *opskrifter*, vil jeg gerne normalisere mængderne af hver ingrediens.

Ellers ender opskrifterne med at sige "2 dele gin, 4 dele tonic" eller "0 dele gin":

```haskell
normalize :: Cocktail -> Cocktail
normalize (Cocktail ingredients) = Cocktail (normalize' ingredients)
  where
    scale = foldr1 gcd (Map.elems ingredients)
    normalize' = Map.map (`div` scale) . Map.filter (/= 0)
```

*(Bemærk, at selvom `foldr1` er [partiel][hw-partial], er den på grund af Haskells ikke-strikte semantik aldrig evalueret, når `ingredients` er tom, fordi den bruges inden for `Map.map` nul gange, og koden evaluerer derfor sikkert hver gang.)*

[hw-partial]: https://wiki.haskell.org/Avoiding_partial_functions

Demonstration af `normalize`:

```haskell
> normalize emptyCocktail 
Cocktail (fromList [])

> normalize (0 `parts` Gin)
Cocktail (fromList [])

> normalize $ combine (2 `parts` Gin) (4 `parts` Tonic)
Cocktail (fromList [(Gin,1),(Tonic,2)])
```

Det ville være fristende at specialisere `Eq Cocktail`-instansen til at bruge `normalize`, så `c == combine c c` for alle `c`. Men jeg er ikke meget for at gøre det, fordi hvis jeg nogensinde har brug for at sammenligne strukturel lighed, kan jeg ikke, hvorimod lighed under normalisering kan opnås med:

```haskell
> let (=~) = (==) `on` normalize
> (1 `parts` Gin) =~ (2 `parts` Gin)
True
```

Det ville også være fristende at tilføje normalisering til `combine`, så kombinationen af to cocktails er en normaliseret cocktail. Men da blogindlægget her handler om cocktails som monoider, og `combine` er den bedste kandidat til en kompositionsoperator, bryder et sådant valg faktisk [monoiders lov om associativitet][monoid-wiki]:

[monoid-wiki]: https://en.wikipedia.org/wiki/Monoid#Definition

```haskell
> let norm_combine c1 c2 = normalize (combine c1 c2)

> gin1 `norm_combine` (gin1 `norm_combine` tonic1)
Cocktail (fromList [(Gin,2),(Tonic,1)])

> (gin1 `norm_combine` gin1) `norm_combine` tonic1
Cocktail (fromList [(Gin,1),(Tonic,1)])
```

*(Når man kombinerer tre ting, bør det være lige meget om man kombinerer til venstre eller til højre først, men det er ikke sandt når man normaliserer efter hver kombinering.)*

Så selvom jeg kan lide tanken om at normalisere cocktailopskrifter, ville det sandsynligvis være en dårlig idé at gøre det til en del af `Semigroup Cocktail`-instansen, hvilket efterlader de meget enklere typeklasse-instanser:

```haskell
instance Semigroup Cocktail where
  (<>) = combine

instance Monoid Cocktail where
  mempty = emptyCocktail
```

Ovenstående rejser spørgsmålet: Er glasset halvt fyldt eller halvt `mempty`?

Hvad angår superdrinks, kan opskriften nu udtrykkes med kode som:

```haskell
superdrinks :: Natural -> Cocktail -> Cocktail
superdrinks n base = mconcat
  [ ((3^n - 1) `div` 2) `parts`  Gin
  ,  (3^n - 1)          `parts`  Lemon
  ,  (3^n)              `rounds` base
  ]

rounds :: Natural -> Cocktail -> Cocktail
rounds n = mconcat . genericReplicate n
```

Er den bedste tilnærmelse ved brug af en `base` af `mempty`?

Eller, som revysketchen foreslår, ``n `parts` Gin``?

Det handler nok om hvor fuld man ønsker at blive.

For en femte approksimation af superdrinks med ren gin som nulte approksimation,

```haskell
> normalize . superdrinks 5 $ 1 `parts` Gin
Cocktail (fromList [(Gin,182),(Lemon,121)])
```

Det kan godt være, vi skal finde nogle større målebægre.

Skål!
