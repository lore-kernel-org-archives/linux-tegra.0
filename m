Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDEBC433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 18:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240554AbiKQSky (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 13:40:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235064AbiKQSkx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 13:40:53 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E6F7DEFF;
        Thu, 17 Nov 2022 10:40:52 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id f27so7379996eje.1;
        Thu, 17 Nov 2022 10:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUtZmWalnQKWM5ERQ4dIqTHxh9HaSKYh4Nk5lsYsOGo=;
        b=E90mIeGWkAHZT8kjF/dtZAkCNw1ExinoGrCn05GM8RvygqrPUsmI5MEkEHBqezbhGM
         TAw/4Tz0ucODj2MstSnfQfAsOYGcLWojIFb0rNvH5FTjqYFx5Y8nyJGgPWkDxmNP88fP
         xRZ2nofJ27QVOuaPgx2Z2WJuyHd3G1F9zeWGJB+AOyrC3RuV1d0wHgOKe46rbqP+dsGT
         DCTGF1z23v3J6bX2nbl8JL6r9pRANpgQSQngl4CPPNvdX7/sH26H1Vq/BhWNqzbL6I/s
         PMkVidGPc7LAkl7at8N9CktkJ/8IBbGK8d33ySrvC96vTBYWDqe/OYaeO5LZrzHh4GYd
         IpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUtZmWalnQKWM5ERQ4dIqTHxh9HaSKYh4Nk5lsYsOGo=;
        b=xKx/ebX1PS27JfUmgcIz3S+CxI14gmOZNmXX0RTg8Kx4F3G2kM2mzj6DsSLJh+zAXp
         L9NE08emW7Y58HwpX4i5KqYgU0R6KmdiAgtd/vw0N84UFJkX97oQncUQ5eI6VPEhKCWi
         17iUik04FDwn6br4aLcLru51PYbqCmy5Ggw7lHTCFTx6Z3/JtJZttObepnzVHeZEQ+/z
         sIMM6a7i1duCikjDR8hYwTi+qjrBtTuLcWFM7cBZQ+piejR6izCXIWJmrZMn7hk/+kTB
         Sq4u+UYbAhOq+k40nD0O2FA5met2qRvoLzJeCjvFIoeHc9ny64R1Z1j8Aq2rtFoquPL3
         e4Ig==
X-Gm-Message-State: ANoB5pn7X9UDvO2mFKXu09ioiLS3MVhsZKD7UaRALGG1fjGI+gCcMXDo
        Vtks+8DPucpMUauhsQDGt9qzVopnqc0=
X-Google-Smtp-Source: AA0mqf5xwnlYcLA9SvYwuazA2YElRV37/cwpxPvOcWKJv7jhRNjkIHWvKvvQSEXIBAIBFpyaAn1mOQ==
X-Received: by 2002:a17:906:a2d8:b0:7ad:fa6c:5e69 with SMTP id by24-20020a170906a2d800b007adfa6c5e69mr3179354ejb.199.1668710451323;
        Thu, 17 Nov 2022 10:40:51 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906310f00b0078cf8a743d6sm684681ejx.100.2022.11.17.10.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:40:50 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 4/8] drm/simpledrm: Use struct iosys_map consistently
Date:   Thu, 17 Nov 2022 19:40:35 +0100
Message-Id: <20221117184039.2291937-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117184039.2291937-1-thierry.reding@gmail.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The majority of the driver already uses struct iosys_map to encapsulate
accesses to I/O remapped vs. system memory. Accesses via the screen base
pointer still use __iomem annotations, which can lead to inconsistencies
and conflicts with subsequent patches.

Convert the screen base to a struct iosys_map as well for consistency
and to avoid these issues.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- properly reinitialize struct iosys_map to avoid bogus increments

 drivers/gpu/drm/tiny/simpledrm.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 162eb44dcba8..3673a42e4bf4 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -208,7 +208,7 @@ struct simpledrm_device {
 	unsigned int pitch;
 
 	/* memory management */
-	void __iomem *screen_base;
+	struct iosys_map screen_base;
 
 	/* modesetting */
 	uint32_t formats[8];
@@ -492,15 +492,15 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		struct iosys_map dst = IOSYS_MAP_INIT_VADDR(sdev->screen_base);
 		struct drm_rect dst_clip = plane_state->dst;
+		struct iosys_map screen = sdev->screen_base;
 
 		if (!drm_rect_intersect(&dst_clip, &damage))
 			continue;
 
-		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
-		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data, fb,
-			    &damage);
+		iosys_map_incr(&screen, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
+		drm_fb_blit(&screen, &sdev->pitch, sdev->format->format, shadow_plane_state->data,
+			    fb, &damage);
 	}
 
 	drm_dev_exit(idx);
@@ -519,7 +519,7 @@ static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plan
 		return;
 
 	/* Clear screen to black if disabled */
-	memset_io(sdev->screen_base, 0, sdev->pitch * sdev->mode.vdisplay);
+	iosys_map_memset(&sdev->screen_base, 0, 0, sdev->pitch * sdev->mode.vdisplay);
 
 	drm_dev_exit(idx);
 }
@@ -722,7 +722,8 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
 	if (!screen_base)
 		return ERR_PTR(-ENOMEM);
-	sdev->screen_base = screen_base;
+
+	iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
 
 	/*
 	 * Modesetting
-- 
2.38.1

