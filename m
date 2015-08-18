From: Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 08/37] watchdog: tegra: Fix parent of watchdog_device
Date: Tue, 18 Aug 2015 10:17:41 +0530
Message-ID: <19025137fe5de0f76ff991038866aeeb84035532.1439524806.git.panand@redhat.com>
References: <cover.1439524806.git.panand@redhat.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1439524806.git.panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <cover.1439524806.git.panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
References: <cover.1439524806.git.panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dzickus-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Fix parent of watchdog_device so that /sys/class/watchdog/watchdogn/device
is populated.

cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/watchdog/tegra_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/tegra_wdt.c b/drivers/watchdog/tegra_wdt.c
index 30451ea46902..7f97cdd53f29 100644
--- a/drivers/watchdog/tegra_wdt.c
+++ b/drivers/watchdog/tegra_wdt.c
@@ -218,6 +218,7 @@ static int tegra_wdt_probe(struct platform_device *pdev)
 	wdd->ops = &tegra_wdt_ops;
 	wdd->min_timeout = MIN_WDT_TIMEOUT;
 	wdd->max_timeout = MAX_WDT_TIMEOUT;
+	wdd->parent = &pdev->dev;
 
 	watchdog_set_drvdata(wdd, wdt);
 
-- 
2.4.3
