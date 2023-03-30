Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255DDC77B6D
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Mar 2023 08:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjC3IgV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 30 Mar 2023 04:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjC3IgN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Mar 2023 04:36:13 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37A66582
        for <linux-tegra@vger.kernel.org>; Thu, 30 Mar 2023 01:36:10 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 971411FE7F;
        Thu, 30 Mar 2023 08:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680165369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DFEjP46DiBZ4uxKnGZYyXU+dBULAFBIzXv2KmBEmlBE=;
        b=pZpPPXQI0Sv+dSpk6IBOfWs2qirQ894hN94r+VSIXSRcsXXtF8uvJNdIXZjp84JQ1cha86
        IkV2Js0olEoMyFDry/+e33mNOb+89MrnWAIRkmaj4BPSRMURkHjJ78N0yWxLjL1q6WbtSg
        wSJ5P1jynl1YwCSNe6/0hVQLhBky8iU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680165369;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DFEjP46DiBZ4uxKnGZYyXU+dBULAFBIzXv2KmBEmlBE=;
        b=chW7mPD7J6EY+Rx7LxI9K64nfgqyndEc6x0+uAZGOPOgZ9y6/MzPgqItWdT8/akWW470m/
        HmImQ3UZfQZibjBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 61930138FF;
        Thu, 30 Mar 2023 08:36:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id OIv9FvlJJWQHHAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 08:36:09 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/7] drm/tegra: Remove struct tegra_fbdev
Date:   Thu, 30 Mar 2023 10:36:04 +0200
Message-Id: <20230330083607.12834-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330083607.12834-1-tzimmermann@suse.de>
References: <20230330083607.12834-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Remove struct tegra_fbdev, which is an empty wrapper around struct
drm_fb_helper. Use the latter directly. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tegra/drm.h | 10 -------
 drivers/gpu/drm/tegra/fb.c  | 59 ++++++++++++++-----------------------
 2 files changed, 22 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 8f8e5cda78da..593a60b03189 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -29,12 +29,6 @@
 
 struct reset_control;
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-struct tegra_fbdev {
-	struct drm_fb_helper base;
-};
-#endif
-
 struct tegra_drm {
 	struct drm_device *drm;
 
@@ -52,10 +46,6 @@ struct tegra_drm {
 	struct mutex clients_lock;
 	struct list_head clients;
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-	struct tegra_fbdev *fbdev;
-#endif
-
 	unsigned int hmask, vmask;
 	unsigned int pitch_align;
 	unsigned int num_crtcs;
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 1ee4771b77d3..12eb260d9f51 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -17,13 +17,6 @@
 #include "drm.h"
 #include "gem.h"
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-static inline struct tegra_fbdev *to_tegra_fbdev(struct drm_fb_helper *helper)
-{
-	return container_of(helper, struct tegra_fbdev, base);
-}
-#endif
-
 struct tegra_bo *tegra_fb_get_plane(struct drm_framebuffer *framebuffer,
 				    unsigned int index)
 {
@@ -296,42 +289,42 @@ static const struct drm_fb_helper_funcs tegra_fb_helper_funcs = {
 	.fb_probe = tegra_fbdev_probe,
 };
 
-static struct tegra_fbdev *tegra_fbdev_create(struct drm_device *drm)
+static struct drm_fb_helper *tegra_fbdev_create(struct drm_device *drm)
 {
-	struct tegra_fbdev *fbdev;
+	struct drm_fb_helper *helper;
 
-	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
-	if (!fbdev) {
+	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
+	if (!helper) {
 		dev_err(drm->dev, "failed to allocate DRM fbdev\n");
 		return ERR_PTR(-ENOMEM);
 	}
 
-	drm_fb_helper_prepare(drm, &fbdev->base, 32, &tegra_fb_helper_funcs);
+	drm_fb_helper_prepare(drm, helper, 32, &tegra_fb_helper_funcs);
 
-	return fbdev;
+	return helper;
 }
 
-static void tegra_fbdev_free(struct tegra_fbdev *fbdev)
+static void tegra_fbdev_free(struct drm_fb_helper *helper)
 {
-	drm_fb_helper_unprepare(&fbdev->base);
-	kfree(fbdev);
+	drm_fb_helper_unprepare(helper);
+	kfree(helper);
 }
 
-static int tegra_fbdev_init(struct tegra_fbdev *fbdev,
+static int tegra_fbdev_init(struct drm_fb_helper *helper,
 			    unsigned int num_crtc,
 			    unsigned int max_connectors)
 {
-	struct drm_device *drm = fbdev->base.dev;
+	struct drm_device *drm = helper->dev;
 	int err;
 
-	err = drm_fb_helper_init(drm, &fbdev->base);
+	err = drm_fb_helper_init(drm, helper);
 	if (err < 0) {
 		dev_err(drm->dev, "failed to initialize DRM FB helper: %d\n",
 			err);
 		return err;
 	}
 
-	err = drm_fb_helper_initial_config(&fbdev->base);
+	err = drm_fb_helper_initial_config(helper);
 	if (err < 0) {
 		dev_err(drm->dev, "failed to set initial configuration: %d\n",
 			err);
@@ -341,13 +334,12 @@ static int tegra_fbdev_init(struct tegra_fbdev *fbdev,
 	return 0;
 
 fini:
-	drm_fb_helper_fini(&fbdev->base);
+	drm_fb_helper_fini(helper);
 	return err;
 }
 
-static void tegra_fbdev_exit(struct tegra_fbdev *fbdev)
+static void tegra_fbdev_exit(struct drm_fb_helper *helper)
 {
-	struct drm_fb_helper *helper = &fbdev->base;
 	struct drm_framebuffer *fb = helper->fb;
 
 	drm_fb_helper_unregister_info(helper);
@@ -365,18 +357,16 @@ static void tegra_fbdev_exit(struct tegra_fbdev *fbdev)
 	}
 
 	drm_fb_helper_fini(helper);
-	tegra_fbdev_free(fbdev);
+	tegra_fbdev_free(helper);
 }
 #endif
 
 int tegra_drm_fb_prepare(struct drm_device *drm)
 {
 #ifdef CONFIG_DRM_FBDEV_EMULATION
-	struct tegra_drm *tegra = drm->dev_private;
-
-	tegra->fbdev = tegra_fbdev_create(drm);
-	if (IS_ERR(tegra->fbdev))
-		return PTR_ERR(tegra->fbdev);
+	drm->fb_helper = tegra_fbdev_create(drm);
+	if (IS_ERR(drm->fb_helper))
+		return PTR_ERR(drm->fb_helper);
 #endif
 
 	return 0;
@@ -385,19 +375,16 @@ int tegra_drm_fb_prepare(struct drm_device *drm)
 void tegra_drm_fb_free(struct drm_device *drm)
 {
 #ifdef CONFIG_DRM_FBDEV_EMULATION
-	struct tegra_drm *tegra = drm->dev_private;
-
-	tegra_fbdev_free(tegra->fbdev);
+	tegra_fbdev_free(drm->fb_helper);
 #endif
 }
 
 int tegra_drm_fb_init(struct drm_device *drm)
 {
 #ifdef CONFIG_DRM_FBDEV_EMULATION
-	struct tegra_drm *tegra = drm->dev_private;
 	int err;
 
-	err = tegra_fbdev_init(tegra->fbdev, drm->mode_config.num_crtc,
+	err = tegra_fbdev_init(drm->fb_helper, drm->mode_config.num_crtc,
 			       drm->mode_config.num_connector);
 	if (err < 0)
 		return err;
@@ -409,8 +396,6 @@ int tegra_drm_fb_init(struct drm_device *drm)
 void tegra_drm_fb_exit(struct drm_device *drm)
 {
 #ifdef CONFIG_DRM_FBDEV_EMULATION
-	struct tegra_drm *tegra = drm->dev_private;
-
-	tegra_fbdev_exit(tegra->fbdev);
+	tegra_fbdev_exit(drm->fb_helper);
 #endif
 }
-- 
2.40.0

