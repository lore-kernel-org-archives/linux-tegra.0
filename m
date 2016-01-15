From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 08/11] thermal: tegra: add thermtrip function
Date: Fri, 15 Jan 2016 18:26:28 +0800
Message-ID: <1452853588-5300-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for hardware critical thermal limits to the SOC_THERM
driver.  This is implemented outside the Linux thermal framework.
If these limits are breached, the chip will reset, and if appropriately
configured, will turn off the PMIC.

This support is critical for safe usage of the chip.

Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/thermal/tegra/soctherm.c          | 282 +++++++++++++++++++++++++++++-
 drivers/thermal/tegra/soctherm.h          |   7 +
 drivers/thermal/tegra/tegra124-soctherm.c |  27 +++
 drivers/thermal/tegra/tegra210-soctherm.c |  27 +++
 4 files changed, 338 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index 9ea2c3e06d56..a14935c91695 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -73,6 +73,9 @@
 #define REG_SET_MASK(r, m, v)	(((r) & ~(m)) | \
 				 (((v) & (m >> (ffs(m) - 1))) << (ffs(m) - 1)))
 
+static const int min_low_temp = -127000;
+static const int max_high_temp = 127000;
+
 struct tegra_thermctl_zone {
 	void __iomem *reg;
 	u32 mask;
@@ -151,12 +154,244 @@ static const struct thermal_zone_of_device_ops tegra_of_thermal_ops = {
 	.get_temp = tegra_thermctl_get_temp,
 };
 
+/**
+ * enforce_temp_range() - check and enforce temperature range [min, max]
+ * @trip_temp: the trip temperature to check
+ *
+ * Checks and enforces the permitted temperature range that SOC_THERM
+ * HW can support This is
+ * done while taking care of precision.
+ *
+ * Return: The precision adjusted capped temperature in millicelsius.
+ */
+static int enforce_temp_range(struct device *dev, int trip_temp)
+{
+	int temp;
+
+	temp = clamp_val(trip_temp, min_low_temp, max_high_temp);
+	if (temp != trip_temp)
+		dev_info(dev, "soctherm: trip temperature %d forced to %d\n",
+			 trip_temp, temp);
+	return temp;
+}
+
+/**
+ * thermtrip_program() - Configures the hardware to shut down the
+ * system if a given sensor group reaches a given temperature
+ * @dev: ptr to the struct device for the SOC_THERM IP block
+ * @sg: pointer to the sensor group to set the thermtrip temperature for
+ * @trip_temp: the temperature in millicelsius to trigger the thermal trip at
+ *
+ * Sets the thermal trip threshold of the given sensor group to be the
+ * @trip_temp.  If this threshold is crossed, the hardware will shut
+ * down.
+ *
+ * Note that, although @trip_temp is specified in millicelsius, the
+ * hardware is programmed in degrees Celsius.
+ *
+ * Return: 0 upon success, or %-EINVAL upon failure.
+ */
+static int thermtrip_program(struct device *dev,
+			     const struct tegra_tsensor_group *sg,
+			     int trip_temp)
+{
+	struct tegra_soctherm *ts = dev_get_drvdata(dev);
+	int temp;
+	u32 r;
+
+	if (!dev || !sg)
+		return -EINVAL;
+
+	if (!sg->thermtrip_threshold_mask)
+		return -EINVAL;
+
+	temp = enforce_temp_range(dev, trip_temp) / sg->thresh_grain;
+
+	r = readl(ts->regs + THERMCTL_THERMTRIP_CTL);
+	r = REG_SET_MASK(r, sg->thermtrip_threshold_mask, temp);
+	r = REG_SET_MASK(r, sg->thermtrip_enable_mask, 1);
+	r = REG_SET_MASK(r, sg->thermtrip_any_en_mask, 0);
+	writel(r, ts->regs + THERMCTL_THERMTRIP_CTL);
+
+	return 0;
+}
+
+/**
+ * tegra_soctherm_thermtrip() - configure thermal shutdown from DT data
+ * @dev: struct device * of the SOC_THERM instance
+ *
+ * Configure the SOC_THERM "THERMTRIP" feature, using data from DT.
+ * After it's been configured, THERMTRIP will take action when the
+ * configured SoC thermal sensor group reaches a certain temperature.
+ *
+ * SOC_THERM registers are in the VDD_SOC voltage domain.  This means
+ * that SOC_THERM THERMTRIP programming does not survive an LP0/SC7
+ * transition, unless this driver has been modified to save those
+ * registers before entering SC7 and restore them upon exiting SC7.
+ *
+ * Return: 0 upon success, or a negative error code on failure.
+ * "Success" does not mean that thermtrip was enabled; it could also
+ * mean that no "thermtrip" node was found in DT.  THERMTRIP has been
+ * enabled successfully when a message similar to this one appears on
+ * the serial console: "thermtrip: will shut down when sensor group
+ * XXX reaches YYYYYY millidegrees C"
+ */
+static int tegra_soctherm_thermtrip(struct device *dev)
+{
+	struct tegra_soctherm *ts = dev_get_drvdata(dev);
+	const struct tegra_tsensor_group **ttgs =  ts->soc->ttgs;
+	struct device_node *np;
+	unsigned int i;
+
+	np = of_find_node_by_name(dev->of_node, "hw-trip-points");
+	if (!np) {
+		dev_info(dev, "thermtrip: no DT node - not enabling\n");
+		return -ENODEV;
+	}
+
+	for (i = 0; i < ts->soc->num_ttgs; ++i) {
+		const struct tegra_tsensor_group *sg = ttgs[i];
+		struct device_node *sgnp;
+		u32 temperature;
+		int r;
+
+		sgnp = of_find_node_by_name(np, sg->name);
+		if (!sgnp) {
+			dev_info(dev,
+				 "thermtrip: %s: no configuration found, skipping\n",
+				 sg->name);
+			continue;
+		}
+
+		r = of_property_read_u32(sgnp, "thermtrip-temperature",
+					 &temperature);
+		if (r) {
+			dev_err(dev,
+				"thermtrip: %s: missing thermtrip temperature\n",
+				sg->name);
+			continue;
+		}
+
+		r = thermtrip_program(dev, sg, temperature);
+		if (r) {
+			dev_err(dev, "thermtrip: %s: error during enable\n",
+				sg->name);
+			continue;
+		}
+
+		dev_info(dev,
+			 "thermtrip: will shut down when %s reaches %d mC\n",
+			 sg->name, temperature);
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_DEBUG_FS
+static const struct tegra_tsensor_group *
+find_sensor_group_by_id(struct tegra_soctherm *ts, u8 id)
+{
+	unsigned int i;
+
+	if (id > TEGRA124_SOCTHERM_SENSOR_NUM)
+		return ERR_PTR(-EINVAL);
+
+	for (i = 0; i < ts->soc->num_ttgs; i++)
+		if (ts->soc->ttgs[i]->id == id)
+			return ts->soc->ttgs[i];
+
+	return NULL;
+}
+
+static int thermtrip_read(struct platform_device *pdev,
+			  u8 id, u32 *temp)
+{
+	struct tegra_soctherm *ts = platform_get_drvdata(pdev);
+	const struct tegra_tsensor_group *sg;
+	u32 state, r;
+
+	sg = find_sensor_group_by_id(ts, id);
+	if (IS_ERR(sg)) {
+		dev_err(&pdev->dev, "Read thermtrip failed\n");
+		return -EINVAL;
+	}
+
+	r = readl(ts->regs + THERMCTL_THERMTRIP_CTL);
+	state = REG_GET_MASK(r, sg->thermtrip_threshold_mask);
+	state *= sg->thresh_grain;
+	*temp = state;
+
+	return 0;
+}
+
+static int thermtrip_write(struct platform_device *pdev,
+			   u8 id, int temp)
+{
+	struct tegra_soctherm *ts = platform_get_drvdata(pdev);
+	const struct tegra_tsensor_group *sg;
+	u32 state, r;
+	int err;
+
+	sg = find_sensor_group_by_id(ts, id);
+	if (IS_ERR(sg)) {
+		dev_err(&pdev->dev, "Read thermtrip failed\n");
+		return -EINVAL;
+	}
+
+	r = readl(ts->regs + THERMCTL_THERMTRIP_CTL);
+	state = REG_GET_MASK(r, sg->thermtrip_enable_mask);
+	if (!state) {
+		dev_err(&pdev->dev, "%s thermtrip not enabled.\n", sg->name);
+		return -EINVAL;
+	}
+
+	err = thermtrip_program(&pdev->dev, sg, temp);
+	if (err) {
+		dev_err(&pdev->dev, "Set %s thermtrip failed.\n", sg->name);
+		return r;
+	}
+
+	return 0;
+}
+
+#define DEFINE_THERMTRIP_SIMPLE_ATTR(__name, __id)			\
+static int __name##_show(void *data, u64 *val)				\
+{									\
+	struct platform_device *pdev = data;				\
+	u32 temp;							\
+	int r;								\
+									\
+	r = thermtrip_read(pdev, __id, &temp);				\
+	if (r < 0)							\
+		return 0;						\
+	*val = temp;							\
+									\
+	return 0;							\
+}									\
+									\
+static int __name##_set(void *data, u64 val)				\
+{									\
+	struct platform_device *pdev = data;				\
+	int r;								\
+									\
+	r = thermtrip_write(pdev, __id, val);				\
+	if (r)								\
+		return r;						\
+	else								\
+		return 0;						\
+}									\
+DEFINE_SIMPLE_ATTRIBUTE(__name##_fops, __name##_show, __name##_set, "%lld\n")
+
+DEFINE_THERMTRIP_SIMPLE_ATTR(cpu_thermtrip, TEGRA124_SOCTHERM_SENSOR_CPU);
+DEFINE_THERMTRIP_SIMPLE_ATTR(gpu_thermtrip, TEGRA124_SOCTHERM_SENSOR_GPU);
+DEFINE_THERMTRIP_SIMPLE_ATTR(pll_thermtrip, TEGRA124_SOCTHERM_SENSOR_PLLX);
+
 static int regs_show(struct seq_file *s, void *data)
 {
 	struct platform_device *pdev = s->private;
 	struct tegra_soctherm *ts = platform_get_drvdata(pdev);
 	struct tegra_tsensor *tsensors = ts->soc->tsensors;
+	const struct tegra_tsensor_group **ttgs = ts->soc->ttgs;
 	u32 r, state;
 	int i;
 
@@ -229,6 +464,17 @@ static int regs_show(struct seq_file *s, void *data)
 	state = REG_GET_MASK(r, SENSOR_TEMP2_MEM_TEMP_MASK);
 	seq_printf(s, " MEM(%d)\n", translate_temp(state));
 
+	r = readl(ts->regs + THERMCTL_THERMTRIP_CTL);
+	state = REG_GET_MASK(r, ttgs[0]->thermtrip_any_en_mask);
+	seq_printf(s, "Thermtrip Any En(%d)\n", state);
+	for (i = 0; i < ts->soc->num_ttgs; i++) {
+		state = REG_GET_MASK(r, ttgs[i]->thermtrip_enable_mask);
+		seq_printf(s, "     %s En(%d) ", ttgs[i]->name, state);
+		state = REG_GET_MASK(r, ttgs[i]->thermtrip_threshold_mask);
+		state *= ttgs[i]->thresh_grain;
+		seq_printf(s, "Thresh(%d)\n", state);
+	}
+
 	return 0;
 }
 
@@ -246,17 +492,42 @@ static const struct file_operations regs_fops = {
 
 static void soctherm_debug_init(struct platform_device *pdev)
 {
-	struct dentry *root, *file;
+	struct dentry *soctherm_root, *thermtrip_root, *file;
 
-	root = debugfs_create_dir("tegra_soctherm", NULL);
-	if (!root) {
+	soctherm_root = debugfs_create_dir("tegra_soctherm", NULL);
+	if (!soctherm_root) {
 		dev_err(&pdev->dev, "failed to create debugfs directory\n");
 		return;
 	}
 
-	file = debugfs_create_file("regs", 0644, root, pdev, &regs_fops);
+	file = debugfs_create_file("regs", 0644, soctherm_root, pdev,
+				   &regs_fops);
+	if (!file)
+		dev_err(&pdev->dev, "failed to create debugfs file regs\n");
+
+	thermtrip_root = debugfs_create_dir("thermtrip", soctherm_root);
+	if (!thermtrip_root) {
+		dev_err(&pdev->dev, "failed to create debugfs thermtrip\n");
+		return;
+	}
+
+	file = debugfs_create_file("cpu", S_IRUGO | S_IWUSR, thermtrip_root,
+				   pdev, &cpu_thermtrip_fops);
+	if (!file)
+		dev_err(&pdev->dev,
+			"failed to create debugfs file thermtrip cpu\n");
+
+	file = debugfs_create_file("gpu", S_IRUGO | S_IWUSR, thermtrip_root,
+				   pdev, &gpu_thermtrip_fops);
+	if (!file)
+		dev_err(&pdev->dev,
+			"failed to create debugfs file thermtrip gpu\n");
+
+	file = debugfs_create_file("pll", S_IRUGO | S_IWUSR, thermtrip_root,
+				   pdev, &pll_thermtrip_fops);
 	if (!file)
-		dev_err(&pdev->dev, "failed to create debugfs file\n");
+		dev_err(&pdev->dev,
+			"failed to create debugfs file thermtrip pll\n");
 }
 #else
 static inline void soctherm_debug_init(struct platform_device *pdev)
@@ -375,6 +646,7 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 	writel(hotspot, tegra->regs + SENSOR_HOTSPOT_OFF);
 
 	/* Initialize thermctl sensors */
+	tegra_soctherm_thermtrip(&pdev->dev);
 
 	for (i = 0; i < soc->num_ttgs; ++i) {
 		struct tegra_thermctl_zone *zone =
diff --git a/drivers/thermal/tegra/soctherm.h b/drivers/thermal/tegra/soctherm.h
index d3583223d76c..05d33839da94 100644
--- a/drivers/thermal/tegra/soctherm.h
+++ b/drivers/thermal/tegra/soctherm.h
@@ -21,6 +21,9 @@
 #define SENSOR_CONFIG2_THERMB_MASK		0xffff
 #define SENSOR_CONFIG2_THERMB_SHIFT		0
 
+#define THERMCTL_THERMTRIP_CTL			0x80
+/* BITs are defined in device file */
+
 #define SENSOR_PDIV				0x1c0
 #define SENSOR_PDIV_CPU_MASK			(0xf << 12)
 #define SENSOR_PDIV_GPU_MASK			(0xf << 8)
@@ -59,6 +62,10 @@ struct tegra_tsensor_group {
 	u32		sensor_temp_mask;
 	u32		pdiv, pdiv_ate, pdiv_mask;
 	u32		pllx_hotspot_diff, pllx_hotspot_mask;
+	u32		thermtrip_enable_mask;
+	u32		thermtrip_any_en_mask;
+	u32		thermtrip_threshold_mask;
+	int		thresh_grain;
 };
 
 struct tegra_tsensor_configuration {
diff --git a/drivers/thermal/tegra/tegra124-soctherm.c b/drivers/thermal/tegra/tegra124-soctherm.c
index db68f8233b0c..0f609be668c0 100644
--- a/drivers/thermal/tegra/tegra124-soctherm.c
+++ b/drivers/thermal/tegra/tegra124-soctherm.c
@@ -19,6 +19,17 @@
 
 #include "soctherm.h"
 
+#define TEGRA124_THERMTRIP_ANY_EN_MASK		(0x1 << 28)
+#define TEGRA124_THERMTRIP_MEM_EN_MASK		(0x1 << 27)
+#define TEGRA124_THERMTRIP_GPU_EN_MASK		(0x1 << 26)
+#define TEGRA124_THERMTRIP_CPU_EN_MASK		(0x1 << 25)
+#define TEGRA124_THERMTRIP_TSENSE_EN_MASK	(0x1 << 24)
+#define TEGRA124_THERMTRIP_GPUMEM_THRESH_MASK	(0xff << 16)
+#define TEGRA124_THERMTRIP_CPU_THRESH_MASK	(0xff << 8)
+#define TEGRA124_THERMTRIP_TSENSE_THRESH_MASK	0xff
+
+#define TEGRA124_THRESH_GRAIN			1000
+
 static const struct tegra_tsensor_configuration t124_tsensor_config = {
 	.tall = 16300,
 	.tiddq_en = 1,
@@ -37,6 +48,10 @@ static const struct tegra_tsensor_group tegra124_tsensor_group_cpu = {
 	.pdiv_mask			= SENSOR_PDIV_CPU_MASK,
 	.pllx_hotspot_diff		= 10,
 	.pllx_hotspot_mask		= SENSOR_HOTSPOT_CPU_MASK,
+	.thermtrip_any_en_mask		= TEGRA124_THERMTRIP_ANY_EN_MASK,
+	.thermtrip_enable_mask		= TEGRA124_THERMTRIP_CPU_EN_MASK,
+	.thermtrip_threshold_mask	= TEGRA124_THERMTRIP_CPU_THRESH_MASK,
+	.thresh_grain			= TEGRA124_THRESH_GRAIN,
 };
 
 static const struct tegra_tsensor_group tegra124_tsensor_group_gpu = {
@@ -49,6 +64,10 @@ static const struct tegra_tsensor_group tegra124_tsensor_group_gpu = {
 	.pdiv_mask			= SENSOR_PDIV_GPU_MASK,
 	.pllx_hotspot_diff		= 5,
 	.pllx_hotspot_mask		= SENSOR_HOTSPOT_GPU_MASK,
+	.thermtrip_any_en_mask		= TEGRA124_THERMTRIP_ANY_EN_MASK,
+	.thermtrip_enable_mask		= TEGRA124_THERMTRIP_GPU_EN_MASK,
+	.thermtrip_threshold_mask	= TEGRA124_THERMTRIP_GPUMEM_THRESH_MASK,
+	.thresh_grain			= TEGRA124_THRESH_GRAIN,
 };
 
 static const struct tegra_tsensor_group tegra124_tsensor_group_pll = {
@@ -59,6 +78,10 @@ static const struct tegra_tsensor_group tegra124_tsensor_group_pll = {
 	.pdiv				= 8,
 	.pdiv_ate			= 8,
 	.pdiv_mask			= SENSOR_PDIV_PLLX_MASK,
+	.thermtrip_any_en_mask		= TEGRA124_THERMTRIP_ANY_EN_MASK,
+	.thermtrip_enable_mask		= TEGRA124_THERMTRIP_TSENSE_EN_MASK,
+	.thermtrip_threshold_mask	= TEGRA124_THERMTRIP_TSENSE_THRESH_MASK,
+	.thresh_grain			= TEGRA124_THRESH_GRAIN,
 };
 
 static const struct tegra_tsensor_group tegra124_tsensor_group_mem = {
@@ -71,6 +94,10 @@ static const struct tegra_tsensor_group tegra124_tsensor_group_mem = {
 	.pdiv_mask			= SENSOR_PDIV_MEM_MASK,
 	.pllx_hotspot_diff		= 0,
 	.pllx_hotspot_mask		= SENSOR_HOTSPOT_MEM_MASK,
+	.thermtrip_any_en_mask		= TEGRA124_THERMTRIP_ANY_EN_MASK,
+	.thermtrip_enable_mask		= TEGRA124_THERMTRIP_MEM_EN_MASK,
+	.thermtrip_threshold_mask	= TEGRA124_THERMTRIP_GPUMEM_THRESH_MASK,
+	.thresh_grain			= TEGRA124_THRESH_GRAIN,
 };
 
 static const struct tegra_tsensor_group *
diff --git a/drivers/thermal/tegra/tegra210-soctherm.c b/drivers/thermal/tegra/tegra210-soctherm.c
index 0907775d361d..5140e3b3b231 100644
--- a/drivers/thermal/tegra/tegra210-soctherm.c
+++ b/drivers/thermal/tegra/tegra210-soctherm.c
@@ -20,6 +20,17 @@
 
 #include "soctherm.h"
 
+#define TEGRA210_THERMTRIP_ANY_EN_MASK		(0x1 << 31)
+#define TEGRA210_THERMTRIP_MEM_EN_MASK		(0x1 << 30)
+#define TEGRA210_THERMTRIP_GPU_EN_MASK		(0x1 << 29)
+#define TEGRA210_THERMTRIP_CPU_EN_MASK		(0x1 << 28)
+#define TEGRA210_THERMTRIP_TSENSE_EN_MASK	(0x1 << 27)
+#define TEGRA210_THERMTRIP_GPUMEM_THRESH_MASK	(0x1ff << 18)
+#define TEGRA210_THERMTRIP_CPU_THRESH_MASK	(0x1ff << 9)
+#define TEGRA210_THERMTRIP_TSENSE_THRESH_MASK	0x1ff
+
+#define TEGRA210_THRESH_GRAIN			500
+
 static const struct tegra_tsensor_configuration tegra210_tsensor_config = {
 	.tall = 16300,
 	.tiddq_en = 1,
@@ -38,6 +49,10 @@ static const struct tegra_tsensor_group tegra210_tsensor_group_cpu = {
 	.pdiv_mask			= SENSOR_PDIV_CPU_MASK,
 	.pllx_hotspot_diff		= 10,
 	.pllx_hotspot_mask		= SENSOR_HOTSPOT_CPU_MASK,
+	.thermtrip_any_en_mask		= TEGRA210_THERMTRIP_ANY_EN_MASK,
+	.thermtrip_enable_mask		= TEGRA210_THERMTRIP_CPU_EN_MASK,
+	.thermtrip_threshold_mask	= TEGRA210_THERMTRIP_CPU_THRESH_MASK,
+	.thresh_grain			= TEGRA210_THRESH_GRAIN,
 };
 
 static const struct tegra_tsensor_group tegra210_tsensor_group_gpu = {
@@ -50,6 +65,10 @@ static const struct tegra_tsensor_group tegra210_tsensor_group_gpu = {
 	.pdiv_mask			= SENSOR_PDIV_GPU_MASK,
 	.pllx_hotspot_diff		= 5,
 	.pllx_hotspot_mask		= SENSOR_HOTSPOT_GPU_MASK,
+	.thermtrip_any_en_mask		= TEGRA210_THERMTRIP_ANY_EN_MASK,
+	.thermtrip_enable_mask		= TEGRA210_THERMTRIP_GPU_EN_MASK,
+	.thermtrip_threshold_mask	= TEGRA210_THERMTRIP_GPUMEM_THRESH_MASK,
+	.thresh_grain			= TEGRA210_THRESH_GRAIN,
 };
 
 static const struct tegra_tsensor_group tegra210_tsensor_group_pll = {
@@ -60,6 +79,10 @@ static const struct tegra_tsensor_group tegra210_tsensor_group_pll = {
 	.pdiv				= 8,
 	.pdiv_ate			= 8,
 	.pdiv_mask			= SENSOR_PDIV_PLLX_MASK,
+	.thermtrip_any_en_mask		= TEGRA210_THERMTRIP_ANY_EN_MASK,
+	.thermtrip_enable_mask		= TEGRA210_THERMTRIP_TSENSE_EN_MASK,
+	.thermtrip_threshold_mask	= TEGRA210_THERMTRIP_TSENSE_THRESH_MASK,
+	.thresh_grain			= TEGRA210_THRESH_GRAIN,
 };
 
 static const struct tegra_tsensor_group tegra210_tsensor_group_mem = {
@@ -72,6 +95,10 @@ static const struct tegra_tsensor_group tegra210_tsensor_group_mem = {
 	.pdiv_mask			= SENSOR_PDIV_MEM_MASK,
 	.pllx_hotspot_diff		= 0,
 	.pllx_hotspot_mask		= SENSOR_HOTSPOT_MEM_MASK,
+	.thermtrip_any_en_mask		= TEGRA210_THERMTRIP_ANY_EN_MASK,
+	.thermtrip_enable_mask		= TEGRA210_THERMTRIP_MEM_EN_MASK,
+	.thermtrip_threshold_mask	= TEGRA210_THERMTRIP_GPUMEM_THRESH_MASK,
+	.thresh_grain			= TEGRA210_THRESH_GRAIN,
 };
 
 static const struct tegra_tsensor_group *
-- 
1.9.1
