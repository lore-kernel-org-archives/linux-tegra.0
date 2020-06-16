From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/73] ARM: tegra: Various fixes for DT schema validation
Date: Tue, 16 Jun 2020 15:51:25 +0200
Message-ID: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Philippe Schenker <philippe.schenker-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This set of patches fixes a bunch of issues that I ran into while
validating device trees for Tegra-based boards against json-schema. Note
that some of these issues won't become apparent until the DT binding
conversions to json-schema are applied:

	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=183004

Marcel, Philippe: I've Cc'ed you explicitly on a couple of patches that
make changes to Toradex boards where I wasn't sure whether those changes
would be safe. Those are mostly things like node names that I wasn't
sure whether maybe some firmware might run into issues if we rename
them. Please take a look and shout if any of those are problematic.

Thierry

Thierry Reding (73):
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
  ARM: tegra: Drop display controller parent clocks on Tegra114
  ARM: tegra: Rename sdhci nodes to mmc
  ARM: tegra: Tegra114 SDHCI is not backwards-compatible
  ARM: tegra: Add missing #phy-cells property to USB PHYs
  ARM: tegra: Add missing #sound-dai-cells property to codecs
  ARM: tegra: Name GPIO hog nodes consistently
  ARM: tegra: Use standard name for Ethernet devices
  ARM: tegra: Use proper tuple notation
  ARM: tegra: Add micro-USB A/B port on Jetson TK1
  ARM: tegra: Add missing panel power supplies on Nyan
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
  arm64: tegra: Add missing #phy-cells property on Jetson TX2
  arm64: tegra: Add missing #phy-cells property on Jetson AGX Xavier
  arm64: tegra: Fix #address-cells/#size-cells for SRAM on Tegra186
  arm64: tegra: Use standard notation for interrupts
  arm64: tegra: Remove extra compatible for Tegra194 SDHCI
  arm64: tegra: Remove extra compatible for Tegra210 SDHCI
  arm64: tegra: Describe interconnect paths on Tegra186
  arm64: tegra: Describe interconnect paths on Tegra194
  arm64: tegra: Add interrupt for Tegra194 memory controller
  arm64: tegra: Add Tegra132 compatible string for host1x
  arm64: tegra: Add interrupt-names for host1x
  arm64: tegra: Remove parent clock from display controllers
  arm64: tegra: Fixup I/O and PLL supply names for HDMI/DP
  arm64: tegra: Add unit-address to memory node
  arm64: tegra: Rename sdhci nodes to mmc
  arm64: tegra: Enable XUSB on Norrin
  arm64: tegra: Remove undocumented battery-name property
  arm64: tegra: Remove simple clocks bus
  arm64: tegra: Remove simple regulators bus
  arm64: tegra: norrin: Add missing panel power supply
  arm64: tegra: Use proper tuple notation
  arm64: tegra: Do not mark host1x as simple bus
  arm64: tegra: Use sor0_out clock on Tegra132
  arm64: tegra: Tegra132 EMC is not compatible with Tegra124
  arm64: tegra: Add missing #phy-cells property to USB PHYs
  arm64: tegra: Remove unneeded power supplies
  arm64: tegra: Update USB connector nodes
  arm64: tegra: Use standard EEPROM properties
  arm64: tegra: Remove XUSB pad controller interrupt from XUSB node
  arm64: tegra: Fix {clock,reset}-names ordering
  arm64: tegra: Do not mark display hub as simple bus
  arm64: tegra: Use standard names for SRAM nodes
  arm64: tegra: Remove unused interrupts from Tegra194 AON GPIO
  arm64: tegra: Fix indentation in Tegra194 device tree
  arm64: tegra: Rename agic -> interrupt-controller
  arm64: tegra: Various fixes for PMICs
  arm64: tegra: Sort nodes by unit-address on Jetson Nano
  arm64: tegra: Rename cbb@0 to bus@0 on Tegra194
  arm64: tegra: Fix order of XUSB controller clocks

 arch/arm/boot/dts/tegra114-dalmore.dts        | 149 +++----
 arch/arm/boot/dts/tegra114-roth.dts           | 141 +++---
 arch/arm/boot/dts/tegra114-tn7.dts            |  84 ++--
 arch/arm/boot/dts/tegra114.dtsi               |  44 +-
 arch/arm/boot/dts/tegra124-apalis-eval.dts    |   6 +-
 .../boot/dts/tegra124-apalis-v1.2-eval.dts    |   6 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi   |   9 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi        |   9 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts     | 263 ++++++-----
 arch/arm/boot/dts/tegra124-nyan-big.dts       |   3 +-
 arch/arm/boot/dts/tegra124-nyan-blaze.dts     |   1 +
 arch/arm/boot/dts/tegra124-nyan.dtsi          | 280 ++++++------
 arch/arm/boot/dts/tegra124-venice2.dts        | 284 ++++++------
 arch/arm/boot/dts/tegra124.dtsi               |  50 ++-
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts |   2 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts    |   2 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi        |   6 +-
 .../boot/dts/tegra20-cpu-opp-microvolt.dtsi   |  98 ++---
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi        |  98 ++---
 arch/arm/boot/dts/tegra20-harmony.dts         | 140 +++---
 arch/arm/boot/dts/tegra20-medcom-wide.dts     |  68 ++-
 arch/arm/boot/dts/tegra20-paz00.dts           |  61 +--
 arch/arm/boot/dts/tegra20-plutux.dts          |  66 ++-
 arch/arm/boot/dts/tegra20-seaboard.dts        | 152 +++----
 arch/arm/boot/dts/tegra20-tamonten.dtsi       |  39 +-
 arch/arm/boot/dts/tegra20-tec.dts             |  66 ++-
 arch/arm/boot/dts/tegra20-trimslice.dts       | 104 ++---
 arch/arm/boot/dts/tegra20-ventana.dts         | 106 ++---
 arch/arm/boot/dts/tegra20.dtsi                |  61 +--
 arch/arm/boot/dts/tegra30-apalis-eval.dts     |   6 +-
 .../arm/boot/dts/tegra30-apalis-v1.1-eval.dts |  10 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi    |   5 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi         |   5 +-
 arch/arm/boot/dts/tegra30-beaver.dts          | 212 ++++-----
 arch/arm/boot/dts/tegra30-cardhu-a02.dts      | 128 +++---
 arch/arm/boot/dts/tegra30-cardhu-a04.dts      | 149 +++----
 arch/arm/boot/dts/tegra30-cardhu.dtsi         | 280 ++++++------
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts |   2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi        |   7 +-
 .../boot/dts/tegra30-cpu-opp-microvolt.dtsi   | 398 ++++++++---------
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi        | 398 ++++++++---------
 arch/arm/boot/dts/tegra30.dtsi                |  77 ++--
 .../arm64/boot/dts/nvidia/tegra132-norrin.dts | 396 ++++++++++-------
 arch/arm64/boot/dts/nvidia/tegra132.dtsi      | 194 ++++++--
 .../boot/dts/nvidia/tegra186-p2771-0000.dts   | 110 ++---
 .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  78 ++--
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      | 122 ++++--
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 123 +++---
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  16 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 220 ++++++----
 .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  46 +-
 .../boot/dts/nvidia/tegra210-p2371-2180.dts   |   6 +-
 .../arm64/boot/dts/nvidia/tegra210-p2530.dtsi |  19 +-
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 292 ++++++------
 .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi | 414 ++++++++----------
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 230 +++++-----
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 171 ++++----
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  51 ++-
 58 files changed, 3214 insertions(+), 3349 deletions(-)

-- 
2.24.1
