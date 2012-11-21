From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] memory: tegra30: Fix warning w/o PM_SLEEP
Date: Wed, 21 Nov 2012 14:42:15 +0200
Message-ID: <1353501740-25420-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Axel Lin <axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Fix build warning w/o PM_SLEEP.

Change-Id: I713f7dd697f1ad9fb1fee56b389b0d6c45bb540c

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/memory/tegra30-mc.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/memory/tegra30-mc.c b/drivers/memory/tegra30-mc.c
index 802b9ea..cf10b77 100644
--- a/drivers/memory/tegra30-mc.c
+++ b/drivers/memory/tegra30-mc.c
@@ -267,6 +267,7 @@ static const u32 tegra30_mc_ctx[] = {
 	MC_INTMASK,
 };
 
+#ifdef CONFIG_PM_SLEEP
 static int tegra30_mc_suspend(struct device *dev)
 {
 	int i;
@@ -290,6 +291,7 @@ static int tegra30_mc_resume(struct device *dev)
 	mc_readl(mc, MC_TIMING_CONTROL);
 	return 0;
 }
+#endif
 
 static UNIVERSAL_DEV_PM_OPS(tegra30_mc_pm,
 			    tegra30_mc_suspend,
-- 
1.7.9.5
