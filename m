From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 030/102] i2c: tegra: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:25:34 +0200
Message-ID: <20170719152646.25903-31-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
Sender: linux-i2c-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-i2c@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4af9bbae20dfd..a23884445fa2f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -911,7 +911,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->cont_id = pdev->id;
 	i2c_dev->dev = &pdev->dev;
 
-	i2c_dev->rst = devm_reset_control_get(&pdev->dev, "i2c");
+	i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
 	if (IS_ERR(i2c_dev->rst)) {
 		dev_err(&pdev->dev, "missing controller reset\n");
 		return PTR_ERR(i2c_dev->rst);
-- 
2.11.0
