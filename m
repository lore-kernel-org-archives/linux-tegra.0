Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AF6C38A23
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 17:31:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjATRb0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 12:31:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbjATRbW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 12:31:22 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD6AD05EB;
        Fri, 20 Jan 2023 09:31:14 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso1505168wmb.0;
        Fri, 20 Jan 2023 09:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78W7IXXHqgUZh6eEXtc3i7yBwKfecEIjh9aXPYe7GEA=;
        b=SEm/NiYw03IrJVONYxj8S6CudMwJbwnQfEfMv8WLW+xrm/hl+XwebXhF8UgZukrwEQ
         jEv1Rtvs+sMjog6lwpKrVMWAdjWu010pPjDx+WW4QkKGsTndKABZNJiJ+rvtclb6RMVN
         M1Sd0fFcCG00kXHifJF8Msn4iIDPEsq7nastKIeqsyv0hPcKNsJUj6I8Pc0PtlL9kLSV
         H0r0Ruqec02yVK5SNpbCM0LfHjQmulKCvAOHPRZrK5qjSfYMW3ZONTLefeEtpIivMyLe
         fmo36tXCle53zltWf++reGaIShW4IzLLaZjB0x77h/FLc4I1R7UI2hjG4VwdOEfRQ32u
         vAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78W7IXXHqgUZh6eEXtc3i7yBwKfecEIjh9aXPYe7GEA=;
        b=pr/awh8mBMz8IdygW/mkNWkgFzMMFzcYlbx1sfqEN2lYj/w3bXkMPq78uK7Qj19kBc
         QMTvOGj0p/lFsC5G9xvHwORgIztEhtOuQvS6i8Qb4DgGODhSzli1flriXGc/yDcEm4MZ
         5b8J36YUCubjQA8iAw5VMtl3iq4oM3zUDjksYBKLWYTNI6R3uwLO2ozBwvnkCZh5zkec
         CiBpgpK1jGBsCYr+P8foE0KN2bRlxoSb7xn8GIxxR9fWJKgFA0xAME4tlVb5/aHQcQ5l
         66PxnMk8Rx/ZPsr29mFrSzeZumqkoUPquDCtu7i9GT07pOUCpw/yxRlYC7xui1/Hz7RR
         aSzQ==
X-Gm-Message-State: AFqh2kq8ZDSmJvoJpUMBkJUYr207p6mBld7+7pQNWtsZIiLNk6l7cwlT
        K1OZsrjcx8p/ti/TZbeSpvjJWYzXdxs=
X-Google-Smtp-Source: AMrXdXvzEgbI7Tp8Tw5Ds4T0d245b1GQLC4LVo8SfXduEZQri0QCyUWQpHLjGRzU3haJg1/JO1ieQA==
X-Received: by 2002:a7b:cc14:0:b0:3da:50b0:e96a with SMTP id f20-20020a7bcc14000000b003da50b0e96amr15053406wmh.29.1674235872923;
        Fri, 20 Jan 2023 09:31:12 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c310a00b003d99da8d30asm3193070wmo.46.2023.01.20.09.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:31:12 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 6/8] drm/format-helper: Support the AB24/XB24 formats
Date:   Fri, 20 Jan 2023 18:31:01 +0100
Message-Id: <20230120173103.4002342-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120173103.4002342-1-thierry.reding@gmail.com>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add a conversion helper for the AB24 and XB24 formats to use in
drm_fb_blit().

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v4:
- rebased on top of latest drm-format-helper rework, add back AB24 support
- add Reviewed-by from Thomas

Changes in v3:
- rebase onto latest drm-next

Changes in v2:
- support XB24 format instead of AB24

 drivers/gpu/drm/drm_format_helper.c | 66 +++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 994f8fb71f45..f93a4efcee90 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -649,6 +649,66 @@ void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb8888);
 
+static void drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	__le32 *dbuf32 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	unsigned int x;
+	u32 pix;
+
+	for (x = 0; x < pixels; x++) {
+		pix = le32_to_cpu(sbuf32[x]);
+		pix = ((pix & 0x00ff0000) >> 16) <<  0 |
+		      ((pix & 0x0000ff00) >>  8) <<  8 |
+		      ((pix & 0x000000ff) >>  0) << 16 |
+		      GENMASK(31, 24); /* fill alpha bits */
+		*dbuf32++ = cpu_to_le32(pix);
+	}
+}
+
+static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
+					const struct iosys_map *src,
+					const struct drm_framebuffer *fb,
+					const struct drm_rect *clip)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		4,
+	};
+
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+		    drm_fb_xrgb8888_to_abgr8888_line);
+}
+
+static void drm_fb_xrgb8888_to_xbgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	__le32 *dbuf32 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	unsigned int x;
+	u32 pix;
+
+	for (x = 0; x < pixels; x++) {
+		pix = le32_to_cpu(sbuf32[x]);
+		pix = ((pix & 0x00ff0000) >> 16) <<  0 |
+		      ((pix & 0x0000ff00) >>  8) <<  8 |
+		      ((pix & 0x000000ff) >>  0) << 16 |
+		      ((pix & 0xff000000) >> 24) << 24;
+		*dbuf32++ = cpu_to_le32(pix);
+	}
+}
+
+static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
+					const struct iosys_map *src,
+					const struct drm_framebuffer *fb,
+					const struct drm_rect *clip)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		4,
+	};
+
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+		    drm_fb_xrgb8888_to_xbgr8888_line);
+}
+
 static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	__le32 *dbuf32 = dbuf;
@@ -868,6 +928,12 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		} else if (dst_format == DRM_FORMAT_ARGB8888) {
 			drm_fb_xrgb8888_to_argb8888(dst, dst_pitch, src, fb, clip);
 			return 0;
+		} else if (dst_format == DRM_FORMAT_XBGR8888) {
+			drm_fb_xrgb8888_to_xbgr8888(dst, dst_pitch, src, fb, clip);
+			return 0;
+		} else if (dst_format == DRM_FORMAT_ABGR8888) {
+			drm_fb_xrgb8888_to_abgr8888(dst, dst_pitch, src, fb, clip);
+			return 0;
 		} else if (dst_format == DRM_FORMAT_XRGB2101010) {
 			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
 			return 0;
-- 
2.39.0

