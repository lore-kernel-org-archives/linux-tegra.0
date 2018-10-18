From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v3 0/7] ARM: dts: tegra: last minute fixes
Date: Thu, 18 Oct 2018 13:14:04 +0200
Message-ID: <20181018111411.26623-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Marcel Ziswiler <marcel@ziswiler.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org


This series comes with some last minutes fixes and further clean-up.

Changes in v3:
- Dropped ASoC patches in favour of sending them as a separate series.

Changes in v2:
- Dropped "[PATCH v1 3/8] ARM: tegra: apalis/colibri_t30: fix hdmi
  regulator" as suggested by Russell et. al.
- Added 2 new patches improving/fixing audio on Apalis TK1.

Changes in v1:
- Remove simple-panel compatible as suggested by Rob.

Marcel Ziswiler (7):
  ARM: tegra: fix simple-panel compatibles
  ARM: tegra: apalis-tk1/colibri_t20/t30: eval/iris: fix regulator gpio
    enable
  ARM: tegra: colibri_t20: reorder pmic properties
  ARM: tegra: apalis-tk1: further regulator clean-up
  ARM: tegra: apalis_t30/tk1: annotate power I2C being on-module
  ARM: tegra: colibri_t30: further regulator clean-up
  ARM: tegra: apalis_t30: further regulator clean-up

 arch/arm/boot/dts/tegra114-dalmore.dts          |  3 +-
 arch/arm/boot/dts/tegra124-apalis-eval.dts      |  4 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts |  4 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi     | 17 +++---
 arch/arm/boot/dts/tegra124-apalis.dtsi          | 17 +++---
 arch/arm/boot/dts/tegra124-venice2.dts          |  2 +-
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts   |  4 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts      |  4 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi          |  4 +-
 arch/arm/boot/dts/tegra20-harmony.dts           |  2 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts       |  2 +-
 arch/arm/boot/dts/tegra20-paz00.dts             |  2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts          |  2 +-
 arch/arm/boot/dts/tegra20-ventana.dts           |  2 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts       |  2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts  |  4 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi      | 72 +++++++++++--------------
 arch/arm/boot/dts/tegra30-apalis.dtsi           | 70 ++++++++++--------------
 arch/arm/boot/dts/tegra30-cardhu.dtsi           |  2 +-
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts   |  4 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi          | 45 ++++++++--------
 21 files changed, 123 insertions(+), 145 deletions(-)

-- 
2.14.4
