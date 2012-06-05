From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/4] i2c: tegra: add PROTOCOL_MANGLING as supported functionality.
Date: Tue, 5 Jun 2012 18:39:58 +0530
Message-ID: <1338901800-23968-3-git-send-email-ldewangan@nvidia.com>
References: <1338901800-23968-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1338901800-23968-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khali@linux-fr.org, w.sang@pengutronix.de, ben-linux@fluff.org, swarren@wwwdotorg.org, olof@lixom.net
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Tegra i2c driver supports the I2C_M_IGNORE_NAK and hence
returning I2C_FUNC_PROTOCOL_MANGLING as supported functionality.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index fa92396..36d8725 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -572,7 +572,8 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 
 static u32 tegra_i2c_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_10BIT_ADDR;
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_10BIT_ADDR |
+		I2C_FUNC_PROTOCOL_MANGLING;
 }
 
 static const struct i2c_algorithm tegra_i2c_algo = {
-- 
1.7.1.1
