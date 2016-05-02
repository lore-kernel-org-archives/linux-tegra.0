From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/6] soc/tegra: pmc: Register PMC child devices as platform device
Date: Mon, 2 May 2016 17:47:12 +0530
Message-ID: <1462191434-28933-5-git-send-email-ldewangan@nvidia.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462191434-28933-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Power Management Controller(PMC) of Tegra does the multiple chip
power related functionality for internal and IO interfacing.
Some of the functionalities are power gating of IP blocks, IO pads
voltage and power state configuration, system power state configurations,
wakeup controls etc.

Different functionalities of the PMC are provided through different
framework like IO pads control can be provided through pinctrl framework,
IO power control is via misc driver etc. All sub functionalities are
represented as PMC child devices.

Register the PMC child devices as platform device and fill the child
devices table for Tegra210.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
Changes from V1:
Reworked on DT for having flat entry and register all child devices
as simple platform device instead of of_populate_device().
---
 drivers/soc/tegra/pmc.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index b3be4b9..625167e 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -132,6 +132,8 @@ struct tegra_pmc_soc {
 	const u8 *cpu_powergates;
 	const struct tegra_io_pads_control *io_pads_control;
 	unsigned int num_io_pads;
+	const char **sub_devs_name;
+	unsigned int num_sub_devs;
 	bool has_tsense_reset;
 	bool has_gpu_clamps;
 };
@@ -158,6 +160,8 @@ struct tegra_pmc_soc {
  * @lp0_vec_size: size of the LP0 warm boot code
  * @powergates_available: Bitmap of available power gates
  * @powergates_lock: mutex for power gate register access
+ * @pdevs: Platform device for PMC child devices.
+ * @num_pdevs: Number of platform devices.
  */
 struct tegra_pmc {
 	struct device *dev;
@@ -184,6 +188,9 @@ struct tegra_pmc {
 	DECLARE_BITMAP(powergates_available, TEGRA_POWERGATE_MAX);
 
 	struct mutex powergates_lock;
+
+	struct platform_device **pdevs;
+	unsigned int num_pdevs;
 };
 
 static struct tegra_pmc *pmc = &(struct tegra_pmc) {
@@ -1379,6 +1386,43 @@ out:
 	of_node_put(np);
 }
 
+static int  tegra_pmc_init_sub_devs(struct tegra_pmc *pmc)
+{
+	int ret, i;
+
+	if (!pmc->soc->num_sub_devs)
+		return 0;
+
+	pmc->pdevs = devm_kzalloc(pmc->dev, sizeof(**pmc->pdevs), GFP_KERNEL);
+	if (!pmc->pdevs)
+		return -ENOMEM;
+
+	for (i = 0; i < pmc->soc->num_sub_devs; ++i) {
+		pmc->pdevs[i] = platform_device_register_data(pmc->dev,
+						pmc->soc->sub_devs_name[i],
+						0, NULL, 0);
+		if (IS_ERR(pmc->pdevs[i])) {
+			ret = PTR_ERR(pmc->pdevs[i]);
+			dev_err(pmc->dev,
+				"Failed to register platform device for %s: %d\n",
+				pmc->soc->sub_devs_name[i], ret);
+			goto pdev_cleanups;
+		}
+		pmc->num_pdevs++;
+	}
+
+	return 0;
+
+pdev_cleanups:
+	for (i = pmc->num_pdevs; i > 0; i--) {
+		platform_device_unregister(pmc->pdevs[i - 1]);
+		pmc->pdevs[i - 1] = NULL;
+	}
+	pmc->num_pdevs = 0;
+
+	return ret;
+}
+
 static int tegra_pmc_probe(struct platform_device *pdev)
 {
 	void __iomem *base;
@@ -1408,6 +1452,10 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 
 	tegra_pmc_init_tsense_reset(pmc);
 
+	err = tegra_pmc_init_sub_devs(pmc);
+	if (err < 0)
+		dev_warn(pmc->dev, "Failed to register sub devices: %d\n", err);
+
 	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
 		err = tegra_powergate_debugfs_init();
 		if (err < 0)
@@ -1616,6 +1664,10 @@ static const u8 tegra210_cpu_powergates[] = {
 	TEGRA_POWERGATE_CPU3,
 };
 
+static const char *tegra210_sub_devs_name[] = {
+	"pinctrl-tegra210-io-pad",
+};
+
 static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.num_powergates = ARRAY_SIZE(tegra210_powergates),
 	.powergates = tegra210_powergates,
@@ -1623,6 +1675,8 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.cpu_powergates = tegra210_cpu_powergates,
 	.io_pads_control = tegra210_io_pads_control,
 	.num_io_pads = ARRAY_SIZE(tegra210_io_pads_control),
+	.sub_devs_name = tegra210_sub_devs_name,
+	.num_sub_devs = ARRAY_SIZE(tegra210_sub_devs_name),
 	.has_tsense_reset = true,
 	.has_gpu_clamps = true,
 };
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
