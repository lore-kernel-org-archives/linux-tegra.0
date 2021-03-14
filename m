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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0699C433E0
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7D1B64EB6
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234327AbhCNPqJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233560AbhCNPpf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 11:45:35 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A081C061574;
        Sun, 14 Mar 2021 08:45:35 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id r15-20020a05600c35cfb029010e639ca09eso18796424wmq.1;
        Sun, 14 Mar 2021 08:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4FTy4HdwvhgNdRGZDpAPkP98g1TyRqgQ5LxuFhEMa4g=;
        b=ba1bpP0/mAHlNBan9GD+3oyEXBKINOceI57ZBmCCbORaKjcnzyOQrEEQYf09dwxyzk
         Z7o0qSPM12D3byFzGUElOlWVwv0ovqXSwVn8ShHn40XSRNTgx5L+ms2u0KEKqKHCg8pL
         A/qjIXti11h5hz8OU+raTh2TH+B7365cSHImfqY499XFzc777CpX2P4fmXFRlkrZGu0z
         73PkLAOGpsR79OSK4com04hcorMPJ8x8uB3qZ2GE8LWlzLQ3m96lhgWZrfUw5z6E75Mw
         +VydNetkcUqBLQblOZEaxKQ+xoOhhUdLTeSQ7q9lVA2/UG7eVaqZ6XjNQZdgzvJUUFJw
         zD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4FTy4HdwvhgNdRGZDpAPkP98g1TyRqgQ5LxuFhEMa4g=;
        b=WgoL/O6aBV19AGvn+Fc39lKvsJjCbKHHPRbT1MAodGhjbttwHT7sc7b8+tl/YTXLIl
         BQzanxqZSNGGmFc8gbeQLW/oM70ie/67vvIsg+Pl+sGfDbxmDHCpn+QmhpFlg3R/M7Sh
         0kBjE45ZiJllnuIkr40KCxrXIgACoK4FRNuaicd2+tL6aTqeDp3Xmoeo/0I1nCBIUWTq
         B86FlleS4LI9CragQWlS82pwKDxegPNMHs5cLJU8APxJDZ1P9tsJylC95dMFJ7LzAjlG
         ecTecz1hvyyZFY9IdtCdZZWUk9irBeTlmyvwu4LZ4Sl8guEcA919lM/BPRZsr9+IvgJj
         pRKA==
X-Gm-Message-State: AOAM533u8FOitLacWqyE6gXHDIjP9TxJvbKC5WcF0zuP22YDXSd6ufjT
        bPomi5dOX5LQyeMUT4RB9UA=
X-Google-Smtp-Source: ABdhPJzzZuvVT0073VQRrIVTiyLp5MTznkF2J2J6+GE3zGtOggeuoza+1fh4MaDq2voQWzJdMaAazw==
X-Received: by 2002:a1c:bc8a:: with SMTP id m132mr21518896wmf.6.1615736734166;
        Sun, 14 Mar 2021 08:45:34 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 08:45:33 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 13/17] ASoC: tegra30: i2s: Use devm_clk_get()
Date:   Sun, 14 Mar 2021 18:44:55 +0300
Message-Id: <20210314154459.15375-14-digetx@gmail.com>
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
 sound/soc/tegra/tegra30_i2s.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 31e08c5c1405..0ed982548ce4 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -438,7 +438,7 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	i2s->playback_i2s_cif = cif_ids[0];
 	i2s->capture_i2s_cif = cif_ids[1];
 
-	i2s->clk_i2s = clk_get(&pdev->dev, NULL);
+	i2s->clk_i2s = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(i2s->clk_i2s)) {
 		dev_err(&pdev->dev, "Can't retrieve i2s clock\n");
 		ret = PTR_ERR(i2s->clk_i2s);
@@ -448,7 +448,7 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs)) {
 		ret = PTR_ERR(regs);
-		goto err_clk_put;
+		goto err;
 	}
 
 	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
@@ -456,7 +456,7 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(i2s->regmap)) {
 		dev_err(&pdev->dev, "regmap init failed\n");
 		ret = PTR_ERR(i2s->regmap);
-		goto err_clk_put;
+		goto err;
 	}
 	regcache_cache_only(i2s->regmap, true);
 
@@ -534,8 +534,6 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 		tegra30_i2s_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
-err_clk_put:
-	clk_put(i2s->clk_i2s);
 err:
 	return ret;
 }
@@ -557,8 +555,6 @@ static int tegra30_i2s_platform_remove(struct platform_device *pdev)
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra30_i2s_runtime_suspend(&pdev->dev);
 
-	clk_put(i2s->clk_i2s);
-
 	return 0;
 }
 
-- 
2.30.2

