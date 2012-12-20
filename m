From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/9] ARM: Initial support for Tegra 114 SoC.
Date: Thu, 20 Dec 2012 11:43:58 +0200
Message-ID: <1355996654-6579-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

This patchset adds initial support for the NVIDIA's new Tegra 114
SoC (T114) based on the ARM Cortex-A15 MP. It has the minimal support
to allow the kernel to boot up into shell console. This can be used as
a basis for adding other device drivers for this SoC. Currently there
are 2 evaluation boards available, "Dalmore" and "Pluto".

This patchset is against Stephen Warren's linux-next_common branch:

  git://nv-tegra.nvidia.com/user/swarren/linux-2.6 linux-next_common

For those who want to try:

  $ make ARCH=arm tegra_defconfig
  $ scripts/config -e ARCH_TEGRA_114_SOC -d DRM -d SUSPEND \
    	-d PM_RUNTIME -d CPU_FREQ -d CPU_IDLE
  $ make ARCH=arm menuconfig # if needed to configure more
  $ make ARCH=arm all -j9

Verified that this single image booted up with "Dalmore(T114)",
"Pluto(T114)" and "Cardhu(T30)". For "Cardhu(T30)" with this single
image, SPI driver doesn't seem to afford the above configuration , it
hangs at boot-up. With SPI disabled, it's ok.


Hiroshi Doyu (9):
  ARM: tegra: fuse: Add chipid TEGRA114 0x35
  HACK: ARM: tegra: Use CLK_IGNORE_UNUSED for Tegra 114 SoC
  ARM: tegra: # of CPU cores detection w/ & w/o HAVE_ARM_SCU
  clocksource: tegra: Reorganize funcs by clock functionarities
  clocksource: tegra: Enable ARM arch_timer with TSC
  ARM: dt: tegra114: Add new SoC base, Tegra 114 SoC
  ARM: dt: tegra114: Add new board, Dalmore
  ARM: dt: tegra114: Add new board, Pluto
  ARM: tegra: Add initial support for Tegra 114 SoC.

 .../bindings/arm/tegra/nvidia,tegra114-tsc.txt     |   11 +
 arch/arm/boot/dts/Makefile                         |    4 +-
 arch/arm/boot/dts/tegra114-dalmore.dts             |   21 ++
 arch/arm/boot/dts/tegra114-pluto.dts               |   21 ++
 arch/arm/boot/dts/tegra114.dtsi                    |   89 ++++++++
 arch/arm/mach-tegra/Kconfig                        |   10 +
 arch/arm/mach-tegra/Makefile                       |    1 +
 arch/arm/mach-tegra/board-dt-tegra114.c            |   48 +++++
 arch/arm/mach-tegra/common.c                       |    1 +
 arch/arm/mach-tegra/fuse.h                         |    1 +
 arch/arm/mach-tegra/platsmp.c                      |   31 ++-
 arch/arm/mach-tegra/tegra30_clocks_data.c          |    2 +
 drivers/clocksource/tegra20_timer.c                |  222 +++++++++++++-------
 13 files changed, 384 insertions(+), 78 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra114-tsc.txt
 create mode 100644 arch/arm/boot/dts/tegra114-dalmore.dts
 create mode 100644 arch/arm/boot/dts/tegra114-pluto.dts
 create mode 100644 arch/arm/boot/dts/tegra114.dtsi
 create mode 100644 arch/arm/mach-tegra/board-dt-tegra114.c

-- 
1.7.9.5
