Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396FBC636D3
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 13:40:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234246AbjAXNkT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 08:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234234AbjAXNkQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 08:40:16 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7595D302A5;
        Tue, 24 Jan 2023 05:40:15 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 126D321886;
        Tue, 24 Jan 2023 13:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674567614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p6uZusSdr1MbshHSKIYuzEGDjhxkKoAoioeknjvp2I4=;
        b=P+07bXYxaYKX3FXIYhLxupX+VPNbGFjuieWc5c/N1GBFpxFoBmUPoYq2aL9KuSWERdOU4n
        a7K2hFKUcF0RpE/3RtEQmvcGxbFagxg71zntcGV90QHnb133HzUcBRAYyjQszR4Xml3Zgc
        qNp4kJmkb8zmkxohV2UKaTNk9DvNBP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674567614;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p6uZusSdr1MbshHSKIYuzEGDjhxkKoAoioeknjvp2I4=;
        b=T2a8dX+3RTqRqTYYMXqWLhNKHEEs+O73XEC5eDFJi4uX+ZtERihdZYOwumpYTBn7fwXWnH
        Uqk+8B9k6s4JDKCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C273F13487;
        Tue, 24 Jan 2023 13:40:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id mOuELr3fz2PWZgAAMHmgww
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
Subject: [PATCH v2 08/10] drm/fbdev-generic: Minimize client unregistering
Date:   Tue, 24 Jan 2023 14:40:08 +0100
Message-Id: <20230124134010.30263-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124134010.30263-1-tzimmermann@suse.de>
References: <20230124134010.30263-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

For uninitialized framebuffers, only release the DRM client and
free the fbdev memory. Do not attempt to clean up the framebuffer.

DRM fbdev clients have a two-step initialization: first create
the DRM client; then create the framebuffer device on the first
successful hotplug event. In cases where the client never creates
the framebuffer, only the client state needs to be released. We
can detect which case it is, full or client-only cleanup, be
looking at the presence of fb_helper's info field.

v2:
	* remove test for (fbi != NULL) in drm_fbdev_cleanup() (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index dd8be5e0f271..9fe37903e3eb 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -51,12 +51,10 @@ static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
 	if (!fb_helper->dev)
 		return;
 
-	if (fbi) {
-		if (fbi->fbdefio)
-			fb_deferred_io_cleanup(fbi);
-		if (drm_fbdev_use_shadow_fb(fb_helper))
-			shadow = fbi->screen_buffer;
-	}
+	if (fbi->fbdefio)
+		fb_deferred_io_cleanup(fbi);
+	if (drm_fbdev_use_shadow_fb(fb_helper))
+		shadow = fbi->screen_buffer;
 
 	drm_fb_helper_fini(fb_helper);
 
@@ -362,11 +360,13 @@ static void drm_fbdev_client_unregister(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 
-	if (fb_helper->info)
-		/* drm_fbdev_fb_destroy() takes care of cleanup */
+	if (fb_helper->info) {
 		drm_fb_helper_unregister_info(fb_helper);
-	else
-		drm_fbdev_release(fb_helper);
+	} else {
+		drm_fb_helper_unprepare(fb_helper);
+		drm_client_release(&fb_helper->client);
+		kfree(fb_helper);
+	}
 }
 
 static int drm_fbdev_client_restore(struct drm_client_dev *client)
-- 
2.39.0

