From: Shardar Shariff Md <smohammed@nvidia.com>
Subject: [PATCH v11 2/5] i2c: tegra: If fifo flush fails return error
Date: Wed, 31 Aug 2016 18:58:41 +0530
Message-ID: <1472650124-5702-2-git-send-email-smohammed@nvidia.com>
References: <1472650124-5702-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472650124-5702-1-git-send-email-smohammed@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: smohammed@nvidia.com, wsa@the-dreams.de, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, ldewangan@nvidia.com
List-Id: linux-tegra@vger.kernel.org

During i2c controller initialization, when fifo flush fails return error
instead of returning the error during exit.

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>

---
Changes in v11:
- Fix smatch error for below warning
  tegra_i2c_init warn: unused return: err = tegra_i2c_flush_fifos()
---
---
 drivers/i2c/busses/i2c-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e93c72a..07a39b7 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -494,6 +494,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	i2c_writel(i2c_dev, val, I2C_FIFO_CONTROL);
 
 	err = tegra_i2c_flush_fifos(i2c_dev);
+	if (err)
+		goto err;
 
 	if (i2c_dev->is_multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
 		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
-- 
1.8.1.5
