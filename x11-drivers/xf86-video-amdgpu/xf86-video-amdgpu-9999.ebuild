# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
XORG_DRI="always"
inherit linux-info xorg-2

#EGIT_REPO_URI="git://anongit.freedesktop.org/xorg/driver/xf86-video-amdgpu"
EGIT_REPO_URI="git://people.freedesktop.org/~agd5f/xf86-video-amdgpu"
EGIT_BRANCH="amdgpu"

DESCRIPTION="Accelerated Open Source driver for nVidia cards"
HOMEPAGE="http://freedesktop.org/"
SRC_URI=""

KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND=">=x11-libs/libdrm-2.4.34" #[video_cards_amdgpu]
DEPEND="${RDEPEND}"
