From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 7/7] arm64: tegra: Device tree changes for v5.9-rc1
Date: Fri, 17 Jul 2020 18:13:00 +0200
Message-ID: <20200717161300.1661002-7-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.9-arm64-dt

for you to fetch changes up to 0f134e39ae651ff3b77c44de387ee1c49d63e99b:

  arm64: tegra: Add the GPU on Tegra194 (2020-07-17 16:14:17 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.9-rc1

This contains a slew of fixes in preparation for validating device trees
against json-schema bindings. In addition, this enables the CPU complex
(for CPU frequency scaling) and GPU on Tegra194.

----------------------------------------------------------------
Jon Hunter (3):
      arm64: tegra: Add support for Jetson Xavier NX
      arm64: tegra: Enable DFLL support on Jetson Nano
      arm64: tegra: Populate VBUS for USB3 on Jetson TX2

Sowjanya Komatineni (3):
      arm64: tegra: jetson-tx1: Add camera supplies
      arm64: tegra: Enable Tegra VI CSI support for Jetson Nano
      arm64: tegra: Add missing clocks and power-domains to Tegra210 VI I2C

Sumit Gupta (1):
      arm64: tegra: Add compatible string for Tegra194 CPU complex

Thierry Reding (48):
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
      arm64: tegra: Fix indentation in Tegra132 device tree
      arm64: tegra: Fix indentation in Tegra194 device tree
      arm64: tegra: Rename agic -> interrupt-controller
      arm64: tegra: Various fixes for PMICs
      arm64: tegra: Sort nodes by unit-address on Jetson Nano
      arm64: tegra: Rename cbb@0 to bus@0 on Tegra194
      arm64: tegra: Fix order of XUSB controller clocks
      arm64: tegra: Remove spurious tabs
      arm64: tegra: Sort aliases alphabetically
      arm64: tegra: Add i2c-bus subnode for DPAUX controllers
      arm64: tegra: Fix compatible string for DPAUX on Tegra210
      arm64: tegra: Add clocks and resets for ISP on Tegra210
      arm64: tegra: Add #{address,size}-cells for VI I2C on Tegra210
      arm64: tegra: Add HDMI supplies on Norrin
      arm64: tegra: Add the GPU on Tegra194

Vidya Sagar (1):
      arm64: tegra: Re-order PCIe aperture mappings

 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     | 399 +++++++++++---------
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           | 205 ++++++++--
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 111 +++---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |  80 ++--
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 124 ++++--
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     | 125 +++----
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  16 +-
 .../dts/nvidia/tegra194-p3509-0000+p3668-0000.dts  | 331 ++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi | 290 +++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 280 +++++++++-----
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |  46 +--
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |   6 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi     |  19 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 330 ++++++++--------
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     | 414 ++++++++++-----------
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 277 ++++++++------
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      | 171 ++++-----
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  72 ++--
 19 files changed, 2107 insertions(+), 1190 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
