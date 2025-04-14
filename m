Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB6119BBC
	for <linux-tegra@vger.kernel.org>; Mon, 14 Apr 2025 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637760; cv=none; b=tvI5MuynCHa7cWD/WWiiC8XXtqR3Rmsg0i5Eykv4Pgjd3faFrPG1DmjY/GjKCm2EfjL8lfNzKKd4yzHo5yqvNj+XmltrQU0yV14u6u+5fo/JepoEAV3EREeO7Xa/jznsmq9L1Xof8pezBCs+iiZ4fpo6OD6Imiog/Y0p8GB2JSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637760; c=relaxed/simple;
	bh=7Bcvo5qVUo38uqnkDKYMla/qH76zZT29rUbn2Q0VVs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e68jXKeRHn5ScX13mY+8YPveRBEZCRlpW9IaZpcByUSbA0hIyaU5toXj2DNmEPan8wMsehJd/sm4Xf1jlCxWrnIFOCIDH/1iifVw0+zRw6ud5BgGM0jHtOFqa0tqWlnSca0vmQZt4NsSvtP62bK2npU7MPNlU9UYxy+rWu4NROU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wu55+3gv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZVBlodRx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wu55+3gv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZVBlodRx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wu55+3gv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZVBlodRx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wu55+3gv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZVBlodRx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4885821215;
	Mon, 14 Apr 2025 13:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744637743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWa/OQMDwG7ICSQeicwCWZnaas6WYOi8B+4U6xgwmPk=;
	b=wu55+3gvLGBxkdKJ6cFrdKNdyk1YiH6Ihn3jqfS8YXnUoSmU6e/9h2Zu5fn+S4sql2iaKQ
	q/PozG9ps9GavUlVnyuME3LhNqa/X4fxv9tpYaJczoUfCsedxcbIJJueZJFhHsuquRcOYE
	JheKLtWvX+9d5wRxpbtFsTtfONHT/nc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744637743;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWa/OQMDwG7ICSQeicwCWZnaas6WYOi8B+4U6xgwmPk=;
	b=ZVBlodRxdXZ1g5HSPD28+SQZZ2KYYybmxq8iFtcsoe0uWsivUuG8FDAAven0rwhJRyIWbU
	1GV9yf133JrRfHDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744637743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWa/OQMDwG7ICSQeicwCWZnaas6WYOi8B+4U6xgwmPk=;
	b=wu55+3gvLGBxkdKJ6cFrdKNdyk1YiH6Ihn3jqfS8YXnUoSmU6e/9h2Zu5fn+S4sql2iaKQ
	q/PozG9ps9GavUlVnyuME3LhNqa/X4fxv9tpYaJczoUfCsedxcbIJJueZJFhHsuquRcOYE
	JheKLtWvX+9d5wRxpbtFsTtfONHT/nc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744637743;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWa/OQMDwG7ICSQeicwCWZnaas6WYOi8B+4U6xgwmPk=;
	b=ZVBlodRxdXZ1g5HSPD28+SQZZ2KYYybmxq8iFtcsoe0uWsivUuG8FDAAven0rwhJRyIWbU
	1GV9yf133JrRfHDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17179136A7;
	Mon, 14 Apr 2025 13:35:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OARHBC8P/WfQfwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 14 Apr 2025 13:35:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm/tegra: Use dma_buf from GEM object instance
Date: Mon, 14 Apr 2025 15:31:42 +0200
Message-ID: <20250414133242.567132-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414133242.567132-1-tzimmermann@suse.de>
References: <20250414133242.567132-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -5.30
X-Spam-Flag: NO

Avoid dereferencing struct drm_gem_object.import_attach for the
imported dma-buf. The dma_buf field in the GEM object instance refers
to the same buffer. Prepares to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tegra/gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index c1695caec956..e17abe63c723 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -527,7 +527,7 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 		if (drm_gem_is_imported(gem)) {
 			dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
 							  DMA_TO_DEVICE);
-			dma_buf_detach(gem->import_attach->dmabuf, gem->import_attach);
+			dma_buf_detach(gem->dma_buf, gem->import_attach);
 		}
 	}
 
-- 
2.49.0

