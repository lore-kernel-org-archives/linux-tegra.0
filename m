From: Wei Ni <wni@nvidia.com>
Subject: [PATCH V1 04/10] thermal: tegra: add T210-specific SOC_THERM driver
Date: Wed, 13 Jan 2016 15:58:43 +0800
Message-ID: <1452671929-32740-5-git-send-email-wni@nvidia.com>
References: <1452671929-32740-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452671929-32740-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, mikko.perttunen@kapsi.fi, swarren@wwwdotorg.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add Tegra210 specific SOC_THERM driver.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 drivers/thermal/tegra/Kconfig               |  11 ++
 drivers/thermal/tegra/Makefile              |   1 +
 drivers/thermal/tegra/tegra210_soctherm.c   | 210 ++++++++++++++++++++++++++++
 drivers/thermal/tegra/tegra_soctherm_fuse.c |  11 ++
 4 files changed, 233 insertions(+)
 create mode 100644 drivers/thermal/tegra/tegra210_soctherm.c

diff --git a/drivers/thermal/tegra/Kconfig b/drivers/thermal/tegra/Kconfig
index ae7e5e93dab9..902ef8bdbc91 100644
--- a/drivers/thermal/tegra/Kconfig
+++ b/drivers/thermal/tegra/Kconfig
@@ -11,3 +11,14 @@ config TEGRA124_SOCTHERM
 	  (CPU, GPU, MEM, PLLX). Cooling devices can be bound to the thermal
 	  zones to manage temperatures. This option is also required for the
 	  emergency thermal reset (thermtrip) feature to function.
+
+config TEGRA210_SOCTHERM
+	bool "Tegra210 SOCTHERM thermal management"
+	depends on ARCH_TEGRA_210_SOC
+	select TEGRA_SOCTHERM
+	help
+	  Enable this option for integrated thermal management support on NVIDIA
+	  Tegra210 systems-on-chip. The driver supports four thermal zones
+	  (CPU, GPU, MEM, PLLX). Cooling devices can be bound to the thermal
+	  zones to manage temperatures. This option is also required for the
+	  emergency thermal reset (thermtrip) feature to function.
diff --git a/drivers/thermal/tegra/Makefile b/drivers/thermal/tegra/Makefile
index 7a864ec07a25..272dd84c7995 100644
--- a/drivers/thermal/tegra/Makefile
+++ b/drivers/thermal/tegra/Makefile
@@ -5,3 +5,4 @@
 # Tegra soc thermal drivers
 obj-$(CONFIG_TEGRA_SOCTHERM)	+= tegra_soctherm.o tegra_soctherm_fuse.o
 obj-$(CONFIG_TEGRA124_SOCTHERM)	+= tegra124_soctherm.o
+obj-$(CONFIG_TEGRA210_SOCTHERM)	+= tegra210_soctherm.o
diff --git a/drivers/thermal/tegra/tegra210_soctherm.c b/drivers/thermal/tegra/tegra210_soctherm.c
new file mode 100644
index 000000000000..70c748c6bed6
--- /dev/null
+++ b/drivers/thermal/tegra/tegra210_soctherm.c
@@ -0,0 +1,210 @@
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
+#include <dt-bindings/thermal/tegra124-soctherm.h>
+
+#include "tegra_soctherm.h"
+
+static const struct tegra_tsensor_configuration tegra210_tsensor_config = {
+	.tall = 16300,
+	.tiddq_en = 1,
+	.ten_count = 1,
+	.tsample = 120,
+	.tsample_ate = 480,
+};
+
+static const struct tegra_tsensor_group tegra210_tsensor_group_cpu = {
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
+static const struct tegra_tsensor_group tegra210_tsensor_group_gpu = {
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
+static const struct tegra_tsensor_group tegra210_tsensor_group_pll = {
+	.id				= TEGRA124_SOCTHERM_SENSOR_PLLX,
+	.name				= "pll",
+	.sensor_temp_offset		= SENSOR_TEMP2,
+	.sensor_temp_mask		= SENSOR_TEMP2_PLLX_TEMP_MASK,
+	.pdiv				= 8,
+	.pdiv_ate			= 8,
+	.pdiv_mask			= SENSOR_PDIV_PLLX_MASK,
+};
+
+static const struct tegra_tsensor_group tegra210_tsensor_group_mem = {
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
+tegra210_tsensor_groups[TEGRA124_SOCTHERM_SENSOR_NUM] = {
+	&tegra210_tsensor_group_cpu,
+	&tegra210_tsensor_group_gpu,
+	&tegra210_tsensor_group_pll,
+	&tegra210_tsensor_group_mem,
+};
+
+static struct tegra_tsensor tegra210_tsensors[] = {
+	{
+		.name = "cpu0",
+		.base = 0xc0,
+		.config = &tegra210_tsensor_config,
+		.calib_fuse_offset = 0x098,
+		.fuse_corr_alpha = 1085000,
+		.fuse_corr_beta = 3244200,
+		.group = &tegra210_tsensor_group_cpu,
+	},
+	{
+		.name = "cpu1",
+		.base = 0xe0,
+		.config = &tegra210_tsensor_config,
+		.calib_fuse_offset = 0x084,
+		.fuse_corr_alpha = 1126200,
+		.fuse_corr_beta = -67500,
+		.group = &tegra210_tsensor_group_cpu,
+	},
+	{
+		.name = "cpu2",
+		.base = 0x100,
+		.config = &tegra210_tsensor_config,
+		.calib_fuse_offset = 0x088,
+		.fuse_corr_alpha = 1098400,
+		.fuse_corr_beta = 2251100,
+		.group = &tegra210_tsensor_group_cpu,
+	},
+	{
+		.name = "cpu3",
+		.base = 0x120,
+		.config = &tegra210_tsensor_config,
+		.calib_fuse_offset = 0x12c,
+		.fuse_corr_alpha = 1108000,
+		.fuse_corr_beta = 602700,
+		.group = &tegra210_tsensor_group_cpu,
+	},
+	{
+		.name = "mem0",
+		.base = 0x140,
+		.config = &tegra210_tsensor_config,
+		.calib_fuse_offset = 0x158,
+		.fuse_corr_alpha = 1069200,
+		.fuse_corr_beta = 3549900,
+		.group = &tegra210_tsensor_group_mem,
+	},
+	{
+		.name = "mem1",
+		.base = 0x160,
+		.config = &tegra210_tsensor_config,
+		.calib_fuse_offset = 0x15c,
+		.fuse_corr_alpha = 1173700,
+		.fuse_corr_beta = -6263600,
+		.group = &tegra210_tsensor_group_mem,
+	},
+	{
+		.name = "gpu",
+		.base = 0x180,
+		.config = &tegra210_tsensor_config,
+		.calib_fuse_offset = 0x154,
+		.fuse_corr_alpha = 1074300,
+		.fuse_corr_beta = 2734900,
+		.group = &tegra210_tsensor_group_gpu,
+	},
+	{
+		.name = "pllx",
+		.base = 0x1a0,
+		.config = &tegra210_tsensor_config,
+		.calib_fuse_offset = 0x160,
+		.fuse_corr_alpha = 1039700,
+		.fuse_corr_beta = 6829100,
+		.group = &tegra210_tsensor_group_pll,
+	},
+	{ .name = NULL },
+};
+
+/*
+ * Mask/shift bits in FUSE_TSENSOR_COMMON and
+ * FUSE_TSENSOR_COMMON, which are described in
+ * tegra_soctherm_fuse.c
+ */
+static const struct tegra_soctherm_fuse tegra210_soctherm_fuse = {
+	.fuse_base_cp_mask = 0x3ff << 11,
+	.fuse_base_cp_shift = 11,
+	.fuse_base_ft_mask = 0x7ff << 21,
+	.fuse_base_ft_shift = 21,
+	.fuse_shift_ft_mask = 0x1f << 6,
+	.fuse_shift_ft_shift = 6,
+	.fuse_spare_realignment = 0,
+};
+
+static const struct of_device_id tegra210_soctherm_of_match[] = {
+	{ .compatible = "nvidia,tegra210-soctherm" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tegra_soctherm_of_match);
+
+#define TEGRA210_FUSE_CP_REV 0x90
+
+static int tegra210_soctherm_probe(struct platform_device *pdev)
+{
+	u32 rev;
+
+	tegra_fuse_readl(TEGRA210_FUSE_CP_REV, &rev);
+	pr_debug("tsosc: CP rev %d.%d\n", (rev & 0x1f), ((rev >> 5) & 0x3f));
+
+	return tegra_soctherm_probe(pdev,
+				    tegra210_tsensors,
+				    tegra210_tsensor_groups,
+				    &tegra210_soctherm_fuse);
+}
+
+static struct platform_driver tegra210_soctherm_driver = {
+	.probe = tegra210_soctherm_probe,
+	.remove = tegra_soctherm_remove,
+	.driver = {
+		.name = "tegra210_soctherm",
+		.owner = THIS_MODULE,
+		.of_match_table = tegra210_soctherm_of_match,
+	},
+};
+module_platform_driver(tegra210_soctherm_driver);
+
+MODULE_AUTHOR("NVIDIA");
+MODULE_DESCRIPTION("Tegra210 SOCTHERM thermal management driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/thermal/tegra/tegra_soctherm_fuse.c b/drivers/thermal/tegra/tegra_soctherm_fuse.c
index 7c608698f1ae..22f402240672 100644
--- a/drivers/thermal/tegra/tegra_soctherm_fuse.c
+++ b/drivers/thermal/tegra/tegra_soctherm_fuse.c
@@ -28,6 +28,17 @@
 #define FUSE_TSENSOR_COMMON			0x180
 
 /*
+ * T210: Layout of bits in FUSE_TSENSOR_COMMON:
+ *    3                   2                   1                   0
+ *  1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ * |       BASE_FT       |      BASE_CP      | SHFT_FT | SHIFT_CP  |
+ * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ *
+ * In chips prior to T210, this fuse was incorrectly sized as 26 bits,
+ * and didn't hold SHIFT_CP in [31:26]. Therefore these missing six bits
+ * were obtained via the FUSE_SPARE_REALIGNMENT_REG register [5:0].
+ *
  * T12x, etc: FUSE_TSENSOR_COMMON:
  *    3                   2                   1                   0
  *  1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
-- 
1.9.1
