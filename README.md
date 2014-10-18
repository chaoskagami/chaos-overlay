chaos-overlay
=============

Repoman Status: [![Build Status](https://travis-ci.org/chaoskagami/chaos-overlay.svg?branch=master)](https://travis-ci.org/chaoskagami/chaos-overlay)

Important things within this overlay:
 - The wine ebuilds in this repo are SLOT-based and can have multiple versions coexist inside of /usr/lib/wine. However, my ebuilds are incompatible with upstream for this reason and thus virtual/wine, app-emulation/wine, app-admin/eselect-wine are masked by default. Unmask if you wish to use them. Additionally - I am tracking unstable wine directly, so you will see the latest unstable pop up here rather quickly (five days max.)
 - The openmw ebuilds here are A-OK with libav instead of ffmpeg. Official openmw ebuilds don't like it. I also provide a live ebuild (9999). This is now functional, but you still need to unmask it. Additionally, the git now has a hard requirement on ogre >=1.9.0. You will have to unmask that on gentoo - I'm not sure what effect this will have but all future releases will possibly enforce this requirement as well.
 - Truecrypt is dead. Fetch restrictions are pointless, because the website has been taken over by an unknown entity, and the 'newest' version hosted there as well as previous versions cannot be trusted to be untampered with. I fetch truecrypt from a team which was auditing truecrypt upon it's death; they keep the tarballs well organized, and they also are trustworthy.
 - Desmume version bump. There was one patch for fixing compilation needed. Why gentoo does not ship this version is beyond me.
 - libgdiplus and mono. GENTOO IS TWO YEARS, FIVE VERSIONS BEHIND ON BOTH. That said, I make no guarantees to any compatibility since they've made no move to update anything.
 - QCMA and vitamtp-fork. Wanna sync your PS Vita? Use this. As far as I know, qcma requires the fork. An ebuild exists for vitamtp, but not qcma or the fork. Ebuild since this is pretty much the cream of the crop for modifying the vita (or attempting to, since there's not too much to do and most native attempts are private)
 - Minecraft & deps - forked from java overlay. Mojang pushes updates to core libs quickly and they're not up to date.
 - Hakuneko - Downloads manga. I love manga. Need I say more?
