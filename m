From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 7/8] ARM: tegra: Devicetree changes for v4.2-rc1
Date: Wed, 13 May 2015 15:49:39 +0200
Message-ID: <1431524980-13599-8-git-send-email-thierry.reding@gmail.com>
References: <1431524980-13599-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431524980-13599-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:

  Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.2-dt

for you to fetch changes up to 869bd180b8e6a81525acab21a5ee4428685bda2a:

  ARM: tegra: Fix hda2codec_2x clock and reset names (2015-05-05 14:09:02 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Devicetree changes for v4.2-rc1

Contains a couple of fixes and additions to device tree files. The most
notable change is a fix for a misapplied patch that was only exposed by
a recent change in the regulator subsystem that caused USB to break on
Tegra124 recently.

Other than that there are a more or less random assortment of additions
to enable various features on a couple of boards.

----------------------------------------------------------------
Marcel Ziswiler (3):
      ARM: tegra: Cardhu device-tree comment spelling fix
      ARM: tegra: Add Tegra30 HDA support
      ARM: tegra: Fix hda2codec_2x clock and reset names

Thierry Reding (5):
      ARM: tegra: cardhu: Add power and volume keys
      ARM: tegra: Add missing HDMI +5V regulator
      ARM: tegra: jetson-tk1: Enable HDA support
      ARM: tegra: venice2: Mark eMMC as non-removable
      ARM: tegra: venice2: Set min-/max-microvolt for VDD_LED supply

Tomeu Vizoso (1):
      ARM: tegra: Correct which USB controller has the UTMI pad registers

 arch/arm/boot/dts/tegra124-jetson-tk1.dts |  4 ++++
 arch/arm/boot/dts/tegra124-venice2.dts    |  3 +++
 arch/arm/boot/dts/tegra124.dtsi           | 12 ++++++------
 arch/arm/boot/dts/tegra20-seaboard.dts    | 12 ++++++++++++
 arch/arm/boot/dts/tegra30-cardhu.dtsi     | 30 +++++++++++++++++++++++++++++-
 arch/arm/boot/dts/tegra30.dtsi            | 15 +++++++++++++++
 6 files changed, 69 insertions(+), 7 deletions(-)
