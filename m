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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CD2C28E80
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0BFF64EE2
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234281AbhCNPqI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234111AbhCNPpc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 11:45:32 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10DAC061762;
        Sun, 14 Mar 2021 08:45:31 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id b2-20020a7bc2420000b029010be1081172so18052673wmj.1;
        Sun, 14 Mar 2021 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uwOwpk83R+cdKaOIdKgxM+y8AmMlhEg4nEbu82oea8Y=;
        b=FricUU/Zao/xfxzFKTc/T0yHKvS5FKBGmCGggEL+kCVwYG10h72X7XZDuRwAeTS8ip
         5F49BIStvN+EtFtHbcAWlS4gZAB1quwkgVHafSXe2mKDqSTnF/U9UPj27kcKuW49WYwY
         8c+6lqTeuZJfDkrSIIUb4eeqbPQu44Z3d1cqOk/pODSIXib2UHUCO0/7ApureugiyYnT
         Q3An7Ku5jD4618Z1DIF3m3sxdxKiQTE3D7qZF+8Mxv+X/3NGj3eZQzF1pPS+uc0+IdKp
         3feJFt+mpxCi3ZsYL7HFBiYYPTHAA7ewSEDHvjis31OEfWaAZXLqy9NbGgWqAwbTvniW
         gX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uwOwpk83R+cdKaOIdKgxM+y8AmMlhEg4nEbu82oea8Y=;
        b=ccD7AqJsz4/AUt7vjgad1bX1+Hh7J+C4JPpow3Vt5bNNDuQsztqC/l09+ihnmIKbBQ
         BLbH1Saoo+CTKHTpQt+DrS0cjVH2CL+Ms59st+0Ajzd34ZAcuILXEg+2fDcFupGgs3Sy
         sR6EfmhXZyvgLmWjwAzffRQiSkrKspHG9VmFMTBuQU1CMxPKUQs+PAfxneq/WAge/JeQ
         uxZYdkiKR23Yb/vwXp0/G1v/lZqmFZE+R8lsfnbn7spOJhbAybr4OShLIxvhuLA2OT1m
         819AZ5oPKcCoJmSEKQS2vsfCUOMZaNkiPsG2v/mnQ8StnLnBANEA9UmR8878/OXEcIMs
         H3yg==
X-Gm-Message-State: AOAM533cDF4HLu7dLQJ04oUfck8C4Lp9Scuihh4K5419UFUuzCLUss4O
        GjViKiHuBukw9HUxWTzNlKc=
X-Google-Smtp-Source: ABdhPJz5OaywGExFLiRmwwnO3hyEECgOoB4oHGxY5YtIYXgA3PAkWwqN8R9YoMcN8/QUH/w8/RFJAA==
X-Received: by 2002:a05:600c:22cd:: with SMTP id 13mr21770353wmg.90.1615736730659;
        Sun, 14 Mar 2021 08:45:30 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 08:45:30 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/17] ASoC: tegra20: i2s: Use devm_clk_get()
Date:   Sun, 14 Mar 2021 18:44:52 +0300
Message-Id: <20210314154459.15375-11-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
References: <20210314154459.15375-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use resource-managed variant of clk_get() to simplify code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_i2s.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 0f2bdc2e8598..fe569198b17a 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -370,7 +370,7 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 		return PTR_ERR(i2s->reset);
 	}
 
-	i2s->clk_i2s = clk_get(&pdev->dev, NULL);
+	i2s->clk_i2s = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(i2s->clk_i2s)) {
 		dev_err(&pdev->dev, "Can't retrieve i2s clock\n");
 		ret = PTR_ERR(i2s->clk_i2s);
@@ -381,7 +381,7 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 	regs = devm_ioremap_resource(&pdev->dev, mem);
 	if (IS_ERR(regs)) {
 		ret = PTR_ERR(regs);
-		goto err_clk_put;
+		goto err;
 	}
 
 	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
@@ -389,7 +389,7 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(i2s->regmap)) {
 		dev_err(&pdev->dev, "regmap init failed\n");
 		ret = PTR_ERR(i2s->regmap);
-		goto err_clk_put;
+		goto err;
 	}
 
 	i2s->capture_dma_data.addr = mem->start + TEGRA20_I2S_FIFO2;
@@ -430,16 +430,12 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 		tegra20_i2s_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
-err_clk_put:
-	clk_put(i2s->clk_i2s);
 err:
 	return ret;
 }
 
 static int tegra20_i2s_platform_remove(struct platform_device *pdev)
 {
-	struct tegra20_i2s *i2s = dev_get_drvdata(&pdev->dev);
-
 	tegra_pcm_platform_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
 
@@ -447,8 +443,6 @@ static int tegra20_i2s_platform_remove(struct platform_device *pdev)
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra20_i2s_runtime_suspend(&pdev->dev);
 
-	clk_put(i2s->clk_i2s);
-
 	return 0;
 }
 
-- 
2.30.2

