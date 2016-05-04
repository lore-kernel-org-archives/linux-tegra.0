From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V3 4/4] soc/tegra: pmc: Register PMC child devices as platform device
Date: Wed, 4 May 2016 17:09:33 +0530
Message-ID: <1462361973-27990-5-git-send-email-ldewangan@nvidia.com>
References: <1462361973-27990-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462361973-27990-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, swarren@wwwdotorg.org, jonathanh@nvidia.com, airlied@linux.ie
Cc: gnurou@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
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
devices table for Tegra124 and Tegra210.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

---
Changes from V1:
Reworked on DT for having flat entry and register all child devices
as simple platform device instead of of_populate_device().

Changes from V2:
- Handling of the release of child devices on error.
- Register sub devices for T124 and T210 as T124 supports the DPD of IO
  pads.
---
 drivers/soc/tegra/pmc.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 0611cea..0eb652f 100644
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
@@ -158,6 +160,7 @@ struct tegra_pmc_soc {
  * @lp0_vec_size: size of the LP0 warm boot code
  * @powergates_available: Bitmap of available power gates
  * @powergates_lock: mutex for power gate register access
+ * @pdevs: Platform device for PMC child devices.
  */
 struct tegra_pmc {
 	struct device *dev;
@@ -184,6 +187,8 @@ struct tegra_pmc {
 	DECLARE_BITMAP(powergates_available, TEGRA_POWERGATE_MAX);
 
 	struct mutex powergates_lock;
+
+	struct platform_device **pdevs;
 };
 
 static struct tegra_pmc *pmc = &(struct tegra_pmc) {
@@ -1310,6 +1315,57 @@ out:
 	of_node_put(np);
 }
 
+static int  tegra_pmc_init_sub_devs(struct tegra_pmc *pmc)
+{
+	int ret, i;
+
+	if (!pmc->soc->num_sub_devs)
+		return 0;
+
+	pmc->pdevs = devm_kzalloc(pmc->dev, pmc->soc->num_sub_devs *
+				  sizeof(**pmc->pdevs), GFP_KERNEL);
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
+	}
+
+	return 0;
+
+pdev_cleanups:
+	while (--i >= 0) {
+		platform_device_unregister(pmc->pdevs[i]);
+		pmc->pdevs[i] = NULL;
+	}
+
+	return ret;
+}
+
+static void tegra_pmc_deinit_sub_devs(struct tegra_pmc *pmc)
+{
+	int i;
+
+	if (!pmc->soc->num_sub_devs || !pmc->pdevs)
+		return;
+
+	for (i = 0; i < pmc->soc->num_sub_devs; ++i) {
+		if (pmc->pdevs[i]) {
+			platform_device_unregister(pmc->pdevs[i]);
+			pmc->pdevs[i] = NULL;
+		}
+	}
+}
+
 static int tegra_pmc_probe(struct platform_device *pdev)
 {
 	void __iomem *base;
@@ -1339,10 +1395,14 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 
 	tegra_pmc_init_tsense_reset(pmc);
 
+	err = tegra_pmc_init_sub_devs(pmc);
+	if (err < 0)
+		dev_warn(pmc->dev, "Failed to register sub devices: %d\n", err);
+
 	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
 		err = tegra_powergate_debugfs_init();
 		if (err < 0)
-			return err;
+			goto cleanups;
 	}
 
 	err = register_restart_handler(&tegra_pmc_restart_handler);
@@ -1350,7 +1410,7 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		debugfs_remove(pmc->debugfs);
 		dev_err(&pdev->dev, "unable to register restart handler, %d\n",
 			err);
-		return err;
+		goto cleanups;
 	}
 
 	tegra_powergate_init(pmc);
@@ -1361,6 +1421,11 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	mutex_unlock(&pmc->powergates_lock);
 
 	return 0;
+
+cleanups:
+	tegra_pmc_deinit_sub_devs(pmc);
+
+	return err;
 }
 
 #if defined(CONFIG_PM_SLEEP) && defined(CONFIG_ARM)
@@ -1544,6 +1609,10 @@ struct tegra_io_pads_control tegra124_io_pads_control[] = {
 	TEGRA_IO_PADS_CONTROL(SYS_DDC, 58, -1),
 };
 
+static const char *tegra124_sub_devs_name[] = {
+	"pinctrl-tegra124-io-pad",
+};
+
 static const struct tegra_pmc_soc tegra124_pmc_soc = {
 	.num_powergates = ARRAY_SIZE(tegra124_powergates),
 	.powergates = tegra124_powergates,
@@ -1551,6 +1620,8 @@ static const struct tegra_pmc_soc tegra124_pmc_soc = {
 	.cpu_powergates = tegra124_cpu_powergates,
 	.io_pads_control = tegra124_io_pads_control,
 	.num_io_pads = ARRAY_SIZE(tegra124_io_pads_control),
+	.sub_devs_name = tegra124_sub_devs_name,
+	.num_sub_devs = ARRAY_SIZE(tegra124_sub_devs_name),
 	.has_tsense_reset = true,
 	.has_gpu_clamps = true,
 };
@@ -1628,6 +1699,11 @@ struct tegra_io_pads_control tegra210_io_pads_control[] = {
 	TEGRA_IO_PADS_CONTROL(LVDS, 57, -1),
 	TEGRA_IO_PADS_CONTROL(AUDIO_HV, 61, 18),
 };
+
+static const char *tegra210_sub_devs_name[] = {
+	"pinctrl-tegra210-io-pad",
+};
+
 static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.num_powergates = ARRAY_SIZE(tegra210_powergates),
 	.powergates = tegra210_powergates,
@@ -1635,6 +1711,8 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
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
