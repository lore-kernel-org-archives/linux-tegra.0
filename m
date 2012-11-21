From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] memory: tegra30: Fix warning w/o PM_SLEEP
Date: Wed, 21 Nov 2012 13:47:27 +0100
Message-ID: <20121121.144727.1842286617829159643.hdoyu@nvidia.com>
References: <1353501740-25420-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353501740-25420-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From 2257f87f95c3982aac7c30389357db66f597c083 Mon Sep 17 00:00:00 2001
From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Thu, 15 Nov 2012 08:28:39 +0200
Subject: [PATCH 1/1] memory: tegra30: Fix warning w/o PM_SLEEP

Fix build warning w/o PM_SLEEP.

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
