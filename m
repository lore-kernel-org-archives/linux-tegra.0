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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C78C43217
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:00:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E134923117
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:00:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390661AbhALNAF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 08:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390631AbhALNAE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 08:00:04 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD02C061786;
        Tue, 12 Jan 2021 04:59:23 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id u21so2764878lja.0;
        Tue, 12 Jan 2021 04:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U1RnP9fDqxuGuZO3p6OVv1kBuZCep9lrHH2HK3m142A=;
        b=Be+mTIPt6Au0v1PqAmS31FaJ0sTmRzMY9Xd+IV1+DnrSVFUQf+z4NoyF+xu6C+4uIN
         Jb7vprZloh3evByiRo3D/x4SHRh87jcFIWPYRFloK6Igmlhky8UdXnL80uAzzR/tU6c1
         ceW3wluhmqRpPvAI7CUBYAxcByKmbM1+zGk34G5dgrA/JoR2W8yLcMIvMkeM5Ym0Jq1I
         WtfKNHTL8G3B4eEcDhZWDnwLXzBOUK/J4gFbHIN0if2/vEy0h1uCG9o1B/ODIOdJXQnQ
         wzWLqeVDSj4Zs0UvOR1zVvZHG9nacOnw82W1FFWxj7Budx7tfMygevywNt2gAQhKi+Hx
         X5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U1RnP9fDqxuGuZO3p6OVv1kBuZCep9lrHH2HK3m142A=;
        b=uWIYDdKaD8Tduuw2RGpCU9bzvKerfueTeAR1rxGXuqnOX4sx+N6tZcdhuvLJe5bzg/
         eGdWIj9gYA5zXddUYgeSBTUP1q+AKydQRdrhyQcFerBNCvNdpKWRy5MlPNl7rrQeRZCS
         Gt4aQhkAV9/xmWeWVYr7O/JwJjV6OPfwX/FSY4QZozU0XySTV5ufEf26vlVIP8/Vi2h3
         355STmSeqcnZeNvVSiJqjQ57Nkbh+VQ5JMOysbAgO7TOzrR6RYGa9E2cuCfH2fh8xgP5
         GNLC0CQXu+DCuPTeVcH247a5K+kNmcf2TtDFlVcU2ciVf7p9ZbzRwx1kI0AaUxWUxkDc
         enNQ==
X-Gm-Message-State: AOAM5317X6pm6yFUXy0vzG11NNEv03vb2MvV1FhFcYexLTNnwWf6oAo2
        88Rni9qmUvrdbMDjvQR/9zc6aM9LiQ4=
X-Google-Smtp-Source: ABdhPJw4grk6GjPtZB2Ufck6pVcNJxP481ZSHWVuteTcIsfAJMKXJ+W+tdtJwlCX0rdYfDZNAt9PsA==
X-Received: by 2002:a2e:6818:: with SMTP id c24mr2126208lja.184.1610456362442;
        Tue, 12 Jan 2021 04:59:22 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id 192sm384211lfa.219.2021.01.12.04.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 04:59:22 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] ALSA: hda/tegra: Use clk_bulk helpers
Date:   Tue, 12 Jan 2021 15:58:30 +0300
Message-Id: <20210112125834.21545-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112125834.21545-1-digetx@gmail.com>
References: <20210112125834.21545-1-digetx@gmail.com>
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
index 70164d1428d4..4c799661c2f6 100644
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

