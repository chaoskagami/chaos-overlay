chaos-overlay
=============

Repoman Status: [![Build Status](https://travis-ci.org/chaoskagami/chaos-overlay.svg?branch=master)](https://travis-ci.org/chaoskagami/chaos-overlay)

BIG FAT NOTICE - I'm no longer actively a gentoo user. They've been making stupid as shit decisions with the way they're going, and everything is subject to systemd/gnome-creep. I'm done. Seriously. That said bug reports are welcome if one of the 9999s aren't building, I'll make a stage3 chroot and attempt to fix build failures. Also, all the prompt update messages below are invalid now. I make an effort to partially satisfy repoman, too.

IMPORTANT NOTE ABOUT MULTI-SLOT WINE:
 - Removed. Use wine-overlay instead. They actively maintain it and are semi-official. Good stuff. Mine? Crappy unmaintained hack.
 - libgdiplus and mono ebuild were removed. Use mono-overlay - again, semi-official.

Important things within this overlay:
 - The openmw ebuilds here are A-OK with libav instead of ffmpeg. Official openmw ebuilds don't like it. I also provide a live ebuild (9999). This is now functional, but you still need to unmask it. Additionally, the git now has a hard requirement on ogre >=1.9.0. You will have to unmask that on gentoo - I'm not sure what effect this will have but all future releases will possibly enforce this requirement as well. UPDATE - They switched to OpenSceneGraph. This ebuild needs work.
 - Truecrypt is dead. Fetch restrictions are pointless, because the website has been taken over by an unknown entity, and the 'newest' version hosted there as well as previous versions cannot be trusted to be untampered with. I fetch truecrypt from a team which was auditing truecrypt upon it's death; they keep the tarballs well organized, and they also are trustworthy. You're still better off with dm-crypt/ecryptfs/some fork though.
 - QCMA and vitamtp-fork. Wanna sync your PS Vita? Use this. As far as I know, qcma requires the fork. An ebuild exists for vitamtp, but not qcma or the fork. Ebuild since this is pretty much the cream of the crop for modifying the vita (or attempting to, since there's not too much to do and most native attempts are private)
 - Minecraft & deps - forked from java overlay. Mojang pushes updates to core libs quickly and they're not up to date.
 - Hakuneko - Downloads manga. I love manga. Need I say more?

More things:
 - Most frequently updated things are 9999. Or live ebuilds, if you prefer the term. smart-live-rebuild may be a good idea.
 - Don't add my repo if you favor stability. You've been warned.
