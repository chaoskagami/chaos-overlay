# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils gnome2-utils cmake-utils games git-r3

DESCRIPTION="An open source reimplementation of TES III: Morrowind"
HOMEPAGE="http://openmw.org/"
EGIT_REPO_URI="git://github.com/OpenMW/openmw"

LICENSE="GPL-3 MIT BitstreamVera OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="devtools +ffmpeg +launcher test"

# XXX static build
# Add below when OGRE becomes deprecated.
#	dev-games/openscenegraph
# Also delete OGRE from RDEPEND
RDEPEND=">=dev-games/mygui-3.2.0
	>=dev-games/ogre-1.9.0[cg,freeimage,ois,opengl,zip]
	dev-games/ois
	>=dev-libs/boost-1.46.0
	dev-libs/tinyxml
	>=dev-qt/qtcore-4.7.0:4
	>=dev-qt/qtgui-4.7.0:4
	media-libs/freetype:2
	media-libs/libsdl2
	media-libs/openal
	>=sci-physics/bullet-2.80
	devtools? ( dev-qt/qtxmlpatterns:4 )
	ffmpeg? ( virtual/ffmpeg )
	launcher? ( app-arch/unshield )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	test? ( dev-cpp/gmock
		dev-cpp/gtest )"

src_prepare() {
	ewarn "Please note: openmw's git is in constant flux, and as such"
	ewarn "this may fail during compile. If so, sit around and wait"
	ewarn "for a commit to fix it, or install a stable version instead."
	ewarn "I guarantee nothing, okay? - @chaoskagami"

	epatch "${FILESDIR}"/${PN}-0.15.0-cfg.patch \
		"${FILESDIR}"/${PN}-0.26.0-build.patch

	sed \
		-e "s#globalPath(\"/etc/\")#globalPath(\"${GAMES_SYSCONFDIR}\")#" \
		-i components/files/linuxpath.cpp || die "fixing global confdir failed!"
}

src_configure() {
	local mycmakeargs=(
		-DBINDIR="${GAMES_BINDIR}"
		$(cmake-utils_use_build devtools BSATOOL)
		$(cmake-utils_use_build devtools ESMTOOL)
		$(cmake-utils_use_build launcher LAUNCHER)
		-DMWINIIMPORTER=ON
		$(cmake-utils_use_build devtools OPENCS)
		$(cmake-utils_use_build test UNITTESTS)
		-DDATADIR="${GAMES_DATADIR}"/${PN}
		-DICONDIR=/usr/share/icons/hicolor/256x256/apps
		-DMORROWIND_DATA_FILES="${GAMES_DATADIR}"/morrowind-data
		-DMORROWIND_RESOURCE_FILES="${GAMES_DATADIR}"/${PN}/resources
		-DSYSCONFDIR="${GAMES_SYSCONFDIR}"/${PN}
		-DUSE_AUDIERE=OFF
		-D__STDC_CONSTANT_MACROS=1
		-DUSE_SYSTEM_TINYXML=ON
		$(cmake-utils_use_use ffmpeg FFMPEG)
	)

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
	prepgamesdirs
}

src_test() {
	"${CMAKE_BUILD_DIR}"/${PN}_test_suite || die
}

pkg_preinst() {
	ewarn "OpenMW is moving away from Ogre3D 1.0 in the future to utilize OpenSceneGraph."
	ewarn "See here: https://openmw.org/2015/announcing-switch-openscenegraph/"
	ewarn "When the Ogre3D backend is deprecated, the 9999 ebuild will be updated to reflect this."
	games_pkg_preinst
	gnome2_icon_savelist
}

pkg_postinst() {
	games_pkg_postinst
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
