From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] i2c: tegra: Correct error path in probe
Date: Tue, 14 Jun 2016 21:26:46 +0100
Message-ID: <1465936007-18599-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Shardar Shariff Md <smohammed@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Commit 497fbe24987b ("i2c: tegra: enable multi master mode for tegra210")
enables the Tegra I2C 'div_clk' for adapters using the multi-master mode
during the device probe. Although the probe error path was updated to
disable the clock on probe failure, there is one place after calling
tegra_i2c_init() where the clock will not be disabled on failure. Correct
the error path so that the 'div_clk' is disabled if calling
tegra_i2c_init() fails.

Fixes: 497fbe24987b ("i2c: tegra: enable multi master mode for tegra210")

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 445398c314a3..b126dbaa47e3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -912,7 +912,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	ret = tegra_i2c_init(i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize i2c controller");
-		goto unprepare_div_clk;
+		goto disable_div_clk;
 	}
 
 	ret = devm_request_irq(&pdev->dev, i2c_dev->irq,
-- 
2.1.4
