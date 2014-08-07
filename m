From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 3/4] host1x: mipi: Include clock lanes in mipi calibrate
Date: Thu,  7 Aug 2014 02:11:46 -0400
Message-ID: <1407391907-19488-4-git-send-email-seanpaul@chromium.org>
References: <1407391907-19488-1-git-send-email-seanpaul@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407391907-19488-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When calibrating the mipi phy, also include the clock lanes
in the calibration.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 drivers/gpu/host1x/mipi.c | 70 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 0af2892..80578dc 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -49,10 +49,18 @@
 #define MIPI_CAL_CONFIG_DSIC		0x10
 #define MIPI_CAL_CONFIG_DSID		0x11
 
+#define MIPI_CAL_CONFIG_DSIAB_CLK	0x19
+#define MIPI_CAL_CONFIG_DSICD_CLK	0x1a
+#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
+#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
+#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
+
 #define MIPI_CAL_CONFIG_SELECT		(1 << 21)
 #define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
 #define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
 #define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
+#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) << 8)
+#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
 
 #define MIPI_CAL_BIAS_PAD_CFG0		0x16
 #define MIPI_CAL_BIAS_PAD_PDVCLAMP	(1 << 1)
@@ -64,17 +72,45 @@
 #define MIPI_CAL_BIAS_PAD_PDVREG	(1 << 1)
 
 static const struct module {
-	unsigned long reg;
+	unsigned long data_reg;
+	unsigned long clk_reg;
 } modules[] = {
-	{ .reg = MIPI_CAL_CONFIG_CSIA },
-	{ .reg = MIPI_CAL_CONFIG_CSIB },
-	{ .reg = MIPI_CAL_CONFIG_CSIC },
-	{ .reg = MIPI_CAL_CONFIG_CSID },
-	{ .reg = MIPI_CAL_CONFIG_CSIE },
-	{ .reg = MIPI_CAL_CONFIG_DSIA },
-	{ .reg = MIPI_CAL_CONFIG_DSIB },
-	{ .reg = MIPI_CAL_CONFIG_DSIC },
-	{ .reg = MIPI_CAL_CONFIG_DSID },
+	{
+		.data_reg = MIPI_CAL_CONFIG_CSIA,
+		.clk_reg = MIPI_CAL_CONFIG_CSIAB_CLK
+	},
+	{
+		.data_reg = MIPI_CAL_CONFIG_CSIB,
+		.clk_reg = MIPI_CAL_CONFIG_CSIAB_CLK
+	},
+	{
+		.data_reg = MIPI_CAL_CONFIG_CSIC,
+		.clk_reg = MIPI_CAL_CONFIG_CSICD_CLK
+	},
+	{
+		.data_reg = MIPI_CAL_CONFIG_CSID,
+		.clk_reg = MIPI_CAL_CONFIG_CSICD_CLK
+	},
+	{
+		.data_reg = MIPI_CAL_CONFIG_CSIE,
+		.clk_reg = MIPI_CAL_CONFIG_CSIE_CLK
+	},
+	{
+		.data_reg = MIPI_CAL_CONFIG_DSIA,
+		.clk_reg = MIPI_CAL_CONFIG_DSIAB_CLK
+	},
+	{
+		.data_reg = MIPI_CAL_CONFIG_DSIB,
+		.clk_reg = MIPI_CAL_CONFIG_DSIAB_CLK
+	},
+	{
+		.data_reg = MIPI_CAL_CONFIG_DSIC,
+		.clk_reg = MIPI_CAL_CONFIG_DSICD_CLK
+	},
+	{
+		.data_reg = MIPI_CAL_CONFIG_DSID,
+		.clk_reg = MIPI_CAL_CONFIG_DSICD_CLK
+	},
 };
 
 struct tegra_mipi {
@@ -178,7 +214,7 @@ static int tegra_mipi_wait(struct tegra_mipi *mipi)
 
 int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 {
-	unsigned long value;
+	unsigned long value, clk_value;
 	unsigned int i;
 	int err;
 
@@ -204,15 +240,21 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
 
 	for (i = 0; i < ARRAY_SIZE(modules); i++) {
-		if (device->pads & BIT(i))
+		if (device->pads & BIT(i)) {
 			value = MIPI_CAL_CONFIG_SELECT |
 				MIPI_CAL_CONFIG_HSPDOS(0) |
 				MIPI_CAL_CONFIG_HSPUOS(4) |
 				MIPI_CAL_CONFIG_TERMOS(5);
-		else
+			clk_value = MIPI_CAL_CONFIG_SELECT |
+				    MIPI_CAL_CONFIG_HSCLKPDOSD(0) |
+				    MIPI_CAL_CONFIG_HSCLKPUOSD(4);
+		} else {
 			value = 0;
+			clk_value = 0;
+		}
 
-		tegra_mipi_writel(device->mipi, value, modules[i].reg);
+		tegra_mipi_writel(device->mipi, value, modules[i].data_reg);
+		tegra_mipi_writel(device->mipi, clk_value, modules[i].clk_reg);
 	}
 
 	value = tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
