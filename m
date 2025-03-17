Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF58229B2D
	for <linux-tegra@vger.kernel.org>; Mon, 17 Mar 2025 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205404; cv=none; b=s7LPupV4TOYRpwCtfItQiR6rfV0MhnIBOPLHSAwoKvOtU9XC2QgTsd6CPC0MZEbQ4e/bRf3VC19zSUklBR4jPmUDkXXakeXs11+gYQIH0OJqPaIcwalfv3vq+nbVQIj6DzJYUZn9bQrLFS/wfoSrVYXWZ3VVCYBRToplBDcMzi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205404; c=relaxed/simple;
	bh=UygM9HkSavW5eORA2rgph5rCbxsItWJm3UmJv9FhkhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdVJnYdnwF+9keORi30LteJCDk7pv27roofIkLdujSxBugKK+U9skcMA5/anwa97eDPwWd83IYN1yEfD4PojcpYpNmPLzQ8av38ATkbtAbE8Y8pu/vHKu8LNq0i3ph0fiM4j4mhPUNAhjTYUyoCUWbZ7vbEMpFspG33guEze2Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ygbXgfGL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z5gowzmZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ygbXgfGL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z5gowzmZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ygbXgfGL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z5gowzmZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ygbXgfGL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z5gowzmZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7099E2218D;
	Mon, 17 Mar 2025 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ykk5inm0GX5Tutd8RGem8eSxAty+l/BUOcBAuDiiIzU=;
	b=ygbXgfGL+FxjU1wYFLPCGiItyczS2DhQ/rxK/t6ekqjJq/COePvLSaRjw6nwxPMUKSgXBv
	7CvKoTvYWX/rAKPYM46HWPgwlPmeYLznpqueD9pdUC9i5l5TfMJ2KlKsbgqj6Qgtcc8Tmz
	4VYU6zITfX/U7COZjZJKyPkiLcI9L8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205388;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ykk5inm0GX5Tutd8RGem8eSxAty+l/BUOcBAuDiiIzU=;
	b=z5gowzmZ/ngu8c5+eZxWgMpQ7NbJgj937Z2RusVQH/+A8PXGulQ5T+Q5obAwfiQnkzkeZW
	mz2IzOETifyIugCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ykk5inm0GX5Tutd8RGem8eSxAty+l/BUOcBAuDiiIzU=;
	b=ygbXgfGL+FxjU1wYFLPCGiItyczS2DhQ/rxK/t6ekqjJq/COePvLSaRjw6nwxPMUKSgXBv
	7CvKoTvYWX/rAKPYM46HWPgwlPmeYLznpqueD9pdUC9i5l5TfMJ2KlKsbgqj6Qgtcc8Tmz
	4VYU6zITfX/U7COZjZJKyPkiLcI9L8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205388;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ykk5inm0GX5Tutd8RGem8eSxAty+l/BUOcBAuDiiIzU=;
	b=z5gowzmZ/ngu8c5+eZxWgMpQ7NbJgj937Z2RusVQH/+A8PXGulQ5T+Q5obAwfiQnkzkeZW
	mz2IzOETifyIugCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BAD6132CF;
	Mon, 17 Mar 2025 09:56:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8KE0Eczx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 85/88] ASoC: tegra30: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:55:47 +0100
Message-ID: <20250317095603.20073-86-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317095603.20073-1-tiwai@suse.de>
References: <20250317095603.20073-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
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

