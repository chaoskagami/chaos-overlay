EAPI=4

inherit distutils

DESCRIPTION="CryptoPy is a python crypto library that's old and 
unmaintained, but still used in some crap. Use only for compatibility, 
please."
HOMEPAGE="http://cryptopy.sourceforge.net"
SRC_URI="mirror://sourceforge/cryptopy/cryptopy/${P}/${P}.tar.gz"

LICENSE="CRYPTOPY"
SLOT="0"
KEYWORDS="~x86 ~amd64"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-unicode.patch"
}

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install
}
