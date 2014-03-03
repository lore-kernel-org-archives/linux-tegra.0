From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: Allocate 64 MiB for CMA by default
Date: Mon,  3 Mar 2014 16:31:08 +0100
Message-ID: <1393860668-31996-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The default size of 16 MiB reserved for CMA is not enough for the
majority of use-cases, so set it to something more sensible.

Note that users can still override this via the cma kernel command-line
argument, which takes precendence over the default specified in the
kernel configuration file.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 81a325eda7b7..5bc752c6d732 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -88,6 +88,7 @@ CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_EXTRA_FIRMWARE="nouveau/nvea_fuc409c nouveau/nvea_fuc409d nouveau/nvea_fuc41ac nouveau/nvea_fuc41ad vic03_ucode.bin gk20a.bin"
 CONFIG_DMA_BUF_TEST=y
 CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_MTD=y
 CONFIG_MTD_M25P80=y
 CONFIG_PROC_DEVICETREE=y
-- 
1.8.4.2
