From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] soc/tegra: pmc: Register PMC child devices as platform device
Date: Wed, 2 Nov 2016 14:29:49 +0530
Message-ID: <1478077189-24426-4-git-send-email-ldewangan@nvidia.com>
References: <1478077189-24426-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478077189-24426-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Power Management Controller(PMC) of Tegra does the multiple chip
power management related functionality for internal and IO interfacing.
Some of the functionalities are power gating of IP blocks, IO pads
voltage and power state configuration, system power state configurations,
wakeup controls etc.

Different functionalities of the PMC are provided through different
framework like IO pads control can be provided through pinctrl framework,
IO power control is via misc driver etc. All sub functionalities are
represented as PMC child devices.

Register the PMC child devices as platform device and fill the child
devices table for Tegra124 and Tegra210.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Based on the branch
	(https://github.com/thierryreding/linux/tree/tegra186).
This was sent earlier but not applied so resending it as new patch
after rebasing it.

 drivers/soc/tegra/pmc.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 44546bd..916a94b 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -145,6 +145,9 @@ struct tegra_pmc_soc {
 
 	const struct tegra_io_pad_soc *io_pads;
 	unsigned int num_io_pads;
+
+	const char **sub_devs_name;
+	unsigned int num_sub_devs;
 };
 
 /**
@@ -169,6 +172,7 @@ struct tegra_pmc_soc {
  * @lp0_vec_size: size of the LP0 warm boot code
  * @powergates_available: Bitmap of available power gates
  * @powergates_lock: mutex for power gate register access
+ * @plat_subdevs: Platform device for PMC child devices.
  */
 struct tegra_pmc {
 	struct device *dev;
@@ -195,6 +199,7 @@ struct tegra_pmc {
 	DECLARE_BITMAP(powergates_available, TEGRA_POWERGATE_MAX);
 
 	struct mutex powergates_lock;
+	struct platform_device **plat_subdevs;
 };
 
 static struct tegra_pmc *pmc = &(struct tegra_pmc) {
@@ -1375,6 +1380,43 @@ static void tegra_pmc_init_tsense_reset(struct tegra_pmc *pmc)
 	of_node_put(np);
 }
 
+static int tegra_pmc_init_sub_devs(struct tegra_pmc *pmc)
+{
+	int ret, i;
+
+	if (!pmc->soc->num_sub_devs)
+		return 0;
+
+	pmc->plat_subdevs = devm_kzalloc(pmc->dev, pmc->soc->num_sub_devs *
+					 sizeof(**pmc->plat_subdevs),
+					 GFP_KERNEL);
+	if (!pmc->plat_subdevs)
+		return -ENOMEM;
+
+	for (i = 0; i < pmc->soc->num_sub_devs; ++i) {
+		pmc->plat_subdevs[i] = platform_device_register_data(pmc->dev,
+						pmc->soc->sub_devs_name[i],
+						0, NULL, 0);
+		if (IS_ERR(pmc->plat_subdevs[i])) {
+			ret = PTR_ERR(pmc->plat_subdevs[i]);
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
+		platform_device_unregister(pmc->plat_subdevs[i]);
+		pmc->plat_subdevs[i] = NULL;
+	}
+
+	return ret;
+}
+
 static int tegra_pmc_probe(struct platform_device *pdev)
 {
 	void __iomem *base;
@@ -1426,6 +1468,11 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	err = tegra_pmc_init_sub_devs(pmc);
+	if (err < 0)
+		dev_warn(pmc->dev, "Failed to register PMC sub devices: %d\n",
+			 err);
+
 	mutex_lock(&pmc->powergates_lock);
 	iounmap(pmc->base);
 	pmc->base = base;
@@ -1608,6 +1655,10 @@ static const struct tegra_io_pad_soc tegra124_io_pads[] = {
 	{ .id = TEGRA_IO_PAD_USB_BIAS, .dpd = 12, .voltage = UINT_MAX },
 };
 
+static const char *tegra124_sub_devs_name[] = {
+	"pinctrl-t124-io-pad",
+};
+
 static const struct tegra_pmc_soc tegra124_pmc_soc = {
 	.num_powergates = ARRAY_SIZE(tegra124_powergates),
 	.powergates = tegra124_powergates,
@@ -1617,6 +1668,8 @@ static const struct tegra_pmc_soc tegra124_pmc_soc = {
 	.has_gpu_clamps = true,
 	.num_io_pads = ARRAY_SIZE(tegra124_io_pads),
 	.io_pads = tegra124_io_pads,
+	.sub_devs_name = tegra124_sub_devs_name,
+	.num_sub_devs = ARRAY_SIZE(tegra124_sub_devs_name),
 };
 
 static const char * const tegra210_powergates[] = {
@@ -1694,6 +1747,10 @@ static const struct tegra_io_pad_soc tegra210_io_pads[] = {
 	{ .id = TEGRA_IO_PAD_USB_BIAS, .dpd = 12, .voltage = UINT_MAX },
 };
 
+static const char *tegra210_sub_devs_name[] = {
+	"pinctrl-t210-io-pad",
+};
+
 static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.num_powergates = ARRAY_SIZE(tegra210_powergates),
 	.powergates = tegra210_powergates,
@@ -1703,6 +1760,8 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.has_gpu_clamps = true,
 	.num_io_pads = ARRAY_SIZE(tegra210_io_pads),
 	.io_pads = tegra210_io_pads,
+	.sub_devs_name = tegra210_sub_devs_name,
+	.num_sub_devs = ARRAY_SIZE(tegra210_sub_devs_name),
 };
 
 static const struct of_device_id tegra_pmc_match[] = {
-- 
2.1.4
