Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40737C05027
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 17:31:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjATRbV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 12:31:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbjATRbT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 12:31:19 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91ED9DBC1;
        Fri, 20 Jan 2023 09:31:12 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id h12so1480071wrv.10;
        Fri, 20 Jan 2023 09:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZNLi/l9wxy+mypxiXIZ6SYlQ5ADDjWtmD5zsC5Iu7U=;
        b=ekmCbRnQ3AKTSQE0uIHwanjK5e6WP9TSnmmjfarZxQgBhR/oiLwMIm/Zsd4JZ810NX
         /12FvuVLMlj3cBThnm4vG/SGhZDBu1ZwSGoeOc1QYfGVHmv2vLI1rKmYu3w2Qa6bcatW
         bihB3PpG/qNnfJ1XcPQw+mWakCZdhXFdABhR2Vx8o5xJCCvQjDdPoy3qbclJna8o6m+/
         vooPj/OdMhGZupkhaDS6ttD+war33jtqb+hJCukHGDvgVn3Df5FeDPXpeC2ch0SZoNuH
         Hh7ONe2kRy1EHHoJ8YqG8/qzCZ/IGBFMKzm+aUF0ILgAdTAcd5nyMcGo3JF+6wBpWOFB
         CDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZNLi/l9wxy+mypxiXIZ6SYlQ5ADDjWtmD5zsC5Iu7U=;
        b=exlqxMQph5Qy6nMoo7Yaw/MbObJbxOTYvTxXnSCe0muifbidUjNlz0u6ma0P8QvYop
         B3KBr0+erih8sP/YpFnjNPPwXLgOfWBKg6U21krgNm2TbMr6yiMziIwUBpJANXmu5ldX
         9/4MMBk47SdB83+kzTbL6KB1NcvRbhwuD7kd7V0sVe1DI5ZKKu8ET2SAYF3Vf0ZDtBMF
         7/ww2Hlp9SoYq/bX82hoBuYJ0+0ST8FyqjaBcx4xt35DLIUB4uaDRQNstzL/mIPuJANV
         9Xg13RQikOKM61sGrEsqwkFNcEYfltBOtGsK7zkYj2cf3puyJ5eykf9ub+QH1faEe/mz
         dUzg==
X-Gm-Message-State: AFqh2kom98YRYDF0eHMWDTisYc+II/E7iP6vDh1BDNf/mmITOT0SCvYe
        nx5Y8vucak5IEVQ21uZFV6w=
X-Google-Smtp-Source: AMrXdXt7beT4QiPFE5mJktjpvop0RXCXl2JkSoxV5JPJmVDP+OojVEZhXyRjj+HLM0Q78WAZAizSiw==
X-Received: by 2002:adf:a31e:0:b0:2be:5cff:5d00 with SMTP id c30-20020adfa31e000000b002be5cff5d00mr2463881wrb.70.1674235871083;
        Fri, 20 Jan 2023 09:31:11 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600012c400b002bbb2d43f65sm33297181wrx.14.2023.01.20.09.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:31:10 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 4/8] drm/simpledrm: Use struct iosys_map consistently
Date:   Fri, 20 Jan 2023 18:30:59 +0100
Message-Id: <20230120173103.4002342-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120173103.4002342-1-thierry.reding@gmail.com>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v4:
- rename screen variable to dst for consistency with other drivers
- add Reviewed-by from Thomas

 drivers/gpu/drm/tiny/simpledrm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index f658b99c796a..c1ed6dd426ec 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -208,7 +208,7 @@ struct simpledrm_device {
 	unsigned int pitch;
 
 	/* memory management */
-	void __iomem *screen_base;
+	struct iosys_map screen_base;
 
 	/* modesetting */
 	uint32_t formats[8];
@@ -473,15 +473,15 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		struct iosys_map dst = IOSYS_MAP_INIT_VADDR(sdev->screen_base);
 		struct drm_rect dst_clip = plane_state->dst;
+		struct iosys_map dst = sdev->screen_base;
 
 		if (!drm_rect_intersect(&dst_clip, &damage))
 			continue;
 
 		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
-		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data, fb,
-			    &damage);
+		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data,
+			    fb, &damage);
 	}
 
 	drm_dev_exit(idx);
@@ -500,7 +500,7 @@ static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plan
 		return;
 
 	/* Clear screen to black if disabled */
-	memset_io(sdev->screen_base, 0, sdev->pitch * sdev->mode.vdisplay);
+	iosys_map_memset(&sdev->screen_base, 0, 0, sdev->pitch * sdev->mode.vdisplay);
 
 	drm_dev_exit(idx);
 }
@@ -703,7 +703,8 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
 	if (!screen_base)
 		return ERR_PTR(-ENOMEM);
-	sdev->screen_base = screen_base;
+
+	iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
 
 	/*
 	 * Modesetting
-- 
2.39.0

