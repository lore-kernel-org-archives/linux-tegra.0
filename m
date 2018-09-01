From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 00/34] ARM: dts: tegra: colibri_t30: major revamp
Date: Sat,  1 Sep 2018 10:12:14 +0200
Message-ID: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel@ziswiler.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

This series is a major overhaul for the Toradex Colibri T30 system on
module.

Changes in v2:
- Also move serial UART "nvidia,tegra30-hsuart" compatible to module
  level device trees.
- Also replace underscores in node names with dashes.
- Also replace underscores in UART annotations with dashes.
- When running some more tests I realized that the reg-addr should
  really be 0x3f. Fix this.
- Get rid of fake clocks simple bus as suggested by Rob.
- Drop "[PATCH 01/26] ARM: tegra: colibri_t30: enable broken-hpi on
  emmc" which should already be handled by the broken-hpi quirk as
  pointed out by Dmitry. If I would find more eMMC parts which exhibit
  the issue I will add them to the quirk as a separate patch.
- New patch as suggested by Rob.
- New patch.

Marcel Ziswiler (34):
  ARM: tegra: colibri_t30: add local-mac-address property
  ARM: tegra: colibri_t30: reorder host1x/hdmi properties
  ARM: tegra: colibri_t30: regulator clean-up
  ARM: tegra: colibri_t30: add missing regulators
  ARM: tegra: colibri_t30: annotate uarts and move compatible to board
  ARM: tegra: colibri_t30: white-space clean-up
  ARM: tegra: colibri_t30: move dr_mode property from phy to controller
  ARM: tegra: colibri_t30: reorder backlight properties
  ARM: tegra: colibri_t30: drop pwmleds
  ARM: tegra: colibri_t30: pinmux clean-up
  ARM: tegra: colibri_t30: add missing pinmux
  ARM: tegra: colibri_t30: use proper irq-gpio for stmpe811
  ARM: tegra: colibri_t30: further lm95245 temperature sensor annotation
  ARM: tegra: colibri_t30: add i2c-thermtrip
  ARM: tegra: colibri_t30: add proper emmc vmmc and vqmmc supplies
  ARM: tegra: colibri_t30: enable emmc ddr52 mode
  ARM: tegra: colibri_t30: get rid of fake clocks simple bus
  ARM: tegra: colibri_t30: line break long compatible property line
  ARM: tegra: colibri_t30: move input include to carrier board
  ARM: tegra: colibri_t30: remove unused nvidia,is-wired property
  ARM: tegra: colibri_t30: add gpio hog to unreset usb ethernet chip
  ARM: tegra: colibri_t30: enable hda over hdmi
  ARM: tegra: colibri_t30: annotate sd card detect
  ARM: tegra: colibri_t30: annotate ehci instance 1
  ARM: tegra: colibri_t30: update compatibility comment
  ARM: tegra: colibri_t30: drop module level model and compatible
  ARM: tegra: colibri_t30: drop obsolete spidev node
  ARM: tegra: colibri_t30: rename hdmiddc to hdmi_ddc
  ARM: tegra: colibri_t30: rename tps65911@2d, stmpe811@41 and
    tps62362@60
  ARM: tegra: colibri_t30: fix mcp2515 can controller interrupt polarity
  ARM: tegra: colibri_t30: remove unused mcp2515 can0 label
  ARM: tegra: colibri_t30: add mcp2515 vdd and xceiver supplies
  ARM: tegra: colibri_t30: annotate unused i2c busses
  ARM: tegra: colibri_t30: annotate power I2C being on-module

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 130 ++---
 arch/arm/boot/dts/tegra30-colibri.dtsi        | 780 +++++++++++++++++++++-----
 2 files changed, 706 insertions(+), 204 deletions(-)

-- 
2.14.4
