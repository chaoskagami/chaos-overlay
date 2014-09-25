# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Wine eselect module & Env support"
HOMEPAGE="http://www.github.com/chaoskagami/chaos-overlay"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux"
IUSE=""

DEPEND=">=app-admin/eselect-1.2.4"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
        insinto /usr/share/eselect/modules/
        newins "${FILESDIR}"/wine.eselect wine.eselect
	insinto /etc/env.d
	newins "${FILESDIR}"/20wine 20wine
}
