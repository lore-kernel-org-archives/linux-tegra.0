From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 0/4] regulator: tps62360: support dts and enable for tegra-cardhu
Date: Fri, 11 May 2012 02:19:35 +0530
Message-ID: <1336682979-11810-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@secretlab.ca, rob.herring@calxeda.com, linux@arm.linux.org.uk, lrg@ti.com, broonie@opensource.wolfsonmicro.com, swarren@nvidia.com, olof@lixom.net
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add support for dt on regulator device tps62360. Also  enable this regulator for Nvidia's
Tegra platform - cardhu.
This series:
- Make the regulator_init_data as pointer type from platform data.
- enable config variable in tegra defconfig
- add entry for tps62360 in dts file of tegra-cardhu.

Changes from V1:
Patch 2 did not compile when not defining CONFIG_OF. Fixed it.

Laxman Dewangan (4):
  regulator: tps62360: make init_data of platform data to pointer.
	Make the regulator init data as pointer type in platform.
  regulator: tps62360: add dt support
	Ad dt support.
  ARM: tegra: config: enable REGULATOR_TPS62360
  ARM: dt: tegra: cardhu: register core regulator tps62360

 .../bindings/regulator/tps62360-regulator.txt      |   45 ++++++++++++
 arch/arm/boot/dts/tegra-cardhu.dts                 |   14 ++++
 arch/arm/configs/tegra_defconfig                   |    1 +
 drivers/regulator/tps62360-regulator.c             |   74 +++++++++++++++++++-
 include/linux/regulator/tps62360.h                 |    4 +-
 5 files changed, 133 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/tps62360-regulator.txt
