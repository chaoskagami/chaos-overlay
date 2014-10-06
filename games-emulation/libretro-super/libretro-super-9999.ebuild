# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-emulation/dolphin/dolphin-9999.ebuild,v 1.13 2014/06/30 05:39:48 twitch153 Exp $

EAPI=5

inherit eutils games git-2

EGIT_REPO_URI="https://github.com/libretro/libretro-super"
KEYWORDS=""

DESCRIPTION="All-in-one emulator frontend"
HOMEPAGE="https://www.libretro.com/"

LICENSE="GPL-3"
SLOT="0"
IUSE="+alsa sdl openal +opengl freetype nvidia-cg-toolkit libxml2 ffmpeg"

RDEPEND="x11-libs/libXext
	x11-libs/libXrandr
	nvidia-cg-toolkit? ( media-gfx/nvidia-cg-toolkit )
	freetype? ( media-libs/freetype )
	libxml2? ( dev-libs/libxml2 )
	sdl? ( media-libs/libsdl )
	alsa? ( media-libs/alsa-lib )
	openal? ( media-libs/openal )
	opengl? ( virtual/opengl )
	ffmpeg? ( virtual/ffmpeg )
	"
DEPEND="${RDEPEND}
	virtual/ffmpeg"

src_configure() {
	bash libretro-fetch.sh
}

src_compile() {
	bash libretro-build.sh
}

src_install() {
	bash libretro-install.sh "${D}"/"${GAMES_PREFIX}" || die "emake failed"
	prepgamesdirs
}
