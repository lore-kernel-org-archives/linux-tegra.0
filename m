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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7320C43603
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFA8864EF8
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234244AbhCNPqG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234091AbhCNPpa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 11:45:30 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034E0C061762;
        Sun, 14 Mar 2021 08:45:29 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id a18so7413074wrc.13;
        Sun, 14 Mar 2021 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iCLWBBqHBwluoiOOJDI5uMrTVFtzy0ArpO4aAlC/nzc=;
        b=R2KJrX5jiM5ZduJ6elrOV/mm2ZzDVmxC9t9WAmsRmyga5VvtJVcz7HJGwSvAta+XII
         6o96r06jdZIFr1GjOIpus/TyOPmcBH4HkvO5OMzu9klUJ817u3lRezSilzmZL8uamtEE
         pO5PNFObIb9A595AWwP6spAQfX44z+LhnrPHjI4f+XZsGR3mHb86yD4U9Q6RKzaqIHeU
         GeTWbF4lvo5Z8eHueZTtBdjOONkmtODi202CTD+BRhIUJpU2cce+Tk8AeCjZGSpwTNFd
         rCSZy8nPJ7X2FhsOpX/QhgOFNQtiqGjKmrsN/EEAz4/C6XligZMICxE6zJTLfHqhpskf
         BA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iCLWBBqHBwluoiOOJDI5uMrTVFtzy0ArpO4aAlC/nzc=;
        b=j3MV2f2Oi9UX2QKKj3RkH5jWY88a1beIazZ8qI/5zXD/23ORHTsoRhK5MktysKvbwN
         lqTNyK4NMUBz+kiFVmN6GKfaGhRVVkgLW8xixcrJqeQ5YajKZ948Y1d84pW7WARuVLIF
         PBVnDu5Ii+3H4y1wJc7Su6LGawsVG2JaDxKHi/5LBx1aINUJkrpCC7JGCRIBcSwYKxb+
         r6itJOsfiA46uwAbhPlfP46yGqfV307/HugTBvrqNI8scujfly9jmSTfEJfmj3gO8HXy
         MFVnEgVQJ0te8itrY+47BTrA4xsMaOI6JMuDwc4Mod/7v3X+qxQRBbc4SG3dH1XK2nY2
         D7gQ==
X-Gm-Message-State: AOAM530o4oShfYvOc/JDxDCm3x9Z8MJu016TRLI5grOwx+OjLSBE48MF
        gVR5LrFyWvW7eLRNI09AOrQ=
X-Google-Smtp-Source: ABdhPJzrCmAwXQXLkCinKkRoszXsLepF9evCyigdVm6SFGYqK4jTQojMCwnap9KNm9463wv78u6a7g==
X-Received: by 2002:adf:9bce:: with SMTP id e14mr24516002wrc.29.1615736727677;
        Sun, 14 Mar 2021 08:45:27 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 08:45:27 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/17] ASoC: tegra20: spdif: Remove handing of disabled runtime PM
Date:   Sun, 14 Mar 2021 18:44:49 +0300
Message-Id: <20210314154459.15375-8-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
References: <20210314154459.15375-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Runtime PM is always available on Tegra since commit 40b2bb1b132a
("ARM: tegra: enforce PM requirement"), hence there is no need to
handle the case of a disabled RPM by Tegra drivers. Remove handing
of a disabled runtime PM from Tegra20 SPDIF driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index e48d332506a0..7b597ee63cb5 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -294,18 +294,13 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 	spdif->playback_dma_data.slave_id = dmareq->start;
 
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		ret = tegra20_spdif_runtime_resume(&pdev->dev);
-		if (ret)
-			goto err_pm_disable;
-	}
 
 	ret = snd_soc_register_component(&pdev->dev, &tegra20_spdif_component,
 					 &tegra20_spdif_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
 		ret = -ENOMEM;
-		goto err_suspend;
+		goto err_pm_disable;
 	}
 
 	ret = tegra_pcm_platform_register(&pdev->dev);
@@ -318,9 +313,6 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 
 err_unregister_component:
 	snd_soc_unregister_component(&pdev->dev);
-err_suspend:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra20_spdif_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 
@@ -333,8 +325,6 @@ static int tegra20_spdif_platform_remove(struct platform_device *pdev)
 	snd_soc_unregister_component(&pdev->dev);
 
 	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra20_spdif_runtime_suspend(&pdev->dev);
 
 	return 0;
 }
-- 
2.30.2

