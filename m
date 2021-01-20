Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFB4C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 00:33:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16B8723109
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 00:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729436AbhATAdf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 19:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729240AbhATAd1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 19:33:27 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0536C0613D6;
        Tue, 19 Jan 2021 16:32:09 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id x23so24003347lji.7;
        Tue, 19 Jan 2021 16:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aatWsRJD4mwUOaOb6poYIVDK+GvKkMOS2h0/TSRhmb0=;
        b=eHPJ/J8Uzbq6l2zEzSk8SetHfqX7mqZvfIEH0BjDbmZIW83RnqwvLiLu0P4xVhc74P
         n/FZ3EEBQvOiM6rTQNNcFNlHU5xfwr4g5zi35IbOvGK3H/HUOTEXhspu29+yQ16Hug5e
         KsQsarAwaPpJ5ZPvUZAjRd40vZW/7K6W0OmpDFAXLl4piU8aE6saqZcJDs1wK5x9ZxvL
         ZhvklnhnUCngfD3iXYw0uZfKCY8gvWzqs17AOYJyzNBNDg42lnpdYRWXITb63XHDS759
         unZ6PGyCy8c7p+KoFdh/7ucwXQ1+wR60NkZ2vTObxKTmj182bJsf3k8ptzDnhxWNPIzc
         B9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aatWsRJD4mwUOaOb6poYIVDK+GvKkMOS2h0/TSRhmb0=;
        b=YSi/JARfVKSMY8glZQJh3zXROlaD21OoK0DpYVmlkZAynNnQVgtMirlfpX9NXIU5GR
         TjQBXi39RCit4ezYtIY219SJUMADNAdZjI5Xw9QABsrIIrQa33bzIthvty0EMmWXEauB
         BARSDrahK2X8jjhiVZTCV1bXURPjb/QdlIseOK4j98wX0sXf6Eb+SUwsHs5LfzVfIEg9
         PJ9nBW8S1Egi2GkMmGB9gj8DzoD2boT0DbHDMQwEQHnKh3xxmUjlDn1GWEM3z18kjGWu
         /kOKJfz7oew18dcEhEMZ+gLt/LAfH9GLHc7gMDQJpPLZ2FHqTstEn+yWZxNdDH6PjJKB
         jwpg==
X-Gm-Message-State: AOAM5338tdDqOzpprFSHTyXD05FU3yuRxPCzrv94+Owb6b1kx+ceQJJp
        Y3Bk3ktAcgaCKZqD9z3Tmqw=
X-Google-Smtp-Source: ABdhPJwKsRA1CF0WCIsSHBi3hk6qkZb3hrjO0ONfS+GEn6OeMZnsK/EjuMgSHZYjHMbVLZKl2MxAhg==
X-Received: by 2002:a05:651c:112c:: with SMTP id e12mr3096600ljo.66.1611102728442;
        Tue, 19 Jan 2021 16:32:08 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id s27sm17710ljd.25.2021.01.19.16.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 16:32:08 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] ASoC: tegra: ahub: Reset hardware properly
Date:   Wed, 20 Jan 2021 03:31:54 +0300
Message-Id: <20210120003154.26749-7-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120003154.26749-1-digetx@gmail.com>
References: <20210120003154.26749-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Assert hardware resets before clocks are enabled and then de-assert them
after clocks are enabled. This brings hardware into a predictable state.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30 audio works
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30 boot-tested
Tested-by: Dmitry Osipenko <digetx@gmail.com> # Nexus7 T30 audio works
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # TK1 boot-tested
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 36 ++++++++++++++++++++++++++++++----
 sound/soc/tegra/tegra30_ahub.h |  1 +
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 12ca8e3ca4f6..9ef05ca4f6c4 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -65,14 +65,39 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
 {
 	int ret;
 
+	ret = reset_control_assert(ahub->reset);
+	if (ret)
+		return ret;
+
 	ret = clk_bulk_prepare_enable(ahub->nclocks, ahub->clocks);
 	if (ret)
 		return ret;
 
+	usleep_range(10, 100);
+
+	ret = reset_control_deassert(ahub->reset);
+	if (ret)
+		goto disable_clocks;
+
 	regcache_cache_only(ahub->regmap_apbif, false);
 	regcache_cache_only(ahub->regmap_ahub, false);
+	regcache_mark_dirty(ahub->regmap_apbif);
+	regcache_mark_dirty(ahub->regmap_ahub);
+
+	ret = regcache_sync(ahub->regmap_apbif);
+	if (ret)
+		goto disable_clocks;
+
+	ret = regcache_sync(ahub->regmap_ahub);
+	if (ret)
+		goto disable_clocks;
 
 	return 0;
+
+disable_clocks:
+	clk_bulk_disable_unprepare(ahub->nclocks, ahub->clocks);
+
+	return ret;
 }
 
 int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
@@ -519,7 +544,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	/*
 	 * The AHUB hosts a register bus: the "configlink". For this to
 	 * operate correctly, all devices on this bus must be out of reset.
-	 * Ensure that here.
 	 */
 	for (i = 0; i < ARRAY_SIZE(configlink_mods); i++) {
 		if (!(configlink_mods[i].mod_list_mask &
@@ -535,10 +559,8 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 			return ret;
 		}
 
-		ret = reset_control_deassert(rst);
+		/* just check presence of the reset control in DT */
 		reset_control_put(rst);
-		if (ret)
-			return ret;
 	}
 
 	ahub = devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
@@ -557,6 +579,12 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ahub->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
+	if (IS_ERR(ahub->reset)) {
+		dev_err(&pdev->dev, "Can't get resets: %pe\n", ahub->reset);
+		return PTR_ERR(ahub->reset);
+	}
+
 	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs_apbif = devm_ioremap_resource(&pdev->dev, res0);
 	if (IS_ERR(regs_apbif))
diff --git a/sound/soc/tegra/tegra30_ahub.h b/sound/soc/tegra/tegra30_ahub.h
index 01480d7dc940..3b85244f87f1 100644
--- a/sound/soc/tegra/tegra30_ahub.h
+++ b/sound/soc/tegra/tegra30_ahub.h
@@ -511,6 +511,7 @@ struct tegra30_ahub_soc_data {
 struct tegra30_ahub {
 	const struct tegra30_ahub_soc_data *soc_data;
 	struct device *dev;
+	struct reset_control *reset;
 	struct clk_bulk_data clocks[2];
 	unsigned int nclocks;
 	resource_size_t apbif_addr;
-- 
2.29.2

