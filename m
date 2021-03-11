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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0CFC43381
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 15:17:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0756B64FF1
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 15:17:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234047AbhCKPRX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 10:17:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234046AbhCKPRC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 10:17:02 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA851C061574;
        Thu, 11 Mar 2021 07:17:01 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id z8so2608026ljm.12;
        Thu, 11 Mar 2021 07:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2SMSIMvYxaxu4F53i5qtc3hVUmETiEH2Ssz4CshQdOI=;
        b=efyTR88FuZ/EWfd8zdy/nRhfsx2cu7cgcFzRLhSVkTz+pFbP+DWxbDR3qq8bqGaXkQ
         KJHJKKPLJjxPuW+SgxTgmhcN3fOilX/K72gigNjciCZtSM1H3eyTp8nzkjqfhNIzCFVq
         +rWlREF3qU58GsnF8gpBkvVvjooWAjlYdj2RGaAZPYSPOo/zq+zww810VvkZ5fIqzVjx
         i8K0nOWtuZj67K8cfQODxQEiW1RoFLaARYQ0swfMCDR+6hdFBXLR5jPbcvf8wux9nmrv
         SjdqvzhxEB9v2Gh0+TmlXX/wu2vtbjogw302OV8svqjlfarX+5fnWG/xcLEeyxkHQ5Ap
         VESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2SMSIMvYxaxu4F53i5qtc3hVUmETiEH2Ssz4CshQdOI=;
        b=HOuY+bbXxMkqVIrVtjon2rSlwdwYIaP+d0ey1UH6UtbEqKfAjgOmlsx+F4T6YISctu
         llZ6cV9GcuoIl4nd+S0U7Q0gjaPbOMB81A9hMzTA5KDSEsZtwdsIiz8+f6Tny0CeKfom
         7gMzw2/NAI+6arDvyQe+Je4CdRAivn8iXgBbFfbMdD3DLulYnzoJIGWEmREXzXNEtUy7
         BGdQ53nbwahXaC9Pb6GiiR6B3gPjUoy7k5UFyL74+E3rcesbNQ6GX9JdsM7K1Rt3nD/V
         abD7xMxCJQp3vaNd00hXtaFHWwoJy6ACnugp52VNjiR1FfVHx4ARzZvZLrGEMb1r/D5u
         j8VQ==
X-Gm-Message-State: AOAM532lLx/Cx6np86oG4+VSkOunBfk6yDI64ItPeR+2b3VHaP3nb7BJ
        gxUyC3Yl+1xKKxOO+Ie8Us8=
X-Google-Smtp-Source: ABdhPJxuzRFej1Px86UaKb3FEtTASiLFxKlnTGK+H5EU5OOkqUeCaBRlXW0zziipgDFzLjTcbUgmGw==
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr5145808ljj.96.1615475820463;
        Thu, 11 Mar 2021 07:17:00 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id m24sm923138lfq.184.2021.03.11.07.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:17:00 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] ASoC: tegra30: i2s: Restore hardware state on runtime PM resume
Date:   Thu, 11 Mar 2021 18:15:52 +0300
Message-Id: <20210311151554.23982-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311151554.23982-1-digetx@gmail.com>
References: <20210311151554.23982-1-digetx@gmail.com>
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

