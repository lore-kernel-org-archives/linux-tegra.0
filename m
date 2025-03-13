Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A9A194080
	for <linux-tegra@vger.kernel.org>; Thu, 13 Mar 2025 17:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887738; cv=none; b=OUutVQr1CesnrdUlOZK9w8yQmVy/Iuqm7pHp4LW/6eMPM0gqdmAL4/jVqB00PABC2sRaCBuLakCLsKNUd6u5dVdZVbIFmjExO4FijzxjILUlnqWOlQsbskzPevJAqA8mZDC5qAiL/l2So/vThJpHLl8jl2OKHqowCW0PD1y1jwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887738; c=relaxed/simple;
	bh=UygM9HkSavW5eORA2rgph5rCbxsItWJm3UmJv9FhkhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QYcKbXf1cgUGX9bLg7BjDm388fq8sFX0hKPWFlT7l/oioec30oec2aVyp3q5m3RToQGrZ33zN7F5/ClNeDKD0YlTXdCf26T4QJGheaU6Kj+6L+jnT7S5TmRjZ5adn6sJ6zvBUjzM+ACGfOLQwahu3AqG8OLNdyEwFE5ky4fRjWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q6A3Rn1L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7yGnwBaz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q6A3Rn1L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7yGnwBaz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q6A3Rn1L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7yGnwBaz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q6A3Rn1L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7yGnwBaz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 428C4211FE;
	Thu, 13 Mar 2025 17:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ykk5inm0GX5Tutd8RGem8eSxAty+l/BUOcBAuDiiIzU=;
	b=Q6A3Rn1LbhTKiUYqpG+8CzhNY4ABFbg+Q3/wsbA2z8UtV8An7ag3QvhIfuQkNrY6JvJgBE
	Izn2Y+MdffNpw1etIVXfemX2G/SWI3DXu2uAWGnrtam5cCWilk3n1xAd6yrsrkuzbBCN+5
	u7Zs3xBAjbLhz/GQV/C6WoSx7empq3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ykk5inm0GX5Tutd8RGem8eSxAty+l/BUOcBAuDiiIzU=;
	b=7yGnwBazAjcdS06ivYFWHq+JLTRJoFKTO1Jay8ybxEAZJp3lJd6ZTHdxTytzeFCvGUNAvY
	WTUgx1RBWM5c3EAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Q6A3Rn1L;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7yGnwBaz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ykk5inm0GX5Tutd8RGem8eSxAty+l/BUOcBAuDiiIzU=;
	b=Q6A3Rn1LbhTKiUYqpG+8CzhNY4ABFbg+Q3/wsbA2z8UtV8An7ag3QvhIfuQkNrY6JvJgBE
	Izn2Y+MdffNpw1etIVXfemX2G/SWI3DXu2uAWGnrtam5cCWilk3n1xAd6yrsrkuzbBCN+5
	u7Zs3xBAjbLhz/GQV/C6WoSx7empq3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ykk5inm0GX5Tutd8RGem8eSxAty+l/BUOcBAuDiiIzU=;
	b=7yGnwBazAjcdS06ivYFWHq+JLTRJoFKTO1Jay8ybxEAZJp3lJd6ZTHdxTytzeFCvGUNAvY
	WTUgx1RBWM5c3EAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C0B2137BA;
	Thu, 13 Mar 2025 17:42:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SNmhBfEY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 86/89] ASoC: tegra30: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:41:31 +0100
Message-ID: <20250313174139.29942-87-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313174139.29942-1-tiwai@suse.de>
References: <20250313174139.29942-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 428C4211FE
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: linux-tegra@vger.kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/tegra/tegra30_ahub.c | 13 ++++++-------
 sound/soc/tegra/tegra30_i2s.c  | 13 ++++++-------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index c9b52f54cea8..51e5ab6c276b 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -40,7 +40,7 @@ static inline void tegra30_audio_write(u32 reg, u32 val)
 	regmap_write(ahub->regmap_ahub, reg, val);
 }
 
-static __maybe_unused int tegra30_ahub_runtime_suspend(struct device *dev)
+static int tegra30_ahub_runtime_suspend(struct device *dev)
 {
 	regcache_cache_only(ahub->regmap_apbif, true);
 	regcache_cache_only(ahub->regmap_ahub, true);
@@ -61,7 +61,7 @@ static __maybe_unused int tegra30_ahub_runtime_suspend(struct device *dev)
  * stopping streams should dynamically adjust the clock as required.  However,
  * this is not yet implemented.
  */
-static __maybe_unused int tegra30_ahub_runtime_resume(struct device *dev)
+static int tegra30_ahub_runtime_resume(struct device *dev)
 {
 	int ret;
 
@@ -600,10 +600,9 @@ static void tegra30_ahub_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra30_ahub_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra30_ahub_runtime_suspend,
-			   tegra30_ahub_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra30_ahub_runtime_suspend,
+		       tegra30_ahub_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra30_ahub_driver = {
@@ -612,7 +611,7 @@ static struct platform_driver tegra30_ahub_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = tegra30_ahub_of_match,
-		.pm = &tegra30_ahub_pm_ops,
+		.pm = pm_ptr(&tegra30_ahub_pm_ops),
 	},
 };
 module_platform_driver(tegra30_ahub_driver);
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 0d3badfbe143..b121af9ef8ed 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -35,7 +35,7 @@
 
 #define DRV_NAME "tegra30-i2s"
 
-static __maybe_unused int tegra30_i2s_runtime_suspend(struct device *dev)
+static int tegra30_i2s_runtime_suspend(struct device *dev)
 {
 	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
 
@@ -46,7 +46,7 @@ static __maybe_unused int tegra30_i2s_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int tegra30_i2s_runtime_resume(struct device *dev)
+static int tegra30_i2s_runtime_resume(struct device *dev)
 {
 	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
 	int ret;
@@ -547,17 +547,16 @@ static void tegra30_i2s_platform_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra30_i2s_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra30_i2s_runtime_suspend,
-			   tegra30_i2s_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra30_i2s_runtime_suspend,
+		       tegra30_i2s_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra30_i2s_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = tegra30_i2s_of_match,
-		.pm = &tegra30_i2s_pm_ops,
+		.pm = pm_ptr(&tegra30_i2s_pm_ops),
 	},
 	.probe = tegra30_i2s_platform_probe,
 	.remove = tegra30_i2s_platform_remove,
-- 
2.43.0

