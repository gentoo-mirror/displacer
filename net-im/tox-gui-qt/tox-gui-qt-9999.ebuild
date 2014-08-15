# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

EGIT_REPO_URI="git://github.com/nurupo/ProjectTox-Qt-GUI.git"

inherit qmake-utils git-2

DESCRIPTION="A front end for ProjectTox Core written in Qt5 and C++."
HOMEPAGE="http://tox.im"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="-*"
IUSE="nacl"

RDEPEND="
	net-im/tox-core
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtwidgets:5
"
DEPEND="${RDEPEND}"

src_prepare() {
	:
}

src_configure() {
	eqmake5 projectfiles/QtCreator/TOX-Qt-GUI.pro
}

src_install() {
	dobin TOX-Qt-GUI
}
