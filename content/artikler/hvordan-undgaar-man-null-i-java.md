+++
date = '2025-04-18T08:43:03Z'
draft = true
title = 'Hvordan undgår man null i Java?'
+++

Brugen af `null` snildt har kostet software-branchen en milliard dollars i tab
forårsaget af lemfældig brug af `null`-værdier. Men hvordan undgår man at
forårsage en fejl som sproget gør så let at indføre?

1. **Optional-klassen** - Java 8 introducerede `Optional<T>` i 2014 som en container-type, der enten indeholder en værdi eller er tom. Det tvinger programmøren til eksplicit at håndtere tilfælde, hvor en værdi kan mangle. `Optional<T>` gør det gør det tydeligt for brugere af ens funktioner, at en returværdi kan mangle. Tjek [Baeldung's Guide to Java Optional][baeldung-optional].

   **I undervisningen:** Det nemmeste sted at få point som lærer for at bruge `Optional<T>` når man underviser datamatikere, er vistnok når man benytter JPA (Java Persistence API) som database-lag. JPA kan auto-generere forespørgselsfunktioner, der returnerer `Optional<T>`. På EK sker det på 3. semester. Det er lidt sent hvis de studerende først se `Optional<T>` der, men bedre sent end aldrig. Læs evt. [Baeldung's How to Make a Field Optional in JPA Entity?][baeldung-optional-jpa]

[baeldung-optional]: https://www.baeldung.com/java-optional
[baeldung-optional-jpa]: https://www.baeldung.com/jpa-optional-field

2. **Record-typer** - Java 14 introducerede `record`-typer som blev stabile i Java 16 i 2021, som er en slags klasser, der producerer immutérbare værdier, der ikke kan være null. De er først og fremmest belejlige, fordi de fjerner en masse boilerplate fra alm. klasser, men de er altså også sikrere på flere måder. Tjek [Oracle's opsummering af record-typer][oracle-records], [Baeldung's opsummering af record-typer][baeldung-records], og en blog post om [hvorfor record-typer ikke helt når i mål sammenlignet med de såkaldte værdi-typer][records-vs-values].

   Record-typer er så meget en forbedring af Java, at de fortjener en hel undersektion af gode grunde til at bruge:

   a. De er immutable by design: Alle felter er `final`, og kan ikke ændres efter oprettelse.
   b. Syntaksen er kompakt, så man undgår en masse boilerplate sammenlignet med traditionelle klasser.
   c. Java genererer automatisk `equals()`, `hashCode()` og `toString()` baseret på record-komponenterne.
   d. Records understøtter at blive dekonstrueret vha. mønstre på en meget belejlig måde.
   e. Records har én kanonisk konstruktur, hvor du kan tilføje yderligere validering af felter.

   Records kan dog stadig godt være null.

   **I undervisningen:** Det første sted jeg brugte record-typer var som DTO-typer på 3. semester. Det kan være lidt omstændigt, fordi JPA ikke tillader at ens `@Entity`-klasser er records, men der er [måder at arbejde med JPA og record-typer][baeldung-jpa-records]. Record-typer er så meget simplere, og leder til så gode vaner blandt den studerende, at **det ville være en skam ikke at introducere dem på første semester, før almindelige klasser.**

[oracle-records]: https://docs.oracle.com/en/java/javase/17/language/records.html
[baeldung-records]: https://www.baeldung.com/java-record-keyword
[records-vs-values]: https://www.beyondjava.net/records-vs-value-types
[baeldung-jpa-records]: https://www.baeldung.com/spring-jpa-java-records

3. **Immutable objekter** - Design klasser til at være immutable med alle nødvendige felter initialiseret i konstruktøren. Det eliminerer muligheden for null-felter, og det eliminerer også risikoen for fejlagtige tilstande inde i objekter. Den letteste måde at opnå immutable objekter er ved altid at bruge record-typer, når det lader sig gøre. Som [The Java Tutorials: Immutable Objects][java-tut-immutable] siger,

   > Maximum reliance on immutable objects is widely accepted as a sound strategy for creating simple, reliable code.

   Det betyder ingen settere. ;-)

[java-tut-immutable]: https://docs.oracle.com/javase/tutorial/essential/concurrency/immutable.html

4. **Null Object-mønsteret** - Implementér en "do-nothing" version af en klasse i stedet for at returnere null. Dette eliminerer behovet for null-tjek, da objektet altid har en gyldig adfærd. 

3. **Assertions og validering** - Brug `Objects.requireNonNull()` eller lignende metoder til at validere input tidligt og kaste exceptions ved null-værdier. 

4. **Defensive programmering** - Tjek altid for null før du bruger referencer, især når du arbejder med eksterne API'er eller brugerinput. 

5. **Annotations for null-analyse** - Brug annotations som ```@NonNull``` og ```@Nullable``` sammen med statiske analyseredskaber som FindBugs, Checker Framework eller IntelliJ's inspektioner. 

7. **Collections i stedet for null** - Returner tomme collections (```Collections.emptyList()```, ```Collections.emptyMap()```) i stedet for null, når en metode skal returnere en samling. 

8. **Builder-mønsteret** - Brug builder-mønsteret med obligatoriske felter for at sikre, at objekter altid oprettes i en gyldig tilstand uden null-værdier. 

9. **Undgå primitive wrapper-klasser** - Brug primitive typer (```int```, ```boolean```) i stedet for deres wrapper-klasser (```Integer```, ```Boolean```) hvor det er muligt, da primitive typer ikke kan være null. 

10. **Dependency Injection** - Brug DI-frameworks som Spring til at sikre, at afhængigheder altid er tilgængelige og ikke null.


