# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils mercurial wxwidgets

DESCRIPTION="Manga scanlation downloader for a few popular sites"
HOMEPAGE="http://sourceforge.net/projects/hakuneko/"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
EHG_REPO_URI="http://hg.code.sf.net/p/hakuneko/code"
DEPEND="x11-libs/wxGTK:2.8
	dev-libs/openssl:0
	net-misc/curl"
RDEPEND="${DEPEND}"

S=${WORKDIR}/code
