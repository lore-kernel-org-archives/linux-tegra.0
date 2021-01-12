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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523CCC43331
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:01:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F1C12311E
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:01:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbhALNAz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 08:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729205AbhALNAp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 08:00:45 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48502C0617A2;
        Tue, 12 Jan 2021 04:59:27 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id m10so2756742lji.1;
        Tue, 12 Jan 2021 04:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c6GtQ1NMerYE2VXfkjD0awJM9c14fA0uLhnuFd5ReVg=;
        b=rClqpU4RHdEeRNfl2B7s/W6CLCwbG6gTtFf+04dfQiJLrYeyw6DF1xLW8YUgTFGyzY
         eJ7fcnGQrVtNVDyasYBBtxu2l6VtTtdsUtO+Uq3y51c39HZRuQS5rcs5wvdvhuOwUsSS
         +3qnY6q6tehOG2Y9UpSO2QYE07Ml2rmVqUwYXjRDtyJ2K07693eLOXk/g7p/Y0WLDcta
         zQ2/k5lq2R14Dh9u2NWAOYuFPF3bCFVnC2LCmWqmjdS0BC1t14sOSf/MYIo3hIcdfKZz
         YWMOdCw5jL+G0k88GACjXm6wyT1CQL8dAZQF/LIF0kYcq21Kxt1Y0KBz863khILci9AD
         7KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c6GtQ1NMerYE2VXfkjD0awJM9c14fA0uLhnuFd5ReVg=;
        b=m3ACMQSTDfqumD0aCocCV8CFuUKWQPJN2Cs7DiS2134ME6cCfE7ZNhDK161KGtIwWr
         WuA85GMDrcNXXLceqeG7O/XZ0xL8Y19wgtD2m3Qf7+AmeEVGgjU60z/ukm2EIHZDG12U
         FKLwISHEoFQh550TQD1x5Ic1dVGIzJzPpXGEtV1HkIuV305aLjbwBM4gNAVk8ksYuqJq
         wT1zHuFwJuq4FeGAqklFO/8oqAp+zqCH1gGb+yFdnl9baAwPM9iPuj8NNBmfC/cj8j9S
         nf4bgkCBrci4iBqOnvqJ70ByOM0MFcrIsfL/mxbfPJqfwCrB/VAYYp17YValTox6l3K8
         H2Sg==
X-Gm-Message-State: AOAM530J0X57OT8kGo10Kj1A/7OwenEsrkULCAwEMXZQinH87KGtGRxA
        j7j4lhIq/A8UF9j++1MNLhU=
X-Google-Smtp-Source: ABdhPJwOkp2bw3DDCg37hiVed+o60utA9Fo0A0qC/6V34IHbxcJcSNZMHviVRYHnYznUlpUrv995Ng==
X-Received: by 2002:a2e:918a:: with SMTP id f10mr1881603ljg.302.1610456365858;
        Tue, 12 Jan 2021 04:59:25 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id 192sm384211lfa.219.2021.01.12.04.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 04:59:25 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] ASoC: tegra: ahub: Reset hardware properly
Date:   Tue, 12 Jan 2021 15:58:34 +0300
Message-Id: <20210112125834.21545-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112125834.21545-1-digetx@gmail.com>
References: <20210112125834.21545-1-digetx@gmail.com>
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
 sound/soc/tegra/tegra30_ahub.c | 33 ++++++++++++++++-----------------
 sound/soc/tegra/tegra30_ahub.h |  1 +
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 4dbb58f7ea36..246cf6a373a1 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -65,10 +65,20 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
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
 
@@ -462,7 +472,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	const struct tegra30_ahub_soc_data *soc_data;
-	struct reset_control *rst;
 	struct resource *res0;
 	void __iomem *regs_apbif, *regs_ahub;
 	int ret = 0;
@@ -475,22 +484,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 		return -EINVAL;
 	soc_data = match->data;
 
-	/*
-	 * The AHUB hosts a register bus: the "configlink". For this to
-	 * operate correctly, all devices on this bus must be out of reset.
-	 * Ensure that here.
-	 */
-	rst = of_reset_control_array_get_exclusive(pdev->dev.of_node);
-	if (IS_ERR(rst)) {
-		dev_err(&pdev->dev, "Can't get reset: %p\n", rst);
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
@@ -507,6 +500,12 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ahub->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
+	if (IS_ERR(ahub->reset)) {
+		dev_err(&pdev->dev, "Can't get reset: %p\n", ahub->reset);
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

