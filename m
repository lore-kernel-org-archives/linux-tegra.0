From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: [PATCH 3/4] bus: tegra-aconnect: make it explicitly non-modular
Date: Sun, 3 Jul 2016 13:30:39 -0400
Message-ID: <20160703173040.23612-4-paul.gortmaker@windriver.com>
References: <20160703173040.23612-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160703173040.23612-1-paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/bus/Kconfig:config TEGRA_ACONNECT
drivers/bus/Kconfig:    bool "Tegra ACONNECT Bus Driver"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Signed-off-by: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
---
 drivers/bus/tegra-aconnect.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/bus/tegra-aconnect.c b/drivers/bus/tegra-aconnect.c
index 7e4104b74fa8..f3982946ab8a 100644
--- a/drivers/bus/tegra-aconnect.c
+++ b/drivers/bus/tegra-aconnect.c
@@ -1,6 +1,8 @@
 /*
  * Tegra ACONNECT Bus Driver
  *
+ * Author: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+ *
  * Copyright (C) 2016, NVIDIA CORPORATION.  All rights reserved.
  *
  * This file is subject to the terms and conditions of the GNU General Public
@@ -9,7 +11,7 @@
  */
 
 #include <linux/clk.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
@@ -66,15 +68,6 @@ clk_destroy:
 	return ret;
 }
 
-static int tegra_aconnect_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
-
-	pm_clk_destroy(&pdev->dev);
-
-	return 0;
-}
-
 static int tegra_aconnect_runtime_resume(struct device *dev)
 {
 	return pm_clk_resume(dev);
@@ -94,19 +87,14 @@ static const struct of_device_id tegra_aconnect_of_match[] = {
 	{ .compatible = "nvidia,tegra210-aconnect", },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, tegra_aconnect_of_match);
 
 static struct platform_driver tegra_aconnect_driver = {
 	.probe = tegra_aconnect_probe,
-	.remove = tegra_aconnect_remove,
 	.driver = {
 		.name = "tegra-aconnect",
+		.suppress_bind_attrs = true,
 		.of_match_table = tegra_aconnect_of_match,
 		.pm = &tegra_aconnect_pm_ops,
 	},
 };
-module_platform_driver(tegra_aconnect_driver);
-
-MODULE_DESCRIPTION("NVIDIA Tegra ACONNECT Bus Driver");
-MODULE_AUTHOR("Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(tegra_aconnect_driver);
-- 
2.8.4
