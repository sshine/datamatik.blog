+++
date = '2025-05-06T13:03:06Z'
draft = false
title = 'Hvordan understøtter man europæisk cloud i undervisningen?'
+++

## *tl;dr* (den ultra korte version):

På Erhvervsakademi København 

- Afskaf brugen af Azure Web Apps, Azure Managed MySQL på 2. semester
- Introducér Docker Compose og Linux på 2. semester i stedet
- Deploy via Docker Compose på Linux på en VPS på 3. semester

Det var det.

## En opsummering af artiklen nedenfor:

- Ved at undervise i cloud-agnostisk teknologi og aldrig vendor-locked features
  - Eksempler på cloud-agnostisk teknologi: Docker Compose, Linux, SSH, Terraform, Ansible, Kubernetes, [GitOps][gitops], [CNCF][cncf-about] (Cloud Native Computing Foundation), [Fediversity][fediversity], [WASI][wasi] (WebAssembly System Interface)
  - Eksempler på vendor-locked features: Azure Web Apps, managed databaser, alt på tre bogstaver i AWS, samtlige *serverless* services, som ikke kan self-hostes
- Der findes ikke europæiske alternativer til de store amerikanske clouds
- Der findes suveræne cloud-baserede alternativer, hvis man siger "cloud" er et spektrum
- Suverænitet opnås igennem ejerskab frem for outsourcing af drift og intellekt

[gitops]: https://about.gitlab.com/topics/gitops/
[cncf-about]: https://www.cncf.io/about/who-we-are/
[fediversity]: https://fediversity.eu/about-fediversity/
[wasi]: https://wasi.dev/

## Hvordan forstås suverænitet?

> "The cloud is just someone else's computer." - anonym

I mit ene år som datamatiker-lærer har jeg oplevet to politiske mærkesager, der
er blevet blandet ind i undervisningen. Den første er bæredygtighed, og den
anden er teknologisk suverænitet i cloud og it-drift, med særligt fokus på at
være uafhængig af amerikanske cloud-tjenester.

Hvis du vil fast-forwardes igennem problematikken har Bert Hubert sammenfattet det overbevisende:

- (2025-02-23) [BertHub: It is no longer safe to move our governments and societies to US clouds][berthub-safety]
- (2025-03-17) [BertHub: But how to get to that European cloud?][berthub-eu-cloud]
- (2025-04-27) [BertHub: 'The cloud' is not just servers. 'Going to the cloud' could also mean locking into a forever sub-contractor][berthub-lockin]

[berthub-eu-cloud]: https://berthub.eu/articles/posts/now-how-to-get-that-european-cloud/
[berthub-safety]: https://berthub.eu/articles/posts/you-can-no-longer-base-your-government-and-society-on-us-clouds/
[berthub-lockin]: https://berthub.eu/articles/posts/beware-cloud-is-part-of-the-software/

Hvis man under en handelskrig afhænger -- offentligt og privat -- af europæiske
cloud-tjenester, har man mere suverænitet som EU-land, er påstanden. Jeg mindes
en gammel snak om hvordan EU fratager national suverænitet, men vi skal huske
at ~~Kina~~ USA er fjenden, ikke EU. Måske ved vi godt at Danmark aldrig kommer
til at levere det næste AWS og sætter målet til "europæisk suverænitet". Man fristes
til at tro, det er et retorisk angreb i handelskrigen mere end en konkret plan.

Det store tekniske spørgsmål, som vi har oppe og vende i samfundsdebatten er
imidlertid, hvordan man undgår amerikanske cloud-udbydere. Jeg køber ikke
præmissen om at afskaffe amerikansk cloud til fordel for europæisk cloud med
den samme mængde vendor lock-in. Men jeg har brugt min karriere indtil nu på
at opnå digital suverænitet ved at afskaffe vendor lock-in.

Hvis vi kigger på top-10 over de største cloud-udbydere, ser listen sådan her
ud:

1. Amazon Web Services (AWS) - USA
2. Microsoft Azure - USA
3. Google Cloud Platform - USA
4. Alibaba Cloud - Kina
5. Oracle Cloud - USA
6. IBM Cloud - USA
7. Tencent Cloud - Kina
8. Salesforce Cloud - USA
9. Huawei Cloud - Kina
10. OVHcloud - Frankrig

Ja, vi skal helt ned på 10. pladsen før vi har et europæisk land repræsenteret.

Og jeg ved ikke om du har prøvet OVHcloud, men det er ikke noget at råbe hurra for.

Der sker nemlig noget når man kommer cirka forbi top 3, og det er, at
definitionen for hvad en cloud er begynder at skifte. Den skifter til noget,
som slet ikke er tilstrækkeligt for større virksomheder, som allerede er dybt
forankret i en af de store clouds.

## Reel suverænitet: Undgå vendor lock-in

Der findes en meget nem test for, om det du underviser i er vendor-locked til en cloud:

> Er det muligt at udføre en deployment af din applikation / digitale
> infrastruktur mens internettet på samtlige involverede maskiner
> (udvikler-laptops, servere mv.) er slået fra?

Hvis det lyder helt umuligt, har du stadig [en pille at sluge][redpill].

[redpill]: https://en.wikipedia.org/wiki/Red_pill_and_blue_pill

Erhvervsakademi København er et "Microsoft-hus". Det er det man kalder det, når
alt ens infrastruktur ejes af ét amerkiansk firma. Det betyder at Microsoft har
en stor sluk-knap på alt digitalt hos EK (måske foruden lyset i loftet og
dør-alarmen). Det er ikke suverænt. Knappen trykker de ikke på at økonomiske
grunde. Men når lande er i (handels)krig, skifter incitamenterne nogle gange.
Og man kan også lirke knappen.

Microsoft er forankret i EK, fordi det eneste alternativ til et styresystem
ejet af en stor amerikansk virksomhed er Linux. Men digital suverænitet i
undervisningen er heldigvis et simplere problem: Når vi angriber problemet i
undervisningen, er det for at undgå at den kommende generation sidder i klemme
og kun kan bruge ét sæt værktøjer som er låst til ét firma.

Imellem de to ekstremer "at alt skal kunne udføres offline", og "at al software
man har installeret reelt set ejes af én amerikansk virksomhed", ligger et
spektrum.

Når vi underviser datamatikere om digital suverænitet, må vi lade de gode
principper drive vores valg af teknologi over bekvemmelighed. Din undervisning
må ikke afhænge af, at den studerende kører Windows. Eller har et bestemt
russisk firmas IDE installeret, hvis licens skal fornys regelmæssigt. Og når
man lærer at deploye sin Java-applikation til skyen, må det ikke være via en
web-formular som kun findes på Azure. For så virker det jo ikke, hvis man vil
være fri for Azure.

## Hvad er en sky?, og brug dog fri og open source software!

For at forløse samfundsdebatten lidt, ser jeg to sider:

1. Den ene er at samle fri og open source software, der er gode at lære.
2. Den anden er en holdningsændring omkring hvad en sky er eller bør være.

## CNCF, Fediversity

Der eksisterer flere initiativer som akkumulerer cloud-projekter, der har
principperne på plads.

- [Cloud Native Computing Foundation (CNCF)][cncf-about] fungerer som en
  afgørende neutral platform, der fremmer åbne standarder og interoperabilitet på
  tværs af cloud-teknologier, hvilket effektivt reducerer risikoen for vendor
  lock-in. Ved at understøtte open source-projekter som Kubernetes, Prometheus og
  Envoy skaber CNCF et fælles økosystem, hvor virksomheder kan implementere
  konsistente løsninger uafhængigt af deres cloud-udbyder. Det fremmer ikke
  kun portering mellem forskellige cloud-miljøer, men etablerer også best
  practices gennem standardiserede værktøjer og processer, som er blevet testet
  og valideret af et globalt fællesskab af eksperter. CNCF's omfattende
  certificeringsprogrammer, uddannelsesinitiativer og tekniske vejledninger
  sikrer desuden, at organisationer kan navigere i det komplekse cloud-landskab
  med større sikkerhed, hvilket ultimativt gør cloud-adoption mere tilgængelig,
  sikker og effektiv for virksomheder i alle størrelser.
  
- [Fediversity][fediversity] fungerer som et banebrydende alternativ til
  centraliserede sociale medier ved at forbinde uafhængige platforme gennem åbne
  protokoller som [ActivityPub][actpub], hvilket skaber et netværk, hvor brugere har reel
  kontrol over deres egne data og oplevelser. Den decentraliserede tilgang
  betyder, at ingen enkelt virksomhed kan diktere vilkårene for hele økosystemet,
  hvilket effektivt beskytter mod kommercialisering og algoritmisk manipulation
  af indhold. Fediversets unikke styrke ligger i dets evne til at tilbyde
  grænsefri kommunikation mellem forskellige platforme som Mastodon, PeerTube og
  Pixelfed, samtidig med at hver instans kan udvikle sine egne
  moderationspolitikker tilpasset specifikke fællesskaber. Det open
  source-baserede fundament sikrer gennemsigtighed og tillader brugerstyret
  innovation, hvor lokale communities har indflydelse på platformens udvikling.
  Det skaber et mere demokratisk og mangfoldigt internetmiljø, der prioriterer
  mennesker frem for profit og fremmer et sundere forhold mellem teknologi og
  samfund.

[actpub]: https://activitypub.rocks/

## Omfavn de mindre skyer

Som sagt, så findes der ikke en eneste europæisk cloud med et serviceniveau der
kommer i nærheden af de største clouds. Eller sagt med en høj standard: Der
findes ikke nogen europæiske clouds, hvis en cloud er defineret som "noget der
minder om AWS, Google Cloud og Azure".

Hvis du er i tvivl om hvad forskellen er på AWS og for eksempel [Hetzner
Cloud][hcloud] (en tysk cloud som jeg gør meget brug af), så er det fraværet af
specialiserede services. Hetzner var indtil for få år siden slet ikke en cloud,
men datacenter-operatører. Men der er flere penge i cloud: Mange skal ikke bruge
en hel server, men kan nøjes med en enkelt virtuel CPU på deltid.

[hcloud]: https://www.hetzner.com/cloud

I et datacenter lejer man servere, rackplads og/eller netværks-peering.

I en cloud lejer man services.

Problemet med services er, når de ikke er generiske. Så når jeg har brug for en
kø, og jeg bygger mine applikationer op omkring [Amazon SQS (Simple Queue
Service)][aws-sqs], så mister jeg min kø når jeg skifter væk fra AWS. Men
bygger jeg med [Apache Kafka][kafka] (en open source kø), kan jeg tage den med
mig når jeg skifter cloud. Og når jeg deployer med Azure Web Apps, så mister
jeg min deployment, når jeg stopper med at bruge Azure. For Azure syntes ikke,
det var vigtigt at værktøjet du bruger virker når de ikke tjener penge.

[aws-sqs]: https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html
[kafka]: https://kafka.apache.org/

Den gyldne standard inden for cloud-drift er Kubernetes. I konteksten af
undervisning tror jeg først datamatikere lærer om Kubernetes når de rammer
valgfag som [DevOps på 4. semester][kea-devops]. Og der er det naturligt at
fokusere på de cloud-agnostiske teknologier.

[kea-devops]: https://katalog.kea.dk/course/3050407/2024-2025

Det kræver heldigvis ikke en masse koordination og opkvalificering af
undervisningen, da det typisk er få undervisere, der fokuserer på
DevOps-undervisningen, som i forvejen har principperne på plads. Men vejen til
et vellykket 4. semester i DevOps går igennem 2. og 3. semester, hvor man lærer
om cloud'en på mange måder. Og der er jo ikke noget i vejen for at være den
lokale Azure-ambassadør, så længe man ikke har ansvar for også at undervise i
digital suverænitet.

Gråzonen i "cloud-spektrummet" er leje af VPS'er (virtual private servers): De
hedder noget forskelligt hos forskellige udbydere, men er grundlæggende Linux
VM'er med et antal virtuelle CPU-kerner og et antal gigabytes RAM til rådighed.
Linux VM'er har en forudsigelig omkostning sammenlignet med mere specialiserede
services, og det kan hjælpe med ikke at brænde de studerendes gratis cloud
credits inden de når 3. semester.

Det er meget rimeligt at sige, at leje af en VPS ikke tæller som cloud. Men at
deploye med Docker Compose på en Linux-server er stadig et skridt op mange
steder i industrien, og danner grundlaget for at forstå sværere
container-teknologi. Og kommer vi meget langt forbi Docker Compose, er vi
alligevel uden for hvad man kan nå på 3. semester.

At undervise datamatikere i digital suverænitet er altså ligefrem.
