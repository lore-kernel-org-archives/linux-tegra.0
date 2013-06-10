From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 3/4] power: tps65090-charger: Add dt node to power_supply
Date: Mon, 10 Jun 2013 17:26:41 -0400
Message-ID: <1370899602-22123-4-git-send-email-rklein@nvidia.com>
References: <1370899602-22123-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1370899602-22123-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <cbou@mail.ru>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Passing in the dt node for this charger enables the logic in the core
to lookup this device, to see if it is supplying another power_supply,
through dt.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/power/tps65090-charger.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/power/tps65090-charger.c b/drivers/power/tps65090-charger.c
index 77ab856..3f4b9cc 100644
--- a/drivers/power/tps65090-charger.c
+++ b/drivers/power/tps65090-charger.c
@@ -230,6 +230,7 @@ static int tps65090_charger_probe(struct platform_device *pdev)
 	cdata->ac.num_properties	= ARRAY_SIZE(tps65090_ac_props);
 	cdata->ac.supplied_to		= pdata->supplied_to;
 	cdata->ac.num_supplicants	= pdata->num_supplicants;
+	cdata->ac.of_node		= pdev->dev.of_node;
 
 	ret = power_supply_register(&pdev->dev, &cdata->ac);
 	if (ret) {
-- 
1.7.9.5
