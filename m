Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52C274655
	for <linux-tegra@vger.kernel.org>; Mon, 14 Apr 2025 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637753; cv=none; b=YIig9XM91Qvi1V8f40NCwpsUFOFy4vQb6CQW+myQ4VDwjIrA6T0JzTqqdrMxy3kDa8C2eunQ0m4YRHqZiuxKlBlWwPUJ8YC4twDk+2qCTb6bv7NABAcZiz5PxOLJAtXWdYqKsoX8zrMBYd+tq95YgDjaX4L9hQ62Alh8FK6Fp8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637753; c=relaxed/simple;
	bh=kH+xKNcfM7mkDRYJ+17EJUSkwHVhnq6IrXavY8KSCNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEFbJApWHXRPb4xX30tPEMnBLtB5OnLN4USJgcAt6X3Q/MW6pYQ+d+IHBOGV6B0yvRLrQtj/I2bMuBcShySMWKOiZo6wZ8WYKOmtf2qJG3dtgGq+bHRuGI5X7i8JqsP8j8HF8sJA7gm0uqtwdOOC7PmwTY9pr2sphDSFOc23UGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0FFBF211FF;
	Mon, 14 Apr 2025 13:35:43 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D37C213A84;
	Mon, 14 Apr 2025 13:35:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4MUdMi4P/WfQfwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 14 Apr 2025 13:35:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] drm/tegra: Test for imported buffers with drm_gem_is_imported()
Date: Mon, 14 Apr 2025 15:31:41 +0200
Message-ID: <20250414133242.567132-2-tzimmermann@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 0FFBF211FF
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The helper tests the dma_buf
itself while import_attach is just an artifact of the import. Prepares
to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tegra/gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index ace3e5a805cf..c1695caec956 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -524,7 +524,7 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 	if (tegra->domain) {
 		tegra_bo_iommu_unmap(tegra, bo);
 
-		if (gem->import_attach) {
+		if (drm_gem_is_imported(gem)) {
 			dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
 							  DMA_TO_DEVICE);
 			dma_buf_detach(gem->import_attach->dmabuf, gem->import_attach);
-- 
2.49.0

