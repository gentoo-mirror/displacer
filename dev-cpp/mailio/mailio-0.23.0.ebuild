# Copyright 20242 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Cross platform C++ library for MIME format and SMTP, POP3 and IMAP protocols."
HOMEPAGE="https://github.com/karastojko/mailio"

SRC_URI="https://github.com/karastojko/mailio/archive/refs/tags/${PV}.tar.gz"

LICENSE="Simplified BSD License"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
