From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 5/7] ARM: tegra: Device tree changes for v5.9-rc1
Date: Fri, 17 Jul 2020 18:12:58 +0200
Message-ID: <20200717161300.1661002-5-thierry.reding@gmail.com>
References: <20200717161300.1661002-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200717161300.1661002-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.9-arm-dt

for you to fetch changes up to 2720008f4239cf36d57b8d0b3cb2a49d4368a378:

  ARM: tegra: Add device-tree for ASUS Google Nexus 7 (2020-07-16 14:21:31 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.9-rc1

This adds device trees for the ASUS Google Nexus 7 and Acer Iconia Tab
A500. In addition there are a slew of fixes to existing device trees in
preparation for validating the DTBs against json-schema.

----------------------------------------------------------------
Dmitry Osipenko (2):
      ARM: tegra: Add device-tree for Acer Iconia Tab A500
      ARM: tegra: Add device-tree for ASUS Google Nexus 7

Thierry Reding (36):
      ARM: tegra: Add missing clock-names for SDHCI on Tegra114
      ARM: tegra: Remove simple clocks bus
      ARM: tegra: Remove simple regulators bus
      ARM: tegra: Remove battery-name property
      ARM: tegra: roth: Use the correct DSI/CSI supply
      ARM: tegra: tn7: Use the correct DSI/CSI supply
      ARM: tegra: Do not mark host1x as simple bus
      ARM: tegra: Add missing host1x properties
      ARM: tegra: gr2d is not backwards-compatible
      ARM: tegra: gr3d is not backwards-compatible
      ARM: tegra: The Tegra114 DC is not backwards-compatible
      ARM: tegra: Drop display controller parent clocks on Tegra124
      ARM: tegra: Rename sdhci nodes to mmc
      ARM: tegra: Tegra114 SDHCI is not backwards-compatible
      ARM: tegra: Add missing #phy-cells property to USB PHYs
      ARM: tegra: Add missing #sound-dai-cells property to codecs
      ARM: tegra: Use standard name for Ethernet devices
      ARM: tegra: Use proper tuple notation
      ARM: tegra: Add micro-USB A/B port on Jetson TK1
      ARM: tegra: Add missing panel power supplies
      ARM: tegra: Add #reset-cells to Tegra124 memory controller
      ARM: tegra: Fix order of XUSB controller clocks
      ARM: tegra: Add missing clock-names for SDHCI controllers
      ARM: tegra: Use proper unit-addresses for OPPs
      ARM: tegra: medcom-wide: Remove extra panel power supply
      ARM: tegra: Use numeric unit-addresses
      ARM: tegra: Use standard names for LED nodes
      ARM: tegra: seaboard: Use standard battery bindings
      ARM: tegra: Use standard names for SRAM nodes
      ARM: tegra: Add parent clock to DSI output
      ARM: tegra: Remove spurious comma from node name
      ARM: tegra: The Tegra30 DC is not backwards-compatible
      ARM: tegra: The Tegra30 SDHCI is not backwards-compatible
      ARM: tegra: Add i2c-bus subnode for DPAUX controllers
      ARM: tegra: Add missing DSI controller on Tegra30
      ARM: tegra: Add HDMI supplies on Nyan boards

 arch/arm/boot/dts/Makefile                         |    4 +
 arch/arm/boot/dts/tegra114-dalmore.dts             |  149 +-
 arch/arm/boot/dts/tegra114-roth.dts                |  141 +-
 arch/arm/boot/dts/tegra114-tn7.dts                 |   84 +-
 arch/arm/boot/dts/tegra114.dtsi                    |   48 +-
 arch/arm/boot/dts/tegra124-apalis-eval.dts         |    4 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts    |    4 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |    5 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi             |    5 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |  263 ++--
 arch/arm/boot/dts/tegra124-nyan-big.dts            |    3 +-
 arch/arm/boot/dts/tegra124-nyan-blaze.dts          |    1 +
 arch/arm/boot/dts/tegra124-nyan.dtsi               |  283 ++--
 arch/arm/boot/dts/tegra124-venice2.dts             |  284 ++--
 arch/arm/boot/dts/tegra124.dtsi                    |   59 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    | 1438 ++++++++++++++++++
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts      |    2 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts         |    2 +-
 arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi   |   98 +-
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi             |   98 +-
 arch/arm/boot/dts/tegra20-harmony.dts              |  140 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts          |   68 +-
 arch/arm/boot/dts/tegra20-paz00.dts                |   61 +-
 arch/arm/boot/dts/tegra20-plutux.dts               |   66 +-
 arch/arm/boot/dts/tegra20-seaboard.dts             |  152 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi            |   39 +-
 arch/arm/boot/dts/tegra20-tec.dts                  |   66 +-
 arch/arm/boot/dts/tegra20-trimslice.dts            |  104 +-
 arch/arm/boot/dts/tegra20-ventana.dts              |  106 +-
 arch/arm/boot/dts/tegra20.dtsi                     |   91 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts          |    4 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts     |    8 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi         |    5 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi              |    5 +-
 .../boot/dts/tegra30-asus-nexus7-grouper-E1565.dts |    9 +
 .../boot/dts/tegra30-asus-nexus7-grouper-PM269.dts |    9 +
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    | 1232 +++++++++++++++
 .../tegra30-asus-nexus7-grouper-maxim-pmic.dtsi    |  185 +++
 ...tegra30-asus-nexus7-grouper-memory-timings.dtsi | 1565 ++++++++++++++++++++
 .../dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi   |  149 ++
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi |  149 ++
 .../boot/dts/tegra30-asus-nexus7-tilapia-E1565.dts |    9 +
 ...tegra30-asus-nexus7-tilapia-memory-timings.dtsi |  325 ++++
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi |  235 +++
 arch/arm/boot/dts/tegra30-beaver.dts               |  212 ++-
 arch/arm/boot/dts/tegra30-cardhu-a02.dts           |  128 +-
 arch/arm/boot/dts/tegra30-cardhu-a04.dts           |  149 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |  280 ++--
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts      |    2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi             |    5 +-
 arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi   |  398 ++---
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi             |  398 ++---
 arch/arm/boot/dts/tegra30.dtsi                     |  117 +-
 53 files changed, 7251 insertions(+), 2195 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-E1565.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-PM269.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-memory-timings.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia-E1565.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia-memory-timings.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
