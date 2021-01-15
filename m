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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F41C43331
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 14:03:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A54723877
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 14:03:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731420AbhAOOCr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 09:02:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726904AbhAOOCr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 09:02:47 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BFDC0613C1;
        Fri, 15 Jan 2021 06:02:06 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id w26so10489413ljo.4;
        Fri, 15 Jan 2021 06:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uVkqDfNQ/EnFgo5jXovd2Jva9z2rUJt5+5HSBeWXzh8=;
        b=k8/AHNV5vFQMmcQ36DuxnWRApxG0nrgnzbBvKSIHN+UXTGkPrX9/6U26N20Tp9IwvZ
         gRabXEn8Em5u+J6AWuFk39HDXdCXs16hj0iuFUAF+PzvC6fKL0UDxxW50EQO+otAf4kh
         gNnBMc81wLSjdzBNlrf9bAsFmSPyxiM1w/dhOkY7xNdxgbzFlaSJFKYI+ze32YxQyuZo
         vafJX9Ul/oFgMEFZbDPL+itg2VmHq+eB61QnVmt0ri5lQXaCsjL5CaCdggU89YcedAAT
         8RhNuYQwK9xctZ5FhFimPXQdePeSJOf1G22kQNrjsiREhk3Pv1aPeB2fFN9WWS+H3SCd
         AFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uVkqDfNQ/EnFgo5jXovd2Jva9z2rUJt5+5HSBeWXzh8=;
        b=FicpmvnVjF+a02BgQ4WObU6FciOLBn0duO1uTq7XtyHyWXQIFlXtvS+Bz6qDRoyXAX
         fgZGl1CcK3oPhkXTebWG99lMgDRxRR8jpClpPj2KqhCcv7WNjKTPvdOHMrTtoir99ZHS
         Zpzqo1sHS8OQXD1MeBCZfxdQ5NeHsn1yvAizTJItfuJSAQLfI8UE2m1akpI/RstLUwoM
         LEiUczZFnQsgPFuzXXDnm+dKUg8901/PeJVrgFHzCBfC3/9NMIMiclcTSbckNxRnUhcz
         YBlqXi5fEbgCuiHbeWz/VePwZYbKomVPGxk+acr2wSfkvoDFiUiZVCamGJArZXNh4ZEH
         ezjw==
X-Gm-Message-State: AOAM533NsBs0LWaT3oc0kUXetq6xC4gjnROKHhgqyWgDjj5I+3sscwnX
        asxodF09Pm2e6HpbcfiLO/E=
X-Google-Smtp-Source: ABdhPJxZ7UaFizlMG1wxnusogSLwNvOH+tv2AnM7S51b1YFmebkjUNJK9l060nexKwNCxBcmjlRXKw==
X-Received: by 2002:a2e:9dc1:: with SMTP id x1mr5119364ljj.32.1610719324653;
        Fri, 15 Jan 2021 06:02:04 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f132sm906852lfd.252.2021.01.15.06.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 06:02:04 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] ALSA: hda/tegra: Use clk_bulk helpers
Date:   Fri, 15 Jan 2021 17:01:41 +0300
Message-Id: <20210115140145.10668-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115140145.10668-1-digetx@gmail.com>
References: <20210115140145.10668-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use clk_bulk helpers to make code cleaner.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/pci/hda/hda_tegra.c | 68 ++++++---------------------------------
 1 file changed, 9 insertions(+), 59 deletions(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 361cf2041911..a25bf7083c28 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -70,9 +70,8 @@
 struct hda_tegra {
 	struct azx chip;
 	struct device *dev;
-	struct clk *hda_clk;
-	struct clk *hda2codec_2x_clk;
-	struct clk *hda2hdmi_clk;
+	struct clk_bulk_data clocks[3];
+	unsigned int nclocks;
 	void __iomem *regs;
 	struct work_struct probe_work;
 };
@@ -113,36 +112,6 @@ static void hda_tegra_init(struct hda_tegra *hda)
 	writel(v, hda->regs + HDA_IPFS_INTR_MASK);
 }
 
-static int hda_tegra_enable_clocks(struct hda_tegra *data)
-{
-	int rc;
-
-	rc = clk_prepare_enable(data->hda_clk);
-	if (rc)
-		return rc;
-	rc = clk_prepare_enable(data->hda2codec_2x_clk);
-	if (rc)
-		goto disable_hda;
-	rc = clk_prepare_enable(data->hda2hdmi_clk);
-	if (rc)
-		goto disable_codec_2x;
-
-	return 0;
-
-disable_codec_2x:
-	clk_disable_unprepare(data->hda2codec_2x_clk);
-disable_hda:
-	clk_disable_unprepare(data->hda_clk);
-	return rc;
-}
-
-static void hda_tegra_disable_clocks(struct hda_tegra *data)
-{
-	clk_disable_unprepare(data->hda2hdmi_clk);
-	clk_disable_unprepare(data->hda2codec_2x_clk);
-	clk_disable_unprepare(data->hda_clk);
-}
-
 /*
  * power management
  */
@@ -186,7 +155,7 @@ static int __maybe_unused hda_tegra_runtime_suspend(struct device *dev)
 		azx_stop_chip(chip);
 		azx_enter_link_reset(chip);
 	}
-	hda_tegra_disable_clocks(hda);
+	clk_bulk_disable_unprepare(hda->nclocks, hda->clocks);
 
 	return 0;
 }
@@ -198,7 +167,7 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
 	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
 	int rc;
 
-	rc = hda_tegra_enable_clocks(hda);
+	rc = clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
 	if (rc != 0)
 		return rc;
 	if (chip && chip->running) {
@@ -268,29 +237,6 @@ static int hda_tegra_init_chip(struct azx *chip, struct platform_device *pdev)
 	return 0;
 }
 
-static int hda_tegra_init_clk(struct hda_tegra *hda)
-{
-	struct device *dev = hda->dev;
-
-	hda->hda_clk = devm_clk_get(dev, "hda");
-	if (IS_ERR(hda->hda_clk)) {
-		dev_err(dev, "failed to get hda clock\n");
-		return PTR_ERR(hda->hda_clk);
-	}
-	hda->hda2codec_2x_clk = devm_clk_get(dev, "hda2codec_2x");
-	if (IS_ERR(hda->hda2codec_2x_clk)) {
-		dev_err(dev, "failed to get hda2codec_2x clock\n");
-		return PTR_ERR(hda->hda2codec_2x_clk);
-	}
-	hda->hda2hdmi_clk = devm_clk_get(dev, "hda2hdmi");
-	if (IS_ERR(hda->hda2hdmi_clk)) {
-		dev_err(dev, "failed to get hda2hdmi clock\n");
-		return PTR_ERR(hda->hda2hdmi_clk);
-	}
-
-	return 0;
-}
-
 static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 {
 	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
@@ -495,7 +441,11 @@ static int hda_tegra_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	err = hda_tegra_init_clk(hda);
+	hda->clocks[hda->nclocks++].id = "hda";
+	hda->clocks[hda->nclocks++].id = "hda2hdmi";
+	hda->clocks[hda->nclocks++].id = "hda2codec_2x";
+
+	err = devm_clk_bulk_get(&pdev->dev, hda->nclocks, hda->clocks);
 	if (err < 0)
 		goto out_free;
 
-- 
2.29.2

