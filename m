From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: Enable DMA CMA support
Date: Tue,  3 Sep 2013 10:05:05 +0200
Message-ID: <1378195505-28753-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Commit f825c73 ("mm/cma: Move dma contiguous changes into a seperate
config") renamed the CMA option to DMA_CMA but didn't update any default
configurations.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Note that this should be applied after 3.12-rc1, since the above patch
will presumably go into 3.12 during the merge window.

Ideally this would've gone into the original commit and in fact digging
through some archives it turns out that an initial version of the patch
did modify the default configurations, but the hunks were dropped when
the patch was applied because of the potential for merge conflicts...
---
 arch/arm/configs/tegra_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 8c284ff..c5224f0 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -37,6 +37,7 @@ CONFIG_PREEMPT=y
 CONFIG_AEABI=y
 # CONFIG_OABI_COMPAT is not set
 CONFIG_HIGHMEM=y
+CONFIG_CMA=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_KEXEC=y
@@ -82,7 +83,7 @@ CONFIG_RFKILL_GPIO=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
-CONFIG_CMA=y
+CONFIG_DMA_CMA=y
 CONFIG_MTD=y
 CONFIG_MTD_M25P80=y
 CONFIG_PROC_DEVICETREE=y
-- 
1.8.4
