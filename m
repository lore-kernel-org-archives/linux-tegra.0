From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 00/26] ARM: dts: tegra: colibri_t30: major revamp
Date: Mon, 23 Jul 2018 14:36:31 +0200
Message-ID: <20180723123658.980-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel@ziswiler.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

This series is a major overhaul for the Toradex Colibri T30 system on
module.

Marcel Ziswiler (26):
  ARM: tegra: colibri_t30: enable broken-hpi on emmc
  ARM: tegra: colibri_t30: add local-mac-address property
  ARM: tegra: colibri_t30: reorder host1x/hdmi properties
  ARM: tegra: colibri_t30: regulator clean-up
  ARM: tegra: colibri_t30: add missing regulators
  ARM: tegra: colibri_t30: annotate uarts
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
  ARM: tegra: colibri_t30: rename clk to clock
  ARM: tegra: colibri_t30: line break long compatible property line
  ARM: tegra: colibri_t30: move input include to carrier board
  ARM: tegra: colibri_t30: remove unused nvidia,is-wired property
  ARM: tegra: colibri_t30: add gpio hog to unreset usb ethernet chip
  ARM: tegra: colibri_t30: enable hda over hdmi
  ARM: tegra: colibri_t30: annotate sd card detect
  ARM: tegra: colibri_t30: annotate ehci instance 1
  ARM: tegra: colibri_t30: update compatibility comment

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts |  99 ++--
 arch/arm/boot/dts/tegra30-colibri.dtsi        | 716 ++++++++++++++++++++++----
 2 files changed, 666 insertions(+), 149 deletions(-)

-- 
2.14.4
