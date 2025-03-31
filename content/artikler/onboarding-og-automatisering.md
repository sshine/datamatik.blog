+++
date = '2025-03-28T15:29:43Z'
draft = true
title = 'Om onboarding, og hvad vi lærer fra os om automatisering'
+++

Denne artikel handler om hvordan onboarding på nye udviklingsmiljøer, DevOps og
studerendes ødelagte MySQL-installationer giver anledning til bedre formidling.

## Den mangelfulde vejledning

Næsten hvert sted hvor jeg er blevet onboardet som softwareudvikler, har jeg
været igennem den samme proces:

1. Få udleveret hardware
2. Få opsat brugerkonto i centrale systemer
3. Få opsat udviklingsmiljø og værktøjer rigtigt

Det første trin bliver håndteret så automatisk som man nu kan. Nogle gange
glitcher oprettelsen af brugerkonti hvis mine initialer skal ændres efter de
først er blevet oprettet. Den slags systemer går tit ikke ind og ændrer alle
steder hvor de opretter.

Onboarding af udvikler-værktøjer, derimod, går altid rigtig galt.

Nogle gange tager det en hel dag at få installeret tingene rigtigt.

Hvis der findes en vejledning, er den ikke opdateret. Nogle gange glemmer den
nogle detaljer, som forfatteren tager for givet, for eksempel at et bestemt
værktøj altid er tilgængeligt, uden at man behøver installere det, eller at
den seneste version af noget software er ukompatibel med onboardingen.

## Alting er hjemmelavet

Når vejledningen lykkes, er den aldrig simpel. Du skal bare skrive én kommando,
og så kører det hele. Men du skal lige skrive en hel masse andre kommandoer
først. Hvis du er heldig, står de beskrevet. Hvis du er rigtig heldig, virker
de også på dit styresystem. (Hvis du bruger NixOS, er du ikke heldig her.)

Når vejledningen findes, og den er nogenlunde opdateret, og man skal skrive en
del kommandoer, så er det næste problem man støder på i onboarding at alting er
hjemmelavet. Et eller andet halvhjertet shell-script kører en række kommandoer
med endnu flere antagelser, som ikke er rigtige, fordi man ikke lige kørte en
anden kommando først, selvom det ikke stod nogen steder, at man skulle.

Når først alt softwaren er installeret, kommer man til den del hvor man lover
at opdatere vejledningen med de ting som har ændret sig siden sidst, eller som
var særlige hjørnetilfælde. Man gør måske et forsøg. Men det er stadig bare et
dødt dokument, der samler støv det meste af tiden.

Nu hvor jeg er blevet "senior-udvikler" kan jeg fravælge arbejdspladser som har
den gammeldags tankegang. Automatisk installation af udviklingssoftware er et
løst problem, hvis man har lyst til at lære noget nyt.

## Der kræves MySQL-database

Jeg ville have kaldt denne artikel "Der kræves MySQL-database" fordi det der
fik mig til at skrive den var, at en lærer skrev til mig, at han havde uploadet
noget eksempel-kode til et emne, og at eksempel-koden kun virkede, hvis man
også havde MySQL-installeret.

En af de små ting, man kan [*bikeshedde*][bikeshed] som datamatiker-lærer, er
om de studerendes apps skal bruge MySQL eller om de skal bruge en in-memory
database som fx SQLite eller H2. Jeg kan rigtig godt lide at bruge H2, fordi så
skal de studerende ikke bøvle med MySQL hver eneste gang de laver et nyt
projekt. Deres MySQL-databaser bliver blandet sammen mellem projekter, og flere
studerende giver op og lader deres gruppemedlemmer køre koden, fordi deres
database "ikke lige virker".

[bikeshed]: https://en.wikipedia.org/wiki/Law_of_triviality

Hele argumentet for at bruge MySQL frem for H2 eller SQLite, som bare virker,
er at de studerende skal eksponeres for at sætte MySQL op, så de ved hvordan
man sætter en MySQL-database op, fordi realistiske apps bruger MySQL.

Men det kræver mange gentagelser at blive god til at installere MySQL, og det
er ikke noget vi øver. Og vi skal jo installere MySQL på en server, før det er
realistisk. Så vi får egentlig ikke det ud af det, som vi gerne vil, ved at
kræve at bruge MySQL: Habilitet med databaser i nogen som helst kapacitet.

## Automatisér deployment af MySQL

Hvis bare der var en måde hvorpå man kunne gøre så...

1. hver app har en MySQL-database isoleret fra andre apps
2. databasen og app'en er konfigureret til at passe sammen
3. både database og app kan startes med en enkelt kommando
4. metoden er den samme i "dev" som i "prod" (laptop vs. server)
5. det er nemmere end at forklare hvordan man installere MySQL
6. kodeord til produktionsdatabasen er ikke committet i git

Og det er der selvfølgelig: [Docker Compose][docker-compose]

[docker-compose]: https://docs.docker.com/compose/

Her er en simpel compose.yaml-fil som starter en MySQL-server i en
Docker-container, som kan startes med `docker compose up`:

```yaml
services:
  db:
    # https://hub.docker.com/_/mysql/tags
    image: mysql:latest

    # Parametrene her virker kun til at bootstrappe databasen første gang.
    environment:
      MYSQL_DATABASE: 'db'
      MYSQL_USER: 'user'
      MYSQL_PASSWORD: 'password'
      MYSQL_ROOT_PASSWORD: 'password'

    # Husk at '3306:3306' betyder at MySQL-serveren er eksponeret på alle interfaces.
    # Husk også at tage højde for, at nogle studerende allerede kører MySQL på 3306.
    ports:
      - '127.0.0.1:3307:3306'
    volumes:
      - db_data:/var/lib/mysql

volumes:
  db_data:
```

Den har ikke en service til den app som man forventer skal forbinde til
databasen. Jeg har erfaret, at apps som udvikles af datamatikere aldrig bliver
startet uden for IntelliJ. I stedet for at skrive "Husk at installere MySQL",
kan man skrive "Husk at køre `docker compose up`." Hvis app'en afhang af en
database jeg aldrig har prøvet at installere, er instruktionen den samme.

## Hvordan gør man egentlig onboarding bedst?

Docker Compose løser deployment, men ikke installation af udviklingsmiljø.

Den nemme løsning: [Devcontainers][devcontainers]

Det er en teknologi som er opstået i konteksten af VSCode, men [IntelliJ har
også understøttelse for devcontainers][intellij-devcontainers]. Idéen er den
at hvis man fx udvikler på en Java-applikation, så er Java SDK'et installeret
i en Docker-container, som ens IDE forbinder til. Man laver en Dockerfile som
beskriver hvilke ting projektet afhænger af, og hvis man starter en IDE der
har devcontainer-support, og man indlæser containeren, så skal man slet ikke
installere noget. Det gør Dockerfile for én.

[devcontainers]: https://containers.dev/
[intellij-devcontainers]: https://www.jetbrains.com/help/idea/connect-to-devcontainer.html

Kan det gøres smartere? [Nix][nix]. (Og med det mener jeg ja.)

[nix]: https://nixos.org/

Nix er en cross-platform pakke-manager der virker til alle programmeringssprog.

Lad mig give et eksempel:

Jeg legede for nyligt med en shell der hedder [schemesh][schemesh] (scheme
shell). Før man kan køre schemesh skal man downloade og compile det. Men før
man kan compile schemesh, skal man installere de nødvendige
programmeringsbiblioteker. [Instruktionerne][schemesh-install] afhænger af ens styresystem:

[schemesh]: https://github.com/cosmos72/schemesh
[schemesh-install]: https://github.com/cosmos72/schemesh#build-instructions

> ```
> # Debian Linux:
> sudo apt install build-essential chezscheme-dev liblz4-dev libncurses-dev git uuid-dev zlib1g-dev
>
> # Fedora Linux:
> sudo dnf install gcc make chez-scheme-devel lz4-devel ncurses-devel git libuuid-devel zlib-devel
>
> # FreeBSD:
> pkg install chez-scheme gcc git gmake  # must be executed as root
>
> # MacOS:
> sudo xcode-select --install # only needed if you don't already have XCode Command Line Tools
> brew install chezscheme lz4
> ```

Forfatteren af schemesh antager altså, at man ved at når man er på FreeBSD,
hedder make-kommandoen gmake fordi FreeBSD's userland-applikationer ikke er
baseret på GNU's økosystem. Og at man ikke behøver installere libncurses på
MacOS, men til gengæld skal man sikre at XCode er installeret.

Sikke en masse bøvl.

Tag i stedet [instruktionerne for at køre schemesh vha. Nix][schemesh-nix]:

[schemesh-nix]: https://github.com/sshine/schemesh/tree/nix-flake#on-nixnixos

```
nix run github:cosmos72/schemesh
```

Vi kan ikke uddanne datamatiker-studerende til at bruge Nix, da det ikke er
særlig udbredt, og konkrete færdigheder tæller for meget. Men vi kan godt
vise dem hvordan Docker Compose virker, både til at drive sine lokale
udviklingsmiljøer og til at søsætte sine apps på en VPS i skyen.
