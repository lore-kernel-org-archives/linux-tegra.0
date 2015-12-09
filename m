From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 6/6] drivers/dma: make tegra20-apb-dma.c explicitly non-modular
Date: Wed, 9 Dec 2015 18:22:02 -0500
Message-ID: <1449703322-17762-7-git-send-email-paul.gortmaker@windriver.com>
References: <1449703322-17762-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449703322-17762-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Laxman Dewangan <ldewangan@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/dma/Kconfig:config TEGRA20_APB_DMA
drivers/dma/Kconfig:    bool "NVIDIA Tegra20 APB DMA support"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

We don't replace module.h with init.h since the file already has that.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Vinod Koul <vinod.koul@intel.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/dma/tegra20-apb-dma.c | 35 ++++-------------------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 935da8192f59..eee783cee45b 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -3,6 +3,8 @@
  *
  * Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
  *
+ * Author: Laxman Dewangan <ldewangan@nvidia.com>
+ *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
  * version 2, as published by the Free Software Foundation.
@@ -26,7 +28,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/mm.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_dma.h>
@@ -1309,7 +1310,6 @@ static const struct of_device_id tegra_dma_of_match[] = {
 	}, {
 	},
 };
-MODULE_DEVICE_TABLE(of, tegra_dma_of_match);
 
 static int tegra_dma_probe(struct platform_device *pdev)
 {
@@ -1488,27 +1488,6 @@ err_irq:
 	return ret;
 }
 
-static int tegra_dma_remove(struct platform_device *pdev)
-{
-	struct tegra_dma *tdma = platform_get_drvdata(pdev);
-	int i;
-	struct tegra_dma_channel *tdc;
-
-	dma_async_device_unregister(&tdma->dma_dev);
-
-	for (i = 0; i < tdma->chip_data->nr_channels; ++i) {
-		tdc = &tdma->channels[i];
-		free_irq(tdc->irq, tdc);
-		tasklet_kill(&tdc->tasklet);
-	}
-
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra_dma_runtime_suspend(&pdev->dev);
-
-	return 0;
-}
-
 static int tegra_dma_runtime_suspend(struct device *dev)
 {
 	struct tegra_dma *tdma = dev_get_drvdata(dev);
@@ -1616,15 +1595,9 @@ static struct platform_driver tegra_dmac_driver = {
 	.driver = {
 		.name	= "tegra-apbdma",
 		.pm	= &tegra_dma_dev_pm_ops,
+		.suppress_bind_attrs = true,
 		.of_match_table = tegra_dma_of_match,
 	},
 	.probe		= tegra_dma_probe,
-	.remove		= tegra_dma_remove,
 };
-
-module_platform_driver(tegra_dmac_driver);
-
-MODULE_ALIAS("platform:tegra20-apbdma");
-MODULE_DESCRIPTION("NVIDIA Tegra APB DMA Controller driver");
-MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(tegra_dmac_driver);
-- 
2.6.1
