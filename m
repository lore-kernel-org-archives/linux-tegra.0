From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/6] i2c: tegra: Add missing new line characters
Date: Thu, 11 Aug 2016 11:16:55 +0100
Message-ID: <1470910620-9898-2-git-send-email-jonathanh@nvidia.com>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add missing new line characters for the various error messages.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b126dbaa47e3..93b09396a10f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -825,7 +825,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	div_clk = devm_clk_get(&pdev->dev, "div-clk");
 	if (IS_ERR(div_clk)) {
-		dev_err(&pdev->dev, "missing controller clock");
+		dev_err(&pdev->dev, "missing controller clock\n");
 		return PTR_ERR(div_clk);
 	}
 
@@ -843,7 +843,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	i2c_dev->rst = devm_reset_control_get(&pdev->dev, "i2c");
 	if (IS_ERR(i2c_dev->rst)) {
-		dev_err(&pdev->dev, "missing controller reset");
+		dev_err(&pdev->dev, "missing controller reset\n");
 		return PTR_ERR(i2c_dev->rst);
 	}
 
@@ -863,7 +863,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev->hw->has_single_clk_source) {
 		fast_clk = devm_clk_get(&pdev->dev, "fast-clk");
 		if (IS_ERR(fast_clk)) {
-			dev_err(&pdev->dev, "missing fast clock");
+			dev_err(&pdev->dev, "missing fast clock\n");
 			return PTR_ERR(fast_clk);
 		}
 		i2c_dev->fast_clk = fast_clk;
@@ -911,7 +911,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	ret = tegra_i2c_init(i2c_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to initialize i2c controller");
+		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
 		goto disable_div_clk;
 	}
 
-- 
2.1.4
