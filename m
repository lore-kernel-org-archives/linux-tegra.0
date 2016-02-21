From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] i2c: tegra: don't open code of_device_get_match_data()
Date: Sun, 21 Feb 2016 14:57:42 +0100
Message-ID: <1456063089-3403-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Wolfram Sang <wolfram@the-dreams.de>

This change will also make Coverity happy by avoiding a theoretical NULL
pointer dereference; yet another reason is to use the above helper function
to tighten the code and make it more readable.

Signed-off-by: Wolfram Sang <wolfram@the-dreams.de>
---

Compile tested only; HW test would be much appreciated!

 drivers/i2c/busses/i2c-tegra.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a0522fcc4ff875..929185a7296c0e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -805,9 +805,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->hw = &tegra20_i2c_hw;
 
 	if (pdev->dev.of_node) {
-		const struct of_device_id *match;
-		match = of_match_device(tegra_i2c_of_match, &pdev->dev);
-		i2c_dev->hw = match->data;
+		i2c_dev->hw = of_device_get_match_data(&pdev->dev);
 		i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
 						"nvidia,tegra20-i2c-dvc");
 	} else if (pdev->id == 3) {
-- 
2.7.0
