From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/5] rtc: tegra: protect suspend/resume callbacks with CONFIG_PM_SLEEP
Date: Sat, 9 Mar 2013 23:39:45 +0530
Message-ID: <1362852588-13362-2-git-send-email-ldewangan@nvidia.com>
References: <1362852588-13362-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362852588-13362-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The CONFIG_PM doesn't actually enable any of the PM callbacks, it
only allows to enable CONFIG_PM_SLEEP and CONFIG_PM_RUNTIME.
This means if CONFIG_PM is used to protect system sleep callbacks
then it may end up unreferenced if only runtime PM is enabled.
Hence protecting sleep callbacks with CONFIG_PM_SLEEP.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/rtc/rtc-tegra.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 0020bab..d64cde6 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -390,7 +390,7 @@ static int __exit tegra_rtc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
+#ifdef CONFIG_PM_SLEEP
 static int tegra_rtc_suspend(struct platform_device *pdev, pm_message_t state)
 {
 	struct device *dev = &pdev->dev;
@@ -446,7 +446,7 @@ static struct platform_driver tegra_rtc_driver = {
 		.owner	= THIS_MODULE,
 		.of_match_table = tegra_rtc_dt_match,
 	},
-#ifdef CONFIG_PM
+#ifdef CONFIG_PM_SLEEP
 	.suspend	= tegra_rtc_suspend,
 	.resume		= tegra_rtc_resume,
 #endif
-- 
1.7.1.1
