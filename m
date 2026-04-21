Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA022FF641
	for <linux-tegra@vger.kernel.org>; Tue, 21 Apr 2026 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776757017; cv=none; b=sTleVtLe3TGN7Bicm/iccfKO5SQar0PYZot+UohlIC74x7SO/RP45dPXaajC4gm5ADPzzDd3OFRpmjYZ4xJ3ku5QGh5r7wDyZbojhxdPnffwamMpA7rOrBpOHvpDmqRBLRoF2T7v3EMUPFKaDMuKQ93fhFICjL4ffqdDwcNloWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776757017; c=relaxed/simple;
	bh=COXteqBl+6s/BtDtlqfxIq28A50KdLRinP0syYufukY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZJv5iPgMlkkcL6M1OwzFgWDl4MzMtW8f/xe10e5F0BTyX/i79fS9Jfst8FKzHVsthflWtEHqKD81tX8ibzEXx3k5V8KT4qn+Vavz9OOcf8Obo3w4UP2APovkK2snX12vZlmUJLas5udox0s9uR04IhzYBYigoE4dIcJu04JS68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B2BF5BCC2;
	Tue, 21 Apr 2026 07:36:55 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE6AA593AF;
	Tue, 21 Apr 2026 07:36:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CIwMLRYp52lgMQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 21 Apr 2026 07:36:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/5] drm/tegra: fbdev: Calculate buffer geometry with format helpers
Date: Tue, 21 Apr 2026 09:29:07 +0200
Message-ID: <20260421073646.144712-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421073646.144712-1-tzimmermann@suse.de>
References: <20260421073646.144712-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 1B2BF5BCC2
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Replace the geometry and size calculation in tegra's fbdev emulation
with DRM format helpers. This consists of a 4CC lookup from the fbdev
parameters, format lookup, pitch calculation and size calculation.
Then allocate the GEM buffer object for the framebuffer memory from
the calculated size.

Set up mode_cmd with the calculated values just before allocating the
framebuffer. This code will later be replaced with a DRM client buffer.

Set framebuffer size fields in struct fb_info from the size stored in
the GEM buffer object instead of what has been requested. The requested
size is an estimate, while the buffer size is the exact value rounded
to the correct alignment.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tegra/fbdev.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index 793849199783..bcf32cfcf818 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -74,31 +74,29 @@ int tegra_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	struct drm_device *drm = helper->dev;
 	struct drm_mode_fb_cmd2 cmd = { 0 };
 	struct fb_info *info = helper->info;
-	unsigned int bytes_per_pixel;
+	u32 fourcc, pitch;
+	u64 size;
+	const struct drm_format_info *format;
 	struct drm_framebuffer *fb;
 	struct tegra_bo *bo;
-	size_t size;
 	int err;
 
-	bytes_per_pixel = DIV_ROUND_UP(sizes->surface_bpp, 8);
-
-	cmd.width = sizes->surface_width;
-	cmd.height = sizes->surface_height;
-	cmd.pitches[0] = round_up(sizes->surface_width * bytes_per_pixel,
-				  tegra->pitch_align);
-
-	cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-						     sizes->surface_depth);
-
-	size = cmd.pitches[0] * cmd.height;
+	fourcc = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
+	format = drm_get_format_info(drm, fourcc, DRM_FORMAT_MOD_LINEAR);
+	pitch = round_up(drm_format_info_min_pitch(format, 0, sizes->surface_width),
+			 tegra->pitch_align);
+	size = ALIGN(pitch * sizes->surface_height, PAGE_SIZE);
 
 	bo = tegra_bo_create(drm, size, 0);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	fb = tegra_fb_alloc(drm,
-			    drm_get_format_info(drm, cmd.pixel_format, cmd.modifier[0]),
-			    &cmd, &bo, 1);
+	cmd.pixel_format = fourcc;
+	cmd.width = sizes->surface_width;
+	cmd.height = sizes->surface_height;
+	cmd.pitches[0] = pitch;
+
+	fb = tegra_fb_alloc(drm, format, &cmd, &bo, 1);
 	if (IS_ERR(fb)) {
 		err = PTR_ERR(fb);
 		dev_err(drm->dev, "failed to allocate DRM framebuffer: %d\n",
@@ -126,9 +124,9 @@ int tegra_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 
 	info->flags |= FBINFO_VIRTFB;
 	info->screen_buffer = bo->vaddr;
-	info->screen_size = size;
+	info->screen_size = bo->gem.size;
 	info->fix.smem_start = (unsigned long)(bo->iova);
-	info->fix.smem_len = size;
+	info->fix.smem_len = bo->gem.size;
 
 	return 0;
 
-- 
2.53.0

