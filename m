From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 00/34] ARM: dts: tegra: apalis_t30: major revamp incl. v1.1 hardware support
Date: Fri, 31 Aug 2018 18:37:42 +0200
Message-ID: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel@ziswiler.com>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, David Lechner <david@lechnology.com>, Thierry Reding <treding@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Johan Hovold <johan@kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
List-Id: linux-tegra@vger.kernel.org

This series is a major overhaul and adds support for the V1.1 hardware
revision of the Toradex Apalis T30 system on module.

Changes in v2:
- Clean-up PCIe controller/port status' as well.
- Also move serial UART "nvidia,tegra30-hsuart" compatible to module
  level device trees.
- Also add two missing newlines.
- Also replace underscores in node names with dashes.
- Explicitly disable input of BKL1_ON as well.
- Replace underscores in node names with dashes.
- When running some more tests I realized that the reg-addr should
  really be 0x3f. Fix this.
- Get rid of fake clocks simple bus as suggested by Rob.
- Replace "[PATCH 27/28] ARM: tegra: apalis_t30: fix pcie switch vendor
  compatible" with "[PATCH v2 26/34] dt-bindings: add broadcom (formerly
  plx technology) vendor prefix" as suggested by Stefan.
- New patch as suggested by Rob.
- New patch.
- Drop "[PATCH 01/28] ARM: tegra: apalis_t30: enable broken-hpi on emmc"
  which should already be handled by the broken-hpi quirk as pointed out
  by Dmitry. If I would find more eMMC parts which exhibit the issue I
  will add them to the quirk as a separate patch.
- Updated V1.1 device trees with all applicable previous fixes.

Marcel Ziswiler (34):
  ARM: tegra: apalis_t30: fix mmc1 cmd pull-up
  ARM: tegra: apalis_t30: pull-up sd card detect pins
  ARM: tegra: apalis_t30: add local-mac-address property
  ARM: tegra: apalis_t30: reorder pcie properties
  ARM: tegra: apalis_t30: annotate/clean-up pcie controller/port nodes
  ARM: tegra: apalis_t30: reorder host1x/hdmi properties
  ARM: tegra: apalis_t30: regulator clean-up
  ARM: tegra: apalis_t30: add missing regulators
  ARM: tegra: apalis_t30: annotate uarts and move compatible to board
  ARM: tegra: apalis_t30: drop unused cami2c label
  ARM: tegra: apalis_t30: white-space/newline clean-up
  ARM: tegra: apalis_t30: drop unused mmc1/sd1 labels
  ARM: tegra: apalis_t30: annotate mmc1/sd1
  ARM: tegra: apalis_t30: move dr_mode property from phy to controller
  ARM: tegra: apalis_t30: reorder backlight properties
  ARM: tegra: apalis_t30: drop pwmleds
  ARM: tegra: apalis_t30: pinmux clean-up
  ARM: tegra: apalis_t30: add missing pinmux
  ARM: tegra: apalis_t30: use proper irq-gpio for stmpe811
  ARM: tegra: apalis_t30: further lm95245 temperature sensor annotation
  ARM: tegra: apalis_t30: add i2c-thermtrip
  ARM: tegra: apalis_t30: add proper emmc vmmc and vqmmc supplies
  ARM: tegra: apalis_t30: enable emmc ddr52 mode
  ARM: tegra: apalis_t30: get rid of fake clocks simple bus
  ARM: tegra: apalis_t30: line break long compatible property line
  dt-bindings: add broadcom (formerly plx technology) vendor prefix
  ARM: tegra: apalis_t30: drop module level model and compatible
  ARM: tegra: apalis_t30: drop obsolete spidev nodes
  ARM: tegra: apalis_t30: hog group for pcie switch reset gpio
  ARM: tegra: apalis_t30: rename hdmiddc to hdmi_ddc
  ARM: tegra: apalis_t30: rename tps65911@2d, stmpe811@41 and
    tps62362@60
  ARM: tegra: apalis_t30: fix mcp2515 can controller interrupt polarity
  ARM: tegra: apalis_t30: move hda node from carrier to module
  ARM: tegra: apalis_t30: support v1.1 hardware revision

 Documentation/devicetree/bindings/arm/tegra.txt    |    2 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/tegra30-apalis-eval.dts          |  148 +--
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts     |  266 +++++
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi         | 1189 ++++++++++++++++++++
 arch/arm/boot/dts/tegra30-apalis.dtsi              |  705 +++++++++---
 7 files changed, 2064 insertions(+), 248 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
 create mode 100644 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi

-- 
2.14.4
