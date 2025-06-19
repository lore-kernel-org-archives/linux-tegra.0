Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9063C241662
	for <linux-tegra@vger.kernel.org>; Thu, 19 Jun 2025 11:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332884; cv=none; b=LSSDzcswJjNV1eOvA27ZZUX9yu9Rvt7lKE8P+q1S0s8+O0pEcEiA7AUfjlWnEN8JTSvefjiwUDRjcB4Yr3VitMLyw9/Hm+jmTkNu9CEBnOqBci7+tKDSgwb+bhioZq+t+BJru3ESioh5GQ2JjcdkFbMrg/G30WTrWBV8GRDjLok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332884; c=relaxed/simple;
	bh=C539jfvjBQhzZHKhAV9GmLeOT9H0ORlmaX431ysBLSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lSS8/fUhmNO480FxxjKMhbBCkUNAmHYyVa0TlljxXivIWFYWGfzZLktUBRcbrM/64L7PcOEw1TaShxz0zyJ1Lth5udCZUaaQ4KFxPZcNOFLDny9PG6RjH+qgdfJbOlnMQCFhvYqMTEunsZpDTATR2jasghGLrpL6b30kdd4/glU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nWf6BkRt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JUa2I3DQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nWf6BkRt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JUa2I3DQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nWf6BkRt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JUa2I3DQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nWf6BkRt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JUa2I3DQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 763E1210F6;
	Thu, 19 Jun 2025 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750332880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HyDUks/3HBCcDKyjeU3On+lhhKFqES47w+fmEVXl3lM=;
	b=nWf6BkRtEZVYi7wKUHvQ6uO4zXDPR1YPYMppq5S5SUpHrk/ylzTnH7ri7VuLRh3J9z6IwF
	Fglg6ijfeWl3/VBFKMngR8+reAZAxiHAucQ9tAVPwG1ucB/eetlV6BwEz2nKq3JyrdXUqM
	kVoHCtLSqEP7PG9atBLoSh8SgxQJeDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750332880;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HyDUks/3HBCcDKyjeU3On+lhhKFqES47w+fmEVXl3lM=;
	b=JUa2I3DQaofWBLWLhOOG9mlKpHeT8IKAIWjGCr7lqgjBajX5GzlPuui0jP/73D6Bo7xhFB
	C3HtbGQB9fcBq/Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nWf6BkRt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JUa2I3DQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750332880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HyDUks/3HBCcDKyjeU3On+lhhKFqES47w+fmEVXl3lM=;
	b=nWf6BkRtEZVYi7wKUHvQ6uO4zXDPR1YPYMppq5S5SUpHrk/ylzTnH7ri7VuLRh3J9z6IwF
	Fglg6ijfeWl3/VBFKMngR8+reAZAxiHAucQ9tAVPwG1ucB/eetlV6BwEz2nKq3JyrdXUqM
	kVoHCtLSqEP7PG9atBLoSh8SgxQJeDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750332880;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HyDUks/3HBCcDKyjeU3On+lhhKFqES47w+fmEVXl3lM=;
	b=JUa2I3DQaofWBLWLhOOG9mlKpHeT8IKAIWjGCr7lqgjBajX5GzlPuui0jP/73D6Bo7xhFB
	C3HtbGQB9fcBq/Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21149139CE;
	Thu, 19 Jun 2025 11:34:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PjSoBtD1U2hKbQAAD6G6ig
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
Subject: [PATCH 0/2] drm/tegra: Avoid using import_attach directly
Date: Thu, 19 Jun 2025 13:26:59 +0200
Message-ID: <20250619113100.70292-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 763E1210F6
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,linaro.org,amd.com,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.51
X-Spam-Level: 

The field import_attach of struct drm_gem_object is often only
required by PRIME code. In other places, replace its use with
clearer alternatives.

Thomas Zimmermann (2):
  drm/tegra: Test for imported buffers with drm_gem_is_imported()
  drm/tegra: Use dma_buf from GEM object instance

 drivers/gpu/drm/tegra/gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.49.0

