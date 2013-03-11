From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V3 3/5] rtc: tegra: use module_platform_driver_probe for module init/exit
Date: Tue, 12 Mar 2013 00:59:59 +0530
Message-ID: <1363030201-14717-4-git-send-email-ldewangan@nvidia.com>
References: <1363030201-14717-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363030201-14717-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, a.zummo@towertech.it
Cc: swarren@wwwdotorg.org, rtc-linux@googlegroups.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, thierry.reding@avionic-design.de, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Use macro module_platform_driver_probe() to reduce some of the
boilerplate code in the driver.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Reviewed-by: Thierry Reding <thierry.reding@avionic-design.de>
Reviewed-by: Stephen Warren <swarren@nvidia.com>
---
Changes from V1:
- Add Thierry's reviewed by.
- No change in code.

Changes from V2:
- Add Stephen's reviewed by.
- No change in code.

 drivers/rtc/rtc-tegra.c |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 9b00bb7..0ef028b 100644
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
