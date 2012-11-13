From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] ARM: tegra: dt: Add entry for tegra20 sflash controller.
Date: Tue, 13 Nov 2012 10:33:38 +0530
Message-ID: <1352783021-25393-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series add the dt entry for tegra20 sflash controller,
add AUXDATA in board dt file for driver name and enable in tegra_defconfig.

Laxman Dewangan (3):
  ARM: tegra: dts: add sflash controller dt entry
  ARM: tegra: Add OF_DEV_AUXDATA for sflash driver in board dt
  ARM: config: tegra: enable SFLASH controller driver

 arch/arm/boot/dts/tegra20.dtsi         |   10 ++++++++++
 arch/arm/configs/tegra_defconfig       |    1 +
 arch/arm/mach-tegra/board-dt-tegra20.c |    2 ++
 3 files changed, 13 insertions(+), 0 deletions(-)
