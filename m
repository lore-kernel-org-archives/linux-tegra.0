From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] soc/tegra: fuse: enable nvidia,tegra114-efuse entry for Tegra132
Date: Thu, 5 May 2016 14:12:07 +0800
Message-ID: <1462428727-28080-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In the Tegra132 DTS file, the compatible of fuse node was
set as "nvidia,tegra124-efuse", because the fuse in Tegra132
is same as Tegra124, they are compatible.
But the fuse driver only defined this entry under the
CONFIG_ARCH_TEGRA_124_SOC, so the Tegra132 builds can't find
this entry.
Define this entry under
"CONFIG_ARCH_TEGRA_124_SOC || CONFIG_ARCH_TEGRA_132_SOC"
to fix this problem.

Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index de2c1bfe28b5..1b0a1e13577e 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -104,10 +104,8 @@ static const struct of_device_id tegra_fuse_match[] = {
 #ifdef CONFIG_ARCH_TEGRA_210_SOC
 	{ .compatible = "nvidia,tegra210-efuse", .data = &tegra210_fuse_soc },
 #endif
-#ifdef CONFIG_ARCH_TEGRA_132_SOC
+#if defined CONFIG_ARCH_TEGRA_124_SOC || defined CONFIG_ARCH_TEGRA_132_SOC
 	{ .compatible = "nvidia,tegra132-efuse", .data = &tegra124_fuse_soc },
-#endif
-#ifdef CONFIG_ARCH_TEGRA_124_SOC
 	{ .compatible = "nvidia,tegra124-efuse", .data = &tegra124_fuse_soc },
 #endif
 #ifdef CONFIG_ARCH_TEGRA_114_SOC
-- 
1.9.1
