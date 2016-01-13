From: Wei Ni <wni@nvidia.com>
Subject: [PATCH V1 03/10] thermal: tegra: split tegra_soctherm driver
Date: Wed, 13 Jan 2016 15:58:42 +0800
Message-ID: <1452671929-32740-4-git-send-email-wni@nvidia.com>
References: <1452671929-32740-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452671929-32740-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, mikko.perttunen@kapsi.fi, swarren@wwwdotorg.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Split most of the T124 data and code into a T124-specific driver.
Split most of the fuse-related code into a fuse-related source file.
Now drivers/thermal/tegra_soctherm.c contains common SOC_THERM library
code.  This is in preparation for adding a T210-specific driver in a
future patch.

Beyond the maintainability improvements, this is intended to separate
chip-specific ATE and characterization-related hacks into chip-specific
drivers, in the hopes that they won't pollute code for other chips.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 drivers/thermal/tegra/Kconfig               |   8 +-
 drivers/thermal/tegra/Makefile              |   3 +-
 drivers/thermal/tegra/tegra124_soctherm.c   | 201 +++++++++++++++++
 drivers/thermal/tegra/tegra_soctherm.c      | 333 ++--------------------------
 drivers/thermal/tegra/tegra_soctherm.h      | 106 +++++++++
 drivers/thermal/tegra/tegra_soctherm_fuse.c | 143 ++++++++++++
 6 files changed, 474 insertions(+), 320 deletions(-)
 create mode 100644 drivers/thermal/tegra/tegra124_soctherm.c
 create mode 100644 drivers/thermal/tegra/tegra_soctherm.h
 create mode 100644 drivers/thermal/tegra/tegra_soctherm_fuse.c

diff --git a/drivers/thermal/tegra/Kconfig b/drivers/thermal/tegra/Kconfig
index a6e6cd4528dc..ae7e5e93dab9 100644
--- a/drivers/thermal/tegra/Kconfig
+++ b/drivers/thermal/tegra/Kconfig
@@ -1,6 +1,10 @@
 config TEGRA_SOCTHERM
-	tristate "Tegra SOCTHERM thermal management"
-	depends on ARCH_TEGRA
+	bool
+
+config TEGRA124_SOCTHERM
+	bool "Tegra124 SOCTHERM thermal management"
+	depends on ARCH_TEGRA_124_SOC
+	select TEGRA_SOCTHERM
 	help
 	  Enable this option for integrated thermal management support on NVIDIA
 	  Tegra124 systems-on-chip. The driver supports four thermal zones
diff --git a/drivers/thermal/tegra/Makefile b/drivers/thermal/tegra/Makefile
index 8c51076e4b1e..7a864ec07a25 100644
--- a/drivers/thermal/tegra/Makefile
+++ b/drivers/thermal/tegra/Makefile
@@ -3,4 +3,5 @@
 #
 
 # Tegra soc thermal drivers
-obj-$(CONFIG_TEGRA_SOCTHERM)	+= tegra_soctherm.o
+obj-$(CONFIG_TEGRA_SOCTHERM)	+= tegra_soctherm.o tegra_soctherm_fuse.o
+obj-$(CONFIG_TEGRA124_SOCTHERM)	+= tegra124_soctherm.o
diff --git a/drivers/thermal/tegra/tegra124_soctherm.c b/drivers/thermal/tegra/tegra124_soctherm.c
new file mode 100644
index 000000000000..56bf26d58a04
--- /dev/null
+++ b/drivers/thermal/tegra/tegra124_soctherm.c
@@ -0,0 +1,201 @@
+/*
+ * Copyright (c) 2014-2016, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/thermal/tegra124-soctherm.h>
+
+#include "tegra_soctherm.h"
+
+static const struct tegra_tsensor_configuration t124_tsensor_config = {
+	.tall = 16300,
+	.tiddq_en = 1,
+	.ten_count = 1,
+	.tsample = 120,
+	.tsample_ate = 480,
+};
+
+static const struct tegra_tsensor_group tegra124_tsensor_group_cpu = {
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
+static const struct tegra_tsensor_group tegra124_tsensor_group_gpu = {
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
+static const struct tegra_tsensor_group tegra124_tsensor_group_pll = {
+	.id				= TEGRA124_SOCTHERM_SENSOR_PLLX,
+	.name				= "pll",
+	.sensor_temp_offset		= SENSOR_TEMP2,
+	.sensor_temp_mask		= SENSOR_TEMP2_PLLX_TEMP_MASK,
+	.pdiv				= 8,
+	.pdiv_ate			= 8,
+	.pdiv_mask			= SENSOR_PDIV_PLLX_MASK,
+};
+
+static const struct tegra_tsensor_group tegra124_tsensor_group_mem = {
+	.id				= TEGRA124_SOCTHERM_SENSOR_MEM,
+	.name				= "mem",
+	.sensor_temp_offset		= SENSOR_TEMP2,
+	.sensor_temp_mask		= SENSOR_TEMP2_MEM_TEMP_MASK,
+	.pdiv				= 8,
+	.pdiv_ate			= 8,
+	.pdiv_mask			= SENSOR_PDIV_MEM_MASK,
+	.pllx_hotspot_diff		= 0,
+	.pllx_hotspot_mask		= SENSOR_HOTSPOT_MEM_MASK,
+};
+
+static const struct tegra_tsensor_group *
+tegra124_tsensor_groups[TEGRA124_SOCTHERM_SENSOR_NUM] = {
+	&tegra124_tsensor_group_cpu,
+	&tegra124_tsensor_group_gpu,
+	&tegra124_tsensor_group_pll,
+	&tegra124_tsensor_group_mem,
+};
+
+static struct tegra_tsensor tegra124_tsensors[] = {
+	{
+		.name = "cpu0",
+		.base = 0xc0,
+		.config = &t124_tsensor_config,
+		.calib_fuse_offset = 0x098,
+		.fuse_corr_alpha = 1135400,
+		.fuse_corr_beta = -6266900,
+		.group = &tegra124_tsensor_group_cpu,
+	},
+	{
+		.name = "cpu1",
+		.base = 0xe0,
+		.config = &t124_tsensor_config,
+		.calib_fuse_offset = 0x084,
+		.fuse_corr_alpha = 1122220,
+		.fuse_corr_beta = -5700700,
+		.group = &tegra124_tsensor_group_cpu,
+	},
+	{
+		.name = "cpu2",
+		.base = 0x100,
+		.config = &t124_tsensor_config,
+		.calib_fuse_offset = 0x088,
+		.fuse_corr_alpha = 1127000,
+		.fuse_corr_beta = -6768200,
+		.group = &tegra124_tsensor_group_cpu,
+	},
+	{
+		.name = "cpu3",
+		.base = 0x120,
+		.config = &t124_tsensor_config,
+		.calib_fuse_offset = 0x12c,
+		.fuse_corr_alpha = 1110900,
+		.fuse_corr_beta = -6232000,
+		.group = &tegra124_tsensor_group_cpu,
+	},
+	{
+		.name = "mem0",
+		.base = 0x140,
+		.config = &t124_tsensor_config,
+		.calib_fuse_offset = 0x158,
+		.fuse_corr_alpha = 1122300,
+		.fuse_corr_beta = -5936400,
+		.group = &tegra124_tsensor_group_mem,
+	},
+	{
+		.name = "mem1",
+		.base = 0x160,
+		.config = &t124_tsensor_config,
+		.calib_fuse_offset = 0x15c,
+		.fuse_corr_alpha = 1145700,
+		.fuse_corr_beta = -7124600,
+		.group = &tegra124_tsensor_group_mem,
+	},
+	{
+		.name = "gpu",
+		.base = 0x180,
+		.config = &t124_tsensor_config,
+		.calib_fuse_offset = 0x154,
+		.fuse_corr_alpha = 1120100,
+		.fuse_corr_beta = -6000500,
+		.group = &tegra124_tsensor_group_gpu,
+	},
+	{
+		.name = "pllx",
+		.base = 0x1a0,
+		.config = &t124_tsensor_config,
+		.calib_fuse_offset = 0x160,
+		.fuse_corr_alpha = 1106500,
+		.fuse_corr_beta = -6729300,
+		.group = &tegra124_tsensor_group_pll,
+	},
+	{ .name = NULL },
+};
+
+/*
+ * Mask/shift bits in FUSE_TSENSOR_COMMON and
+ * FUSE_TSENSOR_COMMON, which are described in
+ * tegra_soctherm_fuse.c
+ */
+static const struct tegra_soctherm_fuse tegra124_soctherm_fuse = {
+	.fuse_base_cp_mask = 0x3ff,
+	.fuse_base_cp_shift = 0,
+	.fuse_base_ft_mask = 0x7ff << 10,
+	.fuse_base_ft_shift = 10,
+	.fuse_shift_ft_mask = 0x1f << 21,
+	.fuse_shift_ft_shift = 21,
+	.fuse_spare_realignment = 0x1fc,
+};
+
+static const struct of_device_id tegra124_soctherm_of_match[] = {
+	{ .compatible = "nvidia,tegra124-soctherm" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tegra_soctherm_of_match);
+
+static int tegra124_soctherm_probe(struct platform_device *pdev)
+{
+	return tegra_soctherm_probe(pdev,
+				    tegra124_tsensors,
+				    tegra124_tsensor_groups,
+				    &tegra124_soctherm_fuse);
+}
+
+static struct platform_driver tegra124_soctherm_driver = {
+	.probe = tegra124_soctherm_probe,
+	.remove = tegra_soctherm_remove,
+	.driver = {
+		.name = "tegra124_soctherm",
+		.of_match_table = tegra124_soctherm_of_match,
+	},
+};
+module_platform_driver(tegra124_soctherm_driver);
+
+MODULE_AUTHOR("NVIDIA");
+MODULE_DESCRIPTION("Tegra124 SOCTHERM thermal management driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/thermal/tegra/tegra_soctherm.c b/drivers/thermal/tegra/tegra_soctherm.c
index 80d97151739e..cc5a3e14948f 100644
--- a/drivers/thermal/tegra/tegra_soctherm.c
+++ b/drivers/thermal/tegra/tegra_soctherm.c
@@ -27,9 +27,10 @@
 #include <linux/reset.h>
 #include <linux/thermal.h>
 
-#include <soc/tegra/fuse.h>
 #include <dt-bindings/thermal/tegra124-soctherm.h>
 
+#include "tegra_soctherm.h"
+
 #define SENSOR_CONFIG0				0
 #define SENSOR_CONFIG0_STOP			BIT(0)
 #define SENSOR_CONFIG0_TALL_SHIFT		8
@@ -43,225 +44,27 @@
 #define SENSOR_CONFIG1_TEN_COUNT_SHIFT		24
 #define SENSOR_CONFIG1_TEMP_ENABLE		BIT(31)
 
-#define SENSOR_CONFIG2				8
-#define SENSOR_CONFIG2_THERMA_SHIFT		16
-#define SENSOR_CONFIG2_THERMB_SHIFT		0
-
-#define SENSOR_PDIV				0x1c0
-#define SENSOR_PDIV_CPU_MASK			(0xf << 12)
-#define SENSOR_PDIV_GPU_MASK			(0xf << 8)
-#define SENSOR_PDIV_MEM_MASK			(0xf << 4)
-#define SENSOR_PDIV_PLLX_MASK			(0xf << 0)
-
-#define SENSOR_HOTSPOT_OFF			0x1c4
-#define SENSOR_HOTSPOT_CPU_MASK			(0xff << 16)
-#define SENSOR_HOTSPOT_GPU_MASK			(0xff << 8)
-#define SENSOR_HOTSPOT_MEM_MASK			(0xff << 0)
-
-#define SENSOR_TEMP1				0x1c8
-#define SENSOR_TEMP1_CPU_TEMP_MASK		(0xffff << 16)
-#define SENSOR_TEMP1_GPU_TEMP_MASK		0xffff
-#define SENSOR_TEMP2				0x1cc
-#define SENSOR_TEMP2_MEM_TEMP_MASK		(0xffff << 16)
-#define SENSOR_TEMP2_PLLX_TEMP_MASK		0xffff
+/*
+ * SENSOR_CONFIG2 is defined in tegra_soctherm.h
+ * because, it will be used by tegra_soctherm_fuse.c
+ */
 
 #define READBACK_VALUE_MASK			0xff00
 #define READBACK_VALUE_SHIFT			8
 #define READBACK_ADD_HALF			BIT(7)
 #define READBACK_NEGATE				BIT(1)
 
-#define FUSE_TSENSOR8_CALIB			0x180
-#define FUSE_SPARE_REALIGNMENT_REG_0		0x1fc
-
-#define FUSE_TSENSOR_CALIB_CP_TS_BASE_MASK	0x1fff
-#define FUSE_TSENSOR_CALIB_FT_TS_BASE_MASK	(0x1fff << 13)
-#define FUSE_TSENSOR_CALIB_FT_TS_BASE_SHIFT	13
-
-#define FUSE_TSENSOR8_CALIB_CP_TS_BASE_MASK	0x3ff
-#define FUSE_TSENSOR8_CALIB_FT_TS_BASE_MASK	(0x7ff << 10)
-#define FUSE_TSENSOR8_CALIB_FT_TS_BASE_SHIFT	10
-
-#define FUSE_SPARE_REALIGNMENT_REG_SHIFT_CP_MASK 0x3f
-#define FUSE_SPARE_REALIGNMENT_REG_SHIFT_FT_MASK (0x1f << 21)
-#define FUSE_SPARE_REALIGNMENT_REG_SHIFT_FT_SHIFT 21
-
-#define NOMINAL_CALIB_FT_T124			105
-#define NOMINAL_CALIB_CP_T124			25
-
 /* get val from register(r) mask bits(m) */
 #define REG_GET_MASK(r, m)	(((r) & (m)) >> (ffs(m) - 1))
 /* set val(v) to mask bits(m) of register(r) */
 #define REG_SET_MASK(r, m, v)	(((r) & ~(m)) | \
 				 (((v) & (m >> (ffs(m) - 1))) << (ffs(m) - 1)))
 
-/**
- * struct tegra_tsensor_group - SOC_THERM sensor group data
- * @name: short name of the temperature sensor group
- * @id: numeric ID of the temperature sensor group
- * @sensor_temp_offset: offset of the SENSOR_TEMP* register
- * @sensor_temp_mask: bit mask for this sensor group in SENSOR_TEMP* register
- * @pdiv: the sensor count post-divider to use during runtime
- * @pdiv_ate: the sensor count post-divider used during automated test
- * @pdiv_mask: register bitfield mask for the PDIV field for this sensor
- * @pllx_hotspot_diff: hotspot offset from the PLLX sensor, must be 0 for
-    PLLX sensor group
- * @pllx_hotspot_mask: register bitfield mask for the HOTSPOT field
- */
-struct tegra_tsensor_group {
-	const char	*name;
-	u8		id;
-	u16		sensor_temp_offset;
-	u32		sensor_temp_mask;
-	u32		pdiv, pdiv_ate, pdiv_mask;
-	u32		pllx_hotspot_diff, pllx_hotspot_mask;
-};
-
-struct tegra_tsensor_configuration {
-	u32 tall, tiddq_en, ten_count, tsample, tsample_ate;
-};
-
-struct tegra_tsensor {
-	const struct tegra_tsensor_configuration *config;
-	u32 base, calib_fuse_offset;
-	/* Correction values used to modify values read from calibration fuses */
-	s32 fuse_corr_alpha, fuse_corr_beta;
-	const struct tegra_tsensor_group *group;
-};
-
 struct tegra_thermctl_zone {
 	void __iomem *reg;
 	u32 mask;
 };
 
-static const struct tegra_tsensor_configuration t124_tsensor_config = {
-	.tall = 16300,
-	.tiddq_en = 1,
-	.ten_count = 1,
-	.tsample = 120,
-	.tsample_ate = 480,
-};
-
-static struct tegra_tsensor_group tegra124_tsensor_group_cpu = {
-	.id				= TEGRA124_SOCTHERM_SENSOR_CPU,
-	.name				= "cpu",
-	.sensor_temp_offset		= SENSOR_TEMP1,
-	.sensor_temp_mask		= SENSOR_TEMP1_CPU_TEMP_MASK,
-	.pdiv				= 8,
-	.pdiv_ate			= 8,
-	.pdiv_mask			= SENSOR_PDIV_CPU_MASK,
-	.pllx_hotspot_diff		= 10,
-	.pllx_hotspot_mask		= SENSOR_HOTSPOT_CPU_MASK,
-};
-
-static struct tegra_tsensor_group tegra124_tsensor_group_gpu = {
-	.id				= TEGRA124_SOCTHERM_SENSOR_GPU,
-	.name				= "gpu",
-	.sensor_temp_offset		= SENSOR_TEMP1,
-	.sensor_temp_mask		= SENSOR_TEMP1_GPU_TEMP_MASK,
-	.pdiv				= 8,
-	.pdiv_ate			= 8,
-	.pdiv_mask			= SENSOR_PDIV_GPU_MASK,
-	.pllx_hotspot_diff		= 5,
-	.pllx_hotspot_mask		= SENSOR_HOTSPOT_GPU_MASK,
-};
-
-static struct tegra_tsensor_group tegra124_tsensor_group_pll = {
-	.id				= TEGRA124_SOCTHERM_SENSOR_PLLX,
-	.name				= "pll",
-	.sensor_temp_offset		= SENSOR_TEMP2,
-	.sensor_temp_mask		= SENSOR_TEMP2_PLLX_TEMP_MASK,
-	.pdiv				= 8,
-	.pdiv_ate			= 8,
-	.pdiv_mask			= SENSOR_PDIV_PLLX_MASK,
-	.pllx_hotspot_diff		= 0,
-	.pllx_hotspot_mask		= SENSOR_HOTSPOT_MEM_MASK,
-};
-
-static struct tegra_tsensor_group tegra124_tsensor_group_mem = {
-	.id				= TEGRA124_SOCTHERM_SENSOR_MEM,
-	.name				= "mem",
-	.sensor_temp_offset		= SENSOR_TEMP2,
-	.sensor_temp_mask		= SENSOR_TEMP2_MEM_TEMP_MASK,
-	.pdiv				= 8,
-	.pdiv_ate			= 8,
-	.pdiv_mask			= SENSOR_PDIV_MEM_MASK,
-};
-
-static struct tegra_tsensor_group *
-tegra124_tsensor_groups[TEGRA124_SOCTHERM_SENSOR_NUM] = {
-	&tegra124_tsensor_group_cpu,
-	&tegra124_tsensor_group_gpu,
-	&tegra124_tsensor_group_pll,
-	&tegra124_tsensor_group_mem,
-};
-
-static const struct tegra_tsensor t124_tsensors[] = {
-	{
-		.config = &t124_tsensor_config,
-		.base = 0xc0,
-		.calib_fuse_offset = 0x098,
-		.fuse_corr_alpha = 1135400,
-		.fuse_corr_beta = -6266900,
-		.group = &tegra124_tsensor_group_cpu,
-	},
-	{
-		.config = &t124_tsensor_config,
-		.base = 0xe0,
-		.calib_fuse_offset = 0x084,
-		.fuse_corr_alpha = 1122220,
-		.fuse_corr_beta = -5700700,
-		.group = &tegra124_tsensor_group_cpu,
-	},
-	{
-		.config = &t124_tsensor_config,
-		.base = 0x100,
-		.calib_fuse_offset = 0x088,
-		.fuse_corr_alpha = 1127000,
-		.fuse_corr_beta = -6768200,
-		.group = &tegra124_tsensor_group_cpu,
-	},
-	{
-		.config = &t124_tsensor_config,
-		.base = 0x120,
-		.calib_fuse_offset = 0x12c,
-		.fuse_corr_alpha = 1110900,
-		.fuse_corr_beta = -6232000,
-		.group = &tegra124_tsensor_group_cpu,
-	},
-	{
-		.config = &t124_tsensor_config,
-		.base = 0x140,
-		.calib_fuse_offset = 0x158,
-		.fuse_corr_alpha = 1122300,
-		.fuse_corr_beta = -5936400,
-		.group = &tegra124_tsensor_group_mem,
-	},
-	{
-		.config = &t124_tsensor_config,
-		.base = 0x160,
-		.calib_fuse_offset = 0x15c,
-		.fuse_corr_alpha = 1145700,
-		.fuse_corr_beta = -7124600,
-		.group = &tegra124_tsensor_group_mem,
-	},
-	{
-		.config = &t124_tsensor_config,
-		.base = 0x180,
-		.calib_fuse_offset = 0x154,
-		.fuse_corr_alpha = 1120100,
-		.fuse_corr_beta = -6000500,
-		.group = &tegra124_tsensor_group_gpu,
-	},
-	{
-		.config = &t124_tsensor_config,
-		.base = 0x1a0,
-		.calib_fuse_offset = 0x160,
-		.fuse_corr_alpha = 1106500,
-		.fuse_corr_beta = -6729300,
-		.group = &tegra124_tsensor_group_pll,
-	},
-};
-
 struct tegra_soctherm {
 	struct reset_control *reset;
 	struct clk *clock_tsensor;
@@ -271,103 +74,15 @@ struct tegra_soctherm {
 	struct thermal_zone_device *thermctl_tzs[TEGRA124_SOCTHERM_SENSOR_NUM];
 };
 
-struct tsensor_shared_calibration {
-	u32 base_cp, base_ft;
-	u32 actual_temp_cp, actual_temp_ft;
-};
-
-static int calculate_shared_calibration(struct tsensor_shared_calibration *r)
-{
-	u32 val, shifted_cp, shifted_ft;
-	int err;
-
-	err = tegra_fuse_readl(FUSE_TSENSOR8_CALIB, &val);
-	if (err)
-		return err;
-	r->base_cp = val & FUSE_TSENSOR8_CALIB_CP_TS_BASE_MASK;
-	r->base_ft = (val & FUSE_TSENSOR8_CALIB_FT_TS_BASE_MASK)
-		>> FUSE_TSENSOR8_CALIB_FT_TS_BASE_SHIFT;
-	val = ((val & FUSE_SPARE_REALIGNMENT_REG_SHIFT_FT_MASK)
-		>> FUSE_SPARE_REALIGNMENT_REG_SHIFT_FT_SHIFT);
-	shifted_ft = sign_extend32(val, 4);
-
-	err = tegra_fuse_readl(FUSE_SPARE_REALIGNMENT_REG_0, &val);
-	if (err)
-		return err;
-	shifted_cp = sign_extend32(val, 5);
-
-	r->actual_temp_cp = 2 * NOMINAL_CALIB_CP_T124 + shifted_cp;
-	r->actual_temp_ft = 2 * NOMINAL_CALIB_FT_T124 + shifted_ft;
-
-	return 0;
-}
-
-static s64 div64_s64_precise(s64 a, s64 b)
-{
-	s64 r, al;
-
-	/* Scale up for increased precision division */
-	al = a << 16;
-
-	r = div64_s64(al * 2 + 1, 2 * b);
-	return r >> 16;
-}
-
-static int
-calculate_tsensor_calibration(const struct tegra_tsensor *sensor,
-			      const struct tsensor_shared_calibration *shared,
-			      u32 *calib)
-{
-	u32 val;
-	s32 actual_tsensor_ft, actual_tsensor_cp, delta_sens, delta_temp,
-	    mult, div;
-	s16 therma, thermb;
-	s64 tmp;
-	int err;
-
-	err = tegra_fuse_readl(sensor->calib_fuse_offset, &val);
-	if (err)
-		return err;
-
-	actual_tsensor_cp = (shared->base_cp * 64) + sign_extend32(val, 12);
-	val = (val & FUSE_TSENSOR_CALIB_FT_TS_BASE_MASK)
-		>> FUSE_TSENSOR_CALIB_FT_TS_BASE_SHIFT;
-	actual_tsensor_ft = (shared->base_ft * 32) + sign_extend32(val, 12);
-
-	delta_sens = actual_tsensor_ft - actual_tsensor_cp;
-	delta_temp = shared->actual_temp_ft - shared->actual_temp_cp;
-
-	mult = sensor->group->pdiv * sensor->config->tsample_ate;
-	div = sensor->config->tsample * sensor->group->pdiv_ate;
-
-	therma = div64_s64_precise((s64) delta_temp * (1LL << 13) * mult,
-				   (s64) delta_sens * div);
-
-	tmp = (s64)actual_tsensor_ft * shared->actual_temp_cp -
-	      (s64)actual_tsensor_cp * shared->actual_temp_ft;
-	thermb = div64_s64_precise(tmp, (s64)delta_sens);
-
-	therma = div64_s64_precise((s64)therma * sensor->fuse_corr_alpha,
-				   (s64)1000000LL);
-	thermb = div64_s64_precise((s64)thermb * sensor->fuse_corr_alpha +
-				   sensor->fuse_corr_beta, (s64)1000000LL);
-
-	*calib = ((u16)therma << SENSOR_CONFIG2_THERMA_SHIFT) |
-		 ((u16)thermb << SENSOR_CONFIG2_THERMB_SHIFT);
-
-	return 0;
-}
-
 static int enable_tsensor(struct tegra_soctherm *tegra,
-			  const struct tegra_tsensor *sensor,
+			  struct tegra_tsensor *sensor,
 			  const struct tsensor_shared_calibration *shared)
 {
 	void __iomem *base = tegra->regs + sensor->base;
 	unsigned int val;
-	u32 calib;
 	int err;
 
-	err = calculate_tsensor_calibration(sensor, shared, &calib);
+	err = tegra_soctherm_calculate_tsensor_calibration(sensor, shared);
 	if (err)
 		return err;
 
@@ -380,7 +95,7 @@ static int enable_tsensor(struct tegra_soctherm *tegra,
 	val |= SENSOR_CONFIG1_TEMP_ENABLE;
 	writel(val, base + SENSOR_CONFIG1);
 
-	writel(calib, base + SENSOR_CONFIG2);
+	writel(sensor->calib, base + SENSOR_CONFIG2);
 
 	return 0;
 }
@@ -422,13 +137,10 @@ static const struct thermal_zone_of_device_ops tegra_of_thermal_ops = {
 	.get_temp = tegra_thermctl_get_temp,
 };
 
-static const struct of_device_id tegra_soctherm_of_match[] = {
-	{ .compatible = "nvidia,tegra124-soctherm" },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, tegra_soctherm_of_match);
-
-static int tegra_soctherm_probe(struct platform_device *pdev)
+int tegra_soctherm_probe(struct platform_device *pdev,
+			 struct tegra_tsensor *tsensors,
+			 const struct tegra_tsensor_group **ttgs,
+			 const struct tegra_soctherm_fuse *tfuse)
 {
 	struct tegra_soctherm *tegra;
 	struct thermal_zone_device *tz;
@@ -438,9 +150,6 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 	int err;
 	u32 pdiv, hotspot;
 
-	const struct tegra_tsensor *tsensors = t124_tsensors;
-	struct tegra_tsensor_group **ttgs = tegra124_tsensor_groups;
-
 	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
 	if (!tegra)
 		return -ENOMEM;
@@ -484,11 +193,11 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 
 	/* Initialize raw sensors */
 
-	err = calculate_shared_calibration(&shared_calib);
+	err = tegra_soctherm_calculate_shared_calibration(tfuse, &shared_calib);
 	if (err)
 		goto disable_clocks;
 
-	for (i = 0; i < ARRAY_SIZE(t124_tsensors); ++i) {
+	for (i = 0; tsensors[i].name; ++i) {
 		err = enable_tsensor(tegra, tsensors + i, &shared_calib);
 		if (err)
 			goto disable_clocks;
@@ -548,7 +257,7 @@ disable_clocks:
 	return err;
 }
 
-static int tegra_soctherm_remove(struct platform_device *pdev)
+int tegra_soctherm_remove(struct platform_device *pdev)
 {
 	struct tegra_soctherm *tegra = platform_get_drvdata(pdev);
 	unsigned int i;
@@ -564,16 +273,6 @@ static int tegra_soctherm_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver tegra_soctherm_driver = {
-	.probe = tegra_soctherm_probe,
-	.remove = tegra_soctherm_remove,
-	.driver = {
-		.name = "tegra-soctherm",
-		.of_match_table = tegra_soctherm_of_match,
-	},
-};
-module_platform_driver(tegra_soctherm_driver);
-
 MODULE_AUTHOR("Mikko Perttunen <mperttunen@nvidia.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra SOCTHERM thermal management driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/thermal/tegra/tegra_soctherm.h b/drivers/thermal/tegra/tegra_soctherm.h
new file mode 100644
index 000000000000..8d06f4f75ff9
--- /dev/null
+++ b/drivers/thermal/tegra/tegra_soctherm.h
@@ -0,0 +1,106 @@
+/*
+ * Copyright (c) 2014-2016, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifndef __DRIVERS_THERMAL_TEGRA_SOCTHERM_H
+#define __DRIVERS_THERMAL_TEGRA_SOCTHERM_H
+
+#define SENSOR_CONFIG2                          8
+#define SENSOR_CONFIG2_THERMA_SHIFT		16
+#define SENSOR_CONFIG2_THERMB_SHIFT		0
+
+#define SENSOR_PDIV				0x1c0
+#define SENSOR_PDIV_CPU_MASK			(0xf << 12)
+#define SENSOR_PDIV_GPU_MASK			(0xf << 8)
+#define SENSOR_PDIV_MEM_MASK			(0xf << 4)
+#define SENSOR_PDIV_PLLX_MASK			(0xf << 0)
+
+#define SENSOR_HOTSPOT_OFF			0x1c4
+#define SENSOR_HOTSPOT_CPU_MASK			(0xff << 16)
+#define SENSOR_HOTSPOT_GPU_MASK			(0xff << 8)
+#define SENSOR_HOTSPOT_MEM_MASK			(0xff << 0)
+
+#define SENSOR_TEMP1				0x1c8
+#define SENSOR_TEMP1_CPU_TEMP_MASK		(0xffff << 16)
+#define SENSOR_TEMP1_GPU_TEMP_MASK		0xffff
+#define SENSOR_TEMP2				0x1cc
+#define SENSOR_TEMP2_MEM_TEMP_MASK		(0xffff << 16)
+#define SENSOR_TEMP2_PLLX_TEMP_MASK		0xffff
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
+struct tegra_tsensor_configuration {
+	u32 tall, tiddq_en, ten_count, pdiv, pdiv_ate, tsample, tsample_ate;
+};
+
+struct tegra_tsensor {
+	const char *name;
+	u32 base;
+	const struct tegra_tsensor_configuration *config;
+	u32 calib_fuse_offset;
+	/*
+	 * Correction values used to modify values read from
+	 * calibration fuses
+	 */
+	s32 fuse_corr_alpha, fuse_corr_beta;
+	u32 calib;
+	const struct tegra_tsensor_group *group;
+};
+
+struct tegra_soctherm_fuse {
+	u32 fuse_base_cp_mask, fuse_base_cp_shift;
+	u32 fuse_base_ft_mask, fuse_base_ft_shift;
+	u32 fuse_shift_ft_mask, fuse_shift_ft_shift;
+	u32 fuse_spare_realignment;
+};
+
+struct tsensor_shared_calibration {
+	u32 base_cp, base_ft;
+	u32 actual_temp_cp, actual_temp_ft;
+};
+
+int tegra_soctherm_calculate_shared_calibration(
+				const struct tegra_soctherm_fuse *tfuse,
+				struct tsensor_shared_calibration *shared);
+int tegra_soctherm_calculate_tsensor_calibration(
+			struct tegra_tsensor *sensor,
+			const struct tsensor_shared_calibration *shared);
+
+int tegra_soctherm_probe(struct platform_device *pdev,
+			 struct tegra_tsensor *tsensors,
+			 const struct tegra_tsensor_group **ttgs,
+			 const struct tegra_soctherm_fuse *tfuse);
+int tegra_soctherm_remove(struct platform_device *pdev);
+
+#endif
+
diff --git a/drivers/thermal/tegra/tegra_soctherm_fuse.c b/drivers/thermal/tegra/tegra_soctherm_fuse.c
new file mode 100644
index 000000000000..7c608698f1ae
--- /dev/null
+++ b/drivers/thermal/tegra/tegra_soctherm_fuse.c
@@ -0,0 +1,143 @@
+/*
+ * Copyright (c) 2014-2016, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <soc/tegra/fuse.h>
+
+#include "tegra_soctherm.h"
+
+#define NOMINAL_CALIB_FT			105
+#define NOMINAL_CALIB_CP			25
+
+#define FUSE_TSENSOR_CALIB_CP_TS_BASE_MASK	0x1fff
+#define FUSE_TSENSOR_CALIB_FT_TS_BASE_MASK	(0x1fff << 13)
+#define FUSE_TSENSOR_CALIB_FT_TS_BASE_SHIFT	13
+
+#define FUSE_TSENSOR_COMMON			0x180
+
+/*
+ * T12x, etc: FUSE_TSENSOR_COMMON:
+ *    3                   2                   1                   0
+ *  1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ * |-----------| SHFT_FT |       BASE_FT       |      BASE_CP      |
+ * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ *
+ * FUSE_SPARE_REALIGNMENT_REG:
+ *    3                   2                   1                   0
+ *  1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ * |---------------------------------------------------| SHIFT_CP  |
+ * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ */
+
+static s64 div64_s64_precise(s64 a, s64 b)
+{
+	s64 r, al;
+
+	/* Scale up for increased precision division */
+	al = a << 16;
+
+	r = div64_s64(al * 2 + 1, 2 * b);
+	return r >> 16;
+}
+
+int tegra_soctherm_calculate_shared_calibration(
+				const struct tegra_soctherm_fuse *tfuse,
+				struct tsensor_shared_calibration *r)
+{
+	u32 val;
+	s32 shifted_cp, shifted_ft;
+	int err;
+
+	err = tegra_fuse_readl(FUSE_TSENSOR_COMMON, &val);
+	if (err)
+		return err;
+
+	r->base_cp = (val & tfuse->fuse_base_cp_mask)
+			>> tfuse->fuse_base_cp_shift;
+	r->base_ft = (val & tfuse->fuse_base_ft_mask)
+			>> tfuse->fuse_base_ft_shift;
+
+	shifted_ft = (val & tfuse->fuse_shift_ft_mask)
+			>> tfuse->fuse_shift_ft_shift;
+	shifted_ft = sign_extend32(shifted_ft, 4);
+
+	if (tfuse->fuse_spare_realignment) {
+		err = tegra_fuse_readl(tfuse->fuse_spare_realignment, &val);
+		if (err)
+			return err;
+	}
+
+	shifted_cp = sign_extend32(val, 5);
+
+	r->actual_temp_cp = 2 * NOMINAL_CALIB_CP + shifted_cp;
+	r->actual_temp_ft = 2 * NOMINAL_CALIB_FT + shifted_ft;
+
+	return 0;
+}
+
+int tegra_soctherm_calculate_tsensor_calibration(
+				struct tegra_tsensor *sensor,
+				const struct tsensor_shared_calibration *shared)
+{
+	const struct tegra_tsensor_group *sensor_group;
+	u32 val, calib;
+	s32 actual_tsensor_ft, actual_tsensor_cp;
+	s32 delta_sens, delta_temp;
+	s32 mult, div;
+	s16 therma, thermb;
+	int err;
+
+	sensor_group = sensor->group;
+
+	err = tegra_fuse_readl(sensor->calib_fuse_offset, &val);
+	if (err)
+		return err;
+
+	actual_tsensor_cp = (shared->base_cp * 64) + sign_extend32(val, 12);
+	val = (val & FUSE_TSENSOR_CALIB_FT_TS_BASE_MASK)
+		>> FUSE_TSENSOR_CALIB_FT_TS_BASE_SHIFT;
+	actual_tsensor_ft = (shared->base_ft * 32) + sign_extend32(val, 12);
+
+	delta_sens = actual_tsensor_ft - actual_tsensor_cp;
+	delta_temp = shared->actual_temp_ft - shared->actual_temp_cp;
+
+	mult = sensor_group->pdiv * sensor->config->tsample_ate;
+	div = sensor->config->tsample * sensor_group->pdiv_ate;
+
+	therma = div64_s64_precise((s64)delta_temp * (1LL << 13) * mult,
+			(s64)delta_sens * div);
+	thermb = div64_s64_precise(
+			((s64)actual_tsensor_ft * shared->actual_temp_cp) -
+			((s64)actual_tsensor_cp * shared->actual_temp_ft),
+			(s64)delta_sens);
+
+	therma = div64_s64_precise((s64)therma * sensor->fuse_corr_alpha,
+			(s64)1000000LL);
+	thermb = div64_s64_precise((s64)thermb * sensor->fuse_corr_alpha +
+			sensor->fuse_corr_beta,
+			(s64)1000000LL);
+	calib = ((u16)therma << SENSOR_CONFIG2_THERMA_SHIFT) |
+		 ((u16)thermb << SENSOR_CONFIG2_THERMB_SHIFT);
+
+	sensor->calib = calib;
+
+	return 0;
+}
+
+MODULE_AUTHOR("NVIDIA");
+MODULE_DESCRIPTION("Tegra SOCTHERM fuse management");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1
