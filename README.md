chaos-overlay
=============

Repoman Status: [![Build Status](https://travis-ci.org/chaoskagami/chaos-overlay.svg?branch=master)](https://travis-ci.org/chaoskagami/chaos-overlay)

Important notes about this repo:
 - The wine ebuilds in this repo are SLOT-based and can have multiple versions coexist. However, my ebuilds are incompatible with upstream for this reason and thus virtual/wine, app-emulation/wine, app-admin/eselect-wine are masked by default. Unmask if you wish to use them.
 - The openmw ebuilds here are A-OK with libav instead of ffmpeg. Official ebuilds don't like it.
