From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] amba: tegra-ahb: Fix warning w/o PM_SLEEP
Date: Wed, 21 Nov 2012 13:46:37 +0100
Message-ID: <20121121.144637.924356344656100182.hdoyu@nvidia.com>
References: <1353501697-25345-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353501697-25345-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From cd21894b640d456974920247d2a10421e78ba960 Mon Sep 17 00:00:00 2001
From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Thu, 15 Nov 2012 08:27:41 +0200
Subject: [PATCH 1/1] amba: tegra-ahb: Fix warning w/o PM_SLEEP

Fix build warning w/o PM_SLEEP.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/amba/tegra-ahb.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
index bd5de08..0576a7d 100644
--- a/drivers/amba/tegra-ahb.c
+++ b/drivers/amba/tegra-ahb.c
@@ -157,6 +157,7 @@ int tegra_ahb_enable_smmu(struct device_node *dn)
 EXPORT_SYMBOL(tegra_ahb_enable_smmu);
 #endif
 
+#ifdef CONFIG_PM_SLEEP
 static int tegra_ahb_suspend(struct device *dev)
 {
 	int i;
@@ -176,6 +177,7 @@ static int tegra_ahb_resume(struct device *dev)
 		gizmo_writel(ahb, ahb->ctx[i], tegra_ahb_gizmo[i]);
 	return 0;
 }
+#endif
 
 static UNIVERSAL_DEV_PM_OPS(tegra_ahb_pm,
 			    tegra_ahb_suspend,
-- 
1.7.9.5
