Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E47281356
	for <linux-tegra@vger.kernel.org>; Fri, 13 Jun 2025 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805563; cv=none; b=lTYkcjFGYcPV82UIsI5YR2Z4XPWeTTYLAFo1Kp3oNLJWGNs6TF2CrA2hhoCZ3EPNEaDgJuA/yYh1y12p3SSELn7xEdcx2Pe73yWzSkueGkU7pkuhve6zANADiTIPioJ01wSN0V1X3/i8egTU2ppYQdZPp1y28ngzyvx86mB5mvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805563; c=relaxed/simple;
	bh=L4TDebew66DfFovJSShGZ3IPi+Z5lNsKj7caiAGfERU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k0KyWAqdw6scvZ9+AL3T694u5nMujxQLdy0rFQqFuimWFBTyjlYJ/eeixmn1LmDdEU0uE1wGcnpHuoQJ4/DC775loQeQJidT210LmhWPbMZE+JAUqSUit7MKB88LUM/kntFzSJ5W/e48dhLqwW3dppT071xlHpKzkg1nxm1dMUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1A3EF1F863;
	Fri, 13 Jun 2025 09:04:49 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75AB113A9C;
	Fri, 13 Jun 2025 09:04:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iJBYG7DpS2inNAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 09:04:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	geert@linux-m68k.org,
	tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 19/25] drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Fri, 13 Jun 2025 11:00:38 +0200
Message-ID: <20250613090431.127087-20-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613090431.127087-1-tzimmermann@suse.de>
References: <20250613090431.127087-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 1A3EF1F863
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 64.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Heiko Stuebner <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 6330b883efc3..3bd06202e232 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -9,6 +9,7 @@
 #include <linux/vmalloc.h>
 
 #include <drm/drm.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -403,13 +404,12 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
 			     struct drm_mode_create_dumb *args)
 {
 	struct rockchip_gem_object *rk_obj;
-	int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	int ret;
 
-	/*
-	 * align to 64 bytes since Mali requires it.
-	 */
-	args->pitch = ALIGN(min_pitch, 64);
-	args->size = args->pitch * args->height;
+	/* 64-byte alignment required by Mali */
+	ret = drm_mode_size_dumb(dev, args, SZ_64, 0);
+	if (ret)
+		return ret;
 
 	rk_obj = rockchip_gem_create_with_handle(file_priv, dev, args->size,
 						 &args->handle);
-- 
2.49.0

