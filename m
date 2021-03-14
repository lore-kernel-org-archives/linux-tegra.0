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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5AAC2BA12
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E042064E69
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234308AbhCNPqJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234118AbhCNPpe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 11:45:34 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331EFC061574;
        Sun, 14 Mar 2021 08:45:33 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id b18so7437977wrn.6;
        Sun, 14 Mar 2021 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QpHXgChknEzhzYi4Q8rqZSYE4y3Oym7aFx47bTQjCRA=;
        b=bRLNLTABvbDYFY599i2T//8iHkJMDYKj6tzFPHL5SRb7AcALZZ0tKjQ5HdxlWBKjWt
         SyQ8A7RJU2hkiRLLJtJhOPzsDbpsLT/2dkHYZfviDM5OBmhMUumILoFGotrAY8soWdmY
         iKzKwqaZgmgpZsx5W23qofLLZaie4fRDfIg01+S70kAdvLXNbGAfhkNN4dnyZehpkVYV
         nF8qR7+vHHQikU6mecPKMNDN5E/JQVnRhgn2B8c8Njs9BsUUJIR9PewiDzSTy3aUCMn2
         1hmnjgAZXcjogfiAAxxCg4d3gfteOrRJuowIVdRkdmpzvi3bDsxpD9bUkaEDeAgVzEbc
         CMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QpHXgChknEzhzYi4Q8rqZSYE4y3Oym7aFx47bTQjCRA=;
        b=m2voiihnyFHnZ3991Yk1dxm/+MqXOQFz4FLaSOqJV4tFbCnW5N5nqvFA4muOYDPhkU
         9Ikm1o51D5jFRYfnSV5Q1PiPSluE/FD0LHtFmYjuF+eOI8afJt7oIbI8I72Zx+d1yceB
         I9ysTR85JpUpo5ivfvEToTzGiWSjnMykn9knEohWYYKNXSvqSPepirZDviJQpx99PJqx
         bcSEXxhwPNeKStxVSfDJqQDPBYqY7+xHswkp0aDb+HJrhbLKVgdq0xtl4nqG8TOgHXQz
         OYcEzUeCloC/oa4kFCf2BUunn6du8hH+C0k/+TYZi5bmKGqoV8/T5XBVbRWVLrmVX7GI
         /sOw==
X-Gm-Message-State: AOAM533pbvPL9Qfb8pXOvpTm+KujV/n18pNE7oCX1VHxwqVfoH+XLteU
        TpIy0d/W5WYdrHidckq/SYM=
X-Google-Smtp-Source: ABdhPJyd0+Gt/PLPpYiHZG8ky3XiLj8yZZzNOhE6OO/1QCc4KEUkdkf0+qyy74cpcV5yufuKG140NA==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr22810754wrs.34.1615736731999;
        Sun, 14 Mar 2021 08:45:31 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 08:45:31 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 11/17] ASoC: tegra20: i2s: Remove handing of disabled runtime PM
Date:   Sun, 14 Mar 2021 18:44:53 +0300
Message-Id: <20210314154459.15375-12-digetx@gmail.com>
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
of a disabled runtime PM from Tegra20 I2S driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_i2s.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index fe569198b17a..1b27f81c10fe 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -401,18 +401,13 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 	i2s->playback_dma_data.maxburst = 4;
 
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		ret = tegra20_i2s_runtime_resume(&pdev->dev);
-		if (ret)
-			goto err_pm_disable;
-	}
 
 	ret = snd_soc_register_component(&pdev->dev, &tegra20_i2s_component,
 					 &i2s->dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
 		ret = -ENOMEM;
-		goto err_suspend;
+		goto err_pm_disable;
 	}
 
 	ret = tegra_pcm_platform_register(&pdev->dev);
@@ -425,9 +420,6 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 
 err_unregister_component:
 	snd_soc_unregister_component(&pdev->dev);
-err_suspend:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra20_i2s_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 err:
@@ -438,10 +430,7 @@ static int tegra20_i2s_platform_remove(struct platform_device *pdev)
 {
 	tegra_pcm_platform_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
-
 	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra20_i2s_runtime_suspend(&pdev->dev);
 
 	return 0;
 }
-- 
2.30.2

