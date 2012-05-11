From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 0/4] regulator: tps62360: support dts and enable for tegra-cardhu
Date: Fri, 11 May 2012 12:08:41 +0530
Message-ID: <1336718325-8372-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for dt on regulator device tps62360. Also  enable this regulator for Nvidia's
Tegra platform - cardhu.
This series:
- Make the regulator_init_data as pointer type from platform data.
- enable config variable in tegra defconfig
- add entry for tps62360 in dts file of tegra-cardhu.

Changes from V1:
	Patch 1 did not compile when not defining CONFIG_OF. Fixed it.

Changes from V2:
	Taken care of Grant's review comments.

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
