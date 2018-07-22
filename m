From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 00/28] ARM: dts: tegra: apalis_t30: major revamp incl. v1.1 hardware support
Date: Sun, 22 Jul 2018 18:49:08 +0200
Message-ID: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel@ziswiler.com>, Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

This series is a major overhaul and adds support for the V1.1 hardware
revision of the Toradex Apalis T30 system on module.

Marcel Ziswiler (28):
  ARM: tegra: apalis_t30: enable broken-hpi on emmc
  ARM: tegra: apalis_t30: fix mmc1 cmd pull-up
  ARM: tegra: apalis_t30: pull-up sd card detect pins
  ARM: tegra: apalis_t30: add local-mac-address property
  ARM: tegra: apalis_t30: reorder pcie properties
  ARM: tegra: apalis_t30: annotate pcie port nodes
  ARM: tegra: apalis_t30: reorder host1x/hdmi properties
  ARM: tegra: apalis_t30: regulator clean-up
  ARM: tegra: apalis_t30: add missing regulators
  ARM: tegra: apalis_t30: annotate uarts
  ARM: tegra: apalis_t30: drop unused cami2c label
  ARM: tegra: apalis_t30: white-space clean-up
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
  ARM: tegra: apalis_t30: rename clk to clock
  ARM: tegra: apalis_t30: line break long compatible property line
  ARM: tegra: apalis_t30: fix pcie switch vendor compatible
  ARM: tegra: apalis_t30: support v1.1 hardware revision

 Documentation/devicetree/bindings/arm/tegra.txt |    2 +
 arch/arm/boot/dts/Makefile                      |    1 +
 arch/arm/boot/dts/tegra30-apalis-eval.dts       |  116 +--
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts  |  280 ++++++
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi      | 1189 +++++++++++++++++++++++
 arch/arm/boot/dts/tegra30-apalis.dtsi           |  595 ++++++++++--
 6 files changed, 2013 insertions(+), 170 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
 create mode 100644 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi

-- 
2.14.4
