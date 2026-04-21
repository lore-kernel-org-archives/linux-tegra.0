Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2254A2BE05F
	for <linux-tegra@vger.kernel.org>; Tue, 21 Apr 2026 07:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776757022; cv=none; b=eVvX+x/GFCnINAwn3/xYH9smVVycXMykLgYSMk8jFuQEO3K+CPZjwMpzZ2syJwdifPtTFtZWPTpA7910w/uv9m3sS2wAx6RJ1JF71GGdzH+3HsOrh/aApiSaSEN8h2cRUEWgvqUjbplgzO2Uko71it5elE3wGi2e4BrMwYIHrIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776757022; c=relaxed/simple;
	bh=2Y71Fuq1cJ+NX/BIrlBqRNhzV0Y4ru/jZBDrEERBt0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ch3TDHPo5xt9JPJE+RyoCMOpdQ2zNejfJ8nGh+M9hBZntFjsp+qI2lKyBZizK/w67pJkVSlGWvfiGoKLQU7oc6SY4EKWIjYzXnOLtY5Owfyoviu4kxE5ByAb5wlcScSPb3FRe2dB4sGmCXubgKqJB5H2r78m1XJ0scc2mXjCfgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F94z7EZT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UwjbWBZo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qkJO7Wt8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t4uG7ERH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F94z7EZT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UwjbWBZo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qkJO7Wt8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t4uG7ERH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D552E6A7F6;
	Tue, 21 Apr 2026 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776757013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TW/MzDOP2ENkPQEJeTMl2b4EFrH1v4tbff2C8jt/ppA=;
	b=F94z7EZTjZ+8nHWatUcTqXdpqWkEXFIiPFYVwJiVti4IJ/MAvpwpRRYSkAtIaWkEzReq4V
	bEuX93N6SrgNDGDo/ykgcDzJIXGWFd7vO64y+VKU92ZrG+ExoWuqhWrCB8IJrxhnRLgNKd
	S4iXSh6kgnZJ9Vr1fvvFo+lhMlj4ptM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776757013;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TW/MzDOP2ENkPQEJeTMl2b4EFrH1v4tbff2C8jt/ppA=;
	b=UwjbWBZoM/t2RY4NHr457lIbgfBSU06UI+3lxjxCWG9yLnVZaGC1sbh2QH/db3not/C654
	Rz08viUdSN5jr3Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776757012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TW/MzDOP2ENkPQEJeTMl2b4EFrH1v4tbff2C8jt/ppA=;
	b=qkJO7Wt83pYkXMp2l6M3SWZ03ttzOvTeJ6lonfeq/D30+JpAg9+IT86esOFv+Ldaw9oqJT
	D3jmiM7PZGn2TISOcvsn/Ge3qQydl789BPSweb5iGccLch9cpW4MCLpDwovCMMt3yW76Zm
	81c6aenK9dolLkuKr9Jhh2HuDX0+E8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776757012;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TW/MzDOP2ENkPQEJeTMl2b4EFrH1v4tbff2C8jt/ppA=;
	b=t4uG7ERHxpDpnlOKKFuKwkfn6/+Jf+mIaOHbRYRbZJwWsArkIpX7h6BFIRd0v3+7fU86ua
	isV7D4Klce9go5Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E445593AF;
	Tue, 21 Apr 2026 07:36:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YZCrERQp52lgMQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 21 Apr 2026 07:36:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] drm/tegra: fbdev: Use client buffers
Date: Tue, 21 Apr 2026 09:29:04 +0200
Message-ID: <20260421073646.144712-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spam-Level: 

A client buffer holds the DRM framebuffer for an in-kernel DRM
client. Until now, tegra created an internal ad-hoc framebuffer for
its fbdev emulation, while by-passing the regular interfaces used by
user-space compositors.

Convert tegra's fbdev emulation to use client buffers. Replacing the
existing code with a client buffer allows for stream-lining tegra code
and later also the fbdev helpers. The new framebuffer will be registered
against the client's file and will support handles for GEM objects. It
is then just another framebuffer within the DRM ecosystem.

Patches 1 and 2 fix problems in the fbdev-emulation code.

Patches 3 and 4 convert fbdev emulation to shared DRM interfaces and
client buffers.

Patch 5 cleans up.

Thomas Zimmermann (5):
  drm/tegra: fbdev: Do not assign to struct drm_fb_helper.info
  drm/tegra: fbdev: Remove offset into framebuffer memory
  drm/tegra: fbdev: Calculate buffer geometry with format helpers
  drm/tegra: fbdev: Use a DRM client buffer
  drm/tegra: Make tegra_fb_alloc() an internal interface

 drivers/gpu/drm/tegra/drm.h   |  5 --
 drivers/gpu/drm/tegra/fb.c    |  1 +
 drivers/gpu/drm/tegra/fbdev.c | 88 ++++++++++++++++++-----------------
 3 files changed, 47 insertions(+), 47 deletions(-)

-- 
2.53.0

