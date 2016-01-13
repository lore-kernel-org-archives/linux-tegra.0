From: Wei Ni <wni@nvidia.com>
Subject: [PATCH V1 05/10] thermal: tegra: add sysfs to dump registers
Date: Wed, 13 Jan 2016 16:00:07 +0800
Message-ID: <1452672007-330-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, mikko.perttunen@kapsi.fi, swarren@wwwdotorg.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add sysfs interface to dump registers for debug.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 drivers/thermal/tegra/tegra_soctherm.c | 134 ++++++++++++++++++++++++++++++++-
 drivers/thermal/tegra/tegra_soctherm.h |   2 +
 2 files changed, 133 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/tegra/tegra_soctherm.c b/drivers/thermal/tegra/tegra_soctherm.c
index cc5a3e14948f..c28d0a2a3ff9 100644
--- a/drivers/thermal/tegra/tegra_soctherm.c
+++ b/drivers/thermal/tegra/tegra_soctherm.c
@@ -15,6 +15,7 @@
  *
  */
 
+#include <linux/debugfs.h>
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -33,14 +34,18 @@
 
 #define SENSOR_CONFIG0				0
 #define SENSOR_CONFIG0_STOP			BIT(0)
-#define SENSOR_CONFIG0_TALL_SHIFT		8
-#define SENSOR_CONFIG0_TCALC_OVER		BIT(4)
-#define SENSOR_CONFIG0_OVER			BIT(3)
 #define SENSOR_CONFIG0_CPTR_OVER		BIT(2)
+#define SENSOR_CONFIG0_OVER			BIT(3)
+#define SENSOR_CONFIG0_TCALC_OVER		BIT(4)
+#define SENSOR_CONFIG0_TALL_MASK		(0xfffff << 8)
+#define SENSOR_CONFIG0_TALL_SHIFT		8
 
 #define SENSOR_CONFIG1				4
+#define SENSOR_CONFIG1_TSAMPLE_MASK		0x3ff
 #define SENSOR_CONFIG1_TSAMPLE_SHIFT		0
+#define SENSOR_CONFIG1_TIDDQ_EN_MASK		(0x3f << 15)
 #define SENSOR_CONFIG1_TIDDQ_EN_SHIFT		15
+#define SENSOR_CONFIG1_TEN_COUNT_MASK		(0x3f << 24)
 #define SENSOR_CONFIG1_TEN_COUNT_SHIFT		24
 #define SENSOR_CONFIG1_TEMP_ENABLE		BIT(31)
 
@@ -49,6 +54,14 @@
  * because, it will be used by tegra_soctherm_fuse.c
  */
 
+#define SENSOR_STATUS0				0xc
+#define SENSOR_STATUS0_VALID_MASK		BIT(31)
+#define SENSOR_STATUS0_CAPTURE_MASK		0xffff
+
+#define SENSOR_STATUS1				0x10
+#define SENSOR_STATUS1_TEMP_VALID_MASK		BIT(31)
+#define SENSOR_STATUS1_TEMP_MASK		0xffff
+
 #define READBACK_VALUE_MASK			0xff00
 #define READBACK_VALUE_SHIFT			8
 #define READBACK_ADD_HALF			BIT(7)
@@ -72,6 +85,7 @@ struct tegra_soctherm {
 	void __iomem *regs;
 
 	struct thermal_zone_device *thermctl_tzs[TEGRA124_SOCTHERM_SENSOR_NUM];
+	struct tegra_tsensor *tsensors;
 };
 
 static int enable_tsensor(struct tegra_soctherm *tegra,
@@ -137,6 +151,114 @@ static const struct thermal_zone_of_device_ops tegra_of_thermal_ops = {
 	.get_temp = tegra_thermctl_get_temp,
 };
 
+#ifdef CONFIG_DEBUG_FS
+static int regs_show(struct seq_file *s, void *data)
+{
+	struct platform_device *pdev = s->private;
+	struct tegra_soctherm *ts = platform_get_drvdata(pdev);
+	struct tegra_tsensor *tsensors = ts->tsensors;
+	u32 r, state;
+	int i;
+
+	seq_puts(s, "-----TSENSE (convert HW)-----\n");
+
+	for (i = 0; tsensors[i].name; i++) {
+		r = readl(ts->regs + tsensors[i].base + SENSOR_CONFIG1);
+		state = REG_GET_MASK(r, SENSOR_CONFIG1_TEMP_ENABLE);
+		if (!state)
+			continue;
+
+		seq_printf(s, "%s: ", tsensors[i].name);
+
+		seq_printf(s, "En(%d) ", state);
+		state = REG_GET_MASK(r, SENSOR_CONFIG1_TIDDQ_EN_MASK);
+		seq_printf(s, "tiddq(%d) ", state);
+		state = REG_GET_MASK(r, SENSOR_CONFIG1_TEN_COUNT_MASK);
+		seq_printf(s, "ten_count(%d) ", state);
+		state = REG_GET_MASK(r, SENSOR_CONFIG1_TSAMPLE_MASK);
+		seq_printf(s, "tsample(%d) ", state + 1);
+
+		r = readl(ts->regs + tsensors[i].base + SENSOR_STATUS1);
+		state = REG_GET_MASK(r, SENSOR_STATUS1_TEMP_VALID_MASK);
+		seq_printf(s, "Temp(%d/", state);
+		state = REG_GET_MASK(r, SENSOR_STATUS1_TEMP_MASK);
+		seq_printf(s, "%d) ", translate_temp(state));
+
+		r = readl(ts->regs + tsensors[i].base + SENSOR_STATUS0);
+		state = REG_GET_MASK(r, SENSOR_STATUS0_VALID_MASK);
+		seq_printf(s, "Capture(%d/", state);
+		state = REG_GET_MASK(r, SENSOR_STATUS0_CAPTURE_MASK);
+		seq_printf(s, "%d) ", state);
+
+		r = readl(ts->regs + tsensors[i].base + SENSOR_CONFIG0);
+		state = REG_GET_MASK(r, SENSOR_CONFIG0_STOP);
+		seq_printf(s, "Stop(%d) ", state);
+		state = REG_GET_MASK(r, SENSOR_CONFIG0_TALL_MASK);
+		seq_printf(s, "Tall(%d) ", state);
+		state = REG_GET_MASK(r, SENSOR_CONFIG0_TCALC_OVER);
+		seq_printf(s, "Over(%d/", state);
+		state = REG_GET_MASK(r, SENSOR_CONFIG0_OVER);
+		seq_printf(s, "%d/", state);
+		state = REG_GET_MASK(r, SENSOR_CONFIG0_CPTR_OVER);
+		seq_printf(s, "%d) ", state);
+
+		r = readl(ts->regs + tsensors[i].base + SENSOR_CONFIG2);
+		state = REG_GET_MASK(r, SENSOR_CONFIG2_THERMA_MASK);
+		seq_printf(s, "Therm_A/B(%d/", state);
+		state = REG_GET_MASK(r, SENSOR_CONFIG2_THERMB_MASK);
+		seq_printf(s, "%d)\n", (s16)state);
+	}
+
+	r = readl(ts->regs + SENSOR_PDIV);
+	seq_printf(s, "PDIV: 0x%x\n", r);
+
+	r = readl(ts->regs + SENSOR_HOTSPOT_OFF);
+	seq_printf(s, "HOTSPOT: 0x%x\n", r);
+
+	seq_puts(s, "\n");
+	seq_puts(s, "-----SOC_THERM-----\n");
+
+	r = readl(ts->regs + SENSOR_TEMP1);
+	state = REG_GET_MASK(r, SENSOR_TEMP1_CPU_TEMP_MASK);
+	seq_printf(s, "Temperatures: CPU(%d) ", translate_temp(state));
+	state = REG_GET_MASK(r, SENSOR_TEMP1_GPU_TEMP_MASK);
+	seq_printf(s, " GPU(%d) ", translate_temp(state));
+	r = readl(ts->regs + SENSOR_TEMP2);
+	state = REG_GET_MASK(r, SENSOR_TEMP2_PLLX_TEMP_MASK);
+	seq_printf(s, " PLLX(%d) ", translate_temp(state));
+	state = REG_GET_MASK(r, SENSOR_TEMP2_MEM_TEMP_MASK);
+	seq_printf(s, " MEM(%d)\n", translate_temp(state));
+
+	return 0;
+}
+
+static int regs_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, regs_show, inode->i_private);
+}
+
+static const struct file_operations regs_fops = {
+	.open		= regs_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static int soctherm_debug_init(struct platform_device *pdev)
+{
+	struct dentry *tegra_soctherm_root;
+
+	tegra_soctherm_root = debugfs_create_dir("tegra_soctherm", NULL);
+	debugfs_create_file("regs", 0644, tegra_soctherm_root,
+			    pdev, &regs_fops);
+
+	return 0;
+}
+#else
+static inline int soctherm_debug_init(struct platform_device *pdev)
+{ return 0; }
+#endif
+
 int tegra_soctherm_probe(struct platform_device *pdev,
 			 struct tegra_tsensor *tsensors,
 			 const struct tegra_tsensor_group **ttgs,
@@ -154,6 +276,10 @@ int tegra_soctherm_probe(struct platform_device *pdev,
 	if (!tegra)
 		return -ENOMEM;
 
+	dev_set_drvdata(&pdev->dev, tegra);
+
+	tegra->tsensors = tsensors;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	tegra->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(tegra->regs))
@@ -243,6 +369,8 @@ int tegra_soctherm_probe(struct platform_device *pdev,
 		tegra->thermctl_tzs[ttgs[i]->id] = tz;
 	}
 
+	soctherm_debug_init(pdev);
+
 	return 0;
 
 unregister_tzs:
diff --git a/drivers/thermal/tegra/tegra_soctherm.h b/drivers/thermal/tegra/tegra_soctherm.h
index 8d06f4f75ff9..3ade453fc353 100644
--- a/drivers/thermal/tegra/tegra_soctherm.h
+++ b/drivers/thermal/tegra/tegra_soctherm.h
@@ -16,7 +16,9 @@
 #define __DRIVERS_THERMAL_TEGRA_SOCTHERM_H
 
 #define SENSOR_CONFIG2                          8
+#define SENSOR_CONFIG2_THERMA_MASK		(0xffff << 16)
 #define SENSOR_CONFIG2_THERMA_SHIFT		16
+#define SENSOR_CONFIG2_THERMB_MASK		0xffff
 #define SENSOR_CONFIG2_THERMB_SHIFT		0
 
 #define SENSOR_PDIV				0x1c0
-- 
1.9.1
