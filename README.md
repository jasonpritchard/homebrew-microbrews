homebrew-microbrews
===================

Homebrew formulae for embedded tools, etc.

To get started with any of these, first tap:

    brew tap jasonpritchard/microbrews

1. [serproxy](#serproxy)
2. [cc-tool](#cc-tool)
3. [sigrok-firmware-fx2lafw](#sigrok-firmware-fx2lafw)
4. [vsprog](#vsprog)

---

## serproxy

Tool for exposing serial ports over a socket.

To install:

    brew install serproxy

---

## cc-tool

cc-tool provides CC-Debugger support for Linux and Mac. More info can be found at [http://sourceforge.net/projects/cctool/](http://sourceforge.net/projects/cctool/)

To install it, just tap and install:

    brew install cc-tool

---

## sigrok-firmware-fx2lafw

fx2lafw is an open-source firmware for Cypress FX2 chips which makes them usable as simple logic analyzer hardware. More info at [http://sigrok.org/wiki/Fx2lafw](http://sigrok.org/wiki/Fx2lafw)

To install it, just tap and install:

    brew install sigrok-firmware-fx2lafw

Here's how I installed all of the sigrok tools.

    brew install --with-libserialport libsigrokdecode
    brew install --with-libserialport sigrok-cli
    brew install pulseview
    brew install sigrok-firmware-fx2lafw

---

## vsprog

Versaloon programmer is a generic platform for programming various chipsets. See more [here](http://www.versaloon.com)

To install:

    brew install vsprog

