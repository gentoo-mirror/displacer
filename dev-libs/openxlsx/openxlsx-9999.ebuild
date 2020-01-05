# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

inherit cmake-utils git-r3

DESCRIPTION="OpenXLSX is a C++ library for reading, writing, creating and modifying Microsoft Excel files, with the .xlsx format"
HOMEPAGE="https://github.com/troldal/OpenXLSX"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-libs/pugixml
	dev-libs/libzip"
DEPEND=""

PATCHES=("${FILESDIR}/install-enabled.patch"
	"${FILESDIR}/install-headers.patch"
	)

EGIT_REPO_URI="https://github.com/troldal/OpenXLSX.git"
