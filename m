From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 0/2] ARM: tegra: a couple of late DT patches
Date: Fri, 25 Jul 2014 12:40:01 -0600
Message-ID: <1406313603-11893-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Here are a couple of fixe/cleanup patches to Tegra DT files that came in
late. They're based on top of Tegra's for-3.17/dt branch/pull-request.

Marcel Ziswiler (1):
  ARM: tegra: apalis t30: fix device tree compatible node

Thierry Reding (1):
  ARM: tegra: paz00: Fix some indentation inconsistencies

 arch/arm/boot/dts/tegra20-paz00.dts       | 6 +++---
 arch/arm/boot/dts/tegra30-apalis-eval.dts | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.9.1
