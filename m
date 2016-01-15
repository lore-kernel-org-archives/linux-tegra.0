From: Wei Ni <wni@nvidia.com>
Subject: [PATCH V2 00/11] Add T210 support in Tegra soctherm
Date: Fri, 15 Jan 2016 18:24:48 +0800
Message-ID: <1452853499-5115-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, rui.zhang@intel.com
Cc: MLongnecker@nvidia.com, swarren@wwwdotorg.org, mikko.perttunen@kapsi.fi, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patchset adds following functions for tegra_soctherm driver:
1. add T210 support.
2. export debugfs to show some registers.
3. add thermtrip funciton.
4. add suspend/resume function.

The V1 serial is in
http://www.gossamer-threads.com/lists/linux/kernel/2343518

Main changes from V1:
1. Use the new type to handl different Tegra chips in one driver,
which suggested by Thierry.
2. Changes per Thieery's other comments.

Wei Ni (11):
  thermal: tegra: move tegra thermal files into tegra directory
  thermal: tegra: combine sensor group-related data
  thermal: tegra: get rid of PDIV/HOTSPOT hack
  thermal: tegra: split tegra_soctherm driver
  thermal: tegra: add T210-specific SOC_THERM driver
  thermal: tegra: add a debugfs to show registers
  of: Add bindings of hw-trips for soctherm
  thermal: tegra: add thermtrip function
  thermal: tegra: add PM support
  arm64: tegra: add soctherm node for Tegra210
  ARM: tegra: set hw trips for Tegra124

 .../devicetree/bindings/thermal/tegra-soctherm.txt |  24 +
 arch/arm/boot/dts/tegra124.dtsi                    |   9 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  53 ++
 drivers/thermal/Kconfig                            |  12 +-
 drivers/thermal/Makefile                           |   2 +-
 drivers/thermal/tegra/Kconfig                      |  13 +
 drivers/thermal/tegra/Makefile                     |   5 +
 drivers/thermal/tegra/soctherm-fuse.c              | 155 ++++
 drivers/thermal/tegra/soctherm.c                   | 782 +++++++++++++++++++++
 drivers/thermal/tegra/soctherm.h                   | 125 ++++
 drivers/thermal/tegra/tegra124-soctherm.c          | 207 ++++++
 drivers/thermal/tegra/tegra210-soctherm.c          | 208 ++++++
 drivers/thermal/tegra_soctherm.c                   | 476 -------------
 include/dt-bindings/thermal/tegra124-soctherm.h    |   1 +
 14 files changed, 1585 insertions(+), 487 deletions(-)
 create mode 100644 drivers/thermal/tegra/Kconfig
 create mode 100644 drivers/thermal/tegra/Makefile
 create mode 100644 drivers/thermal/tegra/soctherm-fuse.c
 create mode 100644 drivers/thermal/tegra/soctherm.c
 create mode 100644 drivers/thermal/tegra/soctherm.h
 create mode 100644 drivers/thermal/tegra/tegra124-soctherm.c
 create mode 100644 drivers/thermal/tegra/tegra210-soctherm.c
 delete mode 100644 drivers/thermal/tegra_soctherm.c

-- 
1.9.1
