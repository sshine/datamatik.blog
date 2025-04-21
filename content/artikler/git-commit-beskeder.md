+++
date = '2025-04-21T01:47:16Z'
draft = true
title = 'Git Commit Beskeder'
+++

> Life is understood backwards, but must be lived forwards.
> --- Søren Kierkegaard

## En sammenfatning om gode commit-beskeder

Fordi versionsstyringssystemer, som git og GitHub, er kernen i moderne softwareudviklingsarbejdsgange, er de fleste arbejdsgange stærkt påvirket af og defineret i forhold til, hvordan man opererer og samarbejder omkring versionsstyring.

Ved at bruge issue trackere, pull requests, review-værktøjer og commit-beskeder er der mange rigtige måder at fordele kommunikationen, der drejer sig om en ændring i kildekoden. Så...

Hvorfor gode commit-beskeder?

- Kode læses meget oftere, end den skrives. Som [Raymond Chen](https://devblogs.microsoft.com/oldnewthing/20070406-00/?p=27343) siger:

  > *Selv hvis du ikke har til hensigt, at andre skal læse din kode, er der stadig en meget god chance for, at nogen bliver nødt til at stirre på din kode og finde ud af, hvad den gør: Den person er sandsynligvis dig selv om tolv måneder.*

- Den samme grund gælder for commit-beskeder. Som [Chris Beans](https://chris.beams.io/posts/git-commit/) siger:

  > *... en velformuleret Git commit-besked er den bedste måde at kommunikere kontekst om en ændring til andre udviklere (og faktisk til deres fremtidige jeg). En diff vil fortælle dig* hvad *der blev ændret, men kun commit-beskeden kan ordentligt fortælle dig* hvorfor.

- Når en hel commit-besked består af beskeder som "wip", "lille rettelse" eller "tilføjet kode", foreslår [Peter Hutterer](http://who-t.blogspot.com/2009/12/on-commit-messages.html), at dette skyldes manglende træning i at læse kode:

  > *Hvis du ikke har tænkt meget over, hvad der gør en god Git commit-besked, kan det være tilfældet, at du ikke har brugt meget tid på at bruge `git log` og relaterede værktøjer. Der er en ond cirkel her: fordi commit-historikken er ustruktureret og inkonsistent, bruger man ikke meget tid på at bruge eller passe på den. Og fordi den ikke bliver brugt eller passet på, forbliver den ustruktureret og inkonsistent.*

## Omkostningerne ved omskrivning under samarbejde

Når man opdager løsningen på et problem, er den udforskede sti sjældent den korteste sti. At placere gode forklaringer i git-historikken gør den ideel til at blive læst, men der er flere omkostninger, når man skal "gå tilbage" og placere dem, samtidig med at man samarbejder med andre:

1. **Omkostninger ved at lære nye værktøjer:** Omskrivning af git-historik kræver nogle af de mere vanskelige git-kommandoer, men der er også simple tilgange:
   - GitHub lader dig [squashe pull requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/about-pull-request-merges#squash-and-merge-your-pull-request-commits); i web-brugergrænsefladen kan du squashe alle commits til en enkelt og redigere commit-beskeden i et tekstområde. Dette fungerer bedst, når dine pull requests er små.
   - `git commit --fixup` og `git rebase -i --autosquash` er nemme at lære og bruge. Læs [`--fixup & --autosquash` guiden](https://fle.github.io/git-tip-keep-your-branch-clean-with-fixup-and-autosquash.html) af Florent Lebreton.
   - `git reset --soft` lader dig gencommitte alt på ny. Læs [Git Basics: Rewriting a branch's commit history from scratch](https://medium.com/magnetis-backstage/git-basics-rewriting-a-branchs-commit-history-from-scratch-7bc966716d8b) af Igor Marques da Silva.
   - Du kan altid oprette en lokal kopi af en branch, før du forsøger at omskrive historikken. Du kan endda se historikken for din kopi (ved hjælp af `git log <branch>` og `git show <hash>`) mens du samtidig genopbygger historikken (ved hjælp af `git add -p` og `git commit -v`).
2. **Omkostninger ved formulering:** Tiden og tålmodigheden til at skrive en god forklaring, og forventningen om, at den til sidst vil blive læst. At skrive beskeder til dit fremtidige jeg kan fungere som en legitim motivator.
3. **Omkostninger ved merge-konflikter:** Når man omskriver historik og force-pusher til en remote branch, tvinger dette samarbejdspartnere på den branch ud af sync ved at fjerne konfliktfrie merge-stier, og det risikerer at overskrive bidrag.
   - Det er klart, at **`push --force` er dårligt, mm'kay?!** Heldigvis har [Steve Smith](https://blog.developer.atlassian.com/force-with-lease/) noget at sige:

     > *Problemet her er, at når Bob laver en force push, ved han ikke, hvorfor hans ændringer er blevet afvist, så han antager, at det skyldes rebase, ikke på grund af Alices ændringer. Dette er grunden til, at `--force` på delte branches er et absolut no-no; og med den centrale repository-arbejdsgang kan enhver branch potentielt deles.*
     >
     > *Men `--force` har en mindre kendt søskende, der delvist beskytter mod skadelige tvungne opdateringer; dette er `--force-with-lease`.*
     >
     > *Hvad `--force-with-lease` gør, er at nægte at opdatere en branch, medmindre den er i den tilstand, vi forventer; dvs. ingen har opdateret branchen upstream. I praksis fungerer dette ved at kontrollere, at upstream ref er, hvad vi forventer, fordi refs er hashes og implicit koder kæden af forældre ind i deres værdi.*

   - Selv når din samarbejdspartner kun gennemgår eller evaluerer kode og ikke pusher ændringer, kan en merge-konflikt forårsaget af force-pushing medføre ekstra tid brugt på synkronisering. Hvis dette generer en samarbejdspartner, kan omskrivning af historik måske kun ske før og efter deres rolle er opfyldt.

Den udforskende sti kan sandfærdigt involvere mange "lille rettelse", "prøver" og "ups" trin, men disse er ikke interessante om 6 måneder. Vi kan være interesserede i mere end perfekt bagklogskab, så at efterlade et spor af kommentarer i en issue tracker, i en pull request-tråd eller i en kodeanmeldelse er en måde at uddybe forståelsen på.

## Hvordan man skriver gode commit-beskeder: Hurtig reference

- [How to write a git commit message](https://chris.beams.io/posts/git-commit/), af Chris Beams, fokuserer på formateringen:

  > 1. *Adskil emne fra brødtekst med en tom linje*
  > 2. *Begræns emnelinjen til 50 tegn*
  > 3. *Skriv emnelinjen med stort begyndelsesbogstav*
  > 4. *Afslut ikke emnelinjen med et punktum*
  > 5. *Brug bydeform i emnelinjen*
  > 6. *Ombryd brødteksten ved 72 tegn*
  > 7. *Brug brødteksten til at forklare hvad og hvorfor vs. hvordan*

- [On commit messages](http://who-t.blogspot.com/2009/12/on-commit-messages.html), af Peter Hutterer, fokuserer på *hvad* og *hvorfor*:

  > 1. *Hvorfor er det nødvendigt? Det kan rette en fejl, det kan tilføje en funktion, det kan forbedre ydeevne, pålidelighed, stabilitet, eller bare være en ændring for korrekthedsskyld.*
  > 2. *Hvordan adresserer det problemet? For korte, indlysende patches kan denne del udelades, men det bør være en overordnet beskrivelse af, hvad tilgangen var.*
  > 3. *Hvilke effekter har patchen? (Ud over de åbenlyse kan dette omfatte benchmarks, bivirkninger osv.)*

## Nogle virkelige eksempler

Forestil dig at modtage en pull request med følgende commits:
