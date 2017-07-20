From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: [PATCH 0/9] Bringing Asus TF300T support to mainline
Date: Thu, 20 Jul 2017 02:14:16 +0200
Message-ID: <cover.1500509346.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Here is a suprisingly small set of patches that enable Asus TF300T tablet
to boot and have all cores available. TF300T is one of a consumer devices
based on NVidia's Cardhu reference tablet.

This series is an arch-dependent part. The rest being driver code - a work
in progress - is available in branch tf300t at:

	https://rere.qmqm.pl/git/linux

Best Regards,
Michał Mirosław

---
Michał Mirosław (9):
  ARM: enable secure platform-only erratas
  arm: cache-l2x0: remove duplicate warning
  arm: cache-l2x0: share l2x0_base
  ARM: trusted_foundations: enable L2x0 cache via firmware_ops
  ARM: trusted_foundations: announce firmware version
  ARM: init: update secondary_data register documentation
  ARM: tegra: enable cache via TF
  ARM: tegra: avoid touching Secure registers in reset handler
  ARM: tegra: fix sleeping while atomic in CPU idle

 arch/arm/Kconfig                           | 20 +++++++---
 arch/arm/firmware/trusted_foundations.c    | 63 +++++++++++++++++++++++++++++-
 arch/arm/include/asm/hardware/cache-l2x0.h |  6 ++-
 arch/arm/kernel/head.S                     |  4 +-
 arch/arm/mach-tegra/reset-handler.S        | 27 ++++++++++++-
 arch/arm/mm/cache-l2x0-pmu.c               |  8 +---
 arch/arm/mm/cache-l2x0.c                   | 26 ++++++------
 drivers/soc/tegra/pmc.c                    |  2 -
 8 files changed, 125 insertions(+), 31 deletions(-)

-- 
2.11.0
