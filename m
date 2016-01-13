From: Wei Ni <wni@nvidia.com>
Subject: [PATCH V1 02/10] thermal: tegra: combine sensor group-related data
Date: Wed, 13 Jan 2016 15:58:41 +0800
Message-ID: <1452671929-32740-3-git-send-email-wni@nvidia.com>
References: <1452671929-32740-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452671929-32740-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, mikko.perttunen@kapsi.fi, swarren@wwwdotorg.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Combine sensor group-related data structures into struct
tegra_tsensor_group. This provides a single location for
sensor group data storage.
More sensor group data will be added in subsequent patches.

Get rid of T124-specific PDIV/HOTSPOT hack.
tegra-soctherm.c contained a hack to set the SENSOR_PDIV and
SENSOR_HOTSPOT_OFFSET registers - it just did two writes of
T124-specific opaque values.  Convert these into a form that can be
substituted on a per-chip basis, and into structure fields that have
at least some independent meaning.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 drivers/thermal/tegra/tegra_soctherm.c          | 165 +++++++++++++++++++-----
 include/dt-bindings/thermal/tegra124-soctherm.h |   1 +
 2 files changed, 135 insertions(+), 31 deletions(-)

diff --git a/drivers/thermal/tegra/tegra_soctherm.c b/drivers/thermal/tegra/tegra_soctherm.c
index 74ea5765938b..80d97151739e 100644
--- a/drivers/thermal/tegra/tegra_soctherm.c
+++ b/drivers/thermal/tegra/tegra_soctherm.c
@@ -28,6 +28,7 @@
 #include <linux/thermal.h>
 
 #include <soc/tegra/fuse.h>
+#include <dt-bindings/thermal/tegra124-soctherm.h>
 
 #define SENSOR_CONFIG0				0
 #define SENSOR_CONFIG0_STOP			BIT(0)
@@ -47,13 +48,23 @@
 #define SENSOR_CONFIG2_THERMB_SHIFT		0
 
 #define SENSOR_PDIV				0x1c0
-#define SENSOR_PDIV_T124			0x8888
+#define SENSOR_PDIV_CPU_MASK			(0xf << 12)
+#define SENSOR_PDIV_GPU_MASK			(0xf << 8)
+#define SENSOR_PDIV_MEM_MASK			(0xf << 4)
+#define SENSOR_PDIV_PLLX_MASK			(0xf << 0)
+
 #define SENSOR_HOTSPOT_OFF			0x1c4
-#define SENSOR_HOTSPOT_OFF_T124			0x00060600
+#define SENSOR_HOTSPOT_CPU_MASK			(0xff << 16)
+#define SENSOR_HOTSPOT_GPU_MASK			(0xff << 8)
+#define SENSOR_HOTSPOT_MEM_MASK			(0xff << 0)
+
 #define SENSOR_TEMP1				0x1c8
+#define SENSOR_TEMP1_CPU_TEMP_MASK		(0xffff << 16)
+#define SENSOR_TEMP1_GPU_TEMP_MASK		0xffff
 #define SENSOR_TEMP2				0x1cc
+#define SENSOR_TEMP2_MEM_TEMP_MASK		(0xffff << 16)
+#define SENSOR_TEMP2_PLLX_TEMP_MASK		0xffff
 
-#define SENSOR_TEMP_MASK			0xffff
 #define READBACK_VALUE_MASK			0xff00
 #define READBACK_VALUE_SHIFT			8
 #define READBACK_ADD_HALF			BIT(7)
@@ -77,8 +88,36 @@
 #define NOMINAL_CALIB_FT_T124			105
 #define NOMINAL_CALIB_CP_T124			25
 
+/* get val from register(r) mask bits(m) */
+#define REG_GET_MASK(r, m)	(((r) & (m)) >> (ffs(m) - 1))
+/* set val(v) to mask bits(m) of register(r) */
+#define REG_SET_MASK(r, m, v)	(((r) & ~(m)) | \
+				 (((v) & (m >> (ffs(m) - 1))) << (ffs(m) - 1)))
+
+/**
+ * struct tegra_tsensor_group - SOC_THERM sensor group data
+ * @name: short name of the temperature sensor group
+ * @id: numeric ID of the temperature sensor group
+ * @sensor_temp_offset: offset of the SENSOR_TEMP* register
+ * @sensor_temp_mask: bit mask for this sensor group in SENSOR_TEMP* register
+ * @pdiv: the sensor count post-divider to use during runtime
+ * @pdiv_ate: the sensor count post-divider used during automated test
+ * @pdiv_mask: register bitfield mask for the PDIV field for this sensor
+ * @pllx_hotspot_diff: hotspot offset from the PLLX sensor, must be 0 for
+    PLLX sensor group
+ * @pllx_hotspot_mask: register bitfield mask for the HOTSPOT field
+ */
+struct tegra_tsensor_group {
+	const char	*name;
+	u8		id;
+	u16		sensor_temp_offset;
+	u32		sensor_temp_mask;
+	u32		pdiv, pdiv_ate, pdiv_mask;
+	u32		pllx_hotspot_diff, pllx_hotspot_mask;
+};
+
 struct tegra_tsensor_configuration {
-	u32 tall, tsample, tiddq_en, ten_count, pdiv, tsample_ate, pdiv_ate;
+	u32 tall, tiddq_en, ten_count, tsample, tsample_ate;
 };
 
 struct tegra_tsensor {
@@ -86,21 +125,74 @@ struct tegra_tsensor {
 	u32 base, calib_fuse_offset;
 	/* Correction values used to modify values read from calibration fuses */
 	s32 fuse_corr_alpha, fuse_corr_beta;
+	const struct tegra_tsensor_group *group;
 };
 
 struct tegra_thermctl_zone {
 	void __iomem *reg;
-	unsigned int shift;
+	u32 mask;
 };
 
 static const struct tegra_tsensor_configuration t124_tsensor_config = {
 	.tall = 16300,
-	.tsample = 120,
 	.tiddq_en = 1,
 	.ten_count = 1,
-	.pdiv = 8,
+	.tsample = 120,
 	.tsample_ate = 480,
-	.pdiv_ate = 8
+};
+
+static struct tegra_tsensor_group tegra124_tsensor_group_cpu = {
+	.id				= TEGRA124_SOCTHERM_SENSOR_CPU,
+	.name				= "cpu",
+	.sensor_temp_offset		= SENSOR_TEMP1,
+	.sensor_temp_mask		= SENSOR_TEMP1_CPU_TEMP_MASK,
+	.pdiv				= 8,
+	.pdiv_ate			= 8,
+	.pdiv_mask			= SENSOR_PDIV_CPU_MASK,
+	.pllx_hotspot_diff		= 10,
+	.pllx_hotspot_mask		= SENSOR_HOTSPOT_CPU_MASK,
+};
+
+static struct tegra_tsensor_group tegra124_tsensor_group_gpu = {
+	.id				= TEGRA124_SOCTHERM_SENSOR_GPU,
+	.name				= "gpu",
+	.sensor_temp_offset		= SENSOR_TEMP1,
+	.sensor_temp_mask		= SENSOR_TEMP1_GPU_TEMP_MASK,
+	.pdiv				= 8,
+	.pdiv_ate			= 8,
+	.pdiv_mask			= SENSOR_PDIV_GPU_MASK,
+	.pllx_hotspot_diff		= 5,
+	.pllx_hotspot_mask		= SENSOR_HOTSPOT_GPU_MASK,
+};
+
+static struct tegra_tsensor_group tegra124_tsensor_group_pll = {
+	.id				= TEGRA124_SOCTHERM_SENSOR_PLLX,
+	.name				= "pll",
+	.sensor_temp_offset		= SENSOR_TEMP2,
+	.sensor_temp_mask		= SENSOR_TEMP2_PLLX_TEMP_MASK,
+	.pdiv				= 8,
+	.pdiv_ate			= 8,
+	.pdiv_mask			= SENSOR_PDIV_PLLX_MASK,
+	.pllx_hotspot_diff		= 0,
+	.pllx_hotspot_mask		= SENSOR_HOTSPOT_MEM_MASK,
+};
+
+static struct tegra_tsensor_group tegra124_tsensor_group_mem = {
+	.id				= TEGRA124_SOCTHERM_SENSOR_MEM,
+	.name				= "mem",
+	.sensor_temp_offset		= SENSOR_TEMP2,
+	.sensor_temp_mask		= SENSOR_TEMP2_MEM_TEMP_MASK,
+	.pdiv				= 8,
+	.pdiv_ate			= 8,
+	.pdiv_mask			= SENSOR_PDIV_MEM_MASK,
+};
+
+static struct tegra_tsensor_group *
+tegra124_tsensor_groups[TEGRA124_SOCTHERM_SENSOR_NUM] = {
+	&tegra124_tsensor_group_cpu,
+	&tegra124_tsensor_group_gpu,
+	&tegra124_tsensor_group_pll,
+	&tegra124_tsensor_group_mem,
 };
 
 static const struct tegra_tsensor t124_tsensors[] = {
@@ -110,6 +202,7 @@ static const struct tegra_tsensor t124_tsensors[] = {
 		.calib_fuse_offset = 0x098,
 		.fuse_corr_alpha = 1135400,
 		.fuse_corr_beta = -6266900,
+		.group = &tegra124_tsensor_group_cpu,
 	},
 	{
 		.config = &t124_tsensor_config,
@@ -117,6 +210,7 @@ static const struct tegra_tsensor t124_tsensors[] = {
 		.calib_fuse_offset = 0x084,
 		.fuse_corr_alpha = 1122220,
 		.fuse_corr_beta = -5700700,
+		.group = &tegra124_tsensor_group_cpu,
 	},
 	{
 		.config = &t124_tsensor_config,
@@ -124,6 +218,7 @@ static const struct tegra_tsensor t124_tsensors[] = {
 		.calib_fuse_offset = 0x088,
 		.fuse_corr_alpha = 1127000,
 		.fuse_corr_beta = -6768200,
+		.group = &tegra124_tsensor_group_cpu,
 	},
 	{
 		.config = &t124_tsensor_config,
@@ -131,6 +226,7 @@ static const struct tegra_tsensor t124_tsensors[] = {
 		.calib_fuse_offset = 0x12c,
 		.fuse_corr_alpha = 1110900,
 		.fuse_corr_beta = -6232000,
+		.group = &tegra124_tsensor_group_cpu,
 	},
 	{
 		.config = &t124_tsensor_config,
@@ -138,6 +234,7 @@ static const struct tegra_tsensor t124_tsensors[] = {
 		.calib_fuse_offset = 0x158,
 		.fuse_corr_alpha = 1122300,
 		.fuse_corr_beta = -5936400,
+		.group = &tegra124_tsensor_group_mem,
 	},
 	{
 		.config = &t124_tsensor_config,
@@ -145,6 +242,7 @@ static const struct tegra_tsensor t124_tsensors[] = {
 		.calib_fuse_offset = 0x15c,
 		.fuse_corr_alpha = 1145700,
 		.fuse_corr_beta = -7124600,
+		.group = &tegra124_tsensor_group_mem,
 	},
 	{
 		.config = &t124_tsensor_config,
@@ -152,6 +250,7 @@ static const struct tegra_tsensor t124_tsensors[] = {
 		.calib_fuse_offset = 0x154,
 		.fuse_corr_alpha = 1120100,
 		.fuse_corr_beta = -6000500,
+		.group = &tegra124_tsensor_group_gpu,
 	},
 	{
 		.config = &t124_tsensor_config,
@@ -159,6 +258,7 @@ static const struct tegra_tsensor t124_tsensors[] = {
 		.calib_fuse_offset = 0x160,
 		.fuse_corr_alpha = 1106500,
 		.fuse_corr_beta = -6729300,
+		.group = &tegra124_tsensor_group_pll,
 	},
 };
 
@@ -168,7 +268,7 @@ struct tegra_soctherm {
 	struct clk *clock_soctherm;
 	void __iomem *regs;
 
-	struct thermal_zone_device *thermctl_tzs[4];
+	struct thermal_zone_device *thermctl_tzs[TEGRA124_SOCTHERM_SENSOR_NUM];
 };
 
 struct tsensor_shared_calibration {
@@ -237,8 +337,8 @@ calculate_tsensor_calibration(const struct tegra_tsensor *sensor,
 	delta_sens = actual_tsensor_ft - actual_tsensor_cp;
 	delta_temp = shared->actual_temp_ft - shared->actual_temp_cp;
 
-	mult = sensor->config->pdiv * sensor->config->tsample_ate;
-	div = sensor->config->tsample * sensor->config->pdiv_ate;
+	mult = sensor->group->pdiv * sensor->config->tsample_ate;
+	div = sensor->config->tsample * sensor->group->pdiv_ate;
 
 	therma = div64_s64_precise((s64) delta_temp * (1LL << 13) * mult,
 				   (s64) delta_sens * div);
@@ -311,7 +411,8 @@ static int tegra_thermctl_get_temp(void *data, int *out_temp)
 	struct tegra_thermctl_zone *zone = data;
 	u32 val;
 
-	val = (readl(zone->reg) >> zone->shift) & SENSOR_TEMP_MASK;
+	val = readl(zone->reg);
+	val = REG_GET_MASK(val, zone->mask);
 	*out_temp = translate_temp(val);
 
 	return 0;
@@ -327,18 +428,6 @@ static const struct of_device_id tegra_soctherm_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_soctherm_of_match);
 
-struct thermctl_zone_desc {
-	unsigned int offset;
-	unsigned int shift;
-};
-
-static const struct thermctl_zone_desc t124_thermctl_temp_zones[] = {
-	{ SENSOR_TEMP1, 16 },
-	{ SENSOR_TEMP2, 16 },
-	{ SENSOR_TEMP1, 0 },
-	{ SENSOR_TEMP2, 0 }
-};
-
 static int tegra_soctherm_probe(struct platform_device *pdev)
 {
 	struct tegra_soctherm *tegra;
@@ -347,8 +436,10 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 	struct resource *res;
 	unsigned int i;
 	int err;
+	u32 pdiv, hotspot;
 
 	const struct tegra_tsensor *tsensors = t124_tsensors;
+	struct tegra_tsensor_group **ttgs = tegra124_tsensor_groups;
 
 	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
 	if (!tegra)
@@ -403,12 +494,23 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 			goto disable_clocks;
 	}
 
-	writel(SENSOR_PDIV_T124, tegra->regs + SENSOR_PDIV);
-	writel(SENSOR_HOTSPOT_OFF_T124, tegra->regs + SENSOR_HOTSPOT_OFF);
+	/* program pdiv and hotspot offsets per THERM */
+	pdiv = readl(tegra->regs + SENSOR_PDIV);
+	hotspot = readl(tegra->regs + SENSOR_HOTSPOT_OFF);
+	for (i = 0; i < TEGRA124_SOCTHERM_SENSOR_NUM; ++i) {
+		pdiv = REG_SET_MASK(pdiv, ttgs[i]->pdiv_mask,
+				   ttgs[i]->pdiv);
+		if (ttgs[i]->id != TEGRA124_SOCTHERM_SENSOR_PLLX)
+			hotspot =  REG_SET_MASK(hotspot,
+						ttgs[i]->pllx_hotspot_mask,
+						ttgs[i]->pllx_hotspot_diff);
+	}
+	writel(pdiv, tegra->regs + SENSOR_PDIV);
+	writel(hotspot, tegra->regs + SENSOR_HOTSPOT_OFF);
 
 	/* Initialize thermctl sensors */
 
-	for (i = 0; i < ARRAY_SIZE(tegra->thermctl_tzs); ++i) {
+	for (i = 0; i < TEGRA124_SOCTHERM_SENSOR_NUM; ++i) {
 		struct tegra_thermctl_zone *zone =
 			devm_kzalloc(&pdev->dev, sizeof(*zone), GFP_KERNEL);
 		if (!zone) {
@@ -416,10 +518,11 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 			goto unregister_tzs;
 		}
 
-		zone->reg = tegra->regs + t124_thermctl_temp_zones[i].offset;
-		zone->shift = t124_thermctl_temp_zones[i].shift;
+		zone->reg = tegra->regs + ttgs[i]->sensor_temp_offset;
+		zone->mask = ttgs[i]->sensor_temp_mask;
 
-		tz = thermal_zone_of_sensor_register(&pdev->dev, i, zone,
+		tz = thermal_zone_of_sensor_register(&pdev->dev,
+						     ttgs[i]->id, zone,
 						     &tegra_of_thermal_ops);
 		if (IS_ERR(tz)) {
 			err = PTR_ERR(tz);
@@ -428,7 +531,7 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 			goto unregister_tzs;
 		}
 
-		tegra->thermctl_tzs[i] = tz;
+		tegra->thermctl_tzs[ttgs[i]->id] = tz;
 	}
 
 	return 0;
diff --git a/include/dt-bindings/thermal/tegra124-soctherm.h b/include/dt-bindings/thermal/tegra124-soctherm.h
index 85aaf66690f9..729ab9fc325e 100644
--- a/include/dt-bindings/thermal/tegra124-soctherm.h
+++ b/include/dt-bindings/thermal/tegra124-soctherm.h
@@ -9,5 +9,6 @@
 #define TEGRA124_SOCTHERM_SENSOR_MEM 1
 #define TEGRA124_SOCTHERM_SENSOR_GPU 2
 #define TEGRA124_SOCTHERM_SENSOR_PLLX 3
+#define TEGRA124_SOCTHERM_SENSOR_NUM 4
 
 #endif
-- 
1.9.1
