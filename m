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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C79C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 071C261A10
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhCZOwF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbhCZOvj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 10:51:39 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 544F6C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:39 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id g20so3124997wmk.3
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qvvKebFi6ANZJRVhz63aix9PqvdlCopB57+FLZgaRmQ=;
        b=ioyO77vdPbBwIAGXEoneFnDs3te1YMC09DrUxw7JXz6JEnPHevslOe0F4KXrXge3cr
         4+AyBA5IFsEMkONIdZ03KGhUnbgxYRDAN8As3DPUvSV4rfitfb6jJwiiazsPKihhtzU6
         5/qMipZZVDWB9VDdE0B7t3PKL/J7fV/4Xql1s+/E7ZkmOCpvQ7YaQLWM0dv2UZM0yg43
         iXUfShS5LDOjPkHOrS8JOD1WgzZ0IFSHTgLNgKBMVBXG60Egy1LXdO4tBY1K5fdSSZR7
         2DNRnGdYxZwfHfHZhagcWDYcYDpc3HsIFCqvwy0xoiakS55tPMx2RAJRvPPVYfEgh3J/
         F5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qvvKebFi6ANZJRVhz63aix9PqvdlCopB57+FLZgaRmQ=;
        b=YtsLez7gyM/qm2Cgs3TbZ7SwEV92jPqKhiiqb8mQxiC7afzA6+pzC2iuGueGAfSxt/
         LYGL0zyqhl8wr/1RzsFR9KDiTgTC1XXVL3sRXhneK6Aavy2YP0D4Gd3vMZj/Z34ZF0wo
         sgi1g6R4dW1bjX6MZkQjpnQ6IGBpuHQchj99+r9ARnYozTzBccVdpJefAa6kdSG5UiYD
         5fP+9yjFFCYo+1YVkChthuD7skIRnC8co++zhgVBClQ+lFnHsTy/5zwQgHDNxroCAtfY
         Xa+GI6Y3SJgRd4JbNMKoiBTq+vmc0xpm7zjynlJ/RCq7Wt2v6oSbXcEQUit697Vcx25j
         KFFA==
X-Gm-Message-State: AOAM532qpUqqAdaMwj/M/uwnjTKwBIuqkZnPJ7XArAPBu+cYUy1lf7CG
        bL0dZsimOxtEufEFyJd9jf4=
X-Google-Smtp-Source: ABdhPJxVMnW3n5wLI2IGz2koUVdaJcq9DLQu8PsG7a8tOW5BbglpyPRd22ABNJDrjsM43WPJD4RtRQ==
X-Received: by 2002:a7b:c242:: with SMTP id b2mr13938512wmj.119.1616770298117;
        Fri, 26 Mar 2021 07:51:38 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j136sm12156895wmj.35.2021.03.26.07.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:51:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        James Jones <jajones@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 04/10] drm/tegra: dc: Parameterize maximum resolution
Date:   Fri, 26 Mar 2021 15:51:33 +0100
Message-Id: <20210326145139.467072-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
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
index 935717e7410d..0541d7b5c841 100644
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

