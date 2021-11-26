Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA334C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350116AbhKZQjq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350181AbhKZQhq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:37:46 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41660C0617A1;
        Fri, 26 Nov 2021 08:19:49 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id d11so19689938ljg.8;
        Fri, 26 Nov 2021 08:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d38MEEq+r0QwqDvnuwxQbfydxKTbgpiZ5kKyEJPIo+w=;
        b=BPiYz2WeGMWsPtKS1APNfVB/7nuy9JzoTlEySilxtxLhjzkr81In3mdT04JjniVVM9
         3wb4vg4bMVZrc9ZLO+3EzVO9oDyvqMAxX663+WLoplWxgMdgeHGPqcD2tjeImTmSZbNK
         H6xOdWkq5PvGG3wEi13PuvRkOYJ1gAYKw7W+bJLtrx8nfoXcEfBxk0eVvN10Z2srZ4KB
         GvZXGCt6oWUTHqfdcvgpjkel7EM+qr0OgOCFBp9uu/4Mpqf2pDQ/Wt9TVo5vsxhZ6Ryu
         sFJ3t3O3SsJuZPOoTK8l9iIcDKUUj5jTSOS/sU+8/fX6ppC+3U+wvJDP2Aw9Y5YZjB0O
         uEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d38MEEq+r0QwqDvnuwxQbfydxKTbgpiZ5kKyEJPIo+w=;
        b=MAhW9TiGqBz75kE30mIn4eKR23Py6Sv0lkdCFqaNKROcy+4wwmnwTp724BCA4oh772
         1V7IDlChAa9DqDTGMrxTJpJ29RWuLE34yfHVsOwgEEEEL6CS5oAuJ68SFa7YY3nzSAbu
         LA0bh/QNIS7PlY0DnKet6xnuNGhnO0WZ+sR+CxvX9zO6qKSoaZ6/6b8MIYqnMJGD4rr1
         T1Kiy2ckvv5Kf84mpWwvpvD47l4Cwcas2CZtLbM22cIRqTIS5IJVXHzESSwrqmOSuZHI
         VBlAjfVFN7APr1Zbp0cHzNa8mo1rNgnufURVqdDlgKVh6jP1NsqKkJ2rM4omU8DMFp/B
         7qlQ==
X-Gm-Message-State: AOAM531RB3T1KFPQgdIb823/YWB7wm4b4NPs43oZBDP8d7/S33ucQ1S/
        VPdbhD1tbAiczCC+ujbfpgQ=
X-Google-Smtp-Source: ABdhPJwiDLKsyEpyZvghDGkDwPjRYeINMptb0ZgLeUnAm7qiWhxhH0ZBchRFF4q5jWPmusqDhLfroA==
X-Received: by 2002:a2e:3012:: with SMTP id w18mr31124844ljw.217.1637943587520;
        Fri, 26 Nov 2021 08:19:47 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:46 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/20] ASoC: tegra20: spdif: Improve driver's code
Date:   Fri, 26 Nov 2021 19:17:55 +0300
Message-Id: <20211126161807.15776-9-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

- Clean up whitespaces, defines and variables.

- Remove obsolete code.

- Adhere to upstream coding style.

- Don't override returned error code.

- Replace pr_err with dev_err.

No functional changes are made by this patch. This is a minor code's
refactoring that will ease further maintenance of the driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 49 ++++++++++++---------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 6650875d2555..9383683aa4e9 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -23,8 +23,6 @@
 
 #include "tegra20_spdif.h"
 
-#define DRV_NAME "tegra20-spdif"
-
 static __maybe_unused int tegra20_spdif_runtime_suspend(struct device *dev)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
@@ -49,11 +47,10 @@ static __maybe_unused int tegra20_spdif_runtime_resume(struct device *dev)
 }
 
 static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params,
-				struct snd_soc_dai *dai)
+				   struct snd_pcm_hw_params *params,
+				   struct snd_soc_dai *dai)
 {
-	struct device *dev = dai->dev;
-	struct tegra20_spdif *spdif = snd_soc_dai_get_drvdata(dai);
+	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
 	unsigned int mask = 0, val = 0;
 	int ret, spdifclock;
 
@@ -106,7 +103,7 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 
 	ret = clk_set_rate(spdif->clk_spdif_out, spdifclock);
 	if (ret) {
-		dev_err(dev, "Can't set SPDIF clock rate: %d\n", ret);
+		dev_err(dai->dev, "Can't set SPDIF clock rate: %d\n", ret);
 		return ret;
 	}
 
@@ -127,9 +124,9 @@ static void tegra20_spdif_stop_playback(struct tegra20_spdif *spdif)
 }
 
 static int tegra20_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
-				struct snd_soc_dai *dai)
+				 struct snd_soc_dai *dai)
 {
-	struct tegra20_spdif *spdif = snd_soc_dai_get_drvdata(dai);
+	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -151,7 +148,7 @@ static int tegra20_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 
 static int tegra20_spdif_probe(struct snd_soc_dai *dai)
 {
-	struct tegra20_spdif *spdif = snd_soc_dai_get_drvdata(dai);
+	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
 
 	dai->capture_dma_data = NULL;
 	dai->playback_dma_data = &spdif->playback_dma_data;
@@ -160,26 +157,26 @@ static int tegra20_spdif_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops tegra20_spdif_dai_ops = {
-	.hw_params	= tegra20_spdif_hw_params,
-	.trigger	= tegra20_spdif_trigger,
+	.hw_params = tegra20_spdif_hw_params,
+	.trigger = tegra20_spdif_trigger,
 };
 
 static struct snd_soc_dai_driver tegra20_spdif_dai = {
-	.name = DRV_NAME,
+	.name = "tegra20-spdif",
 	.probe = tegra20_spdif_probe,
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
-				SNDRV_PCM_RATE_48000,
+			 SNDRV_PCM_RATE_48000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.ops = &tegra20_spdif_dai_ops,
 };
 
 static const struct snd_soc_component_driver tegra20_spdif_component = {
-	.name		= DRV_NAME,
+	.name = "tegra20-spdif",
 };
 
 static bool tegra20_spdif_wr_rd_reg(struct device *dev, unsigned int reg)
@@ -260,7 +257,7 @@ static const struct regmap_config tegra20_spdif_regmap_config = {
 static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 {
 	struct tegra20_spdif *spdif;
-	struct resource *mem, *dmareq;
+	struct resource *mem;
 	void __iomem *regs;
 	int ret;
 
@@ -273,27 +270,19 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 
 	spdif->clk_spdif_out = devm_clk_get(&pdev->dev, "spdif_out");
 	if (IS_ERR(spdif->clk_spdif_out)) {
-		pr_err("Can't retrieve spdif clock\n");
-		ret = PTR_ERR(spdif->clk_spdif_out);
-		return ret;
+		dev_err(&pdev->dev, "Could not retrieve spdif clock\n");
+		return PTR_ERR(spdif->clk_spdif_out);
 	}
 
 	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	dmareq = platform_get_resource(pdev, IORESOURCE_DMA, 0);
-	if (!dmareq) {
-		dev_err(&pdev->dev, "No DMA resource\n");
-		return -ENODEV;
-	}
-
 	spdif->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
-					    &tegra20_spdif_regmap_config);
+					      &tegra20_spdif_regmap_config);
 	if (IS_ERR(spdif->regmap)) {
 		dev_err(&pdev->dev, "regmap init failed\n");
-		ret = PTR_ERR(spdif->regmap);
-		return ret;
+		return PTR_ERR(spdif->regmap);
 	}
 
 	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
@@ -306,7 +295,6 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 					 &tegra20_spdif_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
-		ret = -ENOMEM;
 		goto err_pm_disable;
 	}
 
@@ -349,14 +337,13 @@ MODULE_DEVICE_TABLE(of, tegra20_spdif_of_match);
 
 static struct platform_driver tegra20_spdif_driver = {
 	.driver = {
-		.name = DRV_NAME,
+		.name = "tegra20-spdif",
 		.pm = &tegra20_spdif_pm_ops,
 		.of_match_table = tegra20_spdif_of_match,
 	},
 	.probe = tegra20_spdif_platform_probe,
 	.remove = tegra20_spdif_platform_remove,
 };
-
 module_platform_driver(tegra20_spdif_driver);
 
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
-- 
2.33.1

