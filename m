Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E2D23B627
	for <linux-tegra@vger.kernel.org>; Thu, 19 Jun 2025 11:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332884; cv=none; b=I3sjrUrheTT2hYe16nr+wlJaXmcR/cjEgL1emkV0YZ917V3UlE9Fbz9KywrJKJMolMi9TNfwyUL40/IUScfIGhovuZAd6kbaBXT2LnmHkE0L00W/Esrb52ITmKfWT8DplVzhmd6b1sa3NnO8MAmhiGpghjRm2VlPFoxmIcG2MKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332884; c=relaxed/simple;
	bh=wgm1RJdsP1ul4qvnEwxTEpXGtARexNbE4cqGN5mXxoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kpG0fLzjKaKCiGbKQzM3zG+pz1wIXZsQ4jHu15TjeB8ETe5H/pNlM3PSUVXIamDkw80YTWNVEijjKFbDd8mtkiQ5OP4hQuV8NbRekTSPmZB2/yr0lrWABYODFv+JvgMyIbcvTi19VeVbzxdpyUEyMpFLpI9HzzvXhfC3oK5YthM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nzXzInCE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/fpQqBfK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nzXzInCE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/fpQqBfK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nzXzInCE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/fpQqBfK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nzXzInCE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/fpQqBfK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D08911F38D;
	Thu, 19 Jun 2025 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750332880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxkbOGMqP0e8d5eC3yq3MnBCg11yfuatWFNdzgYFqgs=;
	b=nzXzInCE6r6p9a55Swqg4txUY95SrAalwNMrupOOHIKrUfuQP106GuW6YYYGSrRXcvnn2y
	/L325GTOjIsrxmUstgGix1jP7OtuCb1yl72KuRs2r0zW0BUO7pAAFIWKU2R6Aids6hPp/4
	M/52xivZweXOdGXcKmSO4OkEFsFbxGQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750332880;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxkbOGMqP0e8d5eC3yq3MnBCg11yfuatWFNdzgYFqgs=;
	b=/fpQqBfKvEGjUaWZmNwIaqHfyQdHzkWEafxSj5nVDeqafwphQ4yvOG7FPLgPfCzg+shchd
	CSQfKlSLE3yZunCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750332880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxkbOGMqP0e8d5eC3yq3MnBCg11yfuatWFNdzgYFqgs=;
	b=nzXzInCE6r6p9a55Swqg4txUY95SrAalwNMrupOOHIKrUfuQP106GuW6YYYGSrRXcvnn2y
	/L325GTOjIsrxmUstgGix1jP7OtuCb1yl72KuRs2r0zW0BUO7pAAFIWKU2R6Aids6hPp/4
	M/52xivZweXOdGXcKmSO4OkEFsFbxGQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750332880;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxkbOGMqP0e8d5eC3yq3MnBCg11yfuatWFNdzgYFqgs=;
	b=/fpQqBfKvEGjUaWZmNwIaqHfyQdHzkWEafxSj5nVDeqafwphQ4yvOG7FPLgPfCzg+shchd
	CSQfKlSLE3yZunCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C28B13721;
	Thu, 19 Jun 2025 11:34:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +GTvHND1U2hKbQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 19 Jun 2025 11:34:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	jonathanh@nvidia.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	simona@ffwll.ch,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] drm/tegra: Test for imported buffers with drm_gem_is_imported()
Date: Thu, 19 Jun 2025 13:27:00 +0200
Message-ID: <20250619113100.70292-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619113100.70292-1-tzimmermann@suse.de>
References: <20250619113100.70292-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,linaro.org,amd.com,ffwll.ch];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tegra/gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index dbc1394f96b8..8ede07fb7a21 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -523,7 +523,7 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 	if (tegra->domain) {
 		tegra_bo_iommu_unmap(tegra, bo);
 
-		if (gem->import_attach) {
+		if (drm_gem_is_imported(gem)) {
 			dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
 							  DMA_TO_DEVICE);
 			dma_buf_detach(gem->import_attach->dmabuf, gem->import_attach);
-- 
2.49.0

