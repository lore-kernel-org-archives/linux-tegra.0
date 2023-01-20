Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECECC27C76
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 11:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjATLBr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 06:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjATLBq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 06:01:46 -0500
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B1408016E
        for <linux-tegra@vger.kernel.org>; Fri, 20 Jan 2023 03:01:43 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 836CD6007C22;
        Fri, 20 Jan 2023 11:01:42 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id jmPLsTe-JPvq; Fri, 20 Jan 2023 11:01:40 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 093D8600883C;
        Fri, 20 Jan 2023 11:01:40 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1674212500;
        bh=iCLdm+39drENTTmwybKXG+FGuENGab22xxEPBh0q9Zw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Ye34XcBVE7NAwOtMQTggr5Z5a0CsKpXhaWXzYRr7o99sTM1LHAM77PMffe1yXkmyQ
         odnmDKCsBoaAduOh6u1PufVvgcMZyua5KCumUsRXL3Bv7MS8tPZ5OMvfjadGH1b3sy
         yoSQ2/0N/2Ygs3C1RPJiJd3HAqj6IR4/ZUnNjGc8=
Received: from wslaptop.lan (unknown [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id D93A036008A;
        Fri, 20 Jan 2023 11:01:39 +0000 (WET)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     diogo.ivo@tecnico.ulisboa.pt, thierry.reding@gmail.com,
        airlied@redhat.com, daniel@ffwll.ch, jonathanh@nvidia.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] drm/tegra: add scanout support for implicit tiling parameters
Date:   Fri, 20 Jan 2023 10:58:58 +0000
Message-Id: <20230120105858.214440-3-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120105858.214440-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230120105858.214440-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When importing buffers from the GPU to scan out, it may happen
that the buffer object has non-trivial tiling parameters, which
currently go by undetected. This leads to the framebuffer being
read and displayed in the wrong order. Explicitly check for this
case and reconstruct the adequate modifier so that the framebuffer
is correctly scanned out.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/gpu/drm/tegra/fb.c | 59 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 9291209154a7..31f381262345 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -116,11 +116,63 @@ static struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
 	struct drm_framebuffer *fb;
 	unsigned int i;
 	int err;
+	struct drm_mode_fb_cmd2 mode_cmd_local;
 
 	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
 	if (!fb)
 		return ERR_PTR(-ENOMEM);
 
+	/* Check for implicitly defined modifiers using
+	 * the state defined by tegra_gem_set_tiling().
+	 */
+	if (!(mode_cmd->flags & DRM_MODE_FB_MODIFIERS)) {
+		uint64_t modifier;
+
+		mode_cmd_local = *mode_cmd;
+
+		switch (planes[0]->tiling.mode) {
+		case TEGRA_BO_TILING_MODE_PITCH:
+			modifier = DRM_FORMAT_MOD_LINEAR;
+			break;
+
+		case TEGRA_BO_TILING_MODE_TILED:
+			modifier = DRM_FORMAT_MOD_NVIDIA_TEGRA_TILED;
+			break;
+
+		/* With all rigour this reconstruction of the modifier is
+		 * incomplete, as it skips some fields (like page kind).
+		 * However, along with the sector layout below it should
+		 * contain all the bits of information needed by the
+		 * scanout hardware.
+		 */
+		case TEGRA_BO_TILING_MODE_BLOCK:
+			unsigned long height = planes[0]->tiling.value;
+
+			if (height > 5) {
+				dev_err(drm->dev, "invalid block height value: %ld\n",
+					height);
+
+				err = -EINVAL;
+				goto cleanup;
+			}
+
+			modifier = DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(height);
+			break;
+
+		default:
+			dev_err(drm->dev, "invalid tiling mode\n");
+			err = -EINVAL;
+			goto cleanup;
+		}
+
+		if (planes[0]->tiling.sector_layout == DRM_TEGRA_GEM_SECTOR_LAYOUT_GPU)
+			modifier |= DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT;
+
+		mode_cmd_local.modifier[0] = modifier;
+
+		mode_cmd = &mode_cmd_local;
+	}
+
 	drm_helper_mode_fill_fb_struct(drm, fb, mode_cmd);
 
 	for (i = 0; i < fb->format->num_planes; i++)
@@ -130,11 +182,14 @@ static struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
 	if (err < 0) {
 		dev_err(drm->dev, "failed to initialize framebuffer: %d\n",
 			err);
-		kfree(fb);
-		return ERR_PTR(err);
+		goto cleanup;
 	}
 
 	return fb;
+
+cleanup:
+	kfree(fb);
+	return ERR_PTR(err);
 }
 
 struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
-- 
2.39.1

