Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541BB35DA69
	for <linux-tegra@vger.kernel.org>; Fri, 25 Sep 2026 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790320811; cv=none; b=lj3MGzfiuszWG349c5faYzTN8VB0VFh1dzfKSRc2N9qmrwlumHsiV/mNoQr0kbMS06q4XLO1CE0R8qqRyuQqM93Z9JQ28goQa3pmSweJ3S0jLDlLOOSnXc+bk/WRSfpLGHrFyuSUPwkEwrPvi4YEdyllFFrBJENPD13djWtJuiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790320811; c=relaxed/simple;
	bh=4zU9JPdVMKluyDoQmj/gqX9z47DVQ2L6nwBG7efEAWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mo056u0pP3gW8/5fcX3qetGNGf+0Z/I2dYxIQi8jYYfSZGGwd4oz0axSmrAQqvYOsuDs76CaB88sT0TbdTiyDlWSLzEcfn9IKNnOT4nlzyjORTUXZTJdO9RmSKTxPo3AF18jdYYYdE+qPsZZzoF6VPaKyUF/uRQ4FEsEvauKIGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lBXUEb7w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YgiCAMCD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mc/BboeH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1FOgy90o; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lBXUEb7w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YgiCAMCD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mc/BboeH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1FOgy90o"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8FBA61FAC1;
	Fri, 25 Sep 2026 07:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790320781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=imALhq4jj8+fxTRPlYWR+7ISiJsVwauG1/P60fRyxNY=;
	b=lBXUEb7wr5CYYbFkrkaqJJSOQqabySDvF5iIx7v0A2uwrih6MgcRrBNQj0OiyiYKdcd153
	p54zyhheFFAQ9xAEl6VIMi4dDHbX0u/iRlE9AB67gFC6TlQ7Mr1xKnEzdsARBA5QxjFlxy
	pj4eBN5rmFq2xyJIplEYX+LhbKbJmSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790320781;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=imALhq4jj8+fxTRPlYWR+7ISiJsVwauG1/P60fRyxNY=;
	b=YgiCAMCDl+zcWFbeh/KBGhvLbG78Scz/cgMpeWX3ElX8Dy21zwOgFRGFCdNxK6CS4Wh0Ts
	lkdYQ3V8pS+AJxDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790320777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=imALhq4jj8+fxTRPlYWR+7ISiJsVwauG1/P60fRyxNY=;
	b=Mc/BboeHhILYj8SG99c7btg5J/EuB1qSQUnfCle2USbRc3PpSrzudEpjpcPIC+SeKlGHOM
	kQJyv+ro1CvWVJZ7XLZFTWF9Axu5EK7h7qz37NZE2H+sDxI9+ip0rMH11uEPJ8pz5ZLCsK
	QnvpUswAtL2yvjlWTSTtjOMG4SoqQm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790320777;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=imALhq4jj8+fxTRPlYWR+7ISiJsVwauG1/P60fRyxNY=;
	b=1FOgy90oTnHYanRtWvovf3ySit+xQQ+Vq70bWJkean9ICMDH6wXAeoM/ukY4Yn+iBvo6n7
	SP0slwiulIPX3bBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9F3D1389C;
	Fri, 25 Sep 2026 07:19:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5u4JJoggtmpbBQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 25 Sep 2026 07:19:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	jani.nikula@linux.intel.com,
	Alexander.Deucher@amd.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/2] drm/fbdev: Move helpers to clients/ subdirectory
Date: Fri, 25 Sep 2026 09:17:48 +0200
Message-ID: <20260925071933.44283-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,amd.com];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLq3cifbxyhc6qbbynzfc6amns)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]

Helpers for fbdev emulation are still linked into drm_kms_helper.ko,
which is for mode setting. Move the source and header files to the
clients/ subdirectory and link them into drm_client_lib.ko. This has
some fallout throughout drivers, but it's all trivial.

There are 3 module parameters to drm_kms_helper.ko that control fbdev
emulation. For compatibility with existing installations, leave them
in this module.

v3:
- remove obsolete dependencies from Kconfig
v2:
- update armada and docs

Thomas Zimmermann (2):
  drm/fbdev: Move fbdev module parameters next to module init
  drm/fbdev: Move fbdev helpers into client library

 Documentation/gpu/drm-kms-helpers.rst         |  6 +--
 drivers/gpu/drm/Kconfig                       |  4 --
 drivers/gpu/drm/Makefile                      |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  2 +-
 drivers/gpu/drm/armada/armada_fbdev.c         |  2 +-
 drivers/gpu/drm/clients/Makefile              |  3 +-
 drivers/gpu/drm/clients/drm_fbdev_client.c    |  2 +-
 .../drm_fbdev_helper.c}                       | 34 +---------------
 drivers/gpu/drm/drm_crtc_helper_internal.h    |  9 +++++
 drivers/gpu/drm/drm_fbdev_dma.c               |  2 +-
 drivers/gpu/drm/drm_fbdev_shmem.c             |  2 +-
 drivers/gpu/drm/drm_fbdev_ttm.c               |  2 +-
 drivers/gpu/drm/drm_kms_helper_common.c       | 39 +++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  2 +-
 drivers/gpu/drm/gma500/fbdev.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 drivers/gpu/drm/msm/msm_debugfs.c             |  2 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  1 -
 drivers/gpu/drm/omapdrm/omap_debugfs.c        |  2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c          |  2 +-
 drivers/gpu/drm/radeon/radeon_device.c        |  2 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c         |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  2 +-
 drivers/gpu/drm/sitronix/st7571.c             |  1 -
 drivers/gpu/drm/tegra/fbdev.c                 |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |  2 +-
 .../drm_fbdev_helper.h}                       |  4 +-
 29 files changed, 76 insertions(+), 64 deletions(-)
 rename drivers/gpu/drm/{drm_fb_helper.c => clients/drm_fbdev_helper.c} (97%)
 rename include/drm/{drm_fb_helper.h => clients/drm_fbdev_helper.h} (99%)


base-commit: ff831af91674990f9f1814340860e96943d5df1a
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: a5a973e527c88a5b47053d7a72aefe0b550197cb
prerequisite-patch-id: b9adc9622920a3e70168e672c2c92795b3e3a106
prerequisite-patch-id: 5030de433a01c2e99056cadb676a8e2ba35f055a
-- 
2.55.0

