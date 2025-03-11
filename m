Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85225260A31
	for <linux-tegra@vger.kernel.org>; Tue, 11 Mar 2025 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708535; cv=none; b=Z5Sakx77+WBpH+z2Q94lCuXzvR3ftyR6me+9a4peytGV8n8iRpHpF8oP9dWLqPoJ6+HpAG3kDkfGkB1JFVtJKLeHjQUc3D6tjpCeW8hMqSfEX++/dPJkmufp7ymy1DZDo1aJ6CkMsy9VjhNo6r0RJKeKos47tvJrXcnrXmh35d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708535; c=relaxed/simple;
	bh=JiJl9H4dYJtspPpDoyo6gbkxt42BFtxOI+3nX5uJMY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V4Zz8oBagxQ5JVNetAXXD+xGPYEC2JNB0O88KId1ZHfiwmWJJqx+kdnCCgBK7bZuh4qxiTGVsTaY8dIH0RxLRYzs+DGqr1fpdrFALBQQuP6nCbcqwSLBMHUzJvywiB7f5zeCxcteH7Ua40ozaSKbm4yZLhAITY+iUsG36QVtXtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ha/wzD6k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=j4/2sQSz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ha/wzD6k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=j4/2sQSz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ha/wzD6k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j4/2sQSz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ha/wzD6k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j4/2sQSz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0641121186;
	Tue, 11 Mar 2025 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXm1bKu+RAFYNAPsfae83e9nA9nFKyOAPYmeFOBwCto=;
	b=ha/wzD6kPdVqzgBow2Gp2uZcrtulOKI1xb9rS6AxvPRI4S8TP9xVt8dENg6/wouW201L0P
	a4N1iZ9/ve7vX6X1HeO1MqjO2zym8r79WGzh2tCtORBxfBdRv69GP7KOyUkjBFhaU+Iisc
	oDkVfC23XK/90ch06usgMsA8McrVgrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708495;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXm1bKu+RAFYNAPsfae83e9nA9nFKyOAPYmeFOBwCto=;
	b=j4/2sQSzG5q27M244BZbWhfxXeRBJ5+ZmEdSrVEdomuPUkPvKZzuwU3Q8zLI4feX1B4uMI
	/Q4odfpgh0+IHXBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXm1bKu+RAFYNAPsfae83e9nA9nFKyOAPYmeFOBwCto=;
	b=ha/wzD6kPdVqzgBow2Gp2uZcrtulOKI1xb9rS6AxvPRI4S8TP9xVt8dENg6/wouW201L0P
	a4N1iZ9/ve7vX6X1HeO1MqjO2zym8r79WGzh2tCtORBxfBdRv69GP7KOyUkjBFhaU+Iisc
	oDkVfC23XK/90ch06usgMsA8McrVgrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708495;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXm1bKu+RAFYNAPsfae83e9nA9nFKyOAPYmeFOBwCto=;
	b=j4/2sQSzG5q27M244BZbWhfxXeRBJ5+ZmEdSrVEdomuPUkPvKZzuwU3Q8zLI4feX1B4uMI
	/Q4odfpgh0+IHXBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EB13134A0;
	Tue, 11 Mar 2025 15:54:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id INPOFc5c0GdUdQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:54:54 +0000
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
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 12/25] drm/mediatek: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 11 Mar 2025 16:47:16 +0100
Message-ID: <20250311155120.442633-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
References: <20250311155120.442633-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,pengutronix.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,suse.de,kernel.org,pengutronix.de,gmail.com,collabora.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 8.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_gem.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
index a172456d1d7b..21e08fabfd7f 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_gem.c
@@ -8,6 +8,7 @@
 
 #include <drm/drm.h>
 #include <drm/drm_device.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_prime.h>
@@ -124,15 +125,9 @@ int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 	struct mtk_gem_obj *mtk_gem;
 	int ret;
 
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-
-	/*
-	 * Multiply 2 variables of different types,
-	 * for example: args->size = args->spacing * args->height;
-	 * may cause coverity issue with unintentional overflow.
-	 */
-	args->size = args->pitch;
-	args->size *= args->height;
+	ret = drm_mode_size_dumb(dev, args, SZ_8, 0);
+	if (ret)
+		return ret;
 
 	mtk_gem = mtk_gem_create(dev, args->size, false);
 	if (IS_ERR(mtk_gem))
-- 
2.48.1

