+++
date = '2025-05-10T16:08:57Z'
draft = true
title = 'Kompetencebaseret undervisning med skill-træer'
+++

> **Note:** Blogindlægget her er baseret på en videnskabelige artikel:
>
> **Structuring Competency-Based Courses Through Skill Trees** af Hildo Bijl, offentliggjort den 23. april 2025 ([ArXiv][hildo-bijl-arxiv], [PDF][hildo-bijl-pdf])

[hildo-bijl-arxiv]: https://arxiv.org/abs/2504.16966
[hildo-bijl-pdf]: https://arxiv.org/pdf/2504.16966

Der er sket to vigtige tendenser i datalogisk (og datamatisk) undervisning:

- et skift fra ren teori til færdigheder: kompetencebaseret undervisning
- et stigende optag af studerende på tværs af uddannelser

Det stigende optag har medført mere automatisering i undervisningen.

Når man automatiserer uddannelse, er det afgørende at strukturere kurserne sådan at de automatiserede vejledningsalgoritmer er realistiske at lave. De struktureringsmetoder man benytter i dag fokuserer på teori og ikke færdigheder, og er ude af stand til at modellere afhængighedsforholdene mellem færdigheder. Derfor er der behov for en ny didaktisk ramme.

Hildo Bijls artikel præsenterer en ny metode til at strukturere undervisningsindhold omkring færdigheder: *skill-træer*, der viser afhængigheder mellem færdigheder, og kobler dem efterfølgende til *concept-træer*, som indeholder intuitive idéer. På grund af fagets algoritmiske natur er trin-for-trin tilgangen særligt velegnet til uddannelsesområdet.

Artiklen præsenterer også retningslinjer for hvordan man designer skill-træer og planlægger et kursus ved hjælp af dem.

## Skills

Først nogle definitioner:

- **Handling:** En *handling* er er noget som nogen kan gøre.
- **Skill:** En *skill* er et udvalg af handlinger, som er vurderet ens nok at være sammenlignelige.
- **Øvelse:** En *øvelse* består i at udføre en bestemt handling, hvorefter en evaluering kan afgøre, om man har nået et succeskriterie.

Skills kan være "at løse en lineær ligning" eller "at sparke en fodbold i mål". Skills har altid en vis mulighed for variation. For eksempel kan *løs a·x+b = c·x+d* og *løs $a·(x+b) = c·x+d* godt være variationer over den samme skill, men *løs a/(x+b) = c/(x+d)* er nok en anden skill. Det er vigtigt at afgrænse hvad en skill indeholder og ikke indeholder.

- **Del-skill:** En skill er betragtet som en del af en anden skill, hvis dens udførsel udgør en betydelig del af den anden skill.
- **Elementær skill:** En skill er elementær hvis man ikke ønsker at bryde den yderligere ned i dele.
- **Skill-træ:** En [orienteret, acyklisk graf][dag-wiki] hvor knuderne er skills og pilene beskriver en forudsættende relation:

[dag-wiki]: https://en.wikipedia.org/wiki/Directed_acyclic_graph

Eksempler på del-skills i ovenstående eksempel med lineære ligninger er *flyt ligningsterm*, *sæt udenfor parentes*, og *løs produktligning*.

Et eksempel på en elementær skill kunne være at indtaste en vilkårlig kommando i en terminal.

Den *afhænger af* at man kan åbne en terminal, men at åbne en terminal er ikke en del af det at indtaste en kommando.

I et skill-træ betyder *a → b* at *a* er en del-skill til *b*, så man forventes at skulle lære *a* for at lære *b*.

## Opsætning af skill-træ for eksisterende fag/kursus

Før vi starter, vil jeg foreslå nogle spilleregler, som har til formål at gøre skill-træet praktisk anvendeligt:

1. **Skills er mål:** Skills bør ikke være baseret på værktøjer/metoder såsom "anvendt en bestemt operator eller regel", men i stedet på mål:
