# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

inherit git-r3
EGIT_REPO_URI="https://github.com/reo7sp/tgbot-cpp"

DESCRIPTION="C++ library for Telegram bot API"
HOMEPAGE="https://github.com/reo7sp/tgbot-cpp"
#SRC_URI="https://github.com/reo7sp/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+shared doc test"
RESTRICT="mirror !test? ( test )"

DEPEND="
	sys-libs/zlib
	dev-libs/openssl
	>=net-misc/curl-7.56.0
	>=dev-libs/boost-1.59.0"
RDEPEND="${DEPEND}"
BDEPEND="doc? ( app-doc/doxygen[dot] )"

src_configure() {
	mycmakeargs=(
		-DENABLE_TESTS=$(usex test ON OFF)
		-DBUILD_SHARED_LIBS=$(usex shared ON OFF)
		-DBUILD_DOCUMENTATION=$(usex doc ON OFF)
	)
	cmake_src_configure
}
