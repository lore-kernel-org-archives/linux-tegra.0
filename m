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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA12C28CC5
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1092D64ED9
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377321AbhCCDax (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344461AbhCBLXe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 06:23:34 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03CC3C06178C;
        Tue,  2 Mar 2021 03:22:08 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id m22so30718580lfg.5;
        Tue, 02 Mar 2021 03:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eHJDWKwpMM6cb9JU11x1wUIhvtQqgROewecwtgVy2N0=;
        b=KA4Y0Tsyx6wny/1fbDCWLOkL6AFPWHKh5/uwf1eSoPg7MlkRHTEMaQ329g1b/M32ZE
         1088gihSRrQDMld+eMaV6KktUmDbyDoGctQTOr3PXGu049GMiv/fnO406mBNQddyKJ8O
         ZeEh4RnZKI92iYsaZ8CaLxcmmv2BKybK4dwDYdu7EJJa/az8DgxphnOX0/ILaAjrnGGt
         m0lxX8tdJs+vZ8+Cni+iZ5evCwhvouv/LJjA1urcEHC8K1kwmStX/XBL6kSvNHF3k8so
         8Fh8Q9XCjqdzHIqYbcBdxml1WviiOf7CziRtpXoRQUQeUf17/4QrHF7zfYDORQj97UT5
         J1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eHJDWKwpMM6cb9JU11x1wUIhvtQqgROewecwtgVy2N0=;
        b=a1oN1peoPQ6hnuQusOzYeDjoTp+YzWT9p0JWqP6VBS0EdlKEEGHarisWWzkpsFsZ23
         3Iy0PTdMng94cTin5Wt59Pie/2H7bxD2a/xxBDRmlZrMeB8IcpVAnkxG8kxvEfNRdPkJ
         xHbtItdrMpz2bUTKou/pZSN1aNPu1MhxQOMS1954OQIplKkMkR7nloJ7hxNcqTdnmbqC
         IjNYIfE/y+D0psNC2OOfnXTfdU+MBxaguHZcWaaHuVzcVoNHD/r1i8LkHFrcEhfExQ9F
         5MBslfKy551R6PELTxEr9g7+elshTJYPMolsYJY2w0bLSwAkfK3zHrz/EGZsDXb9nEFo
         9c2A==
X-Gm-Message-State: AOAM533OODyBfoExyXKWax/u3TWQdlfedwk77/VI9p3QnADrMoofmIQH
        R0/7TtwepRNtqGzWX7+MrEM=
X-Google-Smtp-Source: ABdhPJyKxz9BYcUUyxdMZ1AX6m8pDZ9C0dzxbibzbcLo6KkoeOmLZPDAGWCpPc8MBiSr+rey8Jv9bw==
X-Received: by 2002:a19:3f08:: with SMTP id m8mr12331184lfa.275.1614684126498;
        Tue, 02 Mar 2021 03:22:06 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id w7sm2691078lft.0.2021.03.02.03.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 03:22:06 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] ASoC: tegra20: ac97: Add reset control
Date:   Tue,  2 Mar 2021 14:21:21 +0300
Message-Id: <20210302112123.24161-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302112123.24161-1-digetx@gmail.com>
References: <20210302112123.24161-1-digetx@gmail.com>
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

