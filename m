Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091C8C6FD1D
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Mar 2023 08:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjC3IgU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 30 Mar 2023 04:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbjC3IgN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Mar 2023 04:36:13 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55200658B
        for <linux-tegra@vger.kernel.org>; Thu, 30 Mar 2023 01:36:11 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0FECD21A7E;
        Thu, 30 Mar 2023 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680165370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H2Ext+W82fQQ2w7SqDir609zbPpKyhgFa4BXMGt/wso=;
        b=ZPd7q+qsoGN04zvGDgoBQIm/fHnEtSJ55xP+HZdjTJTnh9nBR3H/qOn7GpJg3S5uVelVVb
        Sy5FQmxmrxRQnYfWrtdhuxARhV5BmgtCBb7oAHBlK/5J27lZ99eZUlUDrM4a/oEUPYFf2F
        OFsHr8Zfe4sy8DX2TmxNj52BPQgaEDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680165370;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H2Ext+W82fQQ2w7SqDir609zbPpKyhgFa4BXMGt/wso=;
        b=i9rdo3Gziu4DUp4Su/dBMaqF4m3tOYt0L9eTiFPBm3OXKk6c4cSsoYkrA8WprOJbK54oH9
        wFUE5RclYdJOveBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4C0D138FF;
        Thu, 30 Mar 2023 08:36:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id iGT5MvlJJWQHHAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 08:36:09 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/7] drm/tegra: Initialize fbdev DRM client
Date:   Thu, 30 Mar 2023 10:36:06 +0200
Message-Id: <20230330083607.12834-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330083607.12834-1-tzimmermann@suse.de>
References: <20230330083607.12834-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Initialize the fbdev client in the fbdev code with empty helper
functions. Also clean up the client. The helpers will later
implement various functionality of the DRM client. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tegra/fbdev.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index 2400d42f82e4..31a95a955efb 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -125,6 +125,30 @@ static const struct drm_fb_helper_funcs tegra_fb_helper_funcs = {
 	.fb_probe = tegra_fbdev_probe,
 };
 
+/*
+ * struct drm_client
+ */
+
+static void tegra_fbdev_client_unregister(struct drm_client_dev *client)
+{ }
+
+static int tregra_fbdev_client_restore(struct drm_client_dev *client)
+{
+	return 0;
+}
+
+static int tegra_fbdev_client_hotplug(struct drm_client_dev *client)
+{
+	return 0;
+}
+
+static const struct drm_client_funcs tegra_fbdev_client_funcs = {
+	.owner		= THIS_MODULE,
+	.unregister	= tegra_fbdev_client_unregister,
+	.restore	= tegra_fbdev_client_restore,
+	.hotplug	= tegra_fbdev_client_hotplug,
+};
+
 static struct drm_fb_helper *tegra_fbdev_create(struct drm_device *drm)
 {
 	struct drm_fb_helper *helper;
@@ -151,11 +175,15 @@ static int tegra_fbdev_init(struct drm_fb_helper *helper,
 	struct drm_device *drm = helper->dev;
 	int err;
 
+	err = drm_client_init(dev, &helper->client, "fbdev", &tegra_fbdev_client_funcs);
+	if (err)
+		return err;
+
 	err = drm_fb_helper_init(drm, helper);
 	if (err < 0) {
 		dev_err(drm->dev, "failed to initialize DRM FB helper: %d\n",
 			err);
-		return err;
+		goto err_drm_client_release;
 	}
 
 	err = drm_fb_helper_initial_config(helper);
@@ -169,6 +197,8 @@ static int tegra_fbdev_init(struct drm_fb_helper *helper,
 
 fini:
 	drm_fb_helper_fini(helper);
+err_drm_client_release:
+	drm_client_release(&helper->client);
 	return err;
 }
 
@@ -191,6 +221,7 @@ static void tegra_fbdev_exit(struct drm_fb_helper *helper)
 	}
 
 	drm_fb_helper_fini(helper);
+	drm_client_release(&helper->client);
 	tegra_fbdev_free(helper);
 }
 
-- 
2.40.0

