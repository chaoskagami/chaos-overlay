# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-emulation/dolphin/dolphin-9999.ebuild,v 1.13 2014/06/30 05:39:48 twitch153 Exp $

EAPI=5

WX_GTK_VER="3.0"

inherit cmake-utils eutils pax-utils toolchain-funcs versionator wxwidgets games

if [[ ${PV} == 9999* ]]
then
	EGIT_HAS_SUBMODULES=1
	EGIT_REPO_URI="https://github.com/DHrpcs3/rpcs3"
	inherit git-2
	KEYWORDS=""
else
	SRC_URI="https://github.com/DHrpcs3/rpcs3/archive/v${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Very experimental PS3 emulator"
HOMEPAGE="http://www.emunewz.net/forum/forumdisplay.php?fid=162"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=">=media-libs/glew-1.10
	x11-libs/libXext
	x11-libs/libXrandr
	media-libs/openal
	virtual/opengl
	"
DEPEND="${RDEPEND}
	app-arch/zip
	media-libs/freetype
	media-libs/libsoundtouch
	>=sys-devel/gcc-4.6.0
	x11-libs/wxGTK:${WX_GTK_VER}
	"

pkg_pretend() {
	ewarn "As an quick warning, rpcs3 does not currently function on intel integrated graphics, so save yourself the pain and hit Ctrl+C or unmerge it"
}

src_configure() {
	local mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX=${GAMES_PREFIX}"
		"-Dprefix=${GAMES_PREFIX}"
		"-Ddatadir=${GAMES_DATADIR}/${PN}"
		"-Dplugindir=$(games_get_libdir)/${PN}"
	)

	cmake-utils_src_configure
}

src_compile() {
	# Rebuild the custom ffmpeg (yes, it cannot be removed)
	cd ffmpeg || die "Missing ffmpeg dir"

	rm -f config.h

	ARCH="$(uname -m)"

	GENERAL="
		--disable-shared \
		--enable-static"

	MODULES="\
		--disable-avdevice \
		--disable-filters \
		--disable-programs \
		--disable-network \
		--disable-avfilter \
		--disable-postproc \
		--disable-encoders \
		--disable-doc \
		--disable-ffplay \
		--disable-ffprobe \
		--disable-ffserver \
		--disable-ffmpeg"

	VIDEO_DECODERS="\
		--enable-decoder=h264 \
		--enable-decoder=h263 \
		--enable-decoder=h263p \
		--enable-decoder=mpeg2video"

	AUDIO_DECODERS="\
		--enable-decoder=aac \
		--enable-decoder=atrac3 \
		--enable-decoder=atrac3p \
		--enable-decoder=mp3 \
		--enable-decoder=pcm_s16le \
		--enable-decoder=pcm_s8"

	DEMUXERS="\
		--enable-demuxer=h264 \
		--enable-demuxer=mpegps \
		--enable-demuxer=mpegvideo \
		--enable-demuxer=avi \
		--enable-demuxer=mp3 \
		--enable-demuxer=aac \
		--enable-demuxer=oma \
		--enable-demuxer=pcm_s16le \
		--enable-demuxer=pcm_s8 \
		--enable-demuxer=wav"

	VIDEO_ENCODERS="\
		--enable-encoder=huffyuv
		--enable-encoder=ffv1
		--enable-encoder=mjpeg"

	AUDIO_ENCODERS="\
		--enable-encoder=pcm_s16le"

	MUXERS="\
		--enable-muxer=avi"

	PARSERS="\
		--enable-parser=h264 \
		--enable-parser=mpeg4video \
		--enable-parser=mpegvideo \
		--enable-parser=aac \
		--enable-parser=mpegaudio"


	./configure \
		--prefix=./linux/${ARCH} \
		${GENERAL} \
		--extra-cflags="-D__STDC_CONSTANT_MACROS -O3" \
		--enable-zlib \
		--disable-yasm \
		--disable-everything \
		${MODULES} \
		${VIDEO_DECODERS} \
		${AUDIO_DECODERS} \
		${VIDEO_ENCODERS} \
		${AUDIO_ENCODERS} \
		${DEMUXERS} \
		${MUXERS} \
		${PARSERS} \
		--arch=${ARCH}

	make clean
	make install

	cmake-utils_src_compile
}

src_install() {

	cmake-utils_src_install

	dodoc README.md

	make_desktop_entry "rpcs3" "rpcs3" "rpcs3" "Game;"

	prepgamesdirs
}

pkg_postinst() {
	# Add pax markings for hardened systems
	pax-mark -m "${EPREFIX}"/usr/games/bin/"${PN}"

}
