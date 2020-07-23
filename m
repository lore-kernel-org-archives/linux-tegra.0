From: Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/7] i2c: tegra: add flag for register write buffering
Date: Thu, 23 Jul 2020 17:48:49 +0530
Message-ID: <1595506733-10307-3-git-send-email-kyarlagadda@nvidia.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595506733-10307-1-git-send-email-kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In chips earlier to Tegra186, register write gets buffered. So to make
sure register writes are completed, there is need to readback the
register. Adding flag to disable this readback for Tegra186 and later
chips.

Signed-off-by: Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a841d6c..bdbbca0 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -220,6 +220,7 @@ struct tegra_i2c_hw_feature {
 	bool has_mst_fifo;
 	const struct i2c_adapter_quirks *quirks;
 	bool supports_bus_clear;
+	bool has_reg_write_buffering;
 	bool has_apb_dma;
 	u8 tlow_std_mode;
 	u8 thigh_std_mode;
@@ -325,8 +326,11 @@ static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 	writel_relaxed(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 
 	/* Read back register to make sure that register writes completed */
-	if (reg != I2C_TX_FIFO)
-		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+	if (i2c_dev->hw->has_reg_write_buffering) {
+		if (reg != I2C_TX_FIFO)
+			readl_relaxed(i2c_dev->base +
+				      tegra_i2c_reg_addr(i2c_dev, reg));
+	}
 }
 
 static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
@@ -1450,6 +1454,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
+	.has_reg_write_buffering = true,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1475,6 +1480,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
+	.has_reg_write_buffering = true,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1500,6 +1506,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
+	.has_reg_write_buffering = true,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1525,6 +1532,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
+	.has_reg_write_buffering = true,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1550,6 +1558,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
+	.has_reg_write_buffering = true,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1575,6 +1584,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
+	.has_reg_write_buffering = false,
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x3,
@@ -1600,6 +1610,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_mst_fifo = true,
 	.quirks = &tegra194_i2c_quirks,
 	.supports_bus_clear = true,
+	.has_reg_write_buffering = false,
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x8,
 	.thigh_std_mode = 0x7,
-- 
2.7.4
