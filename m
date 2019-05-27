From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/3] rtc: tegra: Turn into regular driver
Date: Mon, 27 May 2019 12:13:59 +0200
Message-ID: <20190527101359.5898-4-thierry.reding@gmail.com>
References: <20190527101359.5898-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527101359.5898-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Kartik Kartik <kkartik@nvidia.com>, linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Drivers registered with module_platform_driver_probe() are considered
non-hotpluggable, which among other things means that they don't support
deferred probe. However, recent changes in how the ARM SMMU works have
required the BPMP (which is the clock provider on Tegra186 and later) be
bound to the SMMU, which in turn means that the BPMP driver can defer
probe and hence clocks become available much later than they used to.
For most other drivers this is not a problem because they already
properly support deferred probe, but rtc-tegra is the odd one out that
now fails to probe and will therefore never be registered.

Fix this by making the driver a regular driver that supports unloading
and deferred probe.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/rtc/rtc-tegra.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index b68ba2dd1d36..8bbaea24926e 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -2,7 +2,7 @@
 /*
  * An RTC driver for the NVIDIA Tegra 200 series internal RTC.
  *
- * Copyright (c) 2010, NVIDIA Corporation.
+ * Copyright (c) 2010-2019, NVIDIA Corporation.
  */
 
 #include <linux/clk.h>
@@ -274,7 +274,7 @@ static const struct of_device_id tegra_rtc_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_rtc_dt_match);
 
-static int __init tegra_rtc_probe(struct platform_device *pdev)
+static int tegra_rtc_probe(struct platform_device *pdev)
 {
 	struct tegra_rtc_info *info;
 	struct resource *res;
@@ -406,6 +406,7 @@ static void tegra_rtc_shutdown(struct platform_device *pdev)
 }
 
 static struct platform_driver tegra_rtc_driver = {
+	.probe = tegra_rtc_probe,
 	.remove = tegra_rtc_remove,
 	.shutdown = tegra_rtc_shutdown,
 	.driver = {
@@ -414,8 +415,7 @@ static struct platform_driver tegra_rtc_driver = {
 		.pm = &tegra_rtc_pm_ops,
 	},
 };
-
-module_platform_driver_probe(tegra_rtc_driver, tegra_rtc_probe);
+module_platform_driver(tegra_rtc_driver);
 
 MODULE_AUTHOR("Jon Mayo <jmayo@nvidia.com>");
 MODULE_DESCRIPTION("driver for Tegra internal RTC");
-- 
2.21.0
