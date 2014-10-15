# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils autotools

DESCRIPTION="Cross-platform content manager assistant for the PS Vita"
HOMEPAGE="https://github.com/codestation/VitaMTP"
SRC_URI="https://github.com/codestation/VitaMTP/archive/v${PV}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~amd64 ~arm"

DEPEND="virtual/libusb:1
	dev-libs/libxml2"

S="${WORKDIR}/vitamtp-${PV}"

src_prepare() {
	eautoreconf
}
