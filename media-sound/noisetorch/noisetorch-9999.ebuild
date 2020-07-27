# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Creates virtual microphone suppressing noise using PulseAudio."
HOMEPAGE="https://github.com/lawl/NoiseTorch"


if [ "${PV}" == "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/lawl/${PN}.git"
	EGIT_SUBMODULES=( '*' )
else
	SRC_URI="
		https://github.com/lawl/${PN}/archive/${PV}-beta.tar.gz -> ${PF}-beta.tar.gz
		https://github.com/werman/noise-suppression-for-voice/archive/v0.9.tar.gz -> noise-suppression-for-voice-0.9.tar.gz
	"

	PATCHES=(
		"${FILESDIR}/${PV}-fix-Makefile.patch"
		"${FILESDIR}/${PV}-fix-embedversion.patch"
	)

	src_unpack() {
		if [[ -n ${A} ]]; then
			unpack ${A}
		fi

		mv NoiseTorch-0.5.3-beta ${PF}
	}
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
