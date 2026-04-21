Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6BD31F9B4
	for <linux-tegra@vger.kernel.org>; Tue, 21 Apr 2026 07:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776757028; cv=none; b=qBGUx9GBLEHQN0EM026DXOSw9mExK5l7WY8YGIjLz4yaUB2GKsvZ7xXJCboPQIkiYP4k97OVdENaenaTB0nA6a+8yOtYO33+t5RpDgYzajiO/W09SC8HZSHonMC35RcOsL6UvVpj2luCT92NR814NaA9Ake3EDPcrsvaaDa3H1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776757028; c=relaxed/simple;
	bh=kVaNdiUFr2yls7aiJ9yXpOGD3XYGc3dAJItm7TA1dbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RITSgAWFq1OnwkoaDZ2QheVwYtXGkyB6y5NrCMkEO4+UrqEuQ7vU0a/FV5UvuYJ5TWm3ydmwQNFuj4Cmj/0jhfnWecXkuX5vkbWcIvMjDjyZW8jF8Dw+3ox1JTsX+o9pyiVk4+Idny3Z9kxWT4YS2I89I7ptFRT7pvs4m0K3n2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4CE646A7F5;
	Tue, 21 Apr 2026 07:36:54 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0FA4F593B0;
	Tue, 21 Apr 2026 07:36:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8FObAhUp52lgMQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 21 Apr 2026 07:36:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/5] drm/tegra: fbdev: Do not assign to struct drm_fb_helper.info
Date: Tue, 21 Apr 2026 09:29:05 +0200
Message-ID: <20260421073646.144712-2-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 4CE646A7F5
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

That field already contains the value being assigned. No need to do
this twice.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 63c971af4036 ("drm/fb-helper: Allocate and release fb_info in single place")
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/fbdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index 8f40882aa76e..19e39fa54bfa 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -110,7 +110,6 @@ int tegra_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 
 	helper->funcs = &tegra_fbdev_helper_funcs;
 	helper->fb = fb;
-	helper->info = info;
 
 	info->fbops = &tegra_fb_ops;
 
-- 
2.53.0

