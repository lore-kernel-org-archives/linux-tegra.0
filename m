Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A1AC433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 12 Jan 2022 08:48:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351750AbiALIsj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 12 Jan 2022 03:48:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351742AbiALIsi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 12 Jan 2022 03:48:38 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2497C06173F
        for <linux-tegra@vger.kernel.org>; Wed, 12 Jan 2022 00:48:37 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id k30so2802594wrd.9
        for <linux-tegra@vger.kernel.org>; Wed, 12 Jan 2022 00:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+9cr0iIxduuVifaGNKLD6DHk/cW9wmpOyTJQ6MC3wUE=;
        b=h2AC3N8IfeQNWJdrNnXa4SKwKBNms1gvA2qfj78RQzrsauLJczv7JAG7LuOW3pelQ+
         DGGMvA/yxgwNn5wtdLqxUtL4G2iH8Y6D9tY4nxmqAgJkrGpGDHxVhd1qnTAZN0cKtdpd
         KLGgjwh2l3NE0Dzvb7E1861drI7+YOMV7ves+Vlofn9+Q3AyTY1qZ16Xdz+/xePvMOYS
         RqATi4lrW+smB5uX4fDWDUVHA6k2mVnrtwO+9ad4sMO2BXFmz3ob6zb5JNEpBlX543+3
         7DAyCRbwzQ2/Cgv1uIyW1X935d1isa8ZOxaueJJJ3pTrYBbnrEBTknQFu2EBowW4Zb7j
         Titw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+9cr0iIxduuVifaGNKLD6DHk/cW9wmpOyTJQ6MC3wUE=;
        b=G6RHBrrP1SxRzHYsmX7KY03C4GRaobgkoGeNFMLrGFp7exaXDOkdd7GWVhi8VrR4pQ
         Imke/1xVjPC5PqUE76kkG5cjj6ZCzG5qVI8XGoA61Bz0G0KXunRpJlNi53NUzoown2WJ
         NNYnRuj3ngO4WEaffC1/Oi5QfKovxhWaY4aj9tOnqVFkJxKshXsq/neQ52sGjDREaOZq
         kBO2vlhjGcc5q2kY9+/JVh6TPY8iEzTcbOiZrdbDS6K3sEWO/YYoLg94cAZ9brvohBV0
         88SbJ2Rk7eVe/UhRzRrgOwYpbPKy54CXYDRV2sFuRdHUkfwErZjEkufQ+NwVzpB8yVcy
         oI5Q==
X-Gm-Message-State: AOAM533IFccC/5q/FR/2iaAUsgMCLCBJa/EAPzSQSk3itpWMUs0lxA1y
        98Nk5NNXFPnSGmbsLdszTylQF6mN5CMyRg==
X-Google-Smtp-Source: ABdhPJxScjVoOt7M9sTySUDtRwqy6iVqCn/CjV844UaDBxYxzJGHmP/W5Ra3K3REFrqdbouN8QkXuw==
X-Received: by 2002:a05:6000:18a5:: with SMTP id b5mr7121095wri.24.1641977316403;
        Wed, 12 Jan 2022 00:48:36 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id v13sm1787966wro.90.2022.01.12.00.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 00:48:35 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Maniraj D <md@nvidia.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] drm/tegra: Support semi-planar formats on Tegra114+
Date:   Wed, 12 Jan 2022 09:48:28 +0100
Message-Id: <20220112084828.230780-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112084828.230780-1-thierry.reding@gmail.com>
References: <20220112084828.230780-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The NV12, NV21, NV16, NV61, NV24 and NV42 formats are supported by
Tegra114 and later display hardware. Add the necessary programming to
allow them to be used.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c    | 30 ++++++++++++++++----
 drivers/gpu/drm/tegra/dc.h    |  6 ++++
 drivers/gpu/drm/tegra/hub.c   | 31 +++++++++++++++------
 drivers/gpu/drm/tegra/plane.c | 52 ++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/tegra/plane.h |  2 +-
 5 files changed, 98 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index eb70eee8992a..7bf3d2db5180 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -345,18 +345,19 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
 {
 	unsigned h_offset, v_offset, h_size, v_size, h_dda, v_dda, bpp;
 	struct tegra_dc *dc = plane->dc;
-	bool yuv, planar;
+	unsigned int planes;
 	u32 value;
+	bool yuv;
 
 	/*
 	 * For YUV planar modes, the number of bytes per pixel takes into
 	 * account only the luma component and therefore is 1.
 	 */
-	yuv = tegra_plane_format_is_yuv(window->format, &planar, NULL);
+	yuv = tegra_plane_format_is_yuv(window->format, &planes, NULL);
 	if (!yuv)
 		bpp = window->bits_per_pixel / 8;
 	else
-		bpp = planar ? 1 : 2;
+		bpp = (planes > 1) ? 1 : 2;
 
 	tegra_plane_writel(plane, window->format, DC_WIN_COLOR_DEPTH);
 	tegra_plane_writel(plane, window->swap, DC_WIN_BYTE_SWAP);
@@ -385,7 +386,7 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
 	 * For DDA computations the number of bytes per pixel for YUV planar
 	 * modes needs to take into account all Y, U and V components.
 	 */
-	if (yuv && planar)
+	if (yuv && planes > 1)
 		bpp = 2;
 
 	h_dda = compute_dda_inc(window->src.w, window->dst.w, false, bpp);
@@ -405,9 +406,12 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
 
 	tegra_plane_writel(plane, window->base[0], DC_WINBUF_START_ADDR);
 
-	if (yuv && planar) {
+	if (yuv && planes > 1) {
 		tegra_plane_writel(plane, window->base[1], DC_WINBUF_START_ADDR_U);
-		tegra_plane_writel(plane, window->base[2], DC_WINBUF_START_ADDR_V);
+
+		if (planes > 2)
+			tegra_plane_writel(plane, window->base[2], DC_WINBUF_START_ADDR_V);
+
 		value = window->stride[1] << 16 | window->stride[0];
 		tegra_plane_writel(plane, value, DC_WIN_LINE_STRIDE);
 	} else {
@@ -1193,6 +1197,13 @@ static const u32 tegra114_overlay_formats[] = {
 	DRM_FORMAT_YUYV,
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YUV422,
+	/* semi-planar formats */
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_NV24,
+	DRM_FORMAT_NV42,
 };
 
 static const u32 tegra124_overlay_formats[] = {
@@ -1223,6 +1234,13 @@ static const u32 tegra124_overlay_formats[] = {
 	DRM_FORMAT_YUYV,
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YUV422,
+	/* semi-planar formats */
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_NV24,
+	DRM_FORMAT_NV42,
 };
 
 static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 3f91a10ea6c7..67c4c5baa3cf 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -637,6 +637,12 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define WIN_COLOR_DEPTH_A8B8G8R8       36
 #define WIN_COLOR_DEPTH_B8G8R8X8       37
 #define WIN_COLOR_DEPTH_R8G8B8X8       38
+#define WIN_COLOR_DEPTH_YCrCb420SP     42
+#define WIN_COLOR_DEPTH_YCbCr420SP     43
+#define WIN_COLOR_DEPTH_YCrCb422SP     44
+#define WIN_COLOR_DEPTH_YCbCr422SP     45
+#define WIN_COLOR_DEPTH_YCrCb444SP     48
+#define WIN_COLOR_DEPTH_YCbCr444SP     49
 #define WIN_COLOR_DEPTH_X8B8G8R8       65
 #define WIN_COLOR_DEPTH_X8R8G8B8       66
 
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index fc9813e6b2c9..05f83b0c5c8c 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -47,6 +47,13 @@ static const u32 tegra_shared_plane_formats[] = {
 	DRM_FORMAT_YUYV,
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YUV422,
+	/* semi-planar formats */
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_NV24,
+	DRM_FORMAT_NV42,
 };
 
 static const u64 tegra_shared_plane_modifiers[] = {
@@ -540,8 +547,8 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	struct tegra_plane *p = to_tegra_plane(plane);
 	u32 value, min_width, bypass = 0;
 	dma_addr_t base, addr_flag = 0;
-	unsigned int bpc;
-	bool yuv, planar;
+	unsigned int bpc, planes;
+	bool yuv;
 	int err;
 
 	/* rien ne va plus */
@@ -559,7 +566,7 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 		return;
 	}
 
-	yuv = tegra_plane_format_is_yuv(tegra_plane_state->format, &planar, &bpc);
+	yuv = tegra_plane_format_is_yuv(tegra_plane_state->format, &planes, &bpc);
 
 	tegra_dc_assign_shared_plane(dc, p);
 
@@ -660,20 +667,26 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	value = PITCH(fb->pitches[0]);
 	tegra_plane_writel(p, value, DC_WIN_PLANAR_STORAGE);
 
-	if (yuv && planar) {
+	if (yuv && planes > 1) {
 		base = tegra_plane_state->iova[1] + fb->offsets[1];
 		base |= addr_flag;
 
 		tegra_plane_writel(p, upper_32_bits(base), DC_WINBUF_START_ADDR_HI_U);
 		tegra_plane_writel(p, lower_32_bits(base), DC_WINBUF_START_ADDR_U);
 
-		base = tegra_plane_state->iova[2] + fb->offsets[2];
-		base |= addr_flag;
+		if (planes > 2) {
+			base = tegra_plane_state->iova[2] + fb->offsets[2];
+			base |= addr_flag;
+
+			tegra_plane_writel(p, upper_32_bits(base), DC_WINBUF_START_ADDR_HI_V);
+			tegra_plane_writel(p, lower_32_bits(base), DC_WINBUF_START_ADDR_V);
+		}
+
+		value = PITCH_U(fb->pitches[1]);
 
-		tegra_plane_writel(p, upper_32_bits(base), DC_WINBUF_START_ADDR_HI_V);
-		tegra_plane_writel(p, lower_32_bits(base), DC_WINBUF_START_ADDR_V);
+		if (planes > 2)
+			value |= PITCH_V(fb->pitches[2]);
 
-		value = PITCH_U(fb->pitches[1]) | PITCH_V(fb->pitches[2]);
 		tegra_plane_writel(p, value, DC_WIN_PLANAR_STORAGE_UV);
 	} else {
 		tegra_plane_writel(p, 0, DC_WINBUF_START_ADDR_U);
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 321cb1f13da6..5136a37c0239 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -421,6 +421,30 @@ int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap)
 		*format = WIN_COLOR_DEPTH_YCbCr422P;
 		break;
 
+	case DRM_FORMAT_NV12:
+		*format = WIN_COLOR_DEPTH_YCbCr420SP;
+		break;
+
+	case DRM_FORMAT_NV21:
+		*format = WIN_COLOR_DEPTH_YCrCb420SP;
+		break;
+
+	case DRM_FORMAT_NV16:
+		*format = WIN_COLOR_DEPTH_YCbCr422SP;
+		break;
+
+	case DRM_FORMAT_NV61:
+		*format = WIN_COLOR_DEPTH_YCrCb422SP;
+		break;
+
+	case DRM_FORMAT_NV24:
+		*format = WIN_COLOR_DEPTH_YCbCr444SP;
+		break;
+
+	case DRM_FORMAT_NV42:
+		*format = WIN_COLOR_DEPTH_YCrCb444SP;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -441,13 +465,13 @@ bool tegra_plane_format_is_indexed(unsigned int format)
 	return false;
 }
 
-bool tegra_plane_format_is_yuv(unsigned int format, bool *planar, unsigned int *bpc)
+bool tegra_plane_format_is_yuv(unsigned int format, unsigned int *planes, unsigned int *bpc)
 {
 	switch (format) {
 	case WIN_COLOR_DEPTH_YCbCr422:
 	case WIN_COLOR_DEPTH_YUV422:
-		if (planar)
-			*planar = false;
+		if (planes)
+			*planes = 1;
 
 		if (bpc)
 			*bpc = 8;
@@ -462,8 +486,22 @@ bool tegra_plane_format_is_yuv(unsigned int format, bool *planar, unsigned int *
 	case WIN_COLOR_DEPTH_YUV422R:
 	case WIN_COLOR_DEPTH_YCbCr422RA:
 	case WIN_COLOR_DEPTH_YUV422RA:
-		if (planar)
-			*planar = true;
+		if (planes)
+			*planes = 3;
+
+		if (bpc)
+			*bpc = 8;
+
+		return true;
+
+	case WIN_COLOR_DEPTH_YCrCb420SP:
+	case WIN_COLOR_DEPTH_YCbCr420SP:
+	case WIN_COLOR_DEPTH_YCrCb422SP:
+	case WIN_COLOR_DEPTH_YCbCr422SP:
+	case WIN_COLOR_DEPTH_YCrCb444SP:
+	case WIN_COLOR_DEPTH_YCbCr444SP:
+		if (planes)
+			*planes = 2;
 
 		if (bpc)
 			*bpc = 8;
@@ -471,8 +509,8 @@ bool tegra_plane_format_is_yuv(unsigned int format, bool *planar, unsigned int *
 		return true;
 	}
 
-	if (planar)
-		*planar = false;
+	if (planes)
+		*planes = 1;
 
 	return false;
 }
diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plane.h
index dfb20712fbd7..e33a581e6490 100644
--- a/drivers/gpu/drm/tegra/plane.h
+++ b/drivers/gpu/drm/tegra/plane.h
@@ -90,7 +90,7 @@ int tegra_plane_state_add(struct tegra_plane *plane,
 
 int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap);
 bool tegra_plane_format_is_indexed(unsigned int format);
-bool tegra_plane_format_is_yuv(unsigned int format, bool *planar, unsigned int *bpc);
+bool tegra_plane_format_is_yuv(unsigned int format, unsigned int *planes, unsigned int *bpc);
 int tegra_plane_setup_legacy_state(struct tegra_plane *tegra,
 				   struct tegra_plane_state *state);
 int tegra_plane_interconnect_init(struct tegra_plane *plane);
-- 
2.34.1

