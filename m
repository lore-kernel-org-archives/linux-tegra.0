Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934D3C43332
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 17:44:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68A7064F9A
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 17:44:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhCKRnd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 12:43:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhCKRnO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 12:43:14 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7395CC061574;
        Thu, 11 Mar 2021 09:43:14 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id q25so41131403lfc.8;
        Thu, 11 Mar 2021 09:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eHJDWKwpMM6cb9JU11x1wUIhvtQqgROewecwtgVy2N0=;
        b=Oo8FyoG74UY6khXJw001bnNsUEzVJmthtgVa72zwl0B21I4U4yuSfHEpVh1Tg90cxb
         hhh4GZEsSJa/UcyukKDTVCHjQcxrkpUjh48wA3bJ6uLc33ryaufMWAfjD2crcn6RpuCZ
         F1DxY50VpQByZuszT/Kjlw4Ehig+N7MZn4zDzZ3+EXaZDoCGEFR4qfHJolxNCPZTKVkN
         hP5wh4M2Nn/B3u6a16IYjBpId/j/ep3+HAd1/NgxudGHSXcUlgudG0LBrz7kzvPszAMh
         zdFDu+4pgmTgak6ZwEb2YWO5o9bJXeuAAAFw8WDPyxP4ouTjNffZyex3rxZtRO0kKuEc
         4B2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eHJDWKwpMM6cb9JU11x1wUIhvtQqgROewecwtgVy2N0=;
        b=FOiyhw72E2+TLzwwBuA635rNs37j85fFw8l9fkCq3Ytft0LH2mYPUKytTC2MzHyb56
         E0FZgGwR+LgT8hY4vqhO46mRDdU67Lannxvy9Le1bh2MobBgnLOWaMKdV4wEEA9k4ZcY
         b6TkMszThoGNlUrxHacZe9H68sF998l8uiW8E7uG97+VFpr5Nu9RJ0z4TblyYbbEs4cK
         UPFaNqofMe8HsNW1z61CC0UU9vFKPg4cGmeUhjiPjkFbYi8aKN86oDizxXylQmG+HhuY
         xJhNTtby4yu+nNr7OlrQyHdRQjT38wYJvETcvJPn9BbsTnWLaVCa890Uiv58YRH7XhNJ
         9Rrg==
X-Gm-Message-State: AOAM533g8NUfKWCTmNk63H2WiaOFdk8WAdFnvULa4s/jmAVCgzuJcwKw
        DqDCs53356ikvycn+U6Y5/C0NEuFZ8w=
X-Google-Smtp-Source: ABdhPJwjr3vVXZN9uXoOC8Wd43GEhHXuWl10o49dbqFbet8fNjmYUTrDD7/t8JGP6cIp6uIB7HI0vA==
X-Received: by 2002:a05:6512:ad4:: with SMTP id n20mr3022328lfu.507.1615484592811;
        Thu, 11 Mar 2021 09:43:12 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id g10sm1021245lfe.90.2021.03.11.09.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 09:43:12 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] ASoC: tegra20: ac97: Add reset control
Date:   Thu, 11 Mar 2021 20:42:58 +0300
Message-Id: <20210311174302.15430-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311174302.15430-1-digetx@gmail.com>
References: <20210311174302.15430-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra20 AC97 driver doesn't manage the AC97 controller reset, relying on
implicit deassertion of the reset by tegra-clk driver, which needs to be
fixed since this behaviour is unacceptable by other Tegra drivers. Add
explicit reset control to the Tegra20 AC97 driver.

Note that AC97 reset was always specified in Tegra20 device-tree, hence
DTB ABI changes aren't required.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_ac97.c | 21 +++++++++++++++++++++
 sound/soc/tegra/tegra20_ac97.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 06c728ae17ed..c454a34c15c4 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -313,6 +314,12 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	}
 	dev_set_drvdata(&pdev->dev, ac97);
 
+	ac97->reset = devm_reset_control_get_exclusive(&pdev->dev, "ac97");
+	if (IS_ERR(ac97->reset)) {
+		dev_err(&pdev->dev, "Can't retrieve ac97 reset\n");
+		return PTR_ERR(ac97->reset);
+	}
+
 	ac97->clk_ac97 = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(ac97->clk_ac97)) {
 		dev_err(&pdev->dev, "Can't retrieve ac97 clock\n");
@@ -364,12 +371,26 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	ac97->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	ac97->playback_dma_data.maxburst = 4;
 
+	ret = reset_control_assert(ac97->reset);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to assert AC'97 reset: %d\n", ret);
+		goto err_clk_put;
+	}
+
 	ret = clk_prepare_enable(ac97->clk_ac97);
 	if (ret) {
 		dev_err(&pdev->dev, "clk_enable failed: %d\n", ret);
 		goto err_clk_put;
 	}
 
+	usleep_range(10, 100);
+
+	ret = reset_control_deassert(ac97->reset);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to deassert AC'97 reset: %d\n", ret);
+		goto err_clk_disable_unprepare;
+	}
+
 	ret = snd_soc_set_ac97_ops(&tegra20_ac97_ops);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set AC'97 ops: %d\n", ret);
diff --git a/sound/soc/tegra/tegra20_ac97.h b/sound/soc/tegra/tegra20_ac97.h
index e467cd1ff2ca..870ea09ff301 100644
--- a/sound/soc/tegra/tegra20_ac97.h
+++ b/sound/soc/tegra/tegra20_ac97.h
@@ -78,6 +78,7 @@ struct tegra20_ac97 {
 	struct clk *clk_ac97;
 	struct snd_dmaengine_dai_dma_data capture_dma_data;
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
+	struct reset_control *reset;
 	struct regmap *regmap;
 	int reset_gpio;
 	int sync_gpio;
-- 
2.29.2

