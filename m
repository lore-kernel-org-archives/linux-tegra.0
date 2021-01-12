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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE52C433E9
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 18:15:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AA7E2311D
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 18:15:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404683AbhALSPI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 13:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404410AbhALSPI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 13:15:08 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE72C061794
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 10:14:52 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id o17so4789764lfg.4
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 10:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NQd3TCvrr2TP4Frx3nhwn9PTWSRPzGosIJsNeSPerMA=;
        b=huQskgPf8fX+bWVYEDXOnmdO8Kd5bVKMJgzDd+b7Hoc1bGLNr8/e24WpMesxNuzWdV
         l2BbKE7djqjRJUCbpEgeDdF2QlYdUI47ShsvutrpFxtgFMDwPGGMxPMqqG8IhPlpYrdq
         d/bA3y3LSzekrcXhf308TTnNrHy9wbcbTe54AKrbgFIVCM+WRhZq5YMj3SHkqyJ+X9Vt
         4HxpPIULU5eEs1yq7HMSPD1ulrVwcspTn2IJT/LMeEx3uYJu9v3S6au1Siv9L1/rjSpj
         hhPkHLStIGlLOyUM5Ahm+yI2PrY76BVTr7Hyi/cAL5RiHr1HklIW4RnWrz6rM6ZI5lhD
         1cKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NQd3TCvrr2TP4Frx3nhwn9PTWSRPzGosIJsNeSPerMA=;
        b=TXUhFoNiuZp02H7F0EwEGZTyedBshJzsHrlBcmzy4e9AArgoCkSeVtvo/RLzZiuKE5
         fZF9ch8fWS4eq8yLn4dmyo2gQXdfsmazh1/e0yY93uwlIf99EvmFQU5YObwZfZntn8G1
         hYjda8FC171VAvql7K8V8P1n+IbevpxK0ZkD13OtE3HKOmFMCuc8/MYjJFx3YiKnTf+V
         040a9mAtoyUwomLoD39R2v48CJ8rl0hQV6qgXng6VLR4VInq3/Vd2l1xBK1RgzFnKRov
         /13q09w1+7xKdFAUAIECu9CHIAVW42HefloMg2ggYU2pY3lSolz1W1cp7vOfBLQUIAn4
         2E/Q==
X-Gm-Message-State: AOAM533rfi4OL+4/v95UeVHD+swuxVURQ0rxheicS+J7BjAziJdn01a6
        SNZTk2E7zzOcGUytZ2v5qmA=
X-Google-Smtp-Source: ABdhPJyFAlrix7w6midQ1sAuu83XXb7Qxyzp6UuQZp5EYIfcA50sPOGdP6bvIP6jvffVN28kmG6j8g==
X-Received: by 2002:a19:c158:: with SMTP id r85mr60609lff.405.1610475291381;
        Tue, 12 Jan 2021 10:14:51 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id r8sm417420ljd.140.2021.01.12.10.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 10:14:50 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Anton Bambura <jenneron@protonmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/3] drm/tegra: dc: Enable display controller driver for Tegra114
Date:   Tue, 12 Jan 2021 21:14:19 +0300
Message-Id: <20210112181421.21293-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112181421.21293-1-digetx@gmail.com>
References: <20210112181421.21293-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Display controller driver isn't listed as a DRM sub-device for Tegra114,
thus display driver isn't loaded on Tegra114. Enable display controller
driver for Tegra114 SoC.

Tested-by: Anton Bambura <jenneron@protonmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 1472042da2a7..e24e05a47197 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1315,6 +1315,7 @@ static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra30-hdmi", },
 	{ .compatible = "nvidia,tegra30-gr2d", },
 	{ .compatible = "nvidia,tegra30-gr3d", },
+	{ .compatible = "nvidia,tegra114-dc", },
 	{ .compatible = "nvidia,tegra114-dsi", },
 	{ .compatible = "nvidia,tegra114-hdmi", },
 	{ .compatible = "nvidia,tegra114-gr3d", },
-- 
2.29.2

