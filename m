From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 2/4] ARM: tegra: Device tree changes for v4.8-rc1
Date: Mon, 11 Jul 2016 17:25:10 +0200
Message-ID: <20160711152512.11731-2-thierry.reding@gmail.com>
References: <20160711152512.11731-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160711152512.11731-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.8-arm-dt

for you to fetch changes up to 85afd20e4bccc39f4eae01cb50e435ca45aef912:

  ARM: tegra: Initial support for Apalis TK1 (2016-07-11 16:48:10 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v4.8-rc1

Some cleanups to existing device tree sources and add Toradex Apalis TK1
support.

----------------------------------------------------------------
Marcel Ziswiler (2):
      ARM: tegra: Remove commas from unit addresses on Tegra124
      ARM: tegra: Initial support for Apalis TK1

Stephen Warren (1):
      ARM: tegra: Import latest Jetson TK1 spreadsheet

Thierry Reding (2):
      ARM: tegra: Fix a couple of DTC warnings
      ARM: tegra: Add spaces around = in properties

 arch/arm/boot/dts/Makefile                     |    1 +
 arch/arm/boot/dts/tegra114-dalmore.dts         |    2 +-
 arch/arm/boot/dts/tegra114-roth.dts            |    4 +-
 arch/arm/boot/dts/tegra114-tn7.dts             |    2 +-
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi     | 1502 +++++++++++++++++
 arch/arm/boot/dts/tegra124-apalis-eval.dts     |  284 ++++
 arch/arm/boot/dts/tegra124-apalis.dtsi         | 2100 ++++++++++++++++++++++++
 arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |    6 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts      |   88 +-
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi   |    6 +-
 arch/arm/boot/dts/tegra124-nyan-big.dts        |    4 +-
 arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |    6 +-
 arch/arm/boot/dts/tegra124-nyan-blaze.dts      |    2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi           |   60 +-
 arch/arm/boot/dts/tegra124-venice2.dts         |   70 +-
 arch/arm/boot/dts/tegra124.dtsi                |  125 +-
 arch/arm/boot/dts/tegra20-colibri-512.dtsi     |    2 +-
 arch/arm/boot/dts/tegra20-harmony.dts          |    2 +-
 arch/arm/boot/dts/tegra20-paz00.dts            |    2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts         |    2 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi        |    2 +-
 arch/arm/boot/dts/tegra20-trimslice.dts        |    2 +-
 arch/arm/boot/dts/tegra20-ventana.dts          |    2 +-
 arch/arm/boot/dts/tegra20-whistler.dts         |    2 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi          |    7 +-
 arch/arm/boot/dts/tegra30-beaver.dts           |    2 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi          |    2 +-
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts  |    2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi         |    2 +-
 29 files changed, 4091 insertions(+), 202 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra124-apalis-emc.dtsi
 create mode 100644 arch/arm/boot/dts/tegra124-apalis-eval.dts
 create mode 100644 arch/arm/boot/dts/tegra124-apalis.dtsi
