From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: [PATCH 1/1] amba: tegra-ahb: Fix warning w/o PM_SLEEP
Date: Wed, 21 Nov 2012 14:41:37 +0200
Message-ID: <1353501697-25345-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Hiroshi Doyu <hdoyu@nvidia.com>, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Fix build warning w/o PM_SLEEP.

Change-Id: Id5b7d089de835025b5708fa345a75990fd976363

Signed-off-by: Hiroshi Doyu <hdoyu@nvidia.com>
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
