From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 4/9] i2c: tegra: Add missing new line characters
Date: Fri, 26 Aug 2016 14:09:00 +0100
Message-ID: <1472216945-11818-5-git-send-email-jonathanh@nvidia.com>
References: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add missing new line characters for the various error messages.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 7a7f899936a3..7f31a103c04a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -833,7 +833,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	div_clk = devm_clk_get(&pdev->dev, "div-clk");
 	if (IS_ERR(div_clk)) {
-		dev_err(&pdev->dev, "missing controller clock");
+		dev_err(&pdev->dev, "missing controller clock\n");
 		return PTR_ERR(div_clk);
 	}
 
@@ -851,7 +851,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	i2c_dev->rst = devm_reset_control_get(&pdev->dev, "i2c");
 	if (IS_ERR(i2c_dev->rst)) {
-		dev_err(&pdev->dev, "missing controller reset");
+		dev_err(&pdev->dev, "missing controller reset\n");
 		return PTR_ERR(i2c_dev->rst);
 	}
 
@@ -871,7 +871,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev->hw->has_single_clk_source) {
 		fast_clk = devm_clk_get(&pdev->dev, "fast-clk");
 		if (IS_ERR(fast_clk)) {
-			dev_err(&pdev->dev, "missing fast clock");
+			dev_err(&pdev->dev, "missing fast clock\n");
 			return PTR_ERR(fast_clk);
 		}
 		i2c_dev->fast_clk = fast_clk;
@@ -919,7 +919,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	ret = tegra_i2c_init(i2c_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to initialize i2c controller");
+		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
 		goto disable_div_clk;
 	}
 
-- 
2.1.4
