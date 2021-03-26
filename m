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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10CEC433E5
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97FD261A50
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhCZOwI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbhCZOv5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 10:51:57 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE5AC0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:57 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so3148533wmj.2
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LZ02MH/PBlmRcrHk4LTZiylAhcy1WpUUhenyrj4bfhw=;
        b=CRzKbfldaLJBajwOqigQ+B4RipWu4wIQDwNER/JPBazzp3SXuP4OOP/yZjbger43my
         aPDUyuBKbV8+id4RathqJ2uhCGAvZPd2xyWgSQkuj1wn0eCv5BDAdDUofO45Ck83/Sd3
         o6Io5npaM3qMB+S8Ml4c8M88+zVujxydTHGCZRO8TKnMV0SAz8Jbq7eCKKnwiSW+DpDw
         AUuKlXNG0bIJ3k4PLClVBU0Wr4l5Chm5huFEylVvfhPlnbRU+70vdGtI/vQxVNCoiBsC
         2xnewP9BobD/qdbfp9gqsmD9pUyJ3ESTonfqDLqFAc8XgR7iqpYUY2AXeTduTM+N9o0N
         2tKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LZ02MH/PBlmRcrHk4LTZiylAhcy1WpUUhenyrj4bfhw=;
        b=qkKBNu15AwJW+ObbVjQ3ty/AHlrAdElrOqqhK+eyDKSJBE8p81QvskGCB2vsVka3HK
         OU55ozvgpf0/+54LMyh8qo+0lgOThJwpFlUufvxcRWVOJVqJqRlXzibxxSNXYRR/DpiC
         7NTRrXLZbtqrZGZ0GgL+z1K+5lqlD99t5N5BE6ckeQtgDUrT7xYwcXdeLwm2Q+Zl2BdS
         6LOQMJo53KlpXjtVfECVe4oSobxgYWouvDLsIMcx8072nu7XbLjpS3FYGcwMtqP24nE8
         ATfkmf/YRsX/dpbBRIz1+s5ncmGKgpsXRMv1k6Xl4B4Gc7P5QGIfad+b7OWHSrueJNbv
         bfqg==
X-Gm-Message-State: AOAM531l49lTgncUPT2ZXW3R721++mLKPU6dj24/2BXJoUzwkZ537tiE
        xCwYTQSYe2MdnvHQMJLrQOc=
X-Google-Smtp-Source: ABdhPJw0Cwj4YtKhVrd//BrujalogPt2wlL8i+GkfmMQMSvPAKdcf6mc4D3GBTM9lplcJZMaIY79OA==
X-Received: by 2002:a1c:7d41:: with SMTP id y62mr13943870wmc.48.1616770315877;
        Fri, 26 Mar 2021 07:51:55 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v18sm13858177wrf.41.2021.03.26.07.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:51:53 -0700 (PDT)
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
Subject: [PATCH v2 10/10] drm/tegra: Support sector layout on Tegra194
Date:   Fri, 26 Mar 2021 15:51:39 +0100
Message-Id: <20210326145139.467072-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra194 has a special physical address bit that enables some memory
swizzling logic to support different sector layouts. Support the bit
that selects the sector layout which is passed in the framebuffer
modifier.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c    |  7 +++++++
 drivers/gpu/drm/tegra/dc.h    |  1 +
 drivers/gpu/drm/tegra/drm.h   |  3 +++
 drivers/gpu/drm/tegra/fb.c    |  9 +++++++++
 drivers/gpu/drm/tegra/gem.h   |  6 ++++++
 drivers/gpu/drm/tegra/hub.c   | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/plane.c | 24 ++++++++++++++++++++++++
 7 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 0c51f0bb17a9..2f6c02bf96e5 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2323,6 +2323,7 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
+	.supports_sector_layout = false,
 	.has_legacy_blending = true,
 	.pitch_align = 8,
 	.has_powergate = false,
@@ -2342,6 +2343,7 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
+	.supports_sector_layout = false,
 	.has_legacy_blending = true,
 	.pitch_align = 8,
 	.has_powergate = false,
@@ -2361,6 +2363,7 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
+	.supports_sector_layout = false,
 	.has_legacy_blending = true,
 	.pitch_align = 64,
 	.has_powergate = true,
@@ -2380,6 +2383,7 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
+	.supports_sector_layout = false,
 	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = true,
@@ -2399,6 +2403,7 @@ static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
+	.supports_sector_layout = false,
 	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = true,
@@ -2452,6 +2457,7 @@ static const struct tegra_dc_soc_info tegra186_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
+	.supports_sector_layout = false,
 	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = false,
@@ -2500,6 +2506,7 @@ static const struct tegra_dc_soc_info tegra194_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
+	.supports_sector_layout = true,
 	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = false,
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 21074cd2ce5e..29f19c3c6149 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -52,6 +52,7 @@ struct tegra_dc_soc_info {
 	bool supports_interlacing;
 	bool supports_cursor;
 	bool supports_block_linear;
+	bool supports_sector_layout;
 	bool has_legacy_blending;
 	unsigned int pitch_align;
 	bool has_powergate;
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 9a089b93da24..fe1a37e95bfa 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -24,6 +24,9 @@
 #include "hub.h"
 #include "trace.h"
 
+/* XXX move to include/uapi/drm/drm_fourcc.h? */
+#define DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT BIT(22)
+
 struct reset_control;
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 350f33206076..c04dda8353fd 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -44,6 +44,15 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 {
 	uint64_t modifier = framebuffer->modifier;
 
+	if (fourcc_mod_is_vendor(modifier, NVIDIA)) {
+		if ((modifier & DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT) == 0)
+			tiling->sector_layout = TEGRA_BO_SECTOR_LAYOUT_TEGRA;
+		else
+			tiling->sector_layout = TEGRA_BO_SECTOR_LAYOUT_GPU;
+
+		modifier &= ~DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT;
+	}
+
 	switch (modifier) {
 	case DRM_FORMAT_MOD_LINEAR:
 		tiling->mode = TEGRA_BO_TILING_MODE_PITCH;
diff --git a/drivers/gpu/drm/tegra/gem.h b/drivers/gpu/drm/tegra/gem.h
index fafb5724499b..c15fd99d6cb2 100644
--- a/drivers/gpu/drm/tegra/gem.h
+++ b/drivers/gpu/drm/tegra/gem.h
@@ -21,9 +21,15 @@ enum tegra_bo_tiling_mode {
 	TEGRA_BO_TILING_MODE_BLOCK,
 };
 
+enum tegra_bo_sector_layout {
+	TEGRA_BO_SECTOR_LAYOUT_TEGRA,
+	TEGRA_BO_SECTOR_LAYOUT_GPU,
+};
+
 struct tegra_bo_tiling {
 	enum tegra_bo_tiling_mode mode;
 	unsigned long value;
+	enum tegra_bo_sector_layout sector_layout;
 };
 
 struct tegra_bo {
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 500c9d37e654..79bff8b48271 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -55,6 +55,18 @@ static const u64 tegra_shared_plane_modifiers[] = {
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5),
+	/*
+	 * The GPU sector layout is only supported on Tegra194, but these will
+	 * be filtered out later on by ->format_mod_supported() on SoCs where
+	 * it isn't supported.
+	 */
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	/* sentinel */
 	DRM_FORMAT_MOD_INVALID
 };
 
@@ -366,6 +378,12 @@ static int tegra_shared_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if (tiling->sector_layout == TEGRA_BO_SECTOR_LAYOUT_GPU &&
+	    !dc->soc->supports_sector_layout) {
+		DRM_ERROR("hardware doesn't support GPU sector layout\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Tegra doesn't support different strides for U and V planes so we
 	 * error out if the user tries to display a framebuffer with such a
@@ -485,6 +503,16 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 
 	base = tegra_plane_state->iova[0] + fb->offsets[0];
 
+#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
+	/*
+	 * Physical address bit 39 in Tegra194 is used as a switch for special
+	 * logic that swizzles the memory using either the legacy Tegra or the
+	 * dGPU sector layout.
+	 */
+	if (tegra_plane_state->tiling.sector_layout == TEGRA_BO_SECTOR_LAYOUT_GPU)
+		base |= BIT(39);
+#endif
+
 	tegra_plane_writel(p, tegra_plane_state->format, DC_WIN_COLOR_DEPTH);
 	tegra_plane_writel(p, 0, DC_WIN_PRECOMP_WGRP_PARAMS);
 
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 793da5d675d2..1e0eae8b4342 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -83,6 +83,22 @@ static void tegra_plane_atomic_destroy_state(struct drm_plane *plane,
 	kfree(state);
 }
 
+static bool tegra_plane_supports_sector_layout(struct drm_plane *plane)
+{
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, plane->dev) {
+		if (plane->possible_crtcs & drm_crtc_mask(crtc)) {
+			struct tegra_dc *dc = to_tegra_dc(crtc);
+
+			if (!dc->soc->supports_sector_layout)
+				return false;
+		}
+	}
+
+	return true;
+}
+
 static bool tegra_plane_format_mod_supported(struct drm_plane *plane,
 					     uint32_t format,
 					     uint64_t modifier)
@@ -92,6 +108,14 @@ static bool tegra_plane_format_mod_supported(struct drm_plane *plane,
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;
 
+	/* check for the sector layout bit */
+	if (fourcc_mod_is_vendor(modifier, NVIDIA)) {
+		if (modifier & DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT) {
+			if (!tegra_plane_supports_sector_layout(plane))
+				return false;
+		}
+	}
+
 	if (info->num_planes == 1)
 		return true;
 
-- 
2.30.2

