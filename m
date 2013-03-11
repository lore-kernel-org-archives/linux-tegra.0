From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 3/5] rtc: tegra: use module_platform_driver_probe for module init/exit
Date: Mon, 11 Mar 2013 14:14:26 +0530
Message-ID: <1362991468-30226-4-git-send-email-ldewangan@nvidia.com>
References: <1362991468-30226-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1362991468-30226-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, a.zummo@towertech.it
Cc: swarren@wwwdotorg.org, rtc-linux@googlegroups.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, thierry.reding@avionic-design.de, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Use macro module_platform_driver_probe() to reduce some of the
boilerplate code in the driver.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Reviewed-by: Thierry Reding <thierry.reding@avionic-design.de>
---
Changes from V1:
- Add Thierry's reviewed by.
- No change in code.

 drivers/rtc/rtc-tegra.c |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 6373eb7..c382542 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -450,17 +450,7 @@ static struct platform_driver tegra_rtc_driver = {
 	},
 };
 
-static int __init tegra_rtc_init(void)
-{
-	return platform_driver_probe(&tegra_rtc_driver, tegra_rtc_probe);
-}
-module_init(tegra_rtc_init);
-
-static void __exit tegra_rtc_exit(void)
-{
-	platform_driver_unregister(&tegra_rtc_driver);
-}
-module_exit(tegra_rtc_exit);
+module_platform_driver_probe(tegra_rtc_driver, tegra_rtc_probe);
 
 MODULE_AUTHOR("Jon Mayo <jmayo@nvidia.com>");
 MODULE_DESCRIPTION("driver for Tegra internal RTC");
-- 
1.7.1.1
