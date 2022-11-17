Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD1DC4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 18:40:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240594AbiKQSk6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 13:40:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235064AbiKQSk5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 13:40:57 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D57B86A44;
        Thu, 17 Nov 2022 10:40:56 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id v17so3845393edc.8;
        Thu, 17 Nov 2022 10:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GRAXf35/9spkghPeO95WIhuP6nXSVmFKXeRYmNMois=;
        b=VfM3fZj30J8Y3lxGELBmZekOwuOm+C85b2/WhmB+VL/comM5ERPj0Ss1oErFBEvW0m
         dmqF4IwE8Dh8o82/6yGHriLAVJN9ypue+ym9GLR9d0wyhNiuMDB0mZuXUNmWOndArJLM
         Z0e/j6uFBeXJNWuuOymbqFt5GGu7vWKsp95LrNwR7lxsHZy6nq9N/duc8kk6nfdgHdtJ
         mAo5hvE9gw3y7JHysNZEcgaM32/DfAfow8PpvVPSLeVN9YdjbSTnm9s5YsI4s10hX67S
         oTJn8WebkCb448knh7LId7+hM19J0yIvHLTY5GsEa1zjE9GZK4UhhfjW+hJKcInE63hA
         Oy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GRAXf35/9spkghPeO95WIhuP6nXSVmFKXeRYmNMois=;
        b=sBmIyA3Kve/BVFCWDkBMGoS4dRvguP02rGx2pBMnlD/c+uGZWvvcpydxOlpEg4/Ngj
         E2WhJHYciZeSWfhUPHivSauTQy/GrKAGP40SH0GPHOgdOic2XQLV7LDQV61KviC6ZlNN
         gyKzJXwRk2DHhTIYoCfj4Bs32egTG6gKi9APuduBsRKGIQX6EjPExNlYlxoK3wodHGZm
         E9bdXeuV+JxjYiPGBEke1rZHW3KPXTANii+Me6534uMZJA1N73wK62ceSagyK5nEZ0dF
         iAxci5vpK8Rx3prx1ifrgQk5fuhD6X8CUcCSv+TT9UkxQyJBX3cgWhLkVM/RFOT96lvq
         WWlw==
X-Gm-Message-State: ANoB5plCTbq2nkT/z5bzm5IC2osWxffgJHgows7DOIXR0RPjqJaZ3Y7L
        BtJpxO2WO2iD1GJnGaHJmLs=
X-Google-Smtp-Source: AA0mqf6F4ZxtEVFJDiBDlqw0CRtxE45eikuyc0FSJF9QizBo31wexjxks18m46tF2gcdPlzxpFnOgQ==
X-Received: by 2002:aa7:d803:0:b0:467:f948:6df4 with SMTP id v3-20020aa7d803000000b00467f9486df4mr3213754edq.217.1668710454692;
        Thu, 17 Nov 2022 10:40:54 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906308a00b00782fbb7f5f7sm690526ejv.113.2022.11.17.10.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:40:53 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 6/8] drm/format-helper: Support the XB24 format
Date:   Thu, 17 Nov 2022 19:40:37 +0100
Message-Id: <20221117184039.2291937-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117184039.2291937-1-thierry.reding@gmail.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add a conversion helper for the XB24 format to use in drm_fb_blit().

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- rebase onto latest drm-next

Changes in v2:
- support XB24 format instead of AB24

 drivers/gpu/drm/drm_format_helper.c | 39 +++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 74ff33c2ddaa..c8764cc61e87 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -503,6 +503,36 @@ static void drm_fb_rgb888_to_xrgb8888(struct iosys_map *dst, const unsigned int
 		    drm_fb_rgb888_to_xrgb8888_line);
 }
 
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
+		      0xff << 24;
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
@@ -646,6 +676,8 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		fb_format = DRM_FORMAT_XRGB8888;
 	if (dst_format == DRM_FORMAT_ARGB8888)
 		dst_format = DRM_FORMAT_XRGB8888;
+	if (dst_format == DRM_FORMAT_ABGR8888)
+		dst_format = DRM_FORMAT_XBGR8888;
 	if (fb_format == DRM_FORMAT_ARGB2101010)
 		fb_format = DRM_FORMAT_XRGB2101010;
 	if (dst_format == DRM_FORMAT_ARGB2101010)
@@ -678,6 +710,11 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 			drm_fb_rgb565_to_xrgb8888(dst, dst_pitch, src, fb, clip);
 			return 0;
 		}
+	} else if (dst_format == DRM_FORMAT_XBGR8888) {
+		if (fb_format == DRM_FORMAT_XRGB8888) {
+			drm_fb_xrgb8888_to_xbgr8888(dst, dst_pitch, src, fb, clip);
+			return 0;
+		}
 	} else if (dst_format == DRM_FORMAT_XRGB2101010) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
 			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
@@ -820,6 +857,8 @@ static bool is_listed_fourcc(const uint32_t *fourccs, size_t nfourccs, uint32_t
 static const uint32_t conv_from_xrgb8888[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_XRGB2101010,
 	DRM_FORMAT_ARGB2101010,
 	DRM_FORMAT_RGB565,
-- 
2.38.1

