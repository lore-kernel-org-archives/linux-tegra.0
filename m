From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 00/19] ARM: dts: tegra: apalis-tk1: minor revamp
Date: Sat,  1 Sep 2018 15:04:45 +0200
Message-ID: <20180901130504.14318-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel@ziswiler.com>, Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

This series is a minor overhaul for the Toradex Apalis TK1 system on
module.

Changes in v2:
- Add Rob's reviewed-by.
- New patch as suggested by Rob.
- New patch.
- Get rid of fake clocks simple bus as suggested by Rob.
- Change cover-letter subject to indicate minor revamp.
- Drop "[PATCH 02/15] ARM: tegra: apalis-tk1: reorder pcie properties"
  as requested by Stefan.
- Drop "[PATCH 13/15] ARM: tegra: apalis-tk1: fix pcie switch vendor
  compatible" in favour of the new "[PATCH v2 26/34] dt-bindings: add
  broadcom (formerly plx technology) vendor prefix" posted earlier as
  part of the apalis_t30 revamp v2 as suggested by Stefan.

Marcel Ziswiler (19):
  ARM: tegra: apalis-tk1: add local-mac-address property
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
  ARM: tegra: apalis-tk1: reorder cpu dfll clock properties
  ARM: tegra: apalis-tk1: reorder SD card properties
  ARM: tegra: apalis-tk1: drop module level model and compatible
  ARM: tegra: apalis-tk1: drop obsolete spidev nodes
  ARM: tegra: apalis-tk1: replace underscores in node names with dashes
  ARM: tegra: apalis-tk1: get rid of fake clocks simple bus
  ARM: tegra: apalis-tk1: shorten temperature-sensor node
  ARM: tegra: apalis-tk1: drop unused hdmi_ddc label

 Documentation/devicetree/bindings/arm/tegra.txt |   2 +
 arch/arm/boot/dts/tegra124-apalis-eval.dts      |  40 ++-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts |  43 ++-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi     | 452 ++++++++++++------------
 arch/arm/boot/dts/tegra124-apalis.dtsi          | 451 +++++++++++------------
 5 files changed, 508 insertions(+), 480 deletions(-)

-- 
2.14.4
