From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v3 08/15] ASoC: tegra: Add audio mclk control through clk_out_1 and extern1
Date: Thu, 5 Dec 2019 18:48:48 -0800
Message-ID: <1575600535-26877-9-git-send-email-skomatineni@nvidia.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

Current ASoC driver uses extern1 as cdev1 clock from Tegra30 onwards
through device tree.

Actual audio mclk is clk_out_1 and to use PLLA for mclk rate control,
need to clk_out_1_mux parent to extern1 and extern1 parent to PLLA_OUT0.

Currently Tegra clock driver init sets the parents and enables both
clk_out_1 and extern1 clocks. But these clocks parent and enables should
be controlled by ASoC driver.

Clock parents can be specified in device tree using assigned-clocks
and assigned-clock-parents.

To enable audio mclk, both clk_out_1 and extern1 clocks need to be
enabled.

This patch configures parents for clk_out_1 and extern1 clocks if device
tree does not specify clock parents inorder to support old device tree
and controls mclk using both clk_out_1 and extern1 clocks.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 sound/soc/tegra/tegra_asoc_utils.c | 66 ++++++++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra_asoc_utils.h |  1 +
 2 files changed, 67 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
index 536a578e9512..8e3a3740df7c 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -60,6 +60,7 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
 	data->set_mclk = 0;
 
 	clk_disable_unprepare(data->clk_cdev1);
+	clk_disable_unprepare(data->clk_extern1);
 	clk_disable_unprepare(data->clk_pll_a_out0);
 	clk_disable_unprepare(data->clk_pll_a);
 
@@ -89,6 +90,14 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
 		return err;
 	}
 
+	if (!IS_ERR_OR_NULL(data->clk_extern1)) {
+		err = clk_prepare_enable(data->clk_extern1);
+		if (err) {
+			dev_err(data->dev, "Can't enable extern1: %d\n", err);
+			return err;
+		}
+	}
+
 	err = clk_prepare_enable(data->clk_cdev1);
 	if (err) {
 		dev_err(data->dev, "Can't enable cdev1: %d\n", err);
@@ -109,6 +118,7 @@ int tegra_asoc_utils_set_ac97_rate(struct tegra_asoc_utils_data *data)
 	int err;
 
 	clk_disable_unprepare(data->clk_cdev1);
+	clk_disable_unprepare(data->clk_extern1);
 	clk_disable_unprepare(data->clk_pll_a_out0);
 	clk_disable_unprepare(data->clk_pll_a);
 
@@ -142,6 +152,14 @@ int tegra_asoc_utils_set_ac97_rate(struct tegra_asoc_utils_data *data)
 		return err;
 	}
 
+	if (!IS_ERR_OR_NULL(data->clk_extern1)) {
+		err = clk_prepare_enable(data->clk_extern1);
+		if (err) {
+			dev_err(data->dev, "Can't enable extern1: %d\n", err);
+			return err;
+		}
+	}
+
 	err = clk_prepare_enable(data->clk_cdev1);
 	if (err) {
 		dev_err(data->dev, "Can't enable cdev1: %d\n", err);
@@ -158,6 +176,7 @@ EXPORT_SYMBOL_GPL(tegra_asoc_utils_set_ac97_rate);
 int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 			  struct device *dev)
 {
+	struct clk *clk_out_1_mux;
 	int ret;
 
 	data->dev = dev;
@@ -196,6 +215,51 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 		goto err_put_pll_a_out0;
 	}
 
+	/*
+	 * If clock parents are not set in DT, configure here to use clk_out_1
+	 * as mclk and extern1 as parent for Tegra30 and higher.
+	 */
+	if (!of_find_property(dev->of_node, "assigned-clock-parents", NULL) &&
+	    data->soc > TEGRA_ASOC_UTILS_SOC_TEGRA20) {
+		data->clk_extern1 = clk_get_sys("clk_out_1", "extern1");
+		if (IS_ERR(data->clk_extern1)) {
+			dev_err(data->dev, "Can't retrieve clk extern1\n");
+			ret = PTR_ERR(data->clk_extern1);
+			goto err_put_cdev1;
+		}
+
+		ret = clk_set_parent(data->clk_extern1, data->clk_pll_a_out0);
+		if (ret < 0) {
+			dev_err(data->dev,
+				"Set parent failed for clk extern1: %d\n",
+				ret);
+			goto err_put_cdev1;
+		}
+
+		clk_out_1_mux = clk_get_sys(NULL, "clk_out_1_mux");
+		if (IS_ERR(clk_out_1_mux)) {
+			dev_err(data->dev, "Can't retrieve clk clk_out_1_mux\n");
+			ret = PTR_ERR(clk_out_1_mux);
+			goto err_put_cdev1;
+		}
+
+		ret = clk_set_parent(clk_out_1_mux, data->clk_extern1);
+		if (ret < 0) {
+			dev_err(data->dev,
+				"Set parent failed for clk_out_1_mux: %d\n",
+				ret);
+			clk_put(clk_out_1_mux);
+			goto err_put_cdev1;
+		}
+
+		data->clk_cdev1 = clk_get_sys(NULL, "clk_out_1");
+		if (IS_ERR(data->clk_cdev1)) {
+			dev_err(data->dev, "Can't retrieve clk clk_out_1\n");
+			ret = PTR_ERR(data->clk_cdev1);
+			goto err_put_cdev1;
+		}
+	}
+
 	ret = tegra_asoc_utils_set_rate(data, 44100, 256 * 44100);
 	if (ret)
 		goto err_put_cdev1;
@@ -215,6 +279,8 @@ EXPORT_SYMBOL_GPL(tegra_asoc_utils_init);
 
 void tegra_asoc_utils_fini(struct tegra_asoc_utils_data *data)
 {
+	if (!IS_ERR_OR_NULL(data->clk_extern1))
+		clk_put(data->clk_extern1);
 	clk_put(data->clk_cdev1);
 	clk_put(data->clk_pll_a_out0);
 	clk_put(data->clk_pll_a);
diff --git a/sound/soc/tegra/tegra_asoc_utils.h b/sound/soc/tegra/tegra_asoc_utils.h
index 0c13818dee75..5f2b96478caf 100644
--- a/sound/soc/tegra/tegra_asoc_utils.h
+++ b/sound/soc/tegra/tegra_asoc_utils.h
@@ -25,6 +25,7 @@ struct tegra_asoc_utils_data {
 	struct clk *clk_pll_a;
 	struct clk *clk_pll_a_out0;
 	struct clk *clk_cdev1;
+	struct clk *clk_extern1;
 	int set_baseclock;
 	int set_mclk;
 };
-- 
2.7.4
