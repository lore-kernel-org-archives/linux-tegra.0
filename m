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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1E6C433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C4AE619CF
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbhCWPyk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 11:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232823AbhCWPyb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 11:54:31 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBE6C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:30 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id u5so27928381ejn.8
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fz0pj9ppHMWd8qVO1GW/JKUv14EpoMWJ6NeYk++JZEA=;
        b=FNJVsHPBJpHg9N+6WL9bsnAxgfRAwzvvyV8W6upUxk4EibvlS2qEta0TI6K9dnTBsk
         WprbN53jE5BFzLmE27On/7yDMYd50an73oPrjXXUGlvfp9/MOkuNzLCfsuoqRceh3/N9
         EKQWOsGh5wjkJHLsf6VBuDi4Wy0Ro1ZbNovLb4e/HkM9uDec9P8eLUI1FYgWpPzHwEQD
         /NbFXR6yGFtYs/7Sn1gBCyGP0znXModNAJA6gbvL7fMnOlkJsy7EEVkEGObolcQbcQd3
         wkAXV66WnJWvIWd1jlTSlLNv8rLTo9KSqNon76XIEN9/5h3AZ8AsaDq7T2yDyAiEl/8V
         N7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fz0pj9ppHMWd8qVO1GW/JKUv14EpoMWJ6NeYk++JZEA=;
        b=uD1cH37sxl1Hn/vQsC23ebUjnQFH++VFg+HHddvSmLVXpvnu4DSn1wJ51bnorkiL+O
         8ZlAV6ciNBau1zzk/s06B2126RjMQa5Bt2MJ+C0F5SiDTmpMO18MHTgrrHBw6ceXj+m8
         tuvNbBvByjHphgayUHUlWownSOrUrKKpkdfsszGLB9b5/S9Uvlft5B46zEbNwJq0nPTK
         2zoi/tV2JwOmZ3XiAKpKWlkpmt2W2YcnVaW9fwTpC2HChEqcpsU1sFbn+QPG4DdtYd3m
         3cTt2lfMMBbBKptMLodClApDhh2L4+WJeIkDUFbTCHATw6o+idajWYC0iiSwnrJ1YoEo
         t84Q==
X-Gm-Message-State: AOAM5302shY9d6YM9sLEWv7GqccFAf8XVmfHQ/n7RiCG+/AIuZszMm/K
        7hftyHq+Dxb90gQObjU+E5Q=
X-Google-Smtp-Source: ABdhPJwmgm9LvISuNY9MMJA04AO7jA2DJ5Luc8Ef1wNCoOxHm9cUdrksw6lemE+3pPWbBitTNmK8iw==
X-Received: by 2002:a17:906:f56:: with SMTP id h22mr5654838ejj.494.1616514869097;
        Tue, 23 Mar 2021 08:54:29 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n26sm13024993eds.22.2021.03.23.08.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 08:54:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 3/9] drm/tegra: dc: Parameterize maximum resolution
Date:   Tue, 23 Mar 2021 16:54:31 +0100
Message-Id: <20210323155437.513497-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra186 and later support a higher maximum resolution than earlier
chips, so make sure to reflect that in the mode configuration.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  |  6 ++++++
 drivers/gpu/drm/tegra/drm.c | 13 ++++++++++---
 drivers/gpu/drm/tegra/drm.h |  1 +
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 5737a0c4dc9f..1886ef1fcda7 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2117,6 +2117,12 @@ static int tegra_dc_init(struct host1x_client *client)
 	if (dc->soc->pitch_align > tegra->pitch_align)
 		tegra->pitch_align = dc->soc->pitch_align;
 
+	/* track maximum resolution */
+	if (dc->soc->has_nvdisplay)
+		drm->mode_config.max_width = drm->mode_config.max_height = 16384;
+	else
+		drm->mode_config.max_width = drm->mode_config.max_height = 4096;
+
 	err = tegra_dc_rgb_init(drm, dc);
 	if (err < 0 && err != -ENODEV) {
 		dev_err(dc->dev, "failed to initialize RGB output: %d\n", err);
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6015913fef83..bbc504763bd4 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1144,9 +1144,8 @@ static int host1x_drm_probe(struct host1x_device *dev)
 
 	drm->mode_config.min_width = 0;
 	drm->mode_config.min_height = 0;
-
-	drm->mode_config.max_width = 4096;
-	drm->mode_config.max_height = 4096;
+	drm->mode_config.max_width = 0;
+	drm->mode_config.max_height = 0;
 
 	drm->mode_config.allow_fb_modifiers = true;
 
@@ -1165,6 +1164,14 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	if (err < 0)
 		goto fbdev;
 
+	/*
+	 * Now that all display controller have been initialized, the maximum
+	 * supported resolution is known and the bitmask for horizontal and
+	 * vertical bitfields can be computed.
+	 */
+	tegra->hmask = drm->mode_config.max_width - 1;
+	tegra->vmask = drm->mode_config.max_height - 1;
+
 	if (tegra->use_explicit_iommu) {
 		u64 carveout_start, carveout_end, gem_start, gem_end;
 		u64 dma_mask = dma_get_mask(&dev->dev);
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 1af57c2016eb..34fbcd6abf2f 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -54,6 +54,7 @@ struct tegra_drm {
 	struct tegra_fbdev *fbdev;
 #endif
 
+	unsigned int hmask, vmask;
 	unsigned int pitch_align;
 
 	struct tegra_display_hub *hub;
-- 
2.30.2

