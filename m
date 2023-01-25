Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25ADDC636D0
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Jan 2023 20:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236199AbjAYUEY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Jan 2023 15:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236187AbjAYUEV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 15:04:21 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698C23EC50;
        Wed, 25 Jan 2023 12:04:20 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id F1C3121C7A;
        Wed, 25 Jan 2023 20:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674677058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q7fMCgFphIjTE49OaJAuwkZAviu6UYLv719wAQoW7Bs=;
        b=pr9rBpAd4FPZ5gQERAxsfJZFFjS/lkZAhuevRsfm1Gtuisba5Mqkgj6WEMC/beJ48aLDl6
        I7vsspWTHgSOe7XYERG/ixgxR77LpdmgZZGFk1nXE//2eFcpefRgNk+t09TI03BL4PJJDS
        jLaAPA0T60fE3w2zR02H+1d5t90v9lw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674677059;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q7fMCgFphIjTE49OaJAuwkZAviu6UYLv719wAQoW7Bs=;
        b=IC+QpLXW+cxuCgCzittXlggAVEhdZ9551dRZZqaQ7HTZwPd7C5FrXHkB+M7laKPda/rsMs
        huH1+VOhHDx8QlCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B947F13A06;
        Wed, 25 Jan 2023 20:04:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id UBZ3LEKL0WMDeAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 25 Jan 2023 20:04:18 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 07/10] drm/fbdev-generic: Minimize hotplug error handling
Date:   Wed, 25 Jan 2023 21:04:12 +0100
Message-Id: <20230125200415.14123-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125200415.14123-1-tzimmermann@suse.de>
References: <20230125200415.14123-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Call drm_fb_helper_fini() in the generic-fbdev hotplug helper
to revert the effects of drm_fb_helper_init(). No full cleanup
is required.

v3:
	* fix error in commit message (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 6ae014040df3..dd8be5e0f271 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -387,25 +387,21 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
 
 	ret = drm_fb_helper_init(dev, fb_helper);
 	if (ret)
-		goto err;
+		goto err_drm_err;
 
 	if (!drm_drv_uses_atomic_modeset(dev))
 		drm_helper_disable_unused_functions(dev);
 
 	ret = drm_fb_helper_initial_config(fb_helper);
 	if (ret)
-		goto err_cleanup;
+		goto err_drm_fb_helper_fini;
 
 	return 0;
 
-err_cleanup:
-	drm_fbdev_cleanup(fb_helper);
-err:
-	fb_helper->dev = NULL;
-	fb_helper->info = NULL;
-
+err_drm_fb_helper_fini:
+	drm_fb_helper_fini(fb_helper);
+err_drm_err:
 	drm_err(dev, "fbdev: Failed to setup generic emulation (ret=%d)\n", ret);
-
 	return ret;
 }
 
-- 
2.39.0

