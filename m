Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF1DC61D9D
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 13:40:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233908AbjAXNkV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 08:40:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234237AbjAXNkQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 08:40:16 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2AB93754D;
        Tue, 24 Jan 2023 05:40:15 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id BDEBF1FDEF;
        Tue, 24 Jan 2023 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674567613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=afz1DQI5FyPuRzZBzvdALN3LMLNkwLW65z09Mk9nstc=;
        b=irAupa3dQoLcgqzy6sjjvetLKf/6O8/IJP2T7IwihZq5dHeeiOo1cXzSrDTu4spJjZ1bge
        POzp1TaUd8bhPHa7kHxQxsri6mJ5Y1t1AY504OD9O4OXtlkJj9zLfeaTQTQWPhNk3O8ccK
        LPamX4bCXxt8+WBNp77SJm/qbQFQsXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674567613;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=afz1DQI5FyPuRzZBzvdALN3LMLNkwLW65z09Mk9nstc=;
        b=Z7Dx1YHntG0XoQmIY111UfKWr9lK1S5tCRXoEumgAZfA/zrsJbsjTSp34EnE61WS/7o5yX
        Du8FQn79oF/UFxAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B539139FF;
        Tue, 24 Jan 2023 13:40:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0BQ1Hb3fz2PWZgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 24 Jan 2023 13:40:13 +0000
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
Subject: [PATCH v2 07/10] drm/fbdev-generic: Minimize hotplug error handling
Date:   Tue, 24 Jan 2023 14:40:07 +0100
Message-Id: <20230124134010.30263-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124134010.30263-1-tzimmermann@suse.de>
References: <20230124134010.30263-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Call drm_fb_helper_init() in the generic-fbdev hotplug helper
to revert the effects of drm_fb_helper_init(). No full cleanup
is required.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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

