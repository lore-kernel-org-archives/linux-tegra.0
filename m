From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V4 00/11] Add T210 support in Tegra soctherm
Date: Mon, 25 Jan 2016 18:43:15 +0800
Message-ID: <1453718595-4019-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patchset adds following functions for tegra_soctherm driver:
1. add T210 support.
2. export debugfs to show some registers.
3. add thermtrip funciton.
4. add suspend/resume function.

The V3 serial is in:
http://www.spinics.net/lists/linux-tegra/msg24911.html
The V2 serial is in:
http://www.spinics.net/lists/linux-tegra/msg24901.html
The V1 serial is in:
http://www.spinics.net/lists/linux-tegra/msg24808.html

Main changes from V3:
1. Change structures to "const" in chip specific files
2. Minor changes per Thieery's comments.

Main changes from V2:
1. Fix build error in patch [1/11].
2. Use of_get_child_by_name instead of of_find_node_by_name in patch [8/11].
3. Use debugfs_remove_recursive to remove debugfs in patch [6/11].

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
  of: Add bindings of hw-trip-points for soctherm
  thermal: tegra: add thermtrip function
  thermal: tegra: add PM support
  arm64: tegra: add soctherm node for Tegra210
  ARM: tegra: set thermtrip for Tegra124

 .../devicetree/bindings/thermal/tegra-soctherm.txt |  24 +
 arch/arm/boot/dts/tegra124.dtsi                    |   9 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  53 ++
 drivers/thermal/Kconfig                            |  12 +-
 drivers/thermal/Makefile                           |   2 +-
 drivers/thermal/tegra/Kconfig                      |  13 +
 drivers/thermal/tegra/Makefile                     |   5 +
 drivers/thermal/tegra/soctherm-fuse.c              | 169 +++++
 drivers/thermal/tegra/soctherm.c                   | 806 +++++++++++++++++++++
 drivers/thermal/tegra/soctherm.h                   | 123 ++++
 drivers/thermal/tegra/tegra124-soctherm.c          | 196 +++++
 drivers/thermal/tegra/tegra210-soctherm.c          | 197 +++++
 drivers/thermal/tegra_soctherm.c                   | 476 ------------
 include/dt-bindings/thermal/tegra124-soctherm.h    |   1 +
 14 files changed, 1599 insertions(+), 487 deletions(-)
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
