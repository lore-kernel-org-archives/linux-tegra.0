From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V3 4/5] rtc: tegra: set irq name as device name
Date: Tue, 12 Mar 2013 01:00:00 +0530
Message-ID: <1363030201-14717-5-git-send-email-ldewangan@nvidia.com>
References: <1363030201-14717-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363030201-14717-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, a.zummo@towertech.it
Cc: swarren@wwwdotorg.org, rtc-linux@googlegroups.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, thierry.reding@avionic-design.de, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When watching the irq name of tegra rtc, it shows as "rtc alarm"
which actually does not reflect the name related to driver.

Passing the device name to have the irq names with driver name.

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

 drivers/rtc/rtc-tegra.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 0ef028b..e9f0d53 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -362,7 +362,7 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, info->tegra_rtc_irq,
 			tegra_rtc_irq_handler, IRQF_TRIGGER_HIGH,
-			"rtc alarm", &pdev->dev);
+			dev_name(&pdev->dev), &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"Unable to request interrupt for device (err=%d).\n",
-- 
1.7.1.1
