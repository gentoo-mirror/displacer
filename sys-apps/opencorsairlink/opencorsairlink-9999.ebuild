# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

EGIT_REPO_URI="https://github.com/audiohacked/OpenCorsairLink.git"

DESCRIPTION="Status & control utility that interacts with CorsairLink products"
HOMEPAGE="https://github.com/audiohacked/OpenCorsairLink"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

pkg_setup() {
	export PREFIX=/usr
}
