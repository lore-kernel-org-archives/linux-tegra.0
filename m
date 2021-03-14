Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B961AC2BA14
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C6DC64EC8
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbhCNPqL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234152AbhCNPph (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 11:45:37 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833F0C061574;
        Sun, 14 Mar 2021 08:45:37 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id g25so6681926wmh.0;
        Sun, 14 Mar 2021 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Po6yTPVbMrwXaB6ZlYM0aFdBrruf9pmKm6CRlvbqNmk=;
        b=TUB6ZqWKBf+vvC1EIslpgdFrBDvkkdqcaNjKoddwfk/Z9korua/YsHDelq9B0vAIVh
         e0KVXvCDTzkmH4JDFR+33V6hXGqF5rXQ0wT3EdLacm58cBVZi+hMeMWPmW4aSNm2Ka7r
         DF35QArb4r07vGxrk0JT9JzPNLshYDnPl0akdxz17EZWguwdNpHzUHDEXikilDqHyP7g
         5vir1R2BSLApYX292BaXt2ah9bmtNwquLNxHrILvqPlB9hxd8pFCK5kRjrOyuNV5to7c
         C9ffX9oo1LkxzgXGmsLmeXrOLf7tfaPtr1q38PkzNK3AqVMPUxcnh9wi9fnzhUCDfXED
         Tz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Po6yTPVbMrwXaB6ZlYM0aFdBrruf9pmKm6CRlvbqNmk=;
        b=t66uG3eh88RpLj+88hfG7+Qc7AbI4yzePD9kRPr88QdsfFZPJUQ8vsGFZNEKsNIksA
         5Xws2IooV0nnMuEfqW3Q4U+LOvQ1nyOQhM+n++V4U0Km3ak4x8DKUWkRrpK+8MGfoiiO
         ksVYYwu16t5wjntBe/wPjeqTiPL9C2h0xAZAgxZIbtTAvVKHaykCncXVqvnyZMCpRhzx
         kyTXB+ew0NevKVMs9HLpQJCt6Zjr374HzDF4TAFHAQ+qLOoe6bzdCsLGs8hUwxz02R6c
         XqfyR4TDYVqgZRGFMugUsH+bzSe/fxDMNoD5cI7RQHX5WO1ZunHejf4t2mdM03hczyF1
         KQGg==
X-Gm-Message-State: AOAM530FCMF+ySXjnGSho2VGHr5Zjy0L2n1I3Ssk5iPLA14Ktqm2LVea
        S3OP5kdjap621SDEU/MR8QA=
X-Google-Smtp-Source: ABdhPJw26GydCpYmCDmlt82Wx3Xvlld1x34VTdacYYDUaLUi/tUiYVWgRGR6xA14rPfuyNnhFg7Dpg==
X-Received: by 2002:a05:600c:247:: with SMTP id 7mr22283600wmj.116.1615736736293;
        Sun, 14 Mar 2021 08:45:36 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 08:45:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 15/17] ASoC: tegra30: ahub: Reset global variable
Date:   Sun, 14 Mar 2021 18:44:57 +0300
Message-Id: <20210314154459.15375-16-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
References: <20210314154459.15375-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra30 AHUB uses global variable that is never reset by the driver on
a probe failure and on driver removal, meaning that driver will never try
to re-probe and can't be unbound. Make driver to reset the variable.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index d24c26f4960d..409a259e6343 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -518,9 +518,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	void __iomem *regs_apbif, *regs_ahub;
 	int ret = 0;
 
-	if (ahub)
-		return -ENODEV;
-
 	match = of_match_device(tegra30_ahub_of_match, &pdev->dev);
 	if (!match)
 		return -EINVAL;
@@ -544,19 +541,21 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 
 	ret = devm_clk_bulk_get(&pdev->dev, ahub->nclocks, ahub->clocks);
 	if (ret)
-		return ret;
+		goto err_unset_ahub;
 
 	ret = devm_reset_control_bulk_get_exclusive(&pdev->dev, ahub->nresets,
 						    ahub->resets);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't get resets: %d\n", ret);
-		return ret;
+		goto err_unset_ahub;
 	}
 
 	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs_apbif = devm_ioremap_resource(&pdev->dev, res0);
-	if (IS_ERR(regs_apbif))
-		return PTR_ERR(regs_apbif);
+	if (IS_ERR(regs_apbif)) {
+		ret = PTR_ERR(regs_apbif);
+		goto err_unset_ahub;
+	}
 
 	ahub->apbif_addr = res0->start;
 
@@ -565,20 +564,22 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	if (IS_ERR(ahub->regmap_apbif)) {
 		dev_err(&pdev->dev, "apbif regmap init failed\n");
 		ret = PTR_ERR(ahub->regmap_apbif);
-		return ret;
+		goto err_unset_ahub;
 	}
 	regcache_cache_only(ahub->regmap_apbif, true);
 
 	regs_ahub = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(regs_ahub))
-		return PTR_ERR(regs_ahub);
+	if (IS_ERR(regs_ahub)) {
+		ret = PTR_ERR(regs_ahub);
+		goto err_unset_ahub;
+	}
 
 	ahub->regmap_ahub = devm_regmap_init_mmio(&pdev->dev, regs_ahub,
 					&tegra30_ahub_ahub_regmap_config);
 	if (IS_ERR(ahub->regmap_ahub)) {
 		dev_err(&pdev->dev, "ahub regmap init failed\n");
 		ret = PTR_ERR(ahub->regmap_ahub);
-		return ret;
+		goto err_unset_ahub;
 	}
 	regcache_cache_only(ahub->regmap_ahub, true);
 
@@ -595,19 +596,20 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
+err_unset_ahub:
+	ahub = NULL;
 
 	return ret;
 }
 
 static int tegra30_ahub_remove(struct platform_device *pdev)
 {
-	if (!ahub)
-		return -ENODEV;
-
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra30_ahub_runtime_suspend(&pdev->dev);
 
+	ahub = NULL;
+
 	return 0;
 }
 
-- 
2.30.2

