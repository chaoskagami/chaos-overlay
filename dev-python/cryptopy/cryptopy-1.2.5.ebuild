# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="CryptoPy is a python crypto library that's old and unmaintained."
HOMEPAGE="http://cryptopy.sourceforge.net"
SRC_URI="mirror://sourceforge/cryptopy/cryptopy/${P}/${P}.tar.gz"

LICENSE="CRYPTOPY"
SLOT="0"
KEYWORDS="~x86 ~amd64"
PYTHON_COMPAT=( python2_7 )
DEPEND=""

inherit distutils-r1

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_prepare() {
	echo "IS THIS CALLED?"
	epatch "${FILESDIR}"/${P}-unicode.patch
}

src_compile() {
	distutils-r1_python_compile
}

src_install() {
	distutils-r1_python_install
}
