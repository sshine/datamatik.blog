+++
date = '2025-04-10T08:57:09Z'
draft = false
title = 'Corne Split Keyboard Layout'
+++

I min barsel har jeg leget med et Corne v3 split keyboard, som jeg har købt på Taobao.

Det har 46 taster. Til sammenligning har min MacBook Pro med dansk layout 79 taster.

## De knapper man mister vs. de knapper man får

Man fristes til at fokusere på alle de knapper, man mister, frem for alle de knapper man får.

Især får man noget som alle tastaturer burde have: Ekstra knapper til tommelfingrene.

På et almindeligt tastatur har man 1 stor space-knap til deling mellem begge tommelfingre.

På Corne-keyboardet har hver tommelfinger 3 knapper.

Antallet af tommelfinger-knapper varierer en del på forskellige split
keyboards:

- [Lily58](https://www.boardsource.xyz/products/lily58) fra [boardsource.xyz][bs-xyz] har 4
- [Charybdis MK2](https://bastardkb.com/charybdis/) har 3-5 (+ trackball)
- [Kinesis Advantage 360](https://kinesis-ergo.com/keyboards/advantage360/) har 6

[bs-xyz]: https://www.boardsource.xyz/ (amerikansk webshop)


Split keyboards kan blive rigtigt flotte, fordi man kan vælge farve og tema ved
at vælge byggematerialer.

Man kan også selv vælge om man vil betale for at andre samler dem, eller om man
vil bygge et fra et hvilket som helst sted i supply chain'en.

Her er to andre leverandører:

- Corne-inspireret [mini36 Low Profile][controller-works-mini36] fra [Controller Works][controller-works].

[controller-works-mini36]: https://controller.works/products/mini36-low-profile-ergonomic-keyboard
[controller-works]: https://controller.works/

![Corne v3 split keyboard](/img/corne-v3-split-keyboard.jpeg)

## Layered keyboard layout

Jeg synes at 3 knapper på hver hånd er rigeligt: Foruden space og enter, har
jeg 4 modifier-knapper, som ændrer hvad alle de andre knapper gør. Det er det
man kalder et layered keyboard layout.

## Open source hardware og firmware

Corne-tastaturet er 100% open source:

- Hardwarens PCB'er og skematik er tilgængelig på [github.com/foostan/crkbd](https://github.com/foostan/crkbd#corne-keyboard)
- Firmwaren jeg benytter er [QMK](https://qmk.fm/), som virker til Atmel AVR-chips, og ARM-chips som STM32, og nRF.
- Keyboard layout editoren er [VIAL](https://get.vial.today/), som er en cross-platform GUI
- Layoutet er work in progress. Det er det jeg har brugt mest tid på i forbindelse med keyboardet.

