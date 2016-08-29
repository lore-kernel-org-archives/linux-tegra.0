From: Shardar Shariff Md <smohammed@nvidia.com>
Subject: [PATCH v9 3/4] i2c: tegra: use atomic poll function during configuration
Date: Mon, 29 Aug 2016 22:06:38 +0530
Message-ID: <1472488599-13562-3-git-send-email-smohammed@nvidia.com>
References: <1472488599-13562-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472488599-13562-1-git-send-email-smohammed@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: smohammed@nvidia.com, ldewangan@nvidia.com, wsa@the-dreams.de, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Use readl_poll_timeout_atomic() function as *wait_for_config_load()
function can be called from atomic context.

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index da79c5e..e849a44 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -437,8 +437,13 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 		reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
 		addr = i2c_dev->base + reg_offset;
 		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
-		err = readl_poll_timeout(addr, val, val == 0, 1000,
-					 I2C_CONFIG_LOAD_TIMEOUT);
+		if (in_atomic() || irqs_disabled())
+			err = readl_poll_timeout_atomic(addr, val, val == 0,
+					1000, I2C_CONFIG_LOAD_TIMEOUT);
+		else
+			err = readl_poll_timeout(addr, val, val == 0,
+					1000, I2C_CONFIG_LOAD_TIMEOUT);
+
 		if (err) {
 			dev_warn(i2c_dev->dev,
 				 "timeout waiting for config load\n");
-- 
1.8.1.5
