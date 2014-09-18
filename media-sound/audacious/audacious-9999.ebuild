# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils git-r3


MY_P="${P/_/-}"
S="${WORKDIR}/${MY_P}"
DESCRIPTION="Audacious Player - Your music, your way, no exceptions (live ebuild)"
HOMEPAGE="http://audacious-media-player.org/"
EGIT_REPO_URI="git://github.com/audacious-media-player/audacious.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""

IUSE="chardet nls +gtk gtk3 qt"

RDEPEND=">=dev-libs/dbus-glib-0.60
	>=dev-libs/glib-2.28
	dev-libs/libxml2
	>=x11-libs/cairo-1.2.6
	>=x11-libs/pango-1.8.0
	gtk? ( x11-libs/gtk+:2 )
	qt? ( 	dev-qt/qtgui
		dev-qt/qtcore )"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	chardet? ( >=app-i18n/libguess-1.2 )
	nls? ( dev-util/intltool )"

PDEPEND="~media-plugins/audacious-plugins-3.5.1"

src_configure() {
	# D-Bus is a mandatory dependency, remote control,
	# session management and some plugins depend on this.
	# Building without D-Bus is *unsupported* and a USE-flag
	# will not be added due to the bug reports that will result.
	# Bugs #197894, #199069, #207330, #208606
	econf \
		--enable-dbus \
		$(use_enable chardet) \
		$(use_enable nls)
		$(use_enable qt)
}

src_install() {
	default
	dodoc AUTHORS

	# Gentoo_ice skin installation; bug #109772
	insinto /usr/share/audacious/Skins/gentoo_ice
	doins "${WORKDIR}"/gentoo_ice/*
	docinto gentoo_ice
	dodoc "${WORKDIR}"/README
}
