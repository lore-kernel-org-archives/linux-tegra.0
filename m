From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: [PATCH 1/1] amba: tegra-ahb: Fix build error w/ PM_SLEEP w/o PM_RUNTIME
Date: Thu, 14 Mar 2013 11:08:09 +0200
Message-ID: <1363252089-4120-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>
Cc: linux-tegra@vger.kernel.org, Hiroshi Doyu <hdoyu@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Make this depend on CONFIG_PM. This protection is necessary to not
cause any build errors with any combination of PM features especially
when supporting a new SoC where each PM features are being enabled
one-by-one during its depelopment.

Signed-off-by: Hiroshi Doyu <hdoyu@nvidia.com>
Reported-by: Joseph Lo <josephl@nvidia.com>
---
 drivers/amba/tegra-ahb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
index 093c435..1f44e56 100644
--- a/drivers/amba/tegra-ahb.c
+++ b/drivers/amba/tegra-ahb.c
@@ -158,7 +158,7 @@ int tegra_ahb_enable_smmu(struct device_node *dn)
 EXPORT_SYMBOL(tegra_ahb_enable_smmu);
 #endif
 
-#ifdef CONFIG_PM_SLEEP
+#ifdef CONFIG_PM
 static int tegra_ahb_suspend(struct device *dev)
 {
 	int i;
-- 
1.8.1.5
