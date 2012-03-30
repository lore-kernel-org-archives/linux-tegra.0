From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 12/17] ASoC: tegra: utils: add support for Tegra30 devices
Date: Fri, 30 Mar 2012 17:07:27 -0600
Message-ID: <1333148852-17806-13-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra30 has some additional clocks that need to be manipulated, names
some clocks differently, runs PLLs at different base rates, etc. The
utility code needs to handle this.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_alc5632.c    |    3 ++-
 sound/soc/tegra/tegra_asoc_utils.c |   29 ++++++++++++++++++++++++-----
 sound/soc/tegra/tegra_asoc_utils.h |   10 ++++++++--
 sound/soc/tegra/tegra_wm8903.c     |    3 ++-
 sound/soc/tegra/trimslice.c        |    3 ++-
 5 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 32de700..6151487 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -210,7 +210,8 @@ static __devinit int tegra_alc5632_probe(struct platform_device *pdev)
 
 	tegra_alc5632_dai.platform_of_node = tegra_alc5632_dai.cpu_dai_of_node;
 
-	ret = tegra_asoc_utils_init(&alc5632->util_data, &pdev->dev);
+	ret = tegra_asoc_utils_init(&alc5632->util_data,
+				    TEGRA_ASOC_UTILS_SOC_TEGRA20, &pdev->dev);
 	if (ret)
 		goto err;
 
diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
index f8428e4..7e5c412 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -2,7 +2,7 @@
  * tegra_asoc_utils.c - Harmony machine ASoC driver
  *
  * Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
- * Copyright (C) 2010 - NVIDIA, Inc.
+ * Copyright (C) 2010,2012 - NVIDIA, Inc.
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
@@ -40,7 +40,10 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
 	case 22050:
 	case 44100:
 	case 88200:
-		new_baseclock = 56448000;
+		if (data->soc == TEGRA_ASOC_UTILS_SOC_TEGRA20)
+			new_baseclock = 56448000;
+		else
+			new_baseclock = 564480000;
 		break;
 	case 8000:
 	case 16000:
@@ -48,7 +51,10 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
 	case 48000:
 	case 64000:
 	case 96000:
-		new_baseclock = 73728000;
+		if (data->soc == TEGRA_ASOC_UTILS_SOC_TEGRA20)
+			new_baseclock = 73728000;
+		else
+			new_baseclock = 552960000;
 		break;
 	default:
 		return -EINVAL;
@@ -78,7 +84,7 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
 		return err;
 	}
 
-	/* Don't set cdev1 rate; its locked to pll_a_out0 */
+	/* Don't set cdev1/extern1 rate; it's locked to pll_a_out0 */
 
 	err = clk_enable(data->clk_pll_a);
 	if (err) {
@@ -106,10 +112,20 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
 EXPORT_SYMBOL_GPL(tegra_asoc_utils_set_rate);
 
 int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
+			  enum tegra_asoc_utils_soc soc,
 			  struct device *dev)
 {
 	int ret;
 
+	switch (soc) {
+	case TEGRA_ASOC_UTILS_SOC_TEGRA20:
+	case TEGRA_ASOC_UTILS_SOC_TEGRA30:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	data->soc = soc;
 	data->dev = dev;
 
 	data->clk_pll_a = clk_get_sys(NULL, "pll_a");
@@ -126,7 +142,10 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 		goto err_put_pll_a;
 	}
 
-	data->clk_cdev1 = clk_get_sys(NULL, "cdev1");
+	if (data->soc == TEGRA_ASOC_UTILS_SOC_TEGRA20)
+		data->clk_cdev1 = clk_get_sys(NULL, "cdev1");
+	else
+		data->clk_cdev1 = clk_get_sys("extern1", NULL);
 	if (IS_ERR(data->clk_cdev1)) {
 		dev_err(data->dev, "Can't retrieve clk cdev1\n");
 		ret = PTR_ERR(data->clk_cdev1);
diff --git a/sound/soc/tegra/tegra_asoc_utils.h b/sound/soc/tegra/tegra_asoc_utils.h
index 4818195..5e65641 100644
--- a/sound/soc/tegra/tegra_asoc_utils.h
+++ b/sound/soc/tegra/tegra_asoc_utils.h
@@ -2,7 +2,7 @@
  * tegra_asoc_utils.h - Definitions for Tegra DAS driver
  *
  * Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
- * Copyright (C) 2010 - NVIDIA, Inc.
+ * Copyright (C) 2010,2012 - NVIDIA, Inc.
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
@@ -26,8 +26,14 @@
 struct clk;
 struct device;
 
+enum tegra_asoc_utils_soc {
+	TEGRA_ASOC_UTILS_SOC_TEGRA20,
+	TEGRA_ASOC_UTILS_SOC_TEGRA30,
+};
+
 struct tegra_asoc_utils_data {
 	struct device *dev;
+	enum tegra_asoc_utils_soc soc;
 	struct clk *clk_pll_a;
 	struct clk *clk_pll_a_out0;
 	struct clk *clk_cdev1;
@@ -38,8 +44,8 @@ struct tegra_asoc_utils_data {
 int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
 			      int mclk);
 int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
+			  enum tegra_asoc_utils_soc soc,
 			  struct device *dev);
 void tegra_asoc_utils_fini(struct tegra_asoc_utils_data *data);
 
 #endif
-
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 0b0df49..d2ac5cc 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -442,7 +442,8 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
+	ret = tegra_asoc_utils_init(&machine->util_data,
+				    TEGRA_ASOC_UTILS_SOC_TEGRA20, &pdev->dev);
 	if (ret)
 		goto err;
 
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 0fd115e..487c52f 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -149,7 +149,8 @@ static __devinit int tegra_snd_trimslice_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ret = tegra_asoc_utils_init(&trimslice->util_data, &pdev->dev);
+	ret = tegra_asoc_utils_init(&trimslice->util_data,
+				    TEGRA_ASOC_UTILS_SOC_TEGRA20, &pdev->dev);
 	if (ret)
 		goto err;
 
-- 
1.7.0.4
