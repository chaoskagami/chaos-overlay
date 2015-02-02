# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

# svn export https://svn.java.net/svn/jinput~svn/trunk jinput-r${REV}
# rm -r jinput-r${REV}/lib/*
# tar Jcf jinput-r${REV}{.tar.xz,}

WANT_ANT_TASKS="ant-nodeps"
JAVA_PKG_IUSE="source"

inherit eutils java-pkg-2 java-ant-2 git-r3

DESCRIPTION="An implementation of an API for game controller discovery and polled input"
HOMEPAGE="https://jinput.dev.java.net"
EGIT_REPO_URI="https://github.com/jinput/jinput"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jdk-1.4
	dev-java/jutils"

RDEPEND=">=virtual/jre-1.4
	dev-java/jutils"

S="${WORKDIR}/${P}"

JAVA_PKG_BSFIX="off"
EANT_BUILD_TARGET="dist"

src_prepare() {
	cp "${FILESDIR}/build.xml" "${S}/build.xml"

	java-pkg_jar-from --into lib jutils

	sed -i \
		-e "s/-O[0-9]/${CFLAGS} ${LDFLAGS}/g" \
		-e '/<apply .*executable="strip"/,/<\/apply>/d' \
		plugins/linux/src/native/build.xml || die
}

src_install() {
	java-pkg_dojar dist/jinput.jar
	java-pkg_doso dist/*.so

	use source && java-pkg_dosrc */src/java/* */**/src/java/*
}
