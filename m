From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] Tegra 640x480 HDMI audio patches
Date: Fri, 18 Feb 2011 16:18:10 -0700
Message-ID: <1298071093-23865-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch set fixes 640x480 HDMI video clocking, audio over HDMI at 640x80,
and especially 44.1KHz audio at that resolution.

It was generated against linux-tegra-2.6.37, but probably is worth applying
to, or merging into, all of:

for-next
android-tegra-2.6.37
linux-tegra-2.6.37
android-tegra-2.6.36
linux-tegra-2.6.36

Stephen Warren (3):
  ARM: Tegra: Add pll_d table entries for 252MHz
  video: tegra: Fix CTS/N table for 25.2MHz pclk, 44.1Hz audio
  video: tegra: Run pll_d at 252mhz for HDMI 640x480

 arch/arm/mach-tegra/tegra2_clocks.c |    5 +++++
 drivers/video/tegra/dc/dc.c         |    4 +++-
 drivers/video/tegra/dc/hdmi.c       |    2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
