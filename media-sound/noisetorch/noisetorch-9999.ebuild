# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Creates virtual microphone suppressing noise using PulseAudio."
HOMEPAGE="https://github.com/lawl/NoiseTorch"

inherit git-r3
EGIT_REPO_URI="https://github.com/lawl/${PN}.git"
EGIT_SUBMODULES=( '*' )

if [ "${PV}" != "9999" ]; then
	EGIT_COMMIT="${PV}-beta"
fi

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/gcc"

src_install() {
	dobin bin/noisetorch
}
