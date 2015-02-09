# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5

inherit mercurial

DESCRIPTION="Reimplementation of Touhou 6 ~ EoSD in python (needs datafiles)"
HOMEPAGE="http://pytouhou.linkmauve.fr/"
EHG_REPO_URI="http://hg.linkmauve.fr/touhou"

PYTHON_COMPAT=(python2_7)
inherit distutils-r1

LICENSE="GPL-3"
SLOT="0"

KEYWORDS=""
IUSE="gtk"
DEPEND="${DEPEND}
	dev-lang/python:2.7
	>=dev-python/cython-0.19
	dev-python/configparser
	media-libs/libepoxy
	media-libs/libsdl2
	media-libs/sdl2-image
	media-libs/sdl2-mixer
	media-libs/sdl2-ttf
	virtual/opengl
	gtk? ( x11-libs/gtk+:3 )"
RDEPEND="${DEPEND}"
