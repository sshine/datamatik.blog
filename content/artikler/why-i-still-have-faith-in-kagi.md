+++
date = '2025-07-11T12:00:00Z'
draft = true
title = 'Why I still have faith in Kagi'
+++

## The Criticism

This article aims to represent [Kagi](https://kagi.com/) from the perspective of a satisfied user since January 2023.

It is a reaction to the article at [d-shoot.net/kagi.html](https://d-shoot.net/kagi.html) from 2024-04-02 (updated
2024-10-22) which raises several concerns about Kagi. I'll quickly summarize the criticism as I read it, before I
address that and counter-argue. The latest update is 9 months old, and some things have happened since. I will try
to be reasonable when I use arguments that the article could not have addressed.

In short, here's why Kagi sucks:

### Privacy concerns

- Founder dismissive of privacy concerns
- Claims "less than 100 people" need full anonymity
- Casual/optimistic approach to data collection and GDPR compliance

### Excessive AI focus ("Kagi loves AI bullshit")

- Founded originally as an AI company, not a search company
- Developing multiple AI tools like FastGPT, Universal Summarizer, The Assistant
- Kagi's AI-generated "Instant Answers" (FastGPT) in search results often get things wrong
- "They just don't want to admit to being an AI company anymore."

### Financial mismanagement

- Spent 1/3 of their funding round on creating a t-shirt printing business
- Not consistently profitable *[this is old news by now]*
- Neglected to pay sales tax for two years
- Finances are not transparent

### Leadership issues

- "My way or the highway" leadership style
- Unwilling to seriously engage with criticism
- Believes AI can remove bias from news and reviews
- Personally contacted critics after negative blog posts

The author concludes that Kagi is spreading itself too thin across niche products, the search engine isn't significantly
better than alternatives, and the company's approach makes it untrustworthy.

## Trustworthiness

I should start by answering simply:

I still have faith in Kagi because

- I like paying for my search, and I really don't like ads
- I don't have a fundamental problem with Kagi being an AI company
- I'm a satisfied customer (with a lot of feedback that gets listened to fast)
- I like Vlad; given a handful of interactions and his public persona, I don't think he's problematic
- I don't believe they're financially irresponsible or about to go bankrupt

To be completely fair, I also think

- their approach to privacy is a little optimistic, but it isn't terrible for the right risk profile
- they focus too much on web-based chatbots and not enough on api and agents (like Claude Code)
- they do seem to be spreading thin by engaging with so many projects (unsure if it's actually bad)
- a paid search engine is a very particular niche very few people think they need

If you think AI is bullshit, or that Vlad is a cowboy, or that their bar for privacy is too low, or that one of the
ad-based search engines like DuckDuckGo, Startpage or Brave Search fit your needs, Kagi is probably not for you.

Okay, that's it.

The rest of this article is just fighting about details.

## Is Kagi a privacy company?

Well, they're a search and AI company, so no.

Kagi doesn't sell privacy, like [Tor Project][tor-project] or [Mullvad][mullvad] does.

[tor-project]: https://www.torproject.org/
[mullvad]: https://mullvad.net/en

Here's my super serious privacy rating of Kagi: 3.5 / 5.0 ⭐

It's easy for a small company to claim to take privacy serious.

It's hard for any American-based company to do so.

Here's what counts in favor of Kagi's commitment to privacy:

1. 1.0 ⭐: Kagi introduced [Privacy Pass][kagi-privacy-pass] in [Feb 2025][kagi-privacy-release] which decouples your
   payment identity with your browser sessions by following the [Privacy Pass Protoocl][ppp]. That means you can
   authenticate with Kagi without revealing who paid for your session. Kagi has committed to [explain how Privacy
   Pass works][kagi-pp-how], makes an effort to [verify the deployment of this software][kagi-pp-verify], and have
   open-sourced both [privacypass-lib][pp-lib] and [privacypass-extension][pp-ext].

   You might argue that offering a service like this is fundamentally not trustless. But I'm giving it a subjective full
   1.0 ⭐: If you're a celebrity, and you don't want random service companies snooping to report to tabloids, Kagi
   delivers. If I were hiding from state actors, I would not be using Kagi.

[kagi-privacy-pass]: https://help.kagi.com/kagi/privacy/privacy-pass.html
[kagi-privacy-release]: https://blog.kagi.com/kagi-privacy-pass
[ppp]: https://privacypass.github.io/
[kagi-pp-how]: https://help.kagi.com/kagi/privacy/how-does-privacy-pass-work.html
[kagi-pp-verify]: https://help.kagi.com/kagi/privacy/how-does-privacy-pass-work.html#verifiability-of-kagi-s-deployment
[pp-lib]: https://github.com/kagisearch/privacypass-lib
[pp-ext]: https://github.com/kagisearch/privacypass-extension

1. 0.5 ⭐: Kagi signals that they take privacy seriously. They [passed an audit][kagi-audit] in 2022, which [one
   Reddit user pointed out][reddit-comment], "*I don't get your enthusiasm for this network tool based audit. For
   comparison, you should check out source code based reports from well known firms*". Put cynically, Kagi paid
   for a bit of network probing three years ago, big deal!

   To get real points for auditing, Kagi should consider at least periodic source-code audits.

[kagi-audit]: https://blog.kagi.com/security-audit
[reddit-comment]: https://www.reddit.com/r/PrivacyGuides/comments/x1753c/comment/imcyjcy/

1. 0.5 ⭐: Kagi has a [warrant canary][warrant-canary]. The [Stored Communications Act (SCA)][sca] authorizes the
   government to obtain internet communications and simultaneously seek gag orders preventing disclosure. [Kagi's
   warrant canary][kagi-canary] is very direct: "Kagi has received 0 gag orders." How does Kagi intend to update this
   number to 1 while gagged? There are strategies to overcoming gag orders by indirect communication:

   Proactive Disclosure Strategy: Kagi could just remove their canary. By not saying that they've been gagged 0 times,
   they would intentionally be hinting that they have been gagged at least once. 

   Dead Man's Switches: Instead of actively removing information to trigger the canary signal, another approach is
   the absence of action to trigger the canary. For example, the canary could live on a website with a TLS certificate
   that is renewed every day. If the certificate fails to renew, that is the signal.

   Kagi has not exercised their canary, and we don't know how well it works.

1. 1.0 ⭐: Bitcoin payment via OpenNode. I haven't assessed how well this works. I recall that Kagi once didn't have
   Bitcoin payments, and for a period of time didn't prioritise it because not enough customers were interested. Of
   Kagi's now 50.000+ customers, I doubt many use this feature. So it is a commitment to privacy to enable anonymous
   payment when almost nobody wants it.

[warrant-canary]: https://en.wikipedia.org/wiki/Warrant_canary
[sca]: https://yjolt.org/prior-restraints-and-digital-surveillance-constitutionality-gag-orders-issued-under-stored#:~:text=The%20SCA,preventing%20the
[kagi-canary]: https://kagi.com/privacy#warrant-canary

Perhaps anecdotally: When setting their AI assistant data retention policy, the dropdown allows for "24 hours" or
"always": If you want to keep conversations around, they stay forever. Surely this could be more privacy-aware, e.g.
by using local storage or encrypt it in the database. Kagi sacrifices some privacy for convenience.

Kagi does address the privacy of their customers in several ways.

But they also don't provide trustless privacy tools for political activists.

## Does Kagi love AI bullshit?

Yes!

I'm not going to argue much here.

AI divides people in so many ways.

This is probably the strongest reason why Kagi may not be for you: Kagi doesn't try to make it super convenient to
disable their AI features. For example, Kagi's AI assistant ships with every single subscription, and the search-result
summarizer FastGPT is triggered on queries that end with "?". You can disable a lot, but you can't "not pay for it".

If you think AI is bullshit, Kagi is probably not for you.

If you're indifferent to AI, Kagi still provides high-quality search.

I upgraded to Kagi Ultimate ($25/mo) when their AI assistant was only included in this tier.

When their AI assistant recently became available on all tiers, I stuck to Kagi Ultimate because the lower tiers doesn't
include premium models like Claude Sonnet.

Now that I've tried Claude Code, I have to reconsider if having two AI subscriptions is too much: I like that I have
many models to choose from, but Kagi's web interface is somewhat limiting; partly, I can't properly search or categorise
AI conversations. Perhaps I can live without Kagi's assistant for hard coding questions until Kagi gets an agentic CLI.

### Kagi sucks because they made a t-shirt company!

I really don't get this criticism.

If you were rooting for Kagi, you could prior to Kagi reaching break-even say: spending a third of your first money on
t-shirt printing is foolish, because it's risky. You could also say it's bold, because t-shirts worn by geeks is a very
solid advertisement channel. It must without a doubt have been brand building and organic advertisement that was at the
heart of this decision.

Kagi has reached break-even, and they own a t-shirt company. Who cares?

I care that Kagi succeeds financially because

- I hope I can continue to rely on them
- companies like Kagi deserve to exist
- maybe one day I can join their mission

### Kagi didn't pay sales tax for two years!

I'm going to use the opportunity here to address what I'll call "shit smearing":

Taking someone's shit, smearing it all over, and claim they're shitty.

The intent of pointing out that Kagi didn't pay sales tax for two years is to paint them as either dishonest or financially
incompetent. While Vlad [responded to this in his emails][vlad-emails]:

[vlad-emails]: https://d-shoot.net/files/kagiemails.txt

> Implementing sales tax is an extraordinary hard task. it is taking us more than 6 months with resources we have now.
> The reason we did not do it initially is
>
> a) you do not need to collect sales tax until a certain threshold of users (for example 1000 users in certain US states etc)
> b) I did not know if Kagi will ever cross these thresholds.
>
> Two years ago when we launched Kagi nobody thought about paying for a search engine. I had no idea whether this will
> take off or not and it made sense not to invest in sales tax complience at the time, but worry about it when (if) we
> cross the thresholds.

Somehow that failed to get into the update.

## Leadership issues?

It shouldn't be necessary to like the makers of a company at a personal level to like their service.

But I understand very well how that stuff matters. I also can't enjoy Bill Cosby or Sean Connery in spite of their talents.

To label [Vlad Prelovac][vlad] as a baddie, here's some controversial stuff that might divide the waters:

- Vlad is bullish on AI
- Vlad doesn't go all-in on trustless privacy
- Vlad dismisses the need for any GDPR extraction mechanism on Kagi
- Kagi buys search results from both [Yandex][kagi-yandex] and [Brave Search][kagi-brave]

[vlad]: https://vladimir.prelovac.com/
[kagi-yandex]: https://www.reddit.com/r/ukraine/comments/1gvcqua/psa_the_kagi_search_engine_directly_funds_yandex/
[kagi-brave]: https://kagifeedback.org/d/2808-reconsider-your-partnership-with-brave

I should say, however, that I like Vlad. In spite of how he dismisses privacy and GDPR concerns.

I'm happy that he risked so much of his own money and that he is fuelled by principles that align just a smidgeon with mine.

I get to search the internet without providing my every twitch as analytical data for advertisers who want to shit on me.

And yes, I'd rather have that the people who surveil me are less competent at profiting on it (Startpage and DDG vs. Google).

But I'd much rather pay the equivalent of what advertisers get paid for my data, and keep the data. It seems that [my
data is worth ~$700 per year][data-700]. Compared to $120 for a year of Kagi Pro. I know, adblockers kind of solve this
in a practical way. And I've been a happy adblock user for years and years. But I can afford to use a tool that respects me.

[data-700]: https://proton.me/blog/what-is-your-data-worth

I don't know if liking Vlad should be weighted so much when deciding if Kagi is the right search engine for you.

I understand if it matters.
