Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134DDC433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 24 Oct 2021 19:29:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9E616103D
	for <linux-tegra@archiver.kernel.org>; Sun, 24 Oct 2021 19:29:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbhJXTcR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 24 Oct 2021 15:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbhJXTcR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 24 Oct 2021 15:32:17 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB2FC061745;
        Sun, 24 Oct 2021 12:29:56 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i6so12968124lfv.9;
        Sun, 24 Oct 2021 12:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KuWfVJmwiYFrjBYD5I8hPFxxzsgnJfeoN2PJ/5VwVFo=;
        b=DV+dcYL3tCQ7pZQBBoGyJIzfKEiIOS4K/M2JDQH0hHHWhOXQmpoLKrkVY0d7carPZH
         4b5yIMH5NmePlmnJnMpuXGXOHD6Q+Q15j5rFgci0sL7loM/ti27NnufY2rNcGIRNKXIx
         XBclvZ6LjxuTxSM2vphWK6g6HSzHv6WwFmvU7PdxlQGEtN6georbm/6cNAuQxF3Vnnwc
         /iasdD1mJ1fjrHhHdGfzmzAffccAEGksHgAt2EfEg/ckwiFtAjEAHCeIK3pedSk4LRBz
         HRCsdIF6Vif0uRf1Oyo4GANHGlrKDknOgD5xctbM+eW0XFQyQGj8c58GkpyOP881qNVU
         7+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KuWfVJmwiYFrjBYD5I8hPFxxzsgnJfeoN2PJ/5VwVFo=;
        b=FBlqzJhgA2QtIn3pMwEmC83uiES6RqbxYj1V4cqYx00bpdRnzBggeu1BEXhSus5ghL
         Wz9eNF11GyBeb+K+FaX0XULduUMXG01qPd+29qOwLpNyAdFtD7NpqxzcgGQB56oQ9X23
         rGvpgoFhEEtxIu1TZByOW/eq1xWrAS9q2T2dmzZP9coCnI7cOOTzXhSXZdyoYvy7yWsR
         FxAxQZ/tKsK4oU5e9X/tR/RbAdodRDaltav58cmoyme7avTl+WS4ecpw7Ek/C9M17cPp
         dFzAGGyqTDahsGGDlUjOmNJeBpphDpae0MTk0VOp5tTBV6X8w3fF3jVvkTBQh9eZuOTn
         UjNw==
X-Gm-Message-State: AOAM531u4K2vsdfYGALUjU7VENwkSKlSlbc1KXZEAUPH8Bb2sS0Xroy1
        Mdg7j81wiOQzpPLjInpi9h8=
X-Google-Smtp-Source: ABdhPJywrkYKDO2m53ZlDClFzmqKQW/4vr28mkI+ML3NJZ3QDwXCAqQ2Z9CEZuZSTgVzihSr7GrzyQ==
X-Received: by 2002:ac2:561c:: with SMTP id v28mr2325912lfd.604.1635103794358;
        Sun, 24 Oct 2021 12:29:54 -0700 (PDT)
Received: from localhost.localdomain (46-138-50-159.dynamic.spd-mgts.ru. [46.138.50.159])
        by smtp.gmail.com with ESMTPSA id t20sm1616902lft.240.2021.10.24.12.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 12:29:53 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ASoC: tegra: Restore AC97 support
Date:   Sun, 24 Oct 2021 22:28:52 +0300
Message-Id: <20211024192853.21957-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The device-tree of AC97 codecs need to be parsed differently from I2S
codecs, plus codec device may need to be created. This was missed by the
patch that unified machine drivers into a single driver, fix it. It should
restore audio on Toradex Colibri board.

Cc: <stable@vger.kernel.org>
Fixes: cc8f70f56039 ("ASoC: tegra: Unify ASoC machine drivers")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 59 +++++++++++++++++++++++-----
 sound/soc/tegra/tegra_asoc_machine.h |  1 +
 2 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 3cbe6ef1cf9f..d92fabff08bc 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -341,9 +341,34 @@ tegra_machine_parse_phandle(struct device *dev, const char *name)
 	return np;
 }
 
+static void tegra_machine_unregister_codec(void *pdev)
+{
+	platform_device_unregister(pdev);
+}
+
+static int tegra_machine_register_codec(struct device *dev, const char *name)
+{
+	struct platform_device *pdev;
+	int err;
+
+	if (!name)
+		return 0;
+
+	pdev = platform_device_register_simple(name, -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	err = devm_add_action_or_reset(dev, tegra_machine_unregister_codec,
+				       pdev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 int tegra_asoc_machine_probe(struct platform_device *pdev)
 {
-	struct device_node *np_codec, *np_i2s;
+	struct device_node *np_codec, *np_i2s, *np_ac97;
 	const struct tegra_asoc_data *asoc;
 	struct device *dev = &pdev->dev;
 	struct tegra_machine *machine;
@@ -404,17 +429,30 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	np_codec = tegra_machine_parse_phandle(dev, "nvidia,audio-codec");
-	if (IS_ERR(np_codec))
-		return PTR_ERR(np_codec);
+	if (asoc->set_ac97) {
+		err = tegra_machine_register_codec(dev, asoc->codec_dev_name);
+		if (err)
+			return err;
+
+		np_ac97 = tegra_machine_parse_phandle(dev, "nvidia,ac97-controller");
+		if (IS_ERR(np_ac97))
+			return PTR_ERR(np_ac97);
 
-	np_i2s = tegra_machine_parse_phandle(dev, "nvidia,i2s-controller");
-	if (IS_ERR(np_i2s))
-		return PTR_ERR(np_i2s);
+		card->dai_link->cpus->of_node = np_ac97;
+		card->dai_link->platforms->of_node = np_ac97;
+	} else {
+		np_codec = tegra_machine_parse_phandle(dev, "nvidia,audio-codec");
+		if (IS_ERR(np_codec))
+			return PTR_ERR(np_codec);
 
-	card->dai_link->cpus->of_node = np_i2s;
-	card->dai_link->codecs->of_node = np_codec;
-	card->dai_link->platforms->of_node = np_i2s;
+		np_i2s = tegra_machine_parse_phandle(dev, "nvidia,i2s-controller");
+		if (IS_ERR(np_i2s))
+			return PTR_ERR(np_i2s);
+
+		card->dai_link->cpus->of_node = np_i2s;
+		card->dai_link->codecs->of_node = np_codec;
+		card->dai_link->platforms->of_node = np_i2s;
+	}
 
 	if (asoc->add_common_controls) {
 		card->controls = tegra_machine_controls;
@@ -589,6 +627,7 @@ static struct snd_soc_card snd_soc_tegra_wm9712 = {
 static const struct tegra_asoc_data tegra_wm9712_data = {
 	.card = &snd_soc_tegra_wm9712,
 	.add_common_dapm_widgets = true,
+	.codec_dev_name = "wm9712-codec",
 	.set_ac97 = true,
 };
 
diff --git a/sound/soc/tegra/tegra_asoc_machine.h b/sound/soc/tegra/tegra_asoc_machine.h
index 8ee0ec814f67..d6a8d1320551 100644
--- a/sound/soc/tegra/tegra_asoc_machine.h
+++ b/sound/soc/tegra/tegra_asoc_machine.h
@@ -13,6 +13,7 @@ struct snd_soc_pcm_runtime;
 
 struct tegra_asoc_data {
 	unsigned int (*mclk_rate)(unsigned int srate);
+	const char *codec_dev_name;
 	struct snd_soc_card *card;
 	unsigned int mclk_id;
 	bool hp_jack_gpio_active_low;
-- 
2.33.1

