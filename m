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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781EFC433E3
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5101A61A10
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhCZOwF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbhCZOvm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 10:51:42 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184FBC0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:42 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id j18so5933155wra.2
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=86mE7L3OeERw9q4a0HFa9vbgdHUpWpTBoGr2sA+m7Ag=;
        b=OSraSRCgvaylHUtPrpjlqdVqCdVzRensc69voFUJyMwXZixy3hDM40GmMmxDFWVusL
         9wgRIKVOKwXj6uqHm0NJb6bPcOWEHjJcGrG3fOL/5GrzL8ZSXFPcvAzcX7hZAi9+tN9Z
         4hEoRgltBqbMjd/+pj7McfKnyYL2Oyd1CuqIhA08BlHsuSjA2fLkY2N7nDbe8cadT0Ey
         9LF0MRI2cvB9pAbXzn7gOzX3yAylmDN1awmJ2pfOLSKqZGRxUZ8T+05GzNg+//Dnb5Ub
         Gw8G9Gc2PyhYbwoP+gHOgael4TuxR0gsIb+0WgbDieKTFJZxjQFQffhcC01GMaoBsaXH
         c/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=86mE7L3OeERw9q4a0HFa9vbgdHUpWpTBoGr2sA+m7Ag=;
        b=HoEsG7hdkLUebCEa5/oOth2eIES16vNpnY1nBjlYDRuCdskVpTJAGqAQkE9X1Ty2aM
         sA5tItSGsIE5jI8apeZ7cM/rfrdxKb7o25E2xic9twwZapMk9xB+cvoD/ZP/YzjlqTcS
         ZYeSzyCNONjr/mF1cSAYjEoNwFGRA1ntV7uBP1cH4HReMCdYckwhzCBzEMBf2i0BTx5v
         +0SiiG4COrDabDBGuhp81I5n9jwaKF5jKEX/lobX2hfYgDtKhgqWEHfqaNmiKQRmfg1s
         tWiiO77C4oIMHuNYy2h265pBD7P0ptInx5o1x2mE1BXQPybZJgCbtRxSXl+ckL/tGbLJ
         wGfw==
X-Gm-Message-State: AOAM533E6VPpFhpHOPQNt4pPK24zpktcS2J/GVhfY/N/NKa7887MlK4y
        NZwz+5lWv916QqilIwGbje1jmiLTTY0=
X-Google-Smtp-Source: ABdhPJznbL5S+cHlJcDfQNHk54DN3OVxZmXoJBMQqhsek+DSjDRmO9zGSDHyNnTN9ngNARmpg19eCg==
X-Received: by 2002:a5d:58e8:: with SMTP id f8mr15152313wrd.102.1616770300822;
        Fri, 26 Mar 2021 07:51:40 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 64sm10806689wmz.7.2021.03.26.07.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:51:39 -0700 (PDT)
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
Subject: [PATCH v2 05/10] drm/tegra: dc: Implement hardware cursor on Tegra186 and later
Date:   Fri, 26 Mar 2021 15:51:34 +0100
Message-Id: <20210326145139.467072-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The hardware cursor on Tegra186 differs slightly from the implementation
on older SoC generations. In particular the new implementation relies on
software for clipping the cursor against the screen. Fortunately, atomic
KMS already computes clipped coordinates for (cursor) planes, so this is
trivial to implement.

The format supported by the hardware cursor is also slightly different.

v2: use more drm_rect helpers (Dmitry)

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c | 59 ++++++++++++++++++++++++++++++++------
 drivers/gpu/drm/tegra/dc.h |  5 ++++
 2 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 0541d7b5c841..7758d64822ae 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -832,10 +832,14 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
 	return &plane->base;
 }
 
-static const u32 tegra_cursor_plane_formats[] = {
+static const u32 tegra_legacy_cursor_plane_formats[] = {
 	DRM_FORMAT_RGBA8888,
 };
 
+static const u32 tegra_cursor_plane_formats[] = {
+	DRM_FORMAT_ARGB8888,
+};
+
 static int tegra_cursor_atomic_check(struct drm_plane *plane,
 				     struct drm_atomic_state *state)
 {
@@ -875,12 +879,22 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 									   plane);
 	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
 	struct tegra_dc *dc = to_tegra_dc(new_state->crtc);
-	u32 value = CURSOR_CLIP_DISPLAY;
+	struct tegra_drm *tegra = plane->dev->dev_private;
+	u64 dma_mask = *dc->dev->dma_mask;
+	unsigned int x, y;
+	u32 value = 0;
 
 	/* rien ne va plus */
 	if (!new_state->crtc || !new_state->fb)
 		return;
 
+	/*
+	 * Legacy display supports hardware clipping of the cursor, but
+	 * nvdisplay relies on software to clip the cursor to the screen.
+	 */
+	if (!dc->soc->has_nvdisplay)
+		value |= CURSOR_CLIP_DISPLAY;
+
 	switch (new_state->crtc_w) {
 	case 32:
 		value |= CURSOR_SIZE_32x32;
@@ -908,7 +922,7 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_START_ADDR);
 
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-	value = (tegra_plane_state->iova[0] >> 32) & 0x3;
+	value = (tegra_plane_state->iova[0] >> 32) & (dma_mask >> 32);
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_START_ADDR_HI);
 #endif
 
@@ -920,15 +934,39 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 	value = tegra_dc_readl(dc, DC_DISP_BLEND_CURSOR_CONTROL);
 	value &= ~CURSOR_DST_BLEND_MASK;
 	value &= ~CURSOR_SRC_BLEND_MASK;
-	value |= CURSOR_MODE_NORMAL;
+
+	if (dc->soc->has_nvdisplay)
+		value &= ~CURSOR_COMPOSITION_MODE_XOR;
+	else
+		value |= CURSOR_MODE_NORMAL;
+
 	value |= CURSOR_DST_BLEND_NEG_K1_TIMES_SRC;
 	value |= CURSOR_SRC_BLEND_K1_TIMES_SRC;
 	value |= CURSOR_ALPHA;
 	tegra_dc_writel(dc, value, DC_DISP_BLEND_CURSOR_CONTROL);
 
+	/* nvdisplay relies on software for clipping */
+	if (dc->soc->has_nvdisplay) {
+		struct drm_rect src;
+
+		x = new_state->dst.x1;
+		y = new_state->dst.y1;
+
+		drm_rect_fp_to_int(&src, &new_state->src);
+
+		value = (src.y1 & tegra->vmask) << 16 | (src.x1 & tegra->hmask);
+		tegra_dc_writel(dc, value, DC_DISP_PCALC_HEAD_SET_CROPPED_POINT_IN_CURSOR);
+
+		value = (drm_rect_height(&src) & tegra->vmask) << 16 |
+			(drm_rect_width(&src) & tegra->hmask);
+		tegra_dc_writel(dc, value, DC_DISP_PCALC_HEAD_SET_CROPPED_SIZE_IN_CURSOR);
+	} else {
+		x = new_state->crtc_x;
+		y = new_state->crtc_y;
+	}
+
 	/* position the cursor */
-	value = (new_state->crtc_y & 0x3fff) << 16 |
-		(new_state->crtc_x & 0x3fff);
+	value = ((y & tegra->vmask) << 16) | (x & tegra->hmask);
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_POSITION);
 }
 
@@ -982,8 +1020,13 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
 	plane->index = 6;
 	plane->dc = dc;
 
-	num_formats = ARRAY_SIZE(tegra_cursor_plane_formats);
-	formats = tegra_cursor_plane_formats;
+	if (!dc->soc->has_nvdisplay) {
+		num_formats = ARRAY_SIZE(tegra_legacy_cursor_plane_formats);
+		formats = tegra_legacy_cursor_plane_formats;
+	} else {
+		num_formats = ARRAY_SIZE(tegra_cursor_plane_formats);
+		formats = tegra_cursor_plane_formats;
+	}
 
 	err = drm_universal_plane_init(drm, &plane->base, possible_crtcs,
 				       &tegra_plane_funcs, formats,
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 051d03dcb9b0..21074cd2ce5e 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -511,6 +511,8 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 
 #define DC_DISP_CURSOR_START_ADDR_HI		0x4ec
 #define DC_DISP_BLEND_CURSOR_CONTROL		0x4f1
+#define CURSOR_COMPOSITION_MODE_BLEND		(0 << 25)
+#define CURSOR_COMPOSITION_MODE_XOR		(1 << 25)
 #define CURSOR_MODE_LEGACY			(0 << 24)
 #define CURSOR_MODE_NORMAL			(1 << 24)
 #define CURSOR_DST_BLEND_ZERO			(0 << 16)
@@ -705,6 +707,9 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define PROTOCOL_MASK (0xf << 8)
 #define PROTOCOL_SINGLE_TMDS_A (0x1 << 8)
 
+#define DC_DISP_PCALC_HEAD_SET_CROPPED_POINT_IN_CURSOR	0x442
+#define DC_DISP_PCALC_HEAD_SET_CROPPED_SIZE_IN_CURSOR	0x446
+
 #define DC_WIN_CORE_WINDOWGROUP_SET_CONTROL	0x702
 #define OWNER_MASK (0xf << 0)
 #define OWNER(x) (((x) & 0xf) << 0)
-- 
2.30.2

