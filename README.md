chaos-overlay
=============

Repoman Status: [![Build Status](https://travis-ci.org/chaoskagami/chaos-overlay.svg?branch=master)](https://travis-ci.org/chaoskagami/chaos-overlay)

BIG FAT NOTICE - I'm no longer actively a gentoo user. They've been making stupid as shit decisions with the way they're going, and everything is subject to systemd/gnome-creep. I'm done. Seriously. That said bug reports are welcome if one of the 9999s aren't building, I'll make a stage3 chroot and attempt to fix build failures. Also, all the prompt update messages below are invalid now. I make an effort to partially satisfy repoman, too.

IMPORTANT NOTES:
 - Multi-slot wine has been removed. Use wine-overlay instead. They actively maintain it and are semi-official. Good stuff. Mine? Crappy unmaintained hack. You can still revert the removal if you want, but there's better alternativives.
 - libgdiplus and mono ebuild were removed. Use mono-overlay - again, semi-official.

Important things within this overlay:
 - Gentoo provides the latest stable OpenMW. There's a 9999 here if you're into that.
 - Truecrypt is dead. Fetch restrictions are pointless, because the website has been taken over by an unknown entity, and the 'newest' version hosted there as well as previous versions cannot be trusted to be untampered with. I fetch truecrypt from a team which was auditing truecrypt upon it's death; they keep the tarballs well organized, and they also are trustworthy. You're still better off with dm-crypt/ecryptfs/veracrypt.
 - QCMA and vitamtp-fork. Wanna sync your PS Vita? Use this. As far as I know, qcma requires the fork. An ebuild exists for vitamtp, but not qcma or the fork. Now there's actually a point to having this aside from linux support. ;)
 - Minecraft & deps - forked from java overlay. Mojang pushes updates to core libs quickly and they're not up to date.
 - Hakuneko - Downloads manga. I love manga. Need I say more?

More things:
 - Most frequently updated things are 9999. Or live ebuilds, if you prefer the term.
 - Don't add my repo if you favor stability. You've been warned. I try to keep conflicts to a minimum but you should probably set the priority down low on the list.
