# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Virtual for Multiple Wine Installation"
SLOT="1"
KEYWORDS="~amd64 ~arm ~ia64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

RDEPEND="|| (
                =virtual/wine-1*
                app-emulation/wine
        )
	=app-admin/eselect-wine-1"
DEPEND=""
