# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="4"
inherit subversion

DESCRIPTION="Light DLNA Media Server"
HOMEPAGE="http://xupnpd.org/ https://code.google.com/p/tsdemuxer/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="=dev-lang/lua-5.1*"
RDEPEND="${DEPEND}"

ESVN_REPO_URI="http://tsdemuxer.googlecode.com/svn/trunk/xupnpd"

pkg_setup() {
	tc-export CC CXX
}

src_unpack() {
	subversion_src_unpack
	subversion_wc_info
}

src_prepare() {
	cd src || die "Can't cd to src"
	rm -rf lua-5* || die "Faild removing bundled lua"
	epatch "${FILESDIR}"/makefile.patch
	sed -i -e "/cfg\.version/s/1.0-rc8/1.0-rc8-${ESVN_WC_REVISION}/" xupnpd.lua || die "Failed sed to change version"
	sed -i -e "/cfg\.playlists/s/\.\/playlists/\/etc\/xupnpd\/playlists/" xupnpd.lua || die "Failed sed to change playlists poath"
}

src_compile() {
	cd src || die "Can't cd to src"
	emake || die "emake failed"
}

src_install() {
	dodoc README src/ui/*.txt

	dobin src/xupnpd

	insinto /usr/share/xupnpd/
	doins src/xupnpd_*.lua

	insinto /etc/xupnpd/playlists/
	doins src/playlists/*.m3u

	insinto /etc/xupnpd/playlists/example/
	doins src/playlists/example/*.m3u

	insinto /usr/share/xupnpd/plugins/
	doins src/plugins/*.lua

	insinto /usr/share/xupnpd/ui/
	doins src/ui/*.lua src/ui/*.css src/ui/*.html

	insinto /usr/share/xupnpd/www/
	doins src/www/*.html src/www/*.xml src/www/*.mp4 src/www/*.ico src/www/icon-48x48.png

	sed	"s/cfg.ssdp_interface='lo'/cfg.ssdp_interface='eth0'/g;s/cfg.ssdp_loop=1/cfg.ssdp_loop=0/g;s/cfg.mcast_interface='eth1'/cfg.mcast_interface='eth0'/g"	\
	< src/xupnpd.lua > "$D"/usr/share/xupnpd/xupnpd.lua || die "Failed sed to modify config"
	dosym /usr/share/xupnpd/xupnpd.lua /etc/xupnpd/xupnpd.lua

	newenvd "${FILESDIR}"/xupnpd.envd 99xupnpd
	newinitd "${FILESDIR}"/xupnpd.init xupnpd
}
