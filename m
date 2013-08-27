From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 0/2] ARM: tegra: a late cleanup and a build fix
Date: Tue, 27 Aug 2013 12:52:32 -0600
Message-ID: <1377629554-17490-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Both of these patches should apply wherever Tegra's for-3.12/soc branch
was applied. One is a late cleanup re: ioremap, and the other fixes a
build issue in the cpuidle<->PCIe driver coupling.

Julia Lawall (1):
  PCI: tegra: replace devm_request_and_ioremap by devm_ioremap_resource

Kyle McMartin (1):
  tegra-cpuidle: provide stub when !CONFIG_CPU_IDLE

 drivers/pci/host/pci-tegra.c  | 31 ++++++++++---------------------
 include/linux/tegra-cpuidle.h |  6 ++++++
 2 files changed, 16 insertions(+), 21 deletions(-)

-- 
1.8.1.5
