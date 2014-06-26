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

inherit eutils distutils-r1

S="${WORKDIR}/${P}"

python_prepare_all() {
	epatch "${FILESDIR}"/${P}-unicode.patch

	distutils-r1_python_prepare_all
}

