From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] ARM: dt: tegra: cardhu: add entry for regulators
Date: Wed, 8 Aug 2012 12:18:44 +0530
Message-ID: <1344408527-32051-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series add the PMIC and fixed regulators for 
cardhu board. There is multiple versions of cardhu baord named
as A01, A02, A03..and so on. Cardhu A01 and A03 are not supported.
Cardhu A02 and A04 have different sets of GPIO for regualtors.
The cardhu A04 is compatible for A05, A06 and A07 in GPIOs.
This patch series split the cardhu dts file to cardhu-a02 and 
carchu-a04 and then add entry for different fixed regualtors.

In patch 1, it enabled the PMIC tps65910 which is main pmu for 
the cardhu.
In Patch 2, split the cardhu support for cardhu-a02 and cardhu-a04.
In Patch 3, add different regulators.

Laxman Dewangan (3):
  ARM: dt: tegra: cardhu: add entry for PMIC TPS65911.
  ARM: dt: tegra: cardhu: split dts file for support multiple board
    versions
  ARM: tegra: cardhu: add dt entry for fixed regulators

 arch/arm/boot/dts/tegra30-cardhu-a02.dts |   87 ++++++
 arch/arm/boot/dts/tegra30-cardhu-a04.dts |   98 ++++++
 arch/arm/boot/dts/tegra30-cardhu.dts     |  171 -----------
 arch/arm/boot/dts/tegra30-cardhu.dtsi    |  483 ++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/Makefile.boot        |    3 +-
 5 files changed, 670 insertions(+), 172 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra30-cardhu-a02.dts
 create mode 100644 arch/arm/boot/dts/tegra30-cardhu-a04.dts
 delete mode 100644 arch/arm/boot/dts/tegra30-cardhu.dts
 create mode 100644 arch/arm/boot/dts/tegra30-cardhu.dtsi
