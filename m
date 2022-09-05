Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E74ECAAD3
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Sep 2022 16:33:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235786AbiIEQdX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Sep 2022 12:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235938AbiIEQdU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Sep 2022 12:33:20 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7F85789D;
        Mon,  5 Sep 2022 09:33:14 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id gb36so18057772ejc.10;
        Mon, 05 Sep 2022 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=uXTNuaFFOdggI8omSyQsRBaLji6UVsxiw3E8D64RifU=;
        b=SU4g2xDsRRT5Lge5vVMmNdkIdi4Wx4rY2Jb7B1+kjyC4IpWuOpuOCa7gRbYVenGOqc
         ++w7MZB8ca0gPiv0BO9nKcBCNcIiFskMgKUW0ebaktr8VtrAXbZRIOYdJ250PFxLH9pP
         60JLW5enypDB+cXUWpI0rU9y5l8fM7o3T1ruXz2M7jrNImzmZSBait5oF7eL8O+zpHE0
         0y0hpo70sVIv8NuDYDm3HN2+0ZPL/SYdfFQeJkk7t8LpWOBST1G32pX4RE4qDucpPE3K
         oBd59M245Od28432MMfhQjZlO4IAugqgUT5o3Uk7y8kQWztfPoU/a2A2jYcru52fOqjd
         8wgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uXTNuaFFOdggI8omSyQsRBaLji6UVsxiw3E8D64RifU=;
        b=mwWAdOSQaCFW6LxgQ6mXwqvmWBP7AFSfhQQW/yObEl+d/mHUrO9BsKHZvtX0q0U+I8
         Js258wGpx4ocHZ/9cmV27Hli6mAKBoe6m2+wpJ7xBGBhoa2KAOBu7Zes4mSg0n/PEznK
         5W0h70ycUfbTI3a/YC3N8qO67150qAz3x7wy+A5q8OTFnaHPYpJhKBEcnrovgHXGD5Iy
         wgsTJ51h90z3wTR6wBUxiMHRnWKkmm09fHG46RlFZ4xHyW85ptxnD80jcSKRxrVcN3wk
         5cKWPMT6DgHWV3mWVCtHYod6fb+Q7Xystu4vzJgWaaJ3hSHOqRnFEclSaFYkCfKDaqux
         d/XQ==
X-Gm-Message-State: ACgBeo0gBCvjPP5vN9YGH9y85Pefgc+GfAixzeBB3VFzNc4z38Wzp1I/
        iBQP0OahPW5fKTBSaiBG6/U=
X-Google-Smtp-Source: AA6agR6uI3+HR0n8gdjr49biODWamP0NUzQ2iqhGF7LaoQmgLEoRg/Ki4VZBma74UqlsYDxX034kPg==
X-Received: by 2002:a17:906:7315:b0:741:5b1b:920d with SMTP id di21-20020a170906731500b007415b1b920dmr28665181ejc.484.1662395593082;
        Mon, 05 Sep 2022 09:33:13 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d2-20020a056402400200b0043a61f6c389sm6752395eda.4.2022.09.05.09.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 09:33:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 4/6] drm/format-helper: Support the AB24 format
Date:   Mon,  5 Sep 2022 18:32:58 +0200
Message-Id: <20220905163300.391692-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905163300.391692-1-thierry.reding@gmail.com>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add a conversion helper for the AB24 format to use in drm_fb_blit().

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/drm_format_helper.c | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 56642816fdff..d564412a816b 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -503,6 +503,36 @@ static void drm_fb_rgb888_to_xrgb8888(struct iosys_map *dst, const unsigned int
 		    drm_fb_rgb888_to_xrgb8888_line);
 }
 
+static void drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	__le32 *dbuf32 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	unsigned int x;
+	u32 pix;
+
+	for (x = 0; x < pixels; x++) {
+		pix = le32_to_cpu(sbuf32[x]);
+		pix = ((pix & 0xff000000) >> 24) << 24 |
+		      ((pix & 0x00ff0000) >> 16) <<  0 |
+		      ((pix & 0x0000ff00) >>  8) <<  8 |
+		      ((pix & 0x000000ff) >>  0) << 16;
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
 static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	__le32 *dbuf32 = dbuf;
@@ -672,6 +702,11 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 			drm_fb_rgb565_to_xrgb8888(dst, dst_pitch, src, fb, clip);
 			return 0;
 		}
+	} else if (dst_format == DRM_FORMAT_ABGR8888) {
+		if (fb_format == DRM_FORMAT_XRGB8888) {
+			drm_fb_xrgb8888_to_abgr8888(dst, dst_pitch, src, fb, clip);
+			return 0;
+		}
 	} else if (dst_format == DRM_FORMAT_XRGB2101010) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
 			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
-- 
2.37.2

