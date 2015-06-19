# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="SOIL is a tiny C library used primarily for uploading textures into OpenGL."
HOMEPAGE="http://www.lonesock.net/soil.html"
SRC_URI="http://www.lonesock.net/files/soil.zip"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="app-arch/unzip sys-apps/sed virtual/opengl"
RDEPEND="virtual/opengl"

src_unpack() {
	mkdir ${WORKDIR}/${PN}
	unzip ${DISTDIR}/${A} -d ${WORKDIR}/${PN} || die "Unpack failed"
}

src_compile() {
	cd ${WORKDIR}/${PN}/Simple\ OpenGL\ Image\ Library/projects/makefile
	sed -e 's/\/usr\/local/${D}usr/' makefile > temp
	mv temp makefile
	mkdir obj
	emake || die "make failed"
}

src_install() {
	cd ${WORKDIR}/${PN}/Simple\ OpenGL\ Image\ Library/projects/makefile
	mkdir ${D}usr
	mkdir ${D}usr/lib
	mkdir ${D}usr/include
	emake install || die "einstall failed"
}

pkg_postinst() {
	mkdir /usr/include/SOIL
	ln -s /usr/include/SOIL.h /usr/include/SOIL/SOIL.h
	einfo "/usr/include/SOIL.h header file was linked to"
	einfo "/usr/include/SOIL/SOIL.h."
}

pkg_postrm() {
	rm -rf /usr/include/SOIL
}
