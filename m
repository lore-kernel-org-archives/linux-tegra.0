From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v1 0/8] ARM: dts: tegra: last minute fixes
Date: Tue,  9 Oct 2018 17:25:15 +0200
Message-ID: <20181009152523.3771-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel@ziswiler.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

This series comes with some last minutes fixes and further clean-up.

Marcel Ziswiler (8):
  ARM: tegra: fix simple-panel compatibles
  ARM: tegra: apalis-tk1/colibri_t20/t30: eval/iris: fix regulator gpio
    enable
  ARM: tegra: apalis/colibri_t30: fix hdmi regulator
  ARM: tegra: colibri_t20: reorder pmic properties
  ARM: tegra: apalis-tk1: further regulator clean-up
  ARM: tegra: apalis_t30/tk1: annotate power I2C being on-module
  ARM: tegra: colibri_t30: further regulator clean-up
  ARM: tegra: apalis_t30: further regulator clean-up

 arch/arm/boot/dts/tegra114-dalmore.dts          |  3 +-
 arch/arm/boot/dts/tegra124-apalis-eval.dts      |  4 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts |  4 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi     | 17 +++--
 arch/arm/boot/dts/tegra124-apalis.dtsi          | 17 +++--
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
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi      | 88 ++++++++++++-------------
 arch/arm/boot/dts/tegra30-apalis.dtsi           | 86 ++++++++++++------------
 arch/arm/boot/dts/tegra30-cardhu.dtsi           |  2 +-
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts   |  4 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi          | 61 +++++++++--------
 21 files changed, 159 insertions(+), 157 deletions(-)

-- 
2.14.4
