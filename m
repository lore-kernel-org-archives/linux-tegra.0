From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/5] i2c: tegra: use clk_disable_unprepare in place of clk_disable
Date: Tue, 10 Jul 2012 16:50:41 +0530
Message-ID: <1341919244-23327-3-git-send-email-ldewangan@nvidia.com>
References: <1341919244-23327-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1341919244-23327-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: w.sang@pengutronix.de, khali@linux-fr.org, ben-linux@fluff.org
Cc: swarren@nvidia.com, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Use clk_disable_unprepare() inplace of clk_disable().
This was missed as part of moving clock enable/disable to
prepare/unprepare for using the common clock framework.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
This is already discussed in patch
[PATCH] i2c: tegra: use clk_disable_unprepare in place of clk_disable
for applying in Wolfram Tree. Resending this as patch series.

 drivers/i2c/busses/i2c-tegra.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 00cdc10..d071cf0 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -696,7 +696,7 @@ static int __devinit tegra_i2c_probe(struct platform_device *pdev)
 	ret = i2c_add_numbered_adapter(&i2c_dev->adapter);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add I2C adapter\n");
-		clk_disable(i2c_dev->i2c_clk);
+		clk_disable_unprepare(i2c_dev->i2c_clk);
 		return ret;
 	}
 
-- 
1.7.1.1
