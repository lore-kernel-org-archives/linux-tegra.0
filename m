From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/4] ARM: tegra: Enable SLINK controller driver
Date: Mon, 29 Oct 2012 22:49:36 +0530
Message-ID: <1351531180-1652-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series modify the dts file to add the slink addresses,
make AUXDATA in board dt files, enable slink4 for tegra30-cardhu and
enable slink controller defconfig.

Changes from V1:
- Remove changes from clock tables.
- Make the dma req dt property name to nvidia,dma-request-selector.
- change the spi max frequency prop to spi-max-frequency.

Laxman Dewangan (4):
  ARM: tegra: dts: add slink controller dt entry
  ARM: tegra: Add OF_DEV_AUXDATA for SLINK driver in board dt
  ARM: tegra: dts: cardhu: enable SLINK4
  ARM: tegra: config: enable spi driver for Tegra SLINK controller

 arch/arm/boot/dts/tegra20.dtsi           |   40 ++++++++++++++++++++
 arch/arm/boot/dts/tegra30-cardhu.dtsi    |    5 ++
 arch/arm/boot/dts/tegra30.dtsi           |   60 ++++++++++++++++++++++++++++++
 arch/arm/configs/tegra_defconfig         |    2 +-
 arch/arm/mach-tegra/board-dt-tegra20.c   |    8 ++++
 arch/arm/mach-tegra/board-dt-tegra30.c   |   12 ++++++
 arch/arm/mach-tegra/include/mach/iomap.h |   22 +++++++----
 7 files changed, 140 insertions(+), 9 deletions(-)
