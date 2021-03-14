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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04B1C2BA1E
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9465864EEC
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234347AbhCNPqL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234049AbhCNPpi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 11:45:38 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FC0C061574;
        Sun, 14 Mar 2021 08:45:38 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo18042909wmq.4;
        Sun, 14 Mar 2021 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1gWjZKVNCnhVgYQ/8NhksOw3cbjmVx93WVZKmCK3l6c=;
        b=abtm9MxNfLHcix+/FQw/rNeDglWV4BUl8lzzCjJFCMRtuhj/+6yel89bpO0ouFcki0
         BXDiav8ardhQyt0WAoVbEzxFDuMxJoYJ6BTnM9MEKx5yaR/iFoRNgxUwbNTAiCe/6ZZI
         s9zdeYKz/v6b9syBmJB67b//GEPdvpm8gbVqivCXVG92zQz9UTIvDeX96+28pltUzA+X
         PJzyWrg+K4Zft4AGhFCpH45Mf1I38XJdojXiUqH7WkGyIGi0kCGtQeUo8LzJiCRV1S0X
         3m/EGAv7qBwpPh+dgMvxIORFXx6M6caH7BIB8V4/c/bbfFQNCDnXHgCty4xKx8VhK0io
         ikow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1gWjZKVNCnhVgYQ/8NhksOw3cbjmVx93WVZKmCK3l6c=;
        b=aFWH/WL3UM/cgpF/jT8Ky/k16H67XOCAOLRfUQzCZnN53S45eIRI9VE8NMGD7m4TUq
         EMgFBTG0ua4S90pb/OR1FYmP7kMtISak5xbRxjlOd4vF0Fn4VHgSbYaImAuN8MrFxjeO
         Cvm+nf7fcKCgHrYUwP/fDSdguB6OGNbkhuOhzJZVhgitF4DPYK+2eLg/BxZ8njf90JaO
         BQ8MLwXIr/uWxB9FmDxbG4H6Cm3yNkYIh5fxgJ5E3dNXtLwgZS/ajc502H+2+TYoRY5j
         gpGqCQE0kZS/7Oh+7yaD8ETAcQgHnURogFa5Ju34EHdN5Uio6NbB/5QCNHgSowTQhiie
         ZCfw==
X-Gm-Message-State: AOAM530cVTlnea7sBWlE20rlGB6MVmuy7os8+WBPBB8lJpAVdqG+CM6d
        WYgUTThx0gYDjY89QcYuXs0=
X-Google-Smtp-Source: ABdhPJxgG1keItrwFks9hEM0/7+x4JA1tAmy+rjay3Yt2mmi5atU+WjDNSkfDgoSHCLjUmDzxJStqw==
X-Received: by 2002:a05:600c:2d42:: with SMTP id a2mr22510522wmg.77.1615736737227;
        Sun, 14 Mar 2021 08:45:37 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 08:45:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 16/17] ASoC: tegra30: ahub: Correct suspend-resume callbacks
Date:   Sun, 14 Mar 2021 18:44:58 +0300
Message-Id: <20210314154459.15375-17-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
References: <20210314154459.15375-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra30 AHUB driver always syncs hardware state on a runtime PM resume,
hence there is no needed to re-sync the state on system resume. Replace
the suspend-resume callbacks with a generic helpers which ensure that
AHUB is suspended using RPM callbacks across system suspend-resume.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 409a259e6343..e64b41bc5fdf 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -613,36 +613,11 @@ static int tegra30_ahub_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int tegra30_ahub_suspend(struct device *dev)
-{
-	regcache_mark_dirty(ahub->regmap_ahub);
-	regcache_mark_dirty(ahub->regmap_apbif);
-
-	return 0;
-}
-
-static int tegra30_ahub_resume(struct device *dev)
-{
-	int ret;
-
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put(dev);
-		return ret;
-	}
-	ret = regcache_sync(ahub->regmap_ahub);
-	ret |= regcache_sync(ahub->regmap_apbif);
-	pm_runtime_put(dev);
-
-	return ret;
-}
-#endif
-
 static const struct dev_pm_ops tegra30_ahub_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra30_ahub_runtime_suspend,
 			   tegra30_ahub_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(tegra30_ahub_suspend, tegra30_ahub_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra30_ahub_driver = {
-- 
2.30.2

