# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Wine eselect module and Env support"
HOMEPAGE="http://www.github.com/chaoskagami/chaos-overlay"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux"
IUSE=""

DEPEND=">=app-admin/eselect-1.2.4"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	dodir /usr/share/eselect/modules/
	cp "${FILESDIR}"/wine.eselect "${D}"/usr/share/eselect/modules/wine.eselect

	dodir /etc/env.d/
	cp "${FILESDIR}"/90wine "${D}"/etc/env.d/90wine
}

pkg_postinst() {
	elog "Reconfiguring to use first wine instance."

	eselect wine set 1
}
