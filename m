Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A0923E22A
	for <linux-tegra@vger.kernel.org>; Tue, 18 Feb 2025 14:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888817; cv=none; b=mYdhudIkpA6/qyt2VIoREtGrg/pxQGbpflnssB8SSxSQop9neLpq2TtZWX7ku+XjPr2I6gMmOjhQEmBN6MyBMU2t+3J8DpbKU/pgnrwZTY+08XvUbu9+LCBCo6edIIzue4NnxxF2lqtf30KReEK1MPgkQDekkrleWT4U/c/4zJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888817; c=relaxed/simple;
	bh=/pA2mJpJageuvJQUGzaaJ8uI57RFNAQCpR3Nn8llMDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRGbHxoLvUCdevlhMcuOkTEtZt617Ppm4kHVL25thbui8OHlu8A4RvnmE1BSMoX7SDcTkdYlbFnIUr5nmNhc0ukpxxndX9dwrGEKON7H2Qim1CUOPQ0ShcJXiOQyB8vrVbEhWlYgwGbMWPTiJi6FKduuUr4OeN8dyKejPgkYGck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=fail smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0qo+8k9B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pi9YraRR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0qo+8k9B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pi9YraRR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0qo+8k9B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pi9YraRR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0qo+8k9B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pi9YraRR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 95E4421185;
	Tue, 18 Feb 2025 14:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LUTnf6LnrCoWPBTLOSBqvaWHyL0T2pdfUy5F7P2FMlI=;
	b=0qo+8k9BCyegwamdV2fk7gCbDJp3/1QSwvkGepjZKc91JX4nkPA4/lT1ArCZvCn8H0r57U
	4TCKyPkuiy8N2ICvRg3qtcveT/HzQIT0Ebgh4sjSfSRJkhv74MVVDs1ct9O1ejE0nwmxIN
	IiDKmaEpIHJBsa0kw+TCFrQ+VniK7G4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888758;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LUTnf6LnrCoWPBTLOSBqvaWHyL0T2pdfUy5F7P2FMlI=;
	b=pi9YraRReafU57U2P+Ph8CWU1OTq/ozFrhdY5aYBrVpzu7qMizRUE30XmirAUs3+odkYIj
	sTj+pW9z/zxxtpCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0qo+8k9B;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pi9YraRR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LUTnf6LnrCoWPBTLOSBqvaWHyL0T2pdfUy5F7P2FMlI=;
	b=0qo+8k9BCyegwamdV2fk7gCbDJp3/1QSwvkGepjZKc91JX4nkPA4/lT1ArCZvCn8H0r57U
	4TCKyPkuiy8N2ICvRg3qtcveT/HzQIT0Ebgh4sjSfSRJkhv74MVVDs1ct9O1ejE0nwmxIN
	IiDKmaEpIHJBsa0kw+TCFrQ+VniK7G4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888758;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LUTnf6LnrCoWPBTLOSBqvaWHyL0T2pdfUy5F7P2FMlI=;
	b=pi9YraRReafU57U2P+Ph8CWU1OTq/ozFrhdY5aYBrVpzu7qMizRUE30XmirAUs3+odkYIj
	sTj+pW9z/zxxtpCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F3B2132C7;
	Tue, 18 Feb 2025 14:25:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wMYhAnaYtGdXYQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
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
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 20/25] drm/tegra: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 18 Feb 2025 15:23:43 +0100
Message-ID: <20250218142542.438557-21-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218142542.438557-1-tzimmermann@suse.de>
References: <20250218142542.438557-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 95E4421185
X-Spam-Score: -1.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,suse.de,gmail.com,nvidia.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,nvidia.com:email,suse.de:dkim,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch according to hardware requirements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index ace3e5a805cf..4d88e71192fb 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -16,6 +16,7 @@
 #include <linux/vmalloc.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
 #include <drm/tegra_drm.h>
 
@@ -543,12 +544,13 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,
 			 struct drm_mode_create_dumb *args)
 {
-	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
 	struct tegra_drm *tegra = drm->dev_private;
 	struct tegra_bo *bo;
+	int ret;
 
-	args->pitch = round_up(min_pitch, tegra->pitch_align);
-	args->size = args->pitch * args->height;
+	ret = drm_mode_size_dumb(drm, args, tegra->pitch_align, 0);
+	if (ret)
+		return ret;
 
 	bo = tegra_bo_create_with_handle(file, drm, args->size, 0,
 					 &args->handle);
-- 
2.48.1

