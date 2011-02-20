From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] Misc Tegra patches
Date: Sat, 19 Feb 2011 20:38:53 -0700
Message-ID: <1298173137-9242-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I have various patches for arch/arm/mach-tegra queued up in order to support
the new ASoC driver. This series is all those patches except those that touch
clock-related code, since I need to wait for Colin's series to land first,
then drop some of my patches, and fix up any merge conflicts.

* ARM: tegra: Fix typo in TEGRA_IRQ_TO_GPIO

Simple fix. I think not previously posted.

* ARM: tegra: Prevent requeuing in-progress DMA requests

Already in {android,linux}-tegra-2.6.3[67], but not yet in mainline or
for-next.

* ARM: tegra: pinmux: Expose set_func, add get_*
* ARM: tegra: Move pinmux init call

Those two are needed to support updating tegra2_clocks.c's handling of
cdev[12] (see patch series I posted a while back to linux-tegra@).

I believe the first of these was previously posted, but not yet applied
since it was part of a series that included a number of clock changes
that needed to wait for Colin's clock changes.

The second probably hasn't been posted before, but if it has, this
version also covers the trimslice board.

Stephen Warren (4):
  ARM: tegra: Fix typo in TEGRA_IRQ_TO_GPIO
  ARM: tegra: Prevent requeuing in-progress DMA requests
  ARM: tegra: pinmux: Expose set_func, add get_*
  ARM: tegra: Move pinmux init call

 arch/arm/mach-tegra/board-harmony.c       |    4 +-
 arch/arm/mach-tegra/board-trimslice.c     |    4 +-
 arch/arm/mach-tegra/dma.c                 |    8 ++++
 arch/arm/mach-tegra/include/mach/gpio.h   |    2 +-
 arch/arm/mach-tegra/include/mach/pinmux.h |    9 ++++
 arch/arm/mach-tegra/pinmux.c              |   64 ++++++++++++++++++++++++++---
 6 files changed, 80 insertions(+), 11 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
