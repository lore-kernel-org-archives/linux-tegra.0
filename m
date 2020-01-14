From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v8 12/22] ASoC: tegra: Use device managed resource APIs to get the clock
Date: Mon, 13 Jan 2020 23:24:17 -0800
Message-ID: <1578986667-16041-13-git-send-email-skomatineni@nvidia.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

tegra_asoc_utils uses clk_get() to get the clock and clk_put() to
free them explicitly.

This patch updates it to use device managed resource API
devm_clk_get() so the clock will be automatically released and freed
when the device is unbound and removes tegra_asoc_utils_fini() as
its no longer needed.

Tested-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Sameer Pujar <spujar@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 sound/soc/tegra/tegra_alc5632.c    |  7 +------
 sound/soc/tegra/tegra_asoc_utils.c | 39 +++++++++-----------------------------
 sound/soc/tegra/tegra_asoc_utils.h |  1 -
 sound/soc/tegra/tegra_max98090.c   | 22 ++++++---------------
 sound/soc/tegra/tegra_rt5640.c     | 22 ++++++---------------
 sound/soc/tegra/tegra_rt5677.c     |  7 +------
 sound/soc/tegra/tegra_sgtl5000.c   |  7 +------
 sound/soc/tegra/tegra_wm8753.c     | 22 ++++++---------------
 sound/soc/tegra/tegra_wm8903.c     | 22 ++++++---------------
 sound/soc/tegra/tegra_wm9712.c     |  8 ++------
 sound/soc/tegra/trimslice.c        | 18 ++++--------------
 11 files changed, 42 insertions(+), 133 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 9e8b1497efd3..50a6d2ff4442 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -205,13 +205,11 @@ static int tegra_alc5632_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
 			ret);
-		goto err_fini_utils;
+		goto err_put_cpu_of_node;
 	}
 
 	return 0;
 
-err_fini_utils:
-	tegra_asoc_utils_fini(&alc5632->util_data);
 err_put_cpu_of_node:
 	of_node_put(tegra_alc5632_dai.cpus->of_node);
 	tegra_alc5632_dai.cpus->of_node = NULL;
@@ -226,12 +224,9 @@ static int tegra_alc5632_probe(struct platform_device *pdev)
 static int tegra_alc5632_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct tegra_alc5632 *machine = snd_soc_card_get_drvdata(card);
 
 	snd_soc_unregister_card(card);
 
-	tegra_asoc_utils_fini(&machine->util_data);
-
 	of_node_put(tegra_alc5632_dai.cpus->of_node);
 	tegra_alc5632_dai.cpus->of_node = NULL;
 	tegra_alc5632_dai.platforms->of_node = NULL;
diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
index 74d3ffe7e603..84c4f59df71f 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -175,34 +175,30 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 		return -EINVAL;
 	}
 
-	data->clk_pll_a = clk_get(dev, "pll_a");
+	data->clk_pll_a = devm_clk_get(dev, "pll_a");
 	if (IS_ERR(data->clk_pll_a)) {
 		dev_err(data->dev, "Can't retrieve clk pll_a\n");
-		ret = PTR_ERR(data->clk_pll_a);
-		goto err;
+		return PTR_ERR(data->clk_pll_a);
 	}
 
-	data->clk_pll_a_out0 = clk_get(dev, "pll_a_out0");
+	data->clk_pll_a_out0 = devm_clk_get(dev, "pll_a_out0");
 	if (IS_ERR(data->clk_pll_a_out0)) {
 		dev_err(data->dev, "Can't retrieve clk pll_a_out0\n");
-		ret = PTR_ERR(data->clk_pll_a_out0);
-		goto err_put_pll_a;
+		return PTR_ERR(data->clk_pll_a_out0);
 	}
 
-	data->clk_cdev1 = clk_get(dev, "mclk");
+	data->clk_cdev1 = devm_clk_get(dev, "mclk");
 	if (IS_ERR(data->clk_cdev1)) {
 		if (PTR_ERR(data->clk_cdev1) != -ENOENT) {
 			dev_err(data->dev, "Can't retrieve clk cdev1\n");
-			ret = PTR_ERR(data->clk_cdev1);
-			goto err_put_pll_a_out0;
+			return PTR_ERR(data->clk_cdev1);
 		}
 
 		/* Fall back to extern1 */
-		data->clk_cdev1 = clk_get(dev, "extern1");
+		data->clk_cdev1 = devm_clk_get(dev, "extern1");
 		if (IS_ERR(data->clk_cdev1)) {
 			dev_err(data->dev, "Can't retrieve clk extern1\n");
-			ret = PTR_ERR(data->clk_cdev1);
-			goto err_put_pll_a_out0;
+			return PTR_ERR(data->clk_cdev1);
 		}
 
 		dev_info(data->dev, "Falling back to extern1\n");
@@ -210,29 +206,12 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 
 	ret = tegra_asoc_utils_set_rate(data, 44100, 256 * 44100);
 	if (ret)
-		goto err_put_cdev1;
+		return ret;
 
 	return 0;
-
-err_put_cdev1:
-	clk_put(data->clk_cdev1);
-err_put_pll_a_out0:
-	clk_put(data->clk_pll_a_out0);
-err_put_pll_a:
-	clk_put(data->clk_pll_a);
-err:
-	return ret;
 }
 EXPORT_SYMBOL_GPL(tegra_asoc_utils_init);
 
-void tegra_asoc_utils_fini(struct tegra_asoc_utils_data *data)
-{
-	clk_put(data->clk_cdev1);
-	clk_put(data->clk_pll_a_out0);
-	clk_put(data->clk_pll_a);
-}
-EXPORT_SYMBOL_GPL(tegra_asoc_utils_fini);
-
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra ASoC utility code");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/tegra/tegra_asoc_utils.h b/sound/soc/tegra/tegra_asoc_utils.h
index 0c13818dee75..a34439587d59 100644
--- a/sound/soc/tegra/tegra_asoc_utils.h
+++ b/sound/soc/tegra/tegra_asoc_utils.h
@@ -34,6 +34,5 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
 int tegra_asoc_utils_set_ac97_rate(struct tegra_asoc_utils_data *data);
 int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 			  struct device *dev);
-void tegra_asoc_utils_fini(struct tegra_asoc_utils_data *data);
 
 #endif
diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index 4954a33ff46b..f554a3d4571f 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -218,19 +218,18 @@ static int tegra_max98090_probe(struct platform_device *pdev)
 
 	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
 	if (ret)
-		goto err;
+		return ret;
 
 	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
 	if (ret)
-		goto err;
+		return ret;
 
 	tegra_max98090_dai.codecs->of_node = of_parse_phandle(np,
 			"nvidia,audio-codec", 0);
 	if (!tegra_max98090_dai.codecs->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,audio-codec' missing or invalid\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	tegra_max98090_dai.cpus->of_node = of_parse_phandle(np,
@@ -238,40 +237,31 @@ static int tegra_max98090_probe(struct platform_device *pdev)
 	if (!tegra_max98090_dai.cpus->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,i2s-controller' missing or invalid\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	tegra_max98090_dai.platforms->of_node = tegra_max98090_dai.cpus->of_node;
 
 	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
 	if (ret)
-		goto err;
+		return ret;
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
 			ret);
-		goto err_fini_utils;
+		return ret;
 	}
 
 	return 0;
-
-err_fini_utils:
-	tegra_asoc_utils_fini(&machine->util_data);
-err:
-	return ret;
 }
 
 static int tegra_max98090_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct tegra_max98090 *machine = snd_soc_card_get_drvdata(card);
 
 	snd_soc_unregister_card(card);
 
-	tegra_asoc_utils_fini(&machine->util_data);
-
 	return 0;
 }
 
diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
index d46915a3ec4c..5c695dfea009 100644
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -164,19 +164,18 @@ static int tegra_rt5640_probe(struct platform_device *pdev)
 
 	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
 	if (ret)
-		goto err;
+		return ret;
 
 	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
 	if (ret)
-		goto err;
+		return ret;
 
 	tegra_rt5640_dai.codecs->of_node = of_parse_phandle(np,
 			"nvidia,audio-codec", 0);
 	if (!tegra_rt5640_dai.codecs->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,audio-codec' missing or invalid\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	tegra_rt5640_dai.cpus->of_node = of_parse_phandle(np,
@@ -184,40 +183,31 @@ static int tegra_rt5640_probe(struct platform_device *pdev)
 	if (!tegra_rt5640_dai.cpus->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,i2s-controller' missing or invalid\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	tegra_rt5640_dai.platforms->of_node = tegra_rt5640_dai.cpus->of_node;
 
 	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
 	if (ret)
-		goto err;
+		return ret;
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
 			ret);
-		goto err_fini_utils;
+		return ret;
 	}
 
 	return 0;
-
-err_fini_utils:
-	tegra_asoc_utils_fini(&machine->util_data);
-err:
-	return ret;
 }
 
 static int tegra_rt5640_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct tegra_rt5640 *machine = snd_soc_card_get_drvdata(card);
 
 	snd_soc_unregister_card(card);
 
-	tegra_asoc_utils_fini(&machine->util_data);
-
 	return 0;
 }
 
diff --git a/sound/soc/tegra/tegra_rt5677.c b/sound/soc/tegra/tegra_rt5677.c
index 81cb6cc6236e..fb86f76728b3 100644
--- a/sound/soc/tegra/tegra_rt5677.c
+++ b/sound/soc/tegra/tegra_rt5677.c
@@ -270,13 +270,11 @@ static int tegra_rt5677_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
 			ret);
-		goto err_fini_utils;
+		goto err_put_cpu_of_node;
 	}
 
 	return 0;
 
-err_fini_utils:
-	tegra_asoc_utils_fini(&machine->util_data);
 err_put_cpu_of_node:
 	of_node_put(tegra_rt5677_dai.cpus->of_node);
 	tegra_rt5677_dai.cpus->of_node = NULL;
@@ -291,12 +289,9 @@ static int tegra_rt5677_probe(struct platform_device *pdev)
 static int tegra_rt5677_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct tegra_rt5677 *machine = snd_soc_card_get_drvdata(card);
 
 	snd_soc_unregister_card(card);
 
-	tegra_asoc_utils_fini(&machine->util_data);
-
 	tegra_rt5677_dai.platforms->of_node = NULL;
 	of_node_put(tegra_rt5677_dai.codecs->of_node);
 	tegra_rt5677_dai.codecs->of_node = NULL;
diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
index e13b81d29cf3..586f56f435f4 100644
--- a/sound/soc/tegra/tegra_sgtl5000.c
+++ b/sound/soc/tegra/tegra_sgtl5000.c
@@ -156,13 +156,11 @@ static int tegra_sgtl5000_driver_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
 			ret);
-		goto err_fini_utils;
+		goto err_put_cpu_of_node;
 	}
 
 	return 0;
 
-err_fini_utils:
-	tegra_asoc_utils_fini(&machine->util_data);
 err_put_cpu_of_node:
 	of_node_put(tegra_sgtl5000_dai.cpus->of_node);
 	tegra_sgtl5000_dai.cpus->of_node = NULL;
@@ -177,13 +175,10 @@ static int tegra_sgtl5000_driver_probe(struct platform_device *pdev)
 static int tegra_sgtl5000_driver_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct tegra_sgtl5000 *machine = snd_soc_card_get_drvdata(card);
 	int ret;
 
 	ret = snd_soc_unregister_card(card);
 
-	tegra_asoc_utils_fini(&machine->util_data);
-
 	of_node_put(tegra_sgtl5000_dai.cpus->of_node);
 	tegra_sgtl5000_dai.cpus->of_node = NULL;
 	tegra_sgtl5000_dai.platforms->of_node = NULL;
diff --git a/sound/soc/tegra/tegra_wm8753.c b/sound/soc/tegra/tegra_wm8753.c
index f6dd790dad71..f76cfdc963ed 100644
--- a/sound/soc/tegra/tegra_wm8753.c
+++ b/sound/soc/tegra/tegra_wm8753.c
@@ -127,19 +127,18 @@ static int tegra_wm8753_driver_probe(struct platform_device *pdev)
 
 	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
 	if (ret)
-		goto err;
+		return ret;
 
 	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
 	if (ret)
-		goto err;
+		return ret;
 
 	tegra_wm8753_dai.codecs->of_node = of_parse_phandle(np,
 			"nvidia,audio-codec", 0);
 	if (!tegra_wm8753_dai.codecs->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,audio-codec' missing or invalid\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	tegra_wm8753_dai.cpus->of_node = of_parse_phandle(np,
@@ -147,40 +146,31 @@ static int tegra_wm8753_driver_probe(struct platform_device *pdev)
 	if (!tegra_wm8753_dai.cpus->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,i2s-controller' missing or invalid\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	tegra_wm8753_dai.platforms->of_node = tegra_wm8753_dai.cpus->of_node;
 
 	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
 	if (ret)
-		goto err;
+		return ret;
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
 			ret);
-		goto err_fini_utils;
+		return ret;
 	}
 
 	return 0;
-
-err_fini_utils:
-	tegra_asoc_utils_fini(&machine->util_data);
-err:
-	return ret;
 }
 
 static int tegra_wm8753_driver_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct tegra_wm8753 *machine = snd_soc_card_get_drvdata(card);
 
 	snd_soc_unregister_card(card);
 
-	tegra_asoc_utils_fini(&machine->util_data);
-
 	return 0;
 }
 
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index f08d3489c3cf..f5f78c3512cd 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -301,19 +301,18 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 
 	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
 	if (ret)
-		goto err;
+		return ret;
 
 	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
 	if (ret)
-		goto err;
+		return ret;
 
 	tegra_wm8903_dai.codecs->of_node = of_parse_phandle(np,
 						"nvidia,audio-codec", 0);
 	if (!tegra_wm8903_dai.codecs->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,audio-codec' missing or invalid\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	tegra_wm8903_dai.cpus->of_node = of_parse_phandle(np,
@@ -321,40 +320,31 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 	if (!tegra_wm8903_dai.cpus->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,i2s-controller' missing or invalid\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	tegra_wm8903_dai.platforms->of_node = tegra_wm8903_dai.cpus->of_node;
 
 	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
 	if (ret)
-		goto err;
+		return ret;
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
 			ret);
-		goto err_fini_utils;
+		return ret;
 	}
 
 	return 0;
-
-err_fini_utils:
-	tegra_asoc_utils_fini(&machine->util_data);
-err:
-	return ret;
 }
 
 static int tegra_wm8903_driver_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
 
 	snd_soc_unregister_card(card);
 
-	tegra_asoc_utils_fini(&machine->util_data);
-
 	return 0;
 }
 
diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
index b85bd9f89073..726edfa21a29 100644
--- a/sound/soc/tegra/tegra_wm9712.c
+++ b/sound/soc/tegra/tegra_wm9712.c
@@ -113,19 +113,17 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
 
 	ret = tegra_asoc_utils_set_ac97_rate(&machine->util_data);
 	if (ret)
-		goto asoc_utils_fini;
+		goto codec_unregister;
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
 			ret);
-		goto asoc_utils_fini;
+		goto codec_unregister;
 	}
 
 	return 0;
 
-asoc_utils_fini:
-	tegra_asoc_utils_fini(&machine->util_data);
 codec_unregister:
 	platform_device_del(machine->codec);
 codec_put:
@@ -140,8 +138,6 @@ static int tegra_wm9712_driver_remove(struct platform_device *pdev)
 
 	snd_soc_unregister_card(card);
 
-	tegra_asoc_utils_fini(&machine->util_data);
-
 	platform_device_unregister(machine->codec);
 
 	return 0;
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 3f67ddd13674..e51c67092c8f 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -125,8 +125,7 @@ static int tegra_snd_trimslice_probe(struct platform_device *pdev)
 	if (!trimslice_tlv320aic23_dai.codecs->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,audio-codec' missing or invalid\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	trimslice_tlv320aic23_dai.cpus->of_node = of_parse_phandle(np,
@@ -134,8 +133,7 @@ static int tegra_snd_trimslice_probe(struct platform_device *pdev)
 	if (!trimslice_tlv320aic23_dai.cpus->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,i2s-controller' missing or invalid\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	trimslice_tlv320aic23_dai.platforms->of_node =
@@ -143,32 +141,24 @@ static int tegra_snd_trimslice_probe(struct platform_device *pdev)
 
 	ret = tegra_asoc_utils_init(&trimslice->util_data, &pdev->dev);
 	if (ret)
-		goto err;
+		return ret;
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
 			ret);
-		goto err_fini_utils;
+		return ret;
 	}
 
 	return 0;
-
-err_fini_utils:
-	tegra_asoc_utils_fini(&trimslice->util_data);
-err:
-	return ret;
 }
 
 static int tegra_snd_trimslice_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct tegra_trimslice *trimslice = snd_soc_card_get_drvdata(card);
 
 	snd_soc_unregister_card(card);
 
-	tegra_asoc_utils_fini(&trimslice->util_data);
-
 	return 0;
 }
 
-- 
2.7.4
