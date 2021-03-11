Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5573C43331
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 18:00:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DB5A64FE9
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 18:00:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhCKSAU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 13:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbhCKSAL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 13:00:11 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C4AC061574;
        Thu, 11 Mar 2021 10:00:10 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id f26so3301957ljp.8;
        Thu, 11 Mar 2021 10:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yx3Rm9jzGKCPBq80QBACsTq0WbETqkrvY2ZCaXbwiog=;
        b=RfazgWpy9p7PrRnmKyR8+2NTMO03Sr+kHm3ECVQQpNf+cYTLxB9o7UzQSvUlAyjtb2
         v9+ubFIaklLJ+oaCyOvj4U5eSqjsPU1mCih7jGwlw+vy4hcl49esTDD9TLLybfaS47aL
         4luzmPqVamTZUPGAw9XFOrEQMjXXFv3EkOu/0rtYbgNUCuvWJ3+3cupyxZwEwQs5H6r2
         Y0/SyoH4W3ahSTKd5YVUq3JRTdb9E1Oc26MLSf4WSWit1RWaQLXjIihA0xYvi8T0/8c8
         rr+aDyuJD5FV6YoDl1Fx3s7MKwTJX1wUBSPhzGsL5CAgmvpPwtxzjD2MZ2TLFB92EnVc
         a6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yx3Rm9jzGKCPBq80QBACsTq0WbETqkrvY2ZCaXbwiog=;
        b=ARFzBI8Dj3XEmTiBvVEgnCzxtN7X1gTvgBrtB6KU8tRrrOT8hxpRQlJrFkiNSzrKtg
         ozuBIrM/k8IgymPPffhoF30RSkI/DipJzpXyKT6GzhMaXlwpmR2XMla6xpAnKNgRkaUa
         7lh46LTHLmeG30HqNQIRFwWGwmW98JexRq1Jw+wwkCWNO6C6bG5bjVvCAiqT4HjuNhB5
         zd8UZG1VWQL7KVBYtkDLsiWiEsGke4RtZd5fUz85u66VLEKuJYYRqmLCs1MaXrBxAc1C
         +YC7kefvQiVYqWP5HYYljOKyJkYqw6X+bvFkeOb7rv/NSGiVKCC/C8dnWYqYZkfuQcix
         XS6Q==
X-Gm-Message-State: AOAM532LL+TNgDx4jV6o1wqFNzqL75afcAo1Y5f+HNyg7yeBdQYycD+t
        F+wRdKJKgY/PU+RA9BXZfnc=
X-Google-Smtp-Source: ABdhPJwEDL0cJGc6NP26XyZSzQK2KvCQdi/cIkV0fkYk3M2bND0hldvpC1t3fb8CkXoaMXu4Q54CuA==
X-Received: by 2002:a05:651c:1033:: with SMTP id w19mr40842ljm.191.1615485609423;
        Thu, 11 Mar 2021 10:00:09 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id k18sm1014075lfm.88.2021.03.11.10.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 10:00:09 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] ASoC: tegra20: i2s: Add reset control
Date:   Thu, 11 Mar 2021 20:59:55 +0300
Message-Id: <20210311175958.7433-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311175958.7433-1-digetx@gmail.com>
References: <20210311175958.7433-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The I2S reset may be asserted at a boot time, in particular this is the
case on Tegra20 AC100 netbook. Tegra20 I2S driver doesn't manage the
reset control and currently it happens to work because reset is implicitly
deasserted by the tegra-clk driver when I2S clock is enabled. The I2S
permanently stays in a reset once tegra-clk is fixed to not touch the
resets, which it shouldn't be doing. Add reset control to the Tegra20
I2S driver.

Note that I2S reset was always specified in Tegra20 device-tree, hence
DTB ABI changes aren't required.

Tested-by: Paul Fertser <fercerpav@gmail.com> # T20 AC100
Reported-by: Paul Fertser <fercerpav@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_i2s.c | 31 +++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_i2s.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index d7a3d046c8f8..c0af5352b483 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -37,6 +38,8 @@ static int tegra20_i2s_runtime_suspend(struct device *dev)
 {
 	struct tegra20_i2s *i2s = dev_get_drvdata(dev);
 
+	regcache_cache_only(i2s->regmap, true);
+
 	clk_disable_unprepare(i2s->clk_i2s);
 
 	return 0;
@@ -47,13 +50,35 @@ static int tegra20_i2s_runtime_resume(struct device *dev)
 	struct tegra20_i2s *i2s = dev_get_drvdata(dev);
 	int ret;
 
+	ret = reset_control_assert(i2s->reset);
+	if (ret)
+		return ret;
+
 	ret = clk_prepare_enable(i2s->clk_i2s);
 	if (ret) {
 		dev_err(dev, "clk_enable failed: %d\n", ret);
 		return ret;
 	}
 
+	usleep_range(10, 100);
+
+	ret = reset_control_deassert(i2s->reset);
+	if (ret)
+		goto disable_clocks;
+
+	regcache_cache_only(i2s->regmap, false);
+	regcache_mark_dirty(i2s->regmap);
+
+	ret = regcache_sync(i2s->regmap);
+	if (ret)
+		goto disable_clocks;
+
 	return 0;
+
+disable_clocks:
+	clk_disable_unprepare(i2s->clk_i2s);
+
+	return ret;
 }
 
 static int tegra20_i2s_set_fmt(struct snd_soc_dai *dai,
@@ -339,6 +364,12 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 	i2s->dai = tegra20_i2s_dai_template;
 	i2s->dai.name = dev_name(&pdev->dev);
 
+	i2s->reset = devm_reset_control_get_exclusive(&pdev->dev, "i2s");
+	if (IS_ERR(i2s->reset)) {
+		dev_err(&pdev->dev, "Can't retrieve i2s reset\n");
+		return PTR_ERR(i2s->reset);
+	}
+
 	i2s->clk_i2s = clk_get(&pdev->dev, NULL);
 	if (IS_ERR(i2s->clk_i2s)) {
 		dev_err(&pdev->dev, "Can't retrieve i2s clock\n");
diff --git a/sound/soc/tegra/tegra20_i2s.h b/sound/soc/tegra/tegra20_i2s.h
index 628d3ca09f42..8233e5fa2eff 100644
--- a/sound/soc/tegra/tegra20_i2s.h
+++ b/sound/soc/tegra/tegra20_i2s.h
@@ -144,6 +144,7 @@ struct tegra20_i2s {
 	struct snd_dmaengine_dai_dma_data capture_dma_data;
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
 	struct regmap *regmap;
+	struct reset_control *reset;
 };
 
 #endif
-- 
2.29.2

