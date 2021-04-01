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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE69C433B4
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 18:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E7F361001
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 18:03:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237158AbhDASD0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234781AbhDAR7G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 13:59:06 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75090C0225B5
        for <linux-tegra@vger.kernel.org>; Thu,  1 Apr 2021 08:40:44 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id j3so2433877edp.11
        for <linux-tegra@vger.kernel.org>; Thu, 01 Apr 2021 08:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=twoNb6b7leWh8AV7R7ZmVfx/R5TDXseUKmzkX/40PoU=;
        b=PFwzxtailwS3bmCyT6YGNaKXm81RnKbZ7HF5A6Ocdsf4HmgOR1JHWHvvpriHp1wFdH
         bAUbPmlNtEnNZMH1hJxEIaQLSLzE7LjEedR/0hVjCgkPtrrO13pQdlXg3eu8skpc387j
         8rHFs0V2L5K0w9BrBvgVaOgX1GpCgUg540sK/fgfhMwhFLClyB0EvNsnVAyIwO0kFaOQ
         CSh1BpaWsef/56/9ZiDaQlRNh0i0rSyHvNpuhlj6OX11Mh/6Waa+hJWRGneWxBjiT0Ip
         0HcqwnPoTvMR144tL4eaNFx6Z4Buxsf7BTQq6BmDVmXuxGwgTLrdiCdFLtY379+wwWnq
         O1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=twoNb6b7leWh8AV7R7ZmVfx/R5TDXseUKmzkX/40PoU=;
        b=cG9cW3e2kpB+PpM7PWMMUulvOwcO8F1Ak/F7ENuIuhDBoCC537IROhfzlek05r85bC
         kavQdVPWkKCsnDmLAyv3vpYG7BFmNQPCtVN0/Qxr8UvBNm6m/1k/EwhSwSkCw0hNUAni
         ieQcHYFNUJqA0Zic17HfGKj5mxaUC549XokMjBnE9EaqyDyETi12mUWIlrChiBHW/m5f
         JjmNvv51fGZZ/QADXBnFKNSbbor79LgtDM87kk7wV5sk8cnbBvNdhqNRU3h+zF/MrNGQ
         ftZfQ6wuswkcdnYyGge/N6lY8gaDKJlviHsZxktxBZOfMEXpOj2AG9kA7rBtB3T/jczj
         osXQ==
X-Gm-Message-State: AOAM531Kz/T0OLfwEy5i5plDD2dvpshJoocK+c6fR0zb6T72exSvjcLc
        tTEFqHOsAf7rE5PtX5Eub8NCIMznPPo=
X-Google-Smtp-Source: ABdhPJxJyRtuAtKA/CV4uekPtJtBZLlFJzWYg+4Yfy3PcRDDipfNE4cD/0a6EkZS5MG0oTso9aOgZA==
X-Received: by 2002:a05:6402:270c:: with SMTP id y12mr10639711edd.284.1617291643281;
        Thu, 01 Apr 2021 08:40:43 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p3sm2987504ejd.7.2021.04.01.08.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:40:42 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/tegra: sor: Fully initialize SOR before registration
Date:   Thu,  1 Apr 2021 17:41:05 +0200
Message-Id: <20210401154105.3345412-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401154105.3345412-1-thierry.reding@gmail.com>
References: <20210401154105.3345412-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Before registering the SOR host1x client, make sure that it is fully
initialized. This avoids a potential race condition between the SOR's
probe and the host1x device initialization in cases where the SOR is
the final sub-device to register to a host1x instance.

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 7b88261f57bb..b29bc10a0a4d 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3916,17 +3916,10 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, sor);
 	pm_runtime_enable(&pdev->dev);
 
-	INIT_LIST_HEAD(&sor->client.list);
+	host1x_client_init(&sor->client);
 	sor->client.ops = &sor_client_ops;
 	sor->client.dev = &pdev->dev;
 
-	err = host1x_client_register(&sor->client);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
-			err);
-		goto rpm_disable;
-	}
-
 	/*
 	 * On Tegra210 and earlier, provide our own implementation for the
 	 * pad output clock.
@@ -3938,13 +3931,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
 				      sor->index);
 		if (!name) {
 			err = -ENOMEM;
-			goto unregister;
+			goto uninit;
 		}
 
 		err = host1x_client_resume(&sor->client);
 		if (err < 0) {
 			dev_err(sor->dev, "failed to resume: %d\n", err);
-			goto unregister;
+			goto uninit;
 		}
 
 		sor->clk_pad = tegra_clk_sor_pad_register(sor, name);
@@ -3955,14 +3948,20 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		err = PTR_ERR(sor->clk_pad);
 		dev_err(sor->dev, "failed to register SOR pad clock: %d\n",
 			err);
-		goto unregister;
+		goto uninit;
+	}
+
+	err = __host1x_client_register(&sor->client);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
+			err);
+		goto uninit;
 	}
 
 	return 0;
 
-unregister:
-	host1x_client_unregister(&sor->client);
-rpm_disable:
+uninit:
+	host1x_client_exit(&sor->client);
 	pm_runtime_disable(&pdev->dev);
 remove:
 	tegra_output_remove(&sor->output);
-- 
2.30.2

