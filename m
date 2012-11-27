From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: [PATCH 1/1] memory: tegra30: Fix warning w/o PM_SLEEP
Date: Tue, 27 Nov 2012 08:48:35 +0200
Message-ID: <1353998915-13263-1-git-send-email-hdoyu@nvidia.com>
References: <20121126234729.GA19416@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121126234729.GA19416@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: swarren@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Hiroshi Doyu <hdoyu@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Fix build warning w/o PM_SLEEP.

Signed-off-by: Hiroshi Doyu <hdoyu@nvidia.com>
Reviewed-by: Stephen Warren <swarren@nvidia.com>
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
