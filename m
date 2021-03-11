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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E117C43619
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 17:44:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AAB164F9A
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 17:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhCKRne (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 12:43:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhCKRnQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 12:43:16 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA89C061574;
        Thu, 11 Mar 2021 09:43:15 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id e7so41207665lft.2;
        Thu, 11 Mar 2021 09:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2SMSIMvYxaxu4F53i5qtc3hVUmETiEH2Ssz4CshQdOI=;
        b=nPMDAfRVDDoZs0rrhyF8XsG0pQQNjBacimeiag9hlGeuKQ5Lu0pHbeoRz3avqMOcvx
         7GobZrCvZLlROufJ1ApX0WI4zMA5ISknv2y9vbZTmJWJupOKBPJfE84fPWSCA5842JTu
         7VAKq5BDxktUVfz0SrBjcmEyVeAAt1qr7Rrj8841PcWrZTg+TLxRroxejVfo34v0An45
         rm/bAEN3Ob6X2eI2P/C9TyY7nIaVu4zmVTaCBRwYzsAJdSyoTvfKTCIop+Yh+i+l1QJc
         yyGFRC2pKSIh9rQOQ+qUi78TNZ1DFBc5qTBo02g1oWlT6sgMpCQDbVtHlyEQ86EAdQhf
         5P+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2SMSIMvYxaxu4F53i5qtc3hVUmETiEH2Ssz4CshQdOI=;
        b=XtFnY6wCRqk37H7B7f+9HF845c7XiZDNG6CqPMKguQtpWlnAl3Ktp9I6D/G5Npudxe
         IyR8Cg6bSwo+zV8448LJ/ZpU3Bd6q4Ff+6dYoz/1sc3Ob1sEzSwtGlNDAVMELJ+XscPq
         UzyU0+u3IBVizbjSPaZBOpvlA19FM00zXLwihFGj0ViI/MSaW619XdxyUl0i5oweLDci
         QnelqctIBf8UmFDLZyNE6V5gDw6jvNa48F7Wi1aw566Vg5zgPpWJrzN7Egydf9avij+f
         OgoG77Yb3osiEumo4DYwRD2Qa0NjqhMyYErKe/GEuISQa158DkKERgInCuiPPWY4UAtv
         NUjg==
X-Gm-Message-State: AOAM532KkrZwlUk+ZFvohEzE9zyBgUyh4DFVFDVNkk/vjaMXzy1+Yb34
        sCPH4XXCw/RIPVJSZXrgcyM=
X-Google-Smtp-Source: ABdhPJx7am9gJOeVJtdyhP6kXrjDmeN/fJJmTlBjiUylapuIR/ADwJzfnKrRqmdAVcxiJ1d2hV5Szg==
X-Received: by 2002:a19:4850:: with SMTP id v77mr2979755lfa.6.1615484594239;
        Thu, 11 Mar 2021 09:43:14 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id g10sm1021245lfe.90.2021.03.11.09.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 09:43:14 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] ASoC: tegra30: i2s: Restore hardware state on runtime PM resume
Date:   Thu, 11 Mar 2021 20:43:00 +0300
Message-Id: <20210311174302.15430-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311174302.15430-1-digetx@gmail.com>
References: <20210311174302.15430-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra30 I2S driver syncs regmap cache only on resume from system suspend,
but hardware is reset across the runtime suspend because RPM of the parent
AHUB driver resets the I2S hardware, hence h/w state is lost after each
RPM resume. The problem isn't visible because hardware happens to be fully
reprogrammed after each RPM resume. Move hardware syncing to RPM resume in
order to restore h/w state properly.

Fixes: ed9ce1ed2239 ("ASoC: tegra: ahub: Reset hardware properly")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_i2s.c | 40 +++++++++++------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 6740df541508..3d22c1be6f3d 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -58,8 +58,18 @@ static int tegra30_i2s_runtime_resume(struct device *dev)
 	}
 
 	regcache_cache_only(i2s->regmap, false);
+	regcache_mark_dirty(i2s->regmap);
+
+	ret = regcache_sync(i2s->regmap);
+	if (ret)
+		goto disable_clocks;
 
 	return 0;
+
+disable_clocks:
+	clk_disable_unprepare(i2s->clk_i2s);
+
+	return ret;
 }
 
 static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
@@ -551,37 +561,11 @@ static int tegra30_i2s_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int tegra30_i2s_suspend(struct device *dev)
-{
-	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
-
-	regcache_mark_dirty(i2s->regmap);
-
-	return 0;
-}
-
-static int tegra30_i2s_resume(struct device *dev)
-{
-	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
-	int ret;
-
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put(dev);
-		return ret;
-	}
-	ret = regcache_sync(i2s->regmap);
-	pm_runtime_put(dev);
-
-	return ret;
-}
-#endif
-
 static const struct dev_pm_ops tegra30_i2s_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra30_i2s_runtime_suspend,
 			   tegra30_i2s_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(tegra30_i2s_suspend, tegra30_i2s_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra30_i2s_driver = {
-- 
2.29.2

