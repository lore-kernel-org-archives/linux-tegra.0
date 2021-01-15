Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7804C43381
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 14:03:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9862238D7
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 14:03:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732816AbhAOOD0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 09:03:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732623AbhAOODZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 09:03:25 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C232BC061795;
        Fri, 15 Jan 2021 06:02:09 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id v67so13288805lfa.0;
        Fri, 15 Jan 2021 06:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LEFHoCKlwoBTeIV9uQCrZGB8LTusol6OgYk0Nc6MLlc=;
        b=FRijWLnDda9wN+RN+0vI7soeToWea6pd3AKovqBgoqyRyMNR9xc/avXaNJ2mGJL6kR
         dCy61BTRu/KWf6MJanz4XfKYhnO++8hL0ElEha3O+CAcvMhmUinwPcAA9TDhbhVvd3Um
         pIrfTQKbjvIL9NFoATtbEEhDsmlWyDIaKBliihIqVvR9g+cKdJn3jz5gPLJAhH4774v7
         +YukRL+g76cauOARXCY6VzGyXeNoxbPE+Icrq/L8fLBDa/NaYzTLPJSuAvrLX6TPAwYR
         BLtZP4UQSQlRG9YozKsgR/uXW6ko5bHhlI8uMZ5mx3Zvhu/6QXVg5p0ywtHK55E03JMI
         lOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LEFHoCKlwoBTeIV9uQCrZGB8LTusol6OgYk0Nc6MLlc=;
        b=WWcKRHBsoedPx2R/uWPr6ehO/VV9o/u+Fw+tEAZOLQVL8ea+/M9nZtRYyL0jl71Q4M
         WPLYHYyla7ccsGaKdauo8g/u300FXa86IXmxnfx/6kqun88dORKaRJ2wFYvxFZuD4+K+
         IWCrqU2l1VJY96poYMsUGOmesR2EY7GpKAOL1wVhGvtHaGHbH86EJrWgFVXSUyHg9Pxk
         D4alzaZE3l94H3e2R8mmPOri1YTnzcHP4ycpjVpDhTzkKRAxKw8s/dh3KopZ5oMPSN2L
         X+LdcloVedaGVIrGG9KitNUn67vybGpQgc/Fm1IdAMymseGDz6E39hCyRE9pT3KbMvae
         tquw==
X-Gm-Message-State: AOAM532TTfpWOPyetg9wrg9+sHFatqGDmyjC3OBQoKje08+qn0II4xFi
        8fxb0wQm0azRt5wH7qooaoQ=
X-Google-Smtp-Source: ABdhPJyhtRastDCvuC3SUd6kji3K08UNSWGIadr4cyeT8jummwWN4RqelpY2jy0Z/c1fU6lmBuTjYg==
X-Received: by 2002:ac2:4571:: with SMTP id k17mr5339672lfm.208.1610719328358;
        Fri, 15 Jan 2021 06:02:08 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f132sm906852lfd.252.2021.01.15.06.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 06:02:07 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] ASoC: tegra: ahub: Reset hardware properly
Date:   Fri, 15 Jan 2021 17:01:45 +0300
Message-Id: <20210115140145.10668-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115140145.10668-1-digetx@gmail.com>
References: <20210115140145.10668-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Assert hardware reset before clocks are enabled and then de-assert it
after clocks are enabled. This brings hardware into a predictable state
and removes relying on implicit de-assertion of resets which is done by
the clk driver.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 43 ++++++++++++++++++++--------------
 sound/soc/tegra/tegra30_ahub.h |  1 +
 2 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 37a847569a40..df4ca2b35566 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -65,12 +65,32 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
 {
 	int ret;
 
+	ret = reset_control_assert(ahub->reset);
+	if (ret)
+		return ret;
+
 	ret = clk_bulk_prepare_enable(ahub->nclocks, ahub->clocks);
 	if (ret)
 		return ret;
 
+	ret = reset_control_reset(ahub->reset);
+	if (ret) {
+		clk_bulk_disable_unprepare(ahub->nclocks, ahub->clocks);
+		return ret;
+	}
+
 	regcache_cache_only(ahub->regmap_apbif, false);
 	regcache_cache_only(ahub->regmap_ahub, false);
+	regcache_mark_dirty(ahub->regmap_apbif);
+	regcache_mark_dirty(ahub->regmap_ahub);
+
+	ret = regcache_sync(ahub->regmap_apbif);
+	if (ret)
+		return ret;
+
+	ret = regcache_sync(ahub->regmap_ahub);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -462,7 +482,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	const struct tegra30_ahub_soc_data *soc_data;
-	struct reset_control *rst;
 	struct resource *res0;
 	void __iomem *regs_apbif, *regs_ahub;
 	int ret = 0;
@@ -475,22 +494,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 		return -EINVAL;
 	soc_data = match->data;
 
-	/*
-	 * The AHUB hosts a register bus: the "configlink". For this to
-	 * operate correctly, all devices on this bus must be out of reset.
-	 * Ensure that here.
-	 */
-	rst = of_reset_control_array_get_exclusive(pdev->dev.of_node);
-	if (IS_ERR(rst)) {
-		dev_err(&pdev->dev, "Can't get reset: %pe\n", rst);
-		return PTR_ERR(rst);
-	}
-
-	ret = reset_control_deassert(rst);
-	reset_control_put(rst);
-	if (ret)
-		return ret;
-
 	ahub = devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
 			    GFP_KERNEL);
 	if (!ahub)
@@ -507,6 +510,12 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ahub->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
+	if (IS_ERR(ahub->reset)) {
+		dev_err(&pdev->dev, "Can't get reset: %pe\n", ahub->reset);
+		return PTR_ERR(ahub->reset);
+	}
+
 	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs_apbif = devm_ioremap_resource(&pdev->dev, res0);
 	if (IS_ERR(regs_apbif))
diff --git a/sound/soc/tegra/tegra30_ahub.h b/sound/soc/tegra/tegra30_ahub.h
index 063aed5037d7..ceb056575e98 100644
--- a/sound/soc/tegra/tegra30_ahub.h
+++ b/sound/soc/tegra/tegra30_ahub.h
@@ -510,6 +510,7 @@ struct tegra30_ahub_soc_data {
 struct tegra30_ahub {
 	const struct tegra30_ahub_soc_data *soc_data;
 	struct device *dev;
+	struct reset_control *reset;
 	struct clk_bulk_data clocks[2];
 	unsigned int nclocks;
 	resource_size_t apbif_addr;
-- 
2.29.2

