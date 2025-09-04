+++
date = '2025-09-04T11:34:00+02:00'
draft = false
title = 'Design Patterns i popkultur'
+++

Jeg har, som mange andre, været grebet af sangen PPAP:

{{< youtube Ct6BUPvE2sM >}}

Jeg har ikke kunnet lade sangen slippe, fordi PIKOTARO tydeligvis formidler abstrakt algebra:

Studiet af algebraiske strukturer, hvor man betragter sammensætningen af matematiske objekter, der
ikke nødvendigvis er tal.

Abstrakt algebra finder også bred anvendelse i programmering. Vi kalder det et designmønster, fordi
det er et abstrakt mønster som går igen, når vi arbejder med konkrete datastrukturer. Designmønstre
er værd at lære fordi man med tiden kan arbejde på et højere niveau, hvor man kan drage på flere af
sine erfaringer, fordi mange ting er lavet på den samme måde.

## Hvilket designmønster arbejder PIKOTARO med?

En af de grundlæggende principper ved programmering er **komposition**: Man har to værdier,
som man sætter sammen og får en ny værdi der kombinerer de to. Værdier kan være alt fra
heltal, sammensatte datatyper til funktioner, eller endda hele softwaremoduler. Det er kun et
spørgsmål om hvilke kompositionsoperatorer, man har til rådighed.

Eksempler på kompositions-operatorer, du måske kender:

- `+` (plus) komponerer to tal til deres sum i ℤ/64.
- `;` (semikolon) komponerer to statements under sekventiel afvikling.

I tilfældet af PPAP -- eller Pen-Pineapple-Apple-Pen -- kan man udtrykke sangen som
datatype-komposition mellem værdierne _pen_, _apple_ og _pineapple_ som tilsammen giver en række
interessante objekter. Sangen drager mig til at stille følgende spørgsmål, for at forstå den
matematiske modellering:

1. Findes der et neutralt element, som ikke påvirker tingen den kombineres med?
2. Gør det nogen forskel hvilken orden, man kombinerer med? Er pen + apple = apple + pen?
3. Gør det nogen forskel hvilken rækkefølge, man kombinerer med? 
4. Hvor mange ting kan man generere ud fra de tre ting? Endeligt eller uendeligt mange?
5. Hvis strukturen er endelig, findes der så største og mindste elementer?

Og når jeg er klogere på nogle af svarene, vil jeg efterfølgende spørge:

6. Hvordan kan man bedst modellere en datatype for komposition af ovenstående?
7. Hvis der er tale om vilkårlig rekursion, kan man abstrahere rekursionen vha. fikspunkt-typer?

## Sangtekster

Jeg har afskrevet sangteksterne, så jeg kan analysere dem (og synge med):

> I have a pen,
> I have a apple,
> ngh,
> apple-pen.
>
> I have a pen,
> I have a pineapple,
> ngh,
> pineapple-pen.
>
> apple-pen,
> pineapple-pen,
> ugh,
> pen-pineapple-apple-pen.
>
> Dance time (omkvæde)
>
> pen-pine-app-app-apple-apple,
> pen-pine-app-app-apple-pen,
> pen-pine-app-app-apple-apple-apple-pineapple-pineapple-apple-pen,
> pen-pine-app-app-apple-apple-apple-pineapple-pineapple-apple-pen,
> ah-ah-pineapple-pen-pineapple-apple-apple,
> ah-ah-pineapple-pen-pineapple-apple-apple,
>
> I have a pen,
> I have a pen,
> ngh,
> long pen.
>
> I have a apple,
> I have pineapple,
> ngh,
> apple-pineapple.
>
> long pen,
> apple-pineapple,
> ngh,
> pen-pineapple-apple-pen.

## Analyse

Til at starte med er der kun tre objekter: pen, apple, pineapple.

Men allerede i første vers lærer vi, at ved at sammensætte pen og apple, får man en apple-pen.

Hvis nogen er i tvivl om hvordan sådan en sammensætning foregår, eller er i
tvivl om at her er tale om abstrakt algebra, kan I se PIKOTARO udføre
operationen her; det abstrakte er selvfølgelig, at der slet ikke er noget æble
eller nogen pen i hans hånd. Det er noget man skal forestille sig, ligesom med
al matematik.

## Funktionelle designmønstre

{{< youtube E8I19uA-wGY >}}

![Hvordan sammensætter man en apple med en pen?](/img/ppap.jpg)
