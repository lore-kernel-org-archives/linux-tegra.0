From: Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/3] ARM: tegra: add speedo identification for T20/T30
Date: Thu, 15 Nov 2012 15:42:31 +0800
Message-ID: <1352965354-650-1-git-send-email-dahuang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series adds speedo identification functionality for tegra
T20 and T30. It reads speedo value from fuse and chooses CPU and core 
process ID by checking speedo corner tables.

V2:
* Split spare fuse related changes to a separate patch
* Keep original fuse init flow on an unknown chip
* Change size check of speedo cornor table
* Set speedo id to 0 with unknown chip revision/SKU
* Set process id to 0 when speedo value out of range

Danny Huang (3):
  ARM: tegra: flexible spare fuse read function
  ARM: tegra: Add speedo-based process identification
  ARM: tegra: T30 speedo-based process identification

 arch/arm/mach-tegra/Makefile         |   2 +
 arch/arm/mach-tegra/fuse.c           |  49 ++++--
 arch/arm/mach-tegra/fuse.h           |  16 ++
 arch/arm/mach-tegra/tegra20_speedo.c | 109 +++++++++++++
 arch/arm/mach-tegra/tegra30_speedo.c | 292 +++++++++++++++++++++++++++++++++++
 5 files changed, 457 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/mach-tegra/tegra20_speedo.c
 create mode 100644 arch/arm/mach-tegra/tegra30_speedo.c

-- 
1.8.0
