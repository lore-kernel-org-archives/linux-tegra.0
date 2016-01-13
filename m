From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1 00/10] Add T210 support in tegra_soctherm
Date: Wed, 13 Jan 2016 15:58:39 +0800
Message-ID: <1452671929-32740-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patchset adds following functions for tegra_soctherm driver:
1. add T210 support.
2. export debugfs to show some registers.
3. add thermtrip funciton.
4. add suspend/resume function.

Wei Ni (10):
  thermal: tegra: move tegra thermal files into tegra directory
  thermal: tegra: combine sensor group-related data
  thermal: tegra: split tegra_soctherm driver
  thermal: tegra: add T210-specific SOC_THERM driver
  thermal: tegra: add sysfs to dump registers
  of: Add bindings of hw-trips for soctherm
  thermal: tegra: add thermtrip function
  thermal: tegra: add PM support
  arm64: tegra: add soctherm node for Tegra210
  ARM: tegra: set hw trips for Tegra124

 .../devicetree/bindings/thermal/tegra-soctherm.txt |  29 +
 arch/arm/boot/dts/tegra124.dtsi                    |   9 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  56 ++
 drivers/thermal/Kconfig                            |  15 +-
 drivers/thermal/Makefile                           |   2 +-
 drivers/thermal/tegra/Kconfig                      |  24 +
 drivers/thermal/tegra/Makefile                     |   8 +
 drivers/thermal/tegra/tegra124_soctherm.c          | 237 +++++++
 drivers/thermal/tegra/tegra210_soctherm.c          | 246 +++++++
 drivers/thermal/tegra/tegra_soctherm.c             | 722 +++++++++++++++++++++
 drivers/thermal/tegra/tegra_soctherm.h             | 120 ++++
 drivers/thermal/tegra/tegra_soctherm_fuse.c        | 154 +++++
 drivers/thermal/tegra_soctherm.c                   | 476 --------------
 include/dt-bindings/thermal/tegra124-soctherm.h    |   1 +
 14 files changed, 1612 insertions(+), 487 deletions(-)
 create mode 100644 drivers/thermal/tegra/Kconfig
 create mode 100644 drivers/thermal/tegra/Makefile
 create mode 100644 drivers/thermal/tegra/tegra124_soctherm.c
 create mode 100644 drivers/thermal/tegra/tegra210_soctherm.c
 create mode 100644 drivers/thermal/tegra/tegra_soctherm.c
 create mode 100644 drivers/thermal/tegra/tegra_soctherm.h
 create mode 100644 drivers/thermal/tegra/tegra_soctherm_fuse.c
 delete mode 100644 drivers/thermal/tegra_soctherm.c

-- 
1.9.1
