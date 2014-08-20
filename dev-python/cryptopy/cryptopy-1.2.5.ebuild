# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils

DESCRIPTION="CryptoPy is a python crypto library that's old and unmaintained"
HOMEPAGE="http://cryptopy.sourceforge.net"
SRC_URI="mirror://sourceforge/cryptopy/cryptopy/${P}/${P}.tar.gz"

LICENSE="CRYPTOPY"
SLOT="0"
KEYWORDS="~x86 ~amd64"

src_prepare() {
	epatch "${FILESDIR}/${P}-unicode.patch"
}
