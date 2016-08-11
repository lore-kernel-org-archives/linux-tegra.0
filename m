From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/6] i2c: tegra: Remove non device-tree support
Date: Thu, 11 Aug 2016 11:16:56 +0100
Message-ID: <1470910620-9898-3-git-send-email-jonathanh@nvidia.com>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra has only supported device-tree for platform/board configuration
for quite some time now and so simplify the Tegra I2C driver by dropping
code for non device-tree platforms/boards.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 93b09396a10f..412b914fa84b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -851,13 +851,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	i2c_dev->hw = &tegra20_i2c_hw;
 
-	if (pdev->dev.of_node) {
-		i2c_dev->hw = of_device_get_match_data(&pdev->dev);
-		i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
-						"nvidia,tegra20-i2c-dvc");
-	} else if (pdev->id == 3) {
-		i2c_dev->is_dvc = 1;
-	}
+	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
+	i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
+						  "nvidia,tegra20-i2c-dvc");
 	init_completion(&i2c_dev->msg_complete);
 
 	if (!i2c_dev->hw->has_single_clk_source) {
-- 
2.1.4
