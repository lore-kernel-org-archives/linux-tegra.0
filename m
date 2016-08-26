From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 1/9] i2c: tegra: Fix lines over 80 characters
Date: Fri, 26 Aug 2016 14:08:57 +0100
Message-ID: <1472216945-11818-2-git-send-email-jonathanh@nvidia.com>
References: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Checkpatch warns about some lines over 80 characters in the Tegra I2C
driver and so fix these.

While we are at it, prefix the second instance of "STOP condition" in
the comment with a "the".

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d9979da11485..b90bc326907d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -193,7 +193,8 @@ struct tegra_i2c_dev {
 	bool is_multimaster_mode;
 };
 
-static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned long reg)
+static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
+		       unsigned long reg)
 {
 	writel(val, i2c_dev->base + reg);
 }
@@ -643,9 +644,10 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		return 0;
 
 	/*
-	 * NACK interrupt is generated before the I2C controller generates the
-	 * STOP condition on the bus. So wait for 2 clock periods before resetting
-	 * the controller so that STOP condition has been delivered properly.
+	 * NACK interrupt is generated before the I2C controller generates
+	 * the STOP condition on the bus. So wait for 2 clock periods
+	 * before resetting the controller so that the STOP condition has
+	 * been delivered properly.
 	 */
 	if (i2c_dev->msg_err == I2C_ERR_NO_ACK)
 		udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->bus_clk_rate));
-- 
2.1.4
