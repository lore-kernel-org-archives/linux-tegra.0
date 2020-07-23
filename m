From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [PATCH 2/7] i2c: tegra: Fix setting of controller ID
Date: Thu, 23 Jul 2020 17:48:48 +0530
Message-ID: <1595506733-10307-2-git-send-email-kyarlagadda@nvidia.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: digetx@gmail.com, linux-i2c@vger.kernel.org, thierry.reding@gmail.com
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ldewangan@nvidia.com, smohammed@nvidia.com, rgumasta@nvidia.com, Krishna Yarlagadda <kyarlagadda@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Shardar Shariff Md <smohammed@nvidia.com>

Assign controller id with adapter number as it (cont_id) is passed
through DT(through alias). Mask with controller id mask to avoid
overflow other fields when single device is present and id is -1.

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c6c870c..a841d6c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -83,6 +83,7 @@
 #define PACKET_HEADER0_CONT_ID			GENMASK(15, 12)
 #define PACKET_HEADER0_PROTOCOL			GENMASK(7, 4)
 #define PACKET_HEADER0_PROTOCOL_I2C		1
+#define PACKET_HEADER0_CONT_ID_MASK		0xF
 
 #define I2C_HEADER_CONT_ON_NAK			BIT(21)
 #define I2C_HEADER_READ				BIT(19)
@@ -1669,7 +1670,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->adapter.retries = 1;
 	i2c_dev->adapter.timeout = 6 * HZ;
 	i2c_dev->irq = irq;
-	i2c_dev->cont_id = pdev->id;
 	i2c_dev->dev = &pdev->dev;
 
 	i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
@@ -1807,6 +1807,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		goto release_dma;
 
+	i2c_dev->cont_id = i2c_dev->adapter.nr & PACKET_HEADER0_CONT_ID_MASK;
 	pm_runtime_put(&pdev->dev);
 
 	return 0;
-- 
2.7.4
