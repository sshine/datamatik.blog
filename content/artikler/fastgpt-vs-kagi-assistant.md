+++
date = '2025-04-17T10:01:38Z'
draft = true
title = 'FastGPT vs. Kagi Assistant'
+++

Indlægget her handler om at sammenligne [Kagi's FastGPT][fastgpt] og [Kagi: The Assistant][kagi-assistant].

[fastgpt]: https://kagi.com/fastgpt
[kagi-assistant]: https://kagi.com/assistant

FastGPT er Kagi's meget hurtige AI-baserede søgemaskine-udvidelse.

Kagi's The Assistant er en AI-agent med søgemaskine-funktionalitet.

Og ja, hvis jeg ikke havde et fuldtidsjob, jeg var glad for, så arbejdede jeg nok for Kagi. ;-)

## Indledning

Jeg abonnerer på en søgemaskine, der hedder [Kagi][kagi]. Den koster $10/md.

[kagi]: https://kagi.com

Det har jeg gjort i to-tre år, og det er tæt på at være mit foretrukne abonnement.

Da deres AI-agent, [The Assistant][kagi-assistant], udkom, var jeg blevet
eksponeret for AI i et halvt års tid fra to vinkler:


1. Igennem undervisning: Til dels benytter mine studerende AI, og man skal som
   underviser forholde sig til hvilken konsekvens det har for undervisningen.
   Jeg havde forsøgt at bruge ChatGPT i undervisningen, for at forstå hvordan
   det virker. Jeg opdagede fx først sent at opgavebesvarelserne til front-end
   web lignede hinanden fordi en tredjedel af mine studerende på 3. semester
   auto-genererede alt deres JavaScript.

2. Igennem freelance: Samtidigt med jeg startede som lærer for et år siden, fik
   jeg også et nyt freelance gig, hvor jeg skulle bruge Nix og NixOS til at sætte
   on-premise bygge- og testmiljø op til at afprøve firmware på hardware. Jeg
   brugte Claude meget til at lære Nix. Nogle gange var det smart nok, men der
   er meget kontekst som går tabt på AI'erne.

På trods af begrænsningerne, var jeg positivt indstillet efter at have
ignoreret det i et par år.

## Hvad er FastGPT?

Når jeg søger på noget der slutter med et '?' vil Kagi-søgemaskinen lave en
sammenfatning af dens resultater. Selve søgningen tog i nedenstående tilfælde
0,22 sekunder, mens AI-opsummeringen tager cirka 1-2 sekunder længere.

Det er hurtigt!

FastGPT har, efter min mening, de her killer features:

- Hastigheden
- At ethvert svar har kildehenvisninger
- Hvor godt integreret den er i søgemaskinen
- **Kan finde ud af at sige "Det ved jeg ikke"!**
- Er stadig bare en søgning med resultater.

Jeg bruger også FastGPT meget fra mobil og fra [Raycast][raycast] på MacOS
([Raycast FastGPT plugin][raycast-fastgpt]).

Jeg bruger også FastGPT fra min Linux-terminal vha.
[kagi-cli](https://crates.io/crates/kagi-api) som er et terminal-program jeg har lavet.

[raycast]: https://www.raycast.com/
[raycast-fastgpt]: https://www.raycast.com/http.james/kagi-fastgpt

Min brug af FastGPT har snart indhentet min brug af almindelig søgning.

> **Bemærk:** Du kan faktisk prøve FastGPT gratis uden at være logget ind: https://kagi.com/fastgpt

![Hvad er FastGPT? Søgeresultat](/img/kagi-fastgpt-what.png)

### En hurtig bemærkning om "Det ved jeg ikke!"

Stiller man et spørgsmål, der er svært at finde svar på uden at knuse nogle tal fra en database:

> **Q:** What is the average age of women when they have their second child in denmark?
>
> **A**: While the exact average age for women in Denmark having their second child isn't specified, it's reported that second, third, and fourth children are typically born when the mother is between 32 and 35 years old on average `[1]`. The average age of women giving birth to their first child is 30.3 years `[2]`.
>
> References:
> 
> 1. [What is the average age to have a baby Europe?](https://www.studycountry.com/wiki/what-is-the-average-age-to-have-a-baby-europe) `www.studycountry.com`
> 2. [The average Dane - Statistics Denmark](https://www.dst.dk/en/Statistik/laer-om-statistik/gennemsnitsdanskeren) `www.dst.dk`

Fordi dens svar er baseret på søgeresultater, kan den altså nemt svare i hvilken grad de indeholder et svar. Og problemer med kildekritik er tættere på at være de samme, som hvis man selv foretager research og gennemlæsning. Jeg tror ikke at FastGPT er lige så sårbar over for prompt injection, da dens algoritme er lidt simplere end en gennemsnitlig sprogmodel, men det ved jeg faktisk ikke.

## Hvad er Kagi's The Assistant?

Efter et halvt år med gratis ChatGPT og Claude, var jeg klar til at prøve
kræfter med et dyrere værktøj. De +$15/md. Kagi's AI-agent koster når man
allerede har deres søgemaskine, er mindre end de $17-20/md. man ellers betaler
for pro-udgaven af ChatGPT eller Claude, er altså godt givet, når den kan søge
på nettet, og man [frit kan vælge mellem 30+ LLM'er][kagi-llms]:

[kagi-llms]: https://help.kagi.com/kagi/ai/assistant.html#llms-available-in-the-assistant

- Claude 3 Opus (stærk), 3.5 Haiku (hurtig), 3.7 Sonnet med udvidet *thinking*
- OpenAI 4o, 4o Mini, o3 Mini, o4 Mini, 4.1, 4.1 Mini, 4.1 Nano
- Mistral Pixtral eller Large
- Gemini 1.5 Pro, 2.0 Flash, 2.5 Pro Preview
- Llama 3.1, 3.3, 4 Scout, 4 Maverick
- Qwen
- Nova Lite, Pro
- DeepSeek V3, R1, R1 Distill Llama 70B
- Grok 3, 3 Mini

Med mindre du er trendsetter, har du sikkert ikke prøvet mere end et par.

Så man kan også shoppe rundt og prøve forskellige, og finde ud af hvilke der er
gode til hvad.

Kagi's The Assistant hører til "første bølge" af AI-agenter:

Den kan kun søge, og endnu ikke udføre andre handlinger på dine vegne. Det ser
sådan her ud:

![Kagi: The Assistant: Searching with kagi...](/img/kagi-assistant.png)

Så svaret er altså ikke kun baseret på træningsdata.

Før jeg sammenligner kvaliteten af svarene, vil jeg lige fremhæve lidt
statistik fra bunden af svaret:

![Kagi: The Assistant: Statistikker](/img/kagi-stats.png)

Svaret tog altså 38 sekunder, sammenlignet med FastGPT's 1-2 sekunder.

Eftersom The Assistant også benytter søgning, angiver den naturligvis også kilder.

research-## Benchmark 1: Simple research-spørgsmål

Spørger jeg FastGPT "In what way is Kagi's The Assistant an improvement over ChatGPT, Claude and similar LLMs?"

> Kagi's The Assistant improves upon LLMs like ChatGPT and Claude in several ways:
>
> - Access to Multiple LLMs: Kagi's Assistant allows users to access various LLMs, including ChatGPT and Claude, providing flexibility in choosing the best model for a specific task [1][f-1].
> - Web Access: Kagi's Assistant has web access, allowing it to provide more up-to-date and relevant information compared to models without internet access [2][f-2].
> - Search Integration: Kagi's Assistant can be combined with Kagi Search to enhance creative, research, and programming tasks [3][f-3]. The Assistant is able to do searches, which can be constrained to lenses [4][f-4].
> - Coding Assistance: The Assistant comes with a built-in Code Custom Assistant optimized for programming tasks, utilizing Claude 3.5 Sonnet and offering web access [2][f-2].
> - Model Preference: Some users prefer Claude over ChatGPT, finding that Claude understands intentions better [5][f-5].
> - Advanced AI Coding Assistant: Kagi is an advanced AI coding assistant developed to enhance the efficiency and quality of software development [6][f-6].
>
> References
> 1. [The Assistant vs ChatGPT+? : r/SearchKagi - Reddit][f-1] `www.reddit.com`
> 2. [The Assistant by Kagi | Kagi's Docs][f-2] `kagi.com`
> 3. [The Assistant by Kagi | Kagi's Docs][f-3] `help.kagi.com`
> 4. [Kagi Assistant | Hacker News][f-4] `news.ycombinator.com`
> 5. [I much prefer Claude over ChatGPT, based on my experience using ...][f-5] `news.ycombinator.com`
> 6. [Compare ChatGPT vs. Kagi in 2025 - Slashdot][f-6] `slashdot.org`

[f-1]: https://www.reddit.com/r/SearchKagi/comments/1gotuzy/the_assistant_vs_chatgpt/
[f-2]: https://kagi.com/assistant
[f-3]: https://help.kagi.com/kagi/ai/assistant.html
[f-4]: https://news.ycombinator.com/item?id=41448985
[f-5]: https://news.ycombinator.com/item?id=42217571
[f-6]: https://slashdot.org/software/comparison/ChatGPT-vs-Kagi/

Spørger jeg The Assistant om det samme:

> # Kagi's The Assistant vs. ChatGPT and Claude: Key Advantages
> 
> Kagi's The Assistant offers several notable improvements over standalone LLMs like ChatGPT and Claude:
> 
> ## Access to Multiple Top-Tier Models
> 
> - **Diverse model selection** from leading providers including OpenAI, Anthropic, Meta, Google, Mistral, Amazon, Alibaba, and DeepSeek [^1][^2]
> - **Ability to switch models mid-conversation** without starting a new thread [^3][^1]
> - **Access to the latest models** as they become available, including Claude 3.7 Sonnet, GPT-4o, Llama 4, and more [^4][^1]
> 
> ## Enhanced Search Integration
> 
> - **Web access powered by Kagi Search** for up-to-date, high-quality information [^1][^2]
> - **Ability to toggle web access on/off** during conversations [^3][^1]
> - **Application of Kagi's search lenses and personalized results** to filter information based on your preferences [^3][^1]
> 
> ## Privacy-Focused Approach
> 
> - **Your data is never used to train AI models** (neither by Kagi nor by the LLM providers) [^5][^3]
> - **No account information is shared** with LLM providers [^3][^1]
> - **Threads expire by default** after 24 hours (customizable in settings) [^3][^1]
> 
> ## Advanced Conversation Features
> 
> - **Mid-thread editing and branching** to refine prompts without starting over [^6]
> - **Multiple conversation threads** in a single window [^3][^1]
> - **File upload support** for various formats including documents, images, and audio [^3][^1]
> - **Custom assistants** with specialized instructions for specific tasks [^7][^1]
> 
> ## Unique Features
> 
> - **Code Custom Assistant** optimized specifically for programming tasks [^1]
> - **Voice input capability** for hands-free interaction [^3][^1]
> - **Thread management** including saving, sharing, and organizing conversations [^3][^1]
> 
> ## What's Missing
> 
> - **No image generation capability**, which is available in ChatGPT Plus [^8][^9]
> - **Relies more on web search results** than internal knowledge in some cases [^10]
> 
> ## Pricing and Availability
> 
> The Assistant is available as part of Kagi's Ultimate Plan ($25/month), which also includes full access to Kagi Search [^11][^6]. Unlike standalone ChatGPT Plus ($20/month) or Claude Pro subscriptions, The Assistant provides access to **multiple premium AI models under a single subscription** [^6].
> 
> The combination of multiple top-tier models, powerful search integration, privacy-focused design, and advanced conversation features makes Kagi's The Assistant a comprehensive alternative to using individual AI assistants separately.

Assistent-svaret er meget mere detaljeret, men ud over at uddybe hvilke
features The Assistant har, synes jeg FastGPT's overblik er nærmest lige så
godt. Det er i hvert fald ikke 20 gange dårligere, og den var 20 gange
hurtigere til at svare.

Og man skal ikke huske at bede FastGPT om at være kortfattet. 

## Benchmark 2: Simple tekniske spørgsmål

Spørger jeg FastGPT:

> **Q:** How do I write a literal backtick in inline markdown code?
>
> **A:** To write a literal backtick in inline markdown code, use multiple backticks as the opening and closing delimiters `[1][2]`. For example, to display a single backtick, use ``` `[3]`.

Spørger jeg The Assistant:

> **Q:** How do I write a literal backtick in inline markdown code?
> 
> **A:** To write a literal backtick (```) in inline markdown code, you need to use double backticks to enclose your code.
>
> For example, if you want to display a single backtick character, you would write:
> ```` `` ``` ````
>
> If you need to include text with a backtick, you would write:
> ```` ```code``` ````
>
> This will display as: `code`
>
> The key is using double backticks as delimiters when you need to display a single backtick within your inline code.

Her er svarene også cirka lige gode, og The Assistant undlod at søge, så der er ingen referencer.

Når svarene er cirka lige gode, foretrækker jeg at bruge FastGPT, da det går hurtigere.

[^1]: [The Assistant by Kagi | Kagi's Docs](https://kagi.com/assistant#:~:text=The%20Assistant,creative%2C%20research%2C)
[^2]: [Kagi Assistant | Hacker News](https://news.ycombinator.com/item?id=41448985#:~:text=The%20new,is%20excellent.)
[^3]: [The Assistant by Kagi | Kagi's Docs](https://help.kagi.com/kagi/ai/assistant.html#:~:text=Full%20document,more%20information.)
[^4]: [The Assistant by Kagi | Kagi's Docs](https://kagi.com/assistant#:~:text=Full%20document,more%20information.)
[^5]: [Kagi Search Changelog](https://kagi.com/changelog#:~:text=Kagi%20Assistant,%235702%20%40mackid1993.)
[^6]: [LLMs & Privacy | Kagi's Docs](https://help.kagi.com/kagi/ai/llms-privacy.html#:~:text=When%20you,their%20privacy)
[^7]: [Announcing The Assistant | Kagi Blog](https://blog.kagi.com/announcing-assistant#:~:text=Full%20document,more%20information.)
[^8]: [The Assistant by Kagi | Kagi's Docs](https://help.kagi.com/kagi/ai/assistant.html#:~:text=The%20Assistant,turned%20off.)
[^9]: [Custom Assistants | Kagi's Docs](https://help.kagi.com/kagi/ai/custom-assistants.html#:~:text=The%20Assistant%27s,Creating%20a)
[^10]: [The Assistant by Kagi | Kagi's Docs](https://kagi.com/assistant#:~:text=The%20Assistant,For%20more)
[^11]: [The Assistant vs ChatGPT+? : r/SearchKagi - Reddit](https://www.reddit.com/r/SearchKagi/comments/1gotuzy/the_assistant_vs_chatgpt/#:~:text=With%20the,image%20generation.)
[^12]: [Assistant Model Versions : r/SearchKagi - Reddit](https://www.reddit.com/r/SearchKagi/comments/1jlxmfb/assistant_model_versions/#:~:text=Kagi%20only,image%20generation.)
[^13]: [Asking AI on Kagi-ChatGPT (for example) is different from asking ...](https://kagifeedback.org/d/6136-asking-ai-on-kagi-chatgpt-for-example-is-different-from-asking-chatgpt-directly-why-is-this#:~:text=I%27ve%20found,internal%20knowledge.)
[^14]: [Ultimate Plan | Kagi's Docs](https://help.kagi.com/kagi/plans/ultimate-plan.html#:~:text=Ultimate%20Plan,think%20of%21)

