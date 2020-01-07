From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v6 12/19] ASoC: tegra: Add audio mclk configuration
Date: Mon, 6 Jan 2020 20:14:11 -0800
Message-ID: <1578370458-3686-13-git-send-email-skomatineni@nvidia.com>
References: <1578370458-3686-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1578370458-3686-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra PMC clock clk_out_1 is dedicated for audio mclk from Tegra30
through Tegra210 and currently Tegra clock driver does the initial parent
configuration for audio mclk and keeps it enabled by default.

With the move of PMC clocks from clock driver into pmc driver,
audio clocks parent configuration can be specified through the device tree
using assigned-clock-parents property and audio mclk control should be
taken care by the audio driver.

This patch has implementation for parent configuration when default parent
configuration is not specified in the device tree and controls audio mclk
enable and disable during machine startup and shutdown.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 sound/soc/tegra/tegra_alc5632.c    | 21 ++++++++++
 sound/soc/tegra/tegra_asoc_utils.c | 84 ++++++++++++++++++++++++--------------
 sound/soc/tegra/tegra_asoc_utils.h |  2 +
 sound/soc/tegra/tegra_max98090.c   | 21 ++++++++++
 sound/soc/tegra/tegra_rt5640.c     | 21 ++++++++++
 sound/soc/tegra/tegra_rt5677.c     | 21 ++++++++++
 sound/soc/tegra/tegra_sgtl5000.c   | 21 ++++++++++
 sound/soc/tegra/tegra_wm8753.c     | 21 ++++++++++
 sound/soc/tegra/tegra_wm8903.c     | 21 ++++++++++
 sound/soc/tegra/trimslice.c        | 21 ++++++++++
 10 files changed, 224 insertions(+), 30 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 50a6d2ff4442..0fd10023f7a6 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -62,8 +62,29 @@ static int tegra_alc5632_asoc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int tegra_alc5632_asoc_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_alc5632 *machine = snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = tegra_asoc_utils_clk_enable(&machine->util_data);
+
+	return ret;
+}
+
+static void tegra_alc5632_asoc_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_alc5632 *machine = snd_soc_card_get_drvdata(rtd->card);
+
+	tegra_asoc_utils_clk_disable(&machine->util_data);
+}
+
 static const struct snd_soc_ops tegra_alc5632_asoc_ops = {
+	.startup = tegra_alc5632_asoc_startup,
 	.hw_params = tegra_alc5632_asoc_hw_params,
+	.shutdown = tegra_alc5632_asoc_shutdown,
 };
 
 static struct snd_soc_jack tegra_alc5632_hs_jack;
diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
index 0d2271952555..2886ae9f5a16 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -60,8 +60,6 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
 	data->set_mclk = 0;
 
 	clk_disable_unprepare(data->clk_cdev1);
-	clk_disable_unprepare(data->clk_pll_a_out0);
-	clk_disable_unprepare(data->clk_pll_a);
 
 	err = clk_set_rate(data->clk_pll_a, new_baseclock);
 	if (err) {
@@ -77,18 +75,6 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
 
 	/* Don't set cdev1/extern1 rate; it's locked to pll_a_out0 */
 
-	err = clk_prepare_enable(data->clk_pll_a);
-	if (err) {
-		dev_err(data->dev, "Can't enable pll_a: %d\n", err);
-		return err;
-	}
-
-	err = clk_prepare_enable(data->clk_pll_a_out0);
-	if (err) {
-		dev_err(data->dev, "Can't enable pll_a_out0: %d\n", err);
-		return err;
-	}
-
 	err = clk_prepare_enable(data->clk_cdev1);
 	if (err) {
 		dev_err(data->dev, "Can't enable cdev1: %d\n", err);
@@ -109,8 +95,6 @@ int tegra_asoc_utils_set_ac97_rate(struct tegra_asoc_utils_data *data)
 	int err;
 
 	clk_disable_unprepare(data->clk_cdev1);
-	clk_disable_unprepare(data->clk_pll_a_out0);
-	clk_disable_unprepare(data->clk_pll_a);
 
 	/*
 	 * AC97 rate is fixed at 24.576MHz and is used for both the host
@@ -130,17 +114,27 @@ int tegra_asoc_utils_set_ac97_rate(struct tegra_asoc_utils_data *data)
 
 	/* Don't set cdev1/extern1 rate; it's locked to pll_a_out0 */
 
-	err = clk_prepare_enable(data->clk_pll_a);
+	err = clk_prepare_enable(data->clk_cdev1);
 	if (err) {
-		dev_err(data->dev, "Can't enable pll_a: %d\n", err);
+		dev_err(data->dev, "Can't enable cdev1: %d\n", err);
 		return err;
 	}
 
-	err = clk_prepare_enable(data->clk_pll_a_out0);
-	if (err) {
-		dev_err(data->dev, "Can't enable pll_a_out0: %d\n", err);
-		return err;
-	}
+	data->set_baseclock = pll_rate;
+	data->set_mclk = ac97_rate;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra_asoc_utils_set_ac97_rate);
+
+void tegra_asoc_utils_clk_disable(struct tegra_asoc_utils_data *data)
+{
+	clk_disable_unprepare(data->clk_cdev1);
+}
+
+int tegra_asoc_utils_clk_enable(struct tegra_asoc_utils_data *data)
+{
+	int err;
 
 	err = clk_prepare_enable(data->clk_cdev1);
 	if (err) {
@@ -148,16 +142,13 @@ int tegra_asoc_utils_set_ac97_rate(struct tegra_asoc_utils_data *data)
 		return err;
 	}
 
-	data->set_baseclock = pll_rate;
-	data->set_mclk = ac97_rate;
-
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tegra_asoc_utils_set_ac97_rate);
 
 int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 			  struct device *dev)
 {
+	struct clk *clk_out_1, *clk_extern1;
 	int ret;
 
 	data->dev = dev;
@@ -193,9 +184,42 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 		return PTR_ERR(data->clk_cdev1);
 	}
 
-	ret = tegra_asoc_utils_set_rate(data, 44100, 256 * 44100);
-	if (ret)
-		return ret;
+	/*
+	 * If clock parents are not set in DT, configure here to use clk_out_1
+	 * as mclk and extern1 as parent for Tegra30 and higher.
+	 */
+	if (!of_find_property(dev->of_node, "assigned-clock-parents", NULL) &&
+	    data->soc > TEGRA_ASOC_UTILS_SOC_TEGRA20) {
+		dev_err(data->dev,
+			"Configuring clocks for a legacy device-tree\n");
+		clk_extern1 = devm_clk_get(dev, "extern1");
+		if (IS_ERR(clk_extern1)) {
+			dev_err(data->dev, "Can't retrieve clk extern1\n");
+			return PTR_ERR(clk_extern1);
+		}
+
+		ret = clk_set_parent(clk_extern1, data->clk_pll_a_out0);
+		if (ret < 0) {
+			dev_err(data->dev,
+				"Set parent failed for clk extern1\n");
+			return ret;
+		}
+
+		clk_out_1 = devm_clk_get(dev, "clk_out_1");
+		if (IS_ERR(clk_out_1)) {
+			dev_err(data->dev, "Can't retrieve clk clk_out_1\n");
+			return PTR_ERR(clk_out_1);
+		}
+
+		ret = clk_set_parent(clk_out_1, clk_extern1);
+		if (ret < 0) {
+			dev_err(data->dev,
+				"Set parent failed for clk_out_1\n");
+			return ret;
+		}
+
+		data->clk_cdev1 = clk_out_1;
+	}
 
 	return 0;
 }
diff --git a/sound/soc/tegra/tegra_asoc_utils.h b/sound/soc/tegra/tegra_asoc_utils.h
index a34439587d59..6db93009a317 100644
--- a/sound/soc/tegra/tegra_asoc_utils.h
+++ b/sound/soc/tegra/tegra_asoc_utils.h
@@ -34,5 +34,7 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
 int tegra_asoc_utils_set_ac97_rate(struct tegra_asoc_utils_data *data);
 int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 			  struct device *dev);
+int tegra_asoc_utils_clk_enable(struct tegra_asoc_utils_data *data);
+void tegra_asoc_utils_clk_disable(struct tegra_asoc_utils_data *data);
 
 #endif
diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index f554a3d4571f..98d1ff49074b 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -82,8 +82,29 @@ static int tegra_max98090_asoc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int tegra_max98090_asoc_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_max98090 *machine = snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = tegra_asoc_utils_clk_enable(&machine->util_data);
+
+	return ret;
+}
+
+static void tegra_max98090_asoc_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_max98090 *machine = snd_soc_card_get_drvdata(rtd->card);
+
+	tegra_asoc_utils_clk_disable(&machine->util_data);
+}
+
 static const struct snd_soc_ops tegra_max98090_ops = {
+	.startup = tegra_max98090_asoc_startup,
 	.hw_params = tegra_max98090_asoc_hw_params,
+	.shutdown = tegra_max98090_asoc_shutdown,
 };
 
 static struct snd_soc_jack tegra_max98090_hp_jack;
diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
index 5c695dfea009..8705b1a32a14 100644
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -65,8 +65,29 @@ static int tegra_rt5640_asoc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int tegra_rt5640_asoc_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_rt5640 *machine = snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = tegra_asoc_utils_clk_enable(&machine->util_data);
+
+	return ret;
+}
+
+static void tegra_rt5640_asoc_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_rt5640 *machine = snd_soc_card_get_drvdata(rtd->card);
+
+	tegra_asoc_utils_clk_disable(&machine->util_data);
+}
+
 static const struct snd_soc_ops tegra_rt5640_ops = {
+	.startup = tegra_rt5640_asoc_startup,
 	.hw_params = tegra_rt5640_asoc_hw_params,
+	.shutdown = tegra_rt5640_asoc_shutdown,
 };
 
 static struct snd_soc_jack tegra_rt5640_hp_jack;
diff --git a/sound/soc/tegra/tegra_rt5677.c b/sound/soc/tegra/tegra_rt5677.c
index fb86f76728b3..a44b5ddc33ee 100644
--- a/sound/soc/tegra/tegra_rt5677.c
+++ b/sound/soc/tegra/tegra_rt5677.c
@@ -82,8 +82,29 @@ static int tegra_rt5677_event_hp(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int tegra_rt5677_asoc_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_rt5677 *machine = snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = tegra_asoc_utils_clk_enable(&machine->util_data);
+
+	return ret;
+}
+
+static void tegra_rt5677_asoc_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_rt5677 *machine = snd_soc_card_get_drvdata(rtd->card);
+
+	tegra_asoc_utils_clk_disable(&machine->util_data);
+}
+
 static const struct snd_soc_ops tegra_rt5677_ops = {
+	.startup = tegra_rt5677_asoc_startup,
 	.hw_params = tegra_rt5677_asoc_hw_params,
+	.shutdown = tegra_rt5677_asoc_shutdown,
 };
 
 static struct snd_soc_jack tegra_rt5677_hp_jack;
diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
index 586f56f435f4..f3317dd4a79f 100644
--- a/sound/soc/tegra/tegra_sgtl5000.c
+++ b/sound/soc/tegra/tegra_sgtl5000.c
@@ -71,8 +71,29 @@ static int tegra_sgtl5000_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int tegra_sgtl5000_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_sgtl5000 *machine = snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = tegra_asoc_utils_clk_enable(&machine->util_data);
+
+	return ret;
+}
+
+static void tegra_sgtl5000_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_sgtl5000 *machine = snd_soc_card_get_drvdata(rtd->card);
+
+	tegra_asoc_utils_clk_disable(&machine->util_data);
+}
+
 static const struct snd_soc_ops tegra_sgtl5000_ops = {
+	.startup = tegra_sgtl5000_startup,
 	.hw_params = tegra_sgtl5000_hw_params,
+	.shutdown = tegra_sgtl5000_shutdown,
 };
 
 static const struct snd_soc_dapm_widget tegra_sgtl5000_dapm_widgets[] = {
diff --git a/sound/soc/tegra/tegra_wm8753.c b/sound/soc/tegra/tegra_wm8753.c
index f76cfdc963ed..f4a000ec7506 100644
--- a/sound/soc/tegra/tegra_wm8753.c
+++ b/sound/soc/tegra/tegra_wm8753.c
@@ -75,8 +75,29 @@ static int tegra_wm8753_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int tegra_wm8753_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_wm8753 *machine = snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = tegra_asoc_utils_clk_enable(&machine->util_data);
+
+	return ret;
+}
+
+static void tegra_wm8753_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_wm8753 *machine = snd_soc_card_get_drvdata(rtd->card);
+
+	tegra_asoc_utils_clk_disable(&machine->util_data);
+}
+
 static const struct snd_soc_ops tegra_wm8753_ops = {
+	.startup = tegra_wm8753_startup,
 	.hw_params = tegra_wm8753_hw_params,
+	.shutdown = tegra_wm8753_shutdown,
 };
 
 static const struct snd_soc_dapm_widget tegra_wm8753_dapm_widgets[] = {
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index f5f78c3512cd..7b5cd1653821 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -82,8 +82,29 @@ static int tegra_wm8903_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int tegra_wm8903_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = tegra_asoc_utils_clk_enable(&machine->util_data);
+
+	return ret;
+}
+
+static void tegra_wm8903_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(rtd->card);
+
+	tegra_asoc_utils_clk_disable(&machine->util_data);
+}
+
 static const struct snd_soc_ops tegra_wm8903_ops = {
+	.startup = tegra_wm8903_startup,
 	.hw_params = tegra_wm8903_hw_params,
+	.shutdown = tegra_wm8903_shutdown,
 };
 
 static struct snd_soc_jack tegra_wm8903_hp_jack;
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index e51c67092c8f..4b703734904f 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -60,8 +60,29 @@ static int trimslice_asoc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int trimslice_asoc_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_trimslice *machine = snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = tegra_asoc_utils_clk_enable(&machine->util_data);
+
+	return ret;
+}
+
+static void trimslice_asoc_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct tegra_trimslice *machine = snd_soc_card_get_drvdata(rtd->card);
+
+	tegra_asoc_utils_clk_disable(&machine->util_data);
+}
+
 static const struct snd_soc_ops trimslice_asoc_ops = {
+	.startup = trimslice_asoc_startup,
 	.hw_params = trimslice_asoc_hw_params,
+	.shutdown = trimslice_asoc_shutdown,
 };
 
 static const struct snd_soc_dapm_widget trimslice_dapm_widgets[] = {
-- 
2.7.4
