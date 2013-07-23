From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 10/27] drivers/memory: don't check resource with devm_ioremap_resource
Date: Tue, 23 Jul 2013 20:01:43 +0200
Message-ID: <1374602524-3398-11-git-send-email-wsa@the-dreams.de>
References: <1374602524-3398-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1374602524-3398-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

devm_ioremap_resource does sanity checks on the given resource. No need to
duplicate this in the driver.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
Please apply via the subsystem-tree.

 drivers/memory/tegra20-mc.c |    2 --
 drivers/memory/tegra30-mc.c |    2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/memory/tegra20-mc.c b/drivers/memory/tegra20-mc.c
index 0548eea..7cd82b8 100644
--- a/drivers/memory/tegra20-mc.c
+++ b/drivers/memory/tegra20-mc.c
@@ -218,8 +218,6 @@ static int tegra20_mc_probe(struct platform_device *pdev)
 		struct resource *res;
 
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		if (!res)
-			return -ENODEV;
 		mc->regs[i] = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(mc->regs[i]))
 			return PTR_ERR(mc->regs[i]);
diff --git a/drivers/memory/tegra30-mc.c b/drivers/memory/tegra30-mc.c
index 58d2979..ef79345 100644
--- a/drivers/memory/tegra30-mc.c
+++ b/drivers/memory/tegra30-mc.c
@@ -340,8 +340,6 @@ static int tegra30_mc_probe(struct platform_device *pdev)
 		struct resource *res;
 
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		if (!res)
-			return -ENODEV;
 		mc->regs[i] = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(mc->regs[i]))
 			return PTR_ERR(mc->regs[i]);
-- 
1.7.10.4
