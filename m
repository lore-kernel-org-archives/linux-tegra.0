From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 4/5] rtc: tegra: set irq name as device name
Date: Sat, 9 Mar 2013 23:39:48 +0530
Message-ID: <1362852588-13362-5-git-send-email-ldewangan@nvidia.com>
References: <1362852588-13362-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1362852588-13362-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, a.zummo@towertech.it
Cc: swarren@wwwdotorg.org, rtc-linux@googlegroups.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When watching the irq name of tegra rtc, it shows as "rtc alarm"
which actually does not reflect the name related to driver.

Passing the device name to have the irq names with driver name.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/rtc/rtc-tegra.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 4cba10d..8186405 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -361,7 +361,7 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, info->tegra_rtc_irq,
 			tegra_rtc_irq_handler, IRQF_TRIGGER_HIGH,
-			"rtc alarm", &pdev->dev);
+			dev_name(&pdev->dev), &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"Unable to request interrupt for device (err=%d).\n",
-- 
1.7.1.1
