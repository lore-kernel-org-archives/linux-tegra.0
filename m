From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 00/15] ARM: dts: tegra: apalis-tk1: major revamp
Date: Tue, 24 Jul 2018 12:42:54 +0200
Message-ID: <20180724104309.21741-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel@ziswiler.com>, Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

This series is a minor overhaul for the Toradex Apalis TK1 system on
module.

Marcel Ziswiler (15):
  ARM: tegra: apalis-tk1: add local-mac-address property
  ARM: tegra: apalis-tk1: reorder pcie properties
  ARM: tegra: apalis-tk1: reorder host1x/hdmi properties
  ARM: tegra: apalis-tk1: reorder padctl properties
  ARM: tegra: apalis-tk1: regulator clean-up
  ARM: tegra: apalis-tk1: add missing regulators
  ARM: tegra: apalis-tk1: drop unused pinmux label
  ARM: tegra: apalis-tk1: white-space clean-up
  ARM: tegra: apalis-tk1: reorder backlight properties
  ARM: tegra: apalis-tk1: add proper emmc vmmc and vqmmc supplies
  ARM: tegra: apalis-tk1: enable emmc ddr52 mode
  ARM: tegra: apalis-tk1: add toradex,apalis-tk1-v1.2 compatible
  ARM: tegra: apalis-tk1: fix pcie switch vendor compatible
  ARM: tegra: apalis-tk1: reorder cpu dfll clock properties
  ARM: tegra: apalis-tk1: reorder SD card properties

 Documentation/devicetree/bindings/arm/tegra.txt |   2 +
 arch/arm/boot/dts/tegra124-apalis-eval.dts      |  26 ++++-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts |  29 ++++-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi     | 143 +++++++++++++-----------
 arch/arm/boot/dts/tegra124-apalis.dtsi          | 143 +++++++++++++-----------
 5 files changed, 208 insertions(+), 135 deletions(-)

-- 
2.14.4
