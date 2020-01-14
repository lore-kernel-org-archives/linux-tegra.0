From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 6/8] i2c: tegra: Use relaxed versions of readl/writel
Date: Tue, 14 Jan 2020 04:34:40 +0300
Message-ID: <20200114013442.28448-7-digetx@gmail.com>
References: <20200114013442.28448-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200114013442.28448-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

There is nothing to synchronize in regards to memory accesses for PIO
transfers and for DMA transfers the DMA API takes care of the syncing.

Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e0eb8f5dcd6b..1a390e1bff72 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -284,12 +284,12 @@ struct tegra_i2c_dev {
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned long reg)
 {
-	writel(val, i2c_dev->base + reg);
+	writel_relaxed(val, i2c_dev->base + reg);
 }
 
 static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
 {
-	return readl(i2c_dev->base + reg);
+	return readl_relaxed(i2c_dev->base + reg);
 }
 
 /*
@@ -307,16 +307,16 @@ static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
 static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned long reg)
 {
-	writel(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+	writel_relaxed(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 
 	/* Read back register to make sure that register writes completed */
 	if (reg != I2C_TX_FIFO)
-		readl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 }
 
 static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
 {
-	return readl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+	return readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 }
 
 static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
@@ -689,12 +689,13 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
 
 		if (i2c_dev->is_curr_atomic_xfer)
-			err = readl_poll_timeout_atomic(addr, val, val == 0,
-							1000,
-							I2C_CONFIG_LOAD_TIMEOUT);
+			err = readl_relaxed_poll_timeout_atomic(
+						addr, val, val == 0, 1000,
+						I2C_CONFIG_LOAD_TIMEOUT);
 		else
-			err = readl_poll_timeout(addr, val, val == 0, 1000,
-						 I2C_CONFIG_LOAD_TIMEOUT);
+			err = readl_relaxed_poll_timeout(
+						addr, val, val == 0, 1000,
+						I2C_CONFIG_LOAD_TIMEOUT);
 
 		if (err) {
 			dev_warn(i2c_dev->dev,
-- 
2.24.0
