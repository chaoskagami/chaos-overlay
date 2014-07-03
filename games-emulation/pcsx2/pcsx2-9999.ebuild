# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: games-emulation/pcsx2-9999.ebuild,v 1.1 2014/06/20 08:30:00 frostwork Exp $

EAPI=5

WX_GTK_VER="2.8"

inherit games cmake-utils git-2 wxwidgets

DESCRIPTION="A PlayStation 2 emulator"
HOMEPAGE="http://www.pcsx2.net"
EGIT_REPO_URI="https://github.com/PCSX2/pcsx2.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

RDEPEND="
		app-arch/bzip2[abi_x86_32]
		dev-libs/libaio[abi_x86_32]
		sys-libs/zlib[abi_x86_32]
		media-libs/alsa-lib[abi_x86_32]
		media-libs/glew[abi_x86_32]
		media-libs/libsdl[abi_x86_32]
		media-libs/portaudio[abi_x86_32]
		virtual/jpeg:62[abi_x86_32]
		virtual/opengl[abi_x86_32]
		x11-libs/gtk+:2[abi_x86_32]
		x11-libs/libICE[abi_x86_32]
		x11-libs/libX11[abi_x86_32]
		x11-libs/libXext[abi_x86_32]
		x86? ( media-gfx/nvidia-cg-toolkit )
		amd64? ( media-gfx/nvidia-cg-toolkit[multilib]	)
"

DEPEND="${RDEPEND}
	>=dev-cpp/sparsehash-1.5
"

pkg_preinst() {
	ewarn "Before continuing, you need to install 32-bit wxGTK 2.8 if on amd64."
	ewarn "The official repos don't have such a thing; no emul lib, nor USE=abi_x86_32."
	ewarn "If you're on 32-bit and have wxGTK, you're fine. Otherwise, it will fail."
	ewarn "I may make an ebuild for it soon; no guarantees. If I do, this warning"
	ewarn "will be replaced with a default-on use flag dependency."
	ewarn "Waiting 5 seconds before emerging...hit Ctrl+c to cancel."
	wait 5 
}

src_prepare() {
	sed -i -e "s:CDVDnull TRUE:CDVDnull FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:CDVDiso TRUE:CDVDiso FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:CDVDlinuz TRUE:CDVDlinuz FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:dev9null TRUE:dev9null FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:FWnull TRUE:FWnull FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:GSnull TRUE:GSnull FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:GSdx TRUE:GSdx FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:zerogs TRUE:zerogs FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:zzogl TRUE:zzogl FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:PadNull TRUE:PadNull FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:onepad TRUE:onepad FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:zeropad TRUE:zeropad FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:SPU2null TRUE:SPU2null FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:spu2-x TRUE:spu2-x FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:zerospu2 TRUE:zerospu2 FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
	sed -i -e "s:USBnull TRUE:USBnull FALSE:g" -i cmake/SelectPcsx2Plugins.cmake
}

src_configure() {
	multilib_toolchain_setup x86
	
	wxgtk_config=""
	cg_config=""
	if use amd64; then
		# tell cmake to use 32 bit library
		wxgtk_config="-DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-2.8-x86"
		cg_config="-DCG_LIBRARY=/opt/nvidia-cg-toolkit/lib32/libCg.so
					-DCG_GL_LIBRARY=/opt/nvidia-cg-toolkit/lib32/libCgGL.so"
	fi

	mycmakeargs="
		-DCMAKE_BUILD_TYPE=Release
		-DPACKAGE_MODE=1
		-DPLUGIN_DIR=$(games_get_libdir)/${PN}
		-DPLUGIN_DIR_COMPILATION=$(games_get_libdir)/${PN}
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_LIBRARY_PATH=$(games_get_libdir)/${PN}
		${wxgtk_config}
		${cg_config}
		"
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install DESTDIR=${D}

	# move binary files to correct directory
	mkdir -p ${D}/usr/games/bin
	mv ${D}/usr/bin/* ${D}/usr/games/bin || die

	prepgamesdirs
}
