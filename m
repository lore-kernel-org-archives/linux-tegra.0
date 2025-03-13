Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784CC18CBE1
	for <linux-tegra@vger.kernel.org>; Thu, 13 Mar 2025 17:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887732; cv=none; b=NBifLeq3hUAtlrSWJMh03jG0ePwdA/w1rLbt2TzJUXDB+dhqC5bhBuhb3rUDfw/mUN4qqchCB+Vh//5sjJKf4faS49yferhV3i8N/O9EaKzLsmTeiyzMrUvn+/Y52dIWFXRLhz1M7WQ1AaCzqM+xitywvmxYd6JGz4LBWxwA88A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887732; c=relaxed/simple;
	bh=RsA9j94p+YVvKdB90cd3Q/61+ZX91AldYwaYz9pEC0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9+i8KFP9SDplb8rBfEELmqCY4sZWbv4fuawFk9xZUC2N8nlotvip9uYSycC79/E4VyFrLkcgBozSNQCcicGCN5yMkZQ88iGVe2a3g7WJepDDRRZUMniNhfzUtd/NlNThxeHx39pX8BH87ckNAC/edIOAG3P4KoQQA/+zLS4am4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ykQTyMem; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=549nby3B; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ykQTyMem; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=549nby3B; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ykQTyMem";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="549nby3B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ykQTyMem";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="549nby3B"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B13611F7B4;
	Thu, 13 Mar 2025 17:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFKEjjkIm78Ad6srk/hCg61amYwn0Z51tJngkFiWp6I=;
	b=ykQTyMemgcDeUgX3A1DRVqRAcDbTN1CFSySAqMMOPcHtUZX0SNSR22wfzUj5p9kMxcMCw7
	ibNpQ7U+gxZHsk8CjbB+UwaozPXqDZXqlh1HLp8mAW4EFtR0+X0Nh6dS0UHqnc+MpZxepm
	LzcWgqAeMpN/R9WQpYXdL6EN1/1E2BE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFKEjjkIm78Ad6srk/hCg61amYwn0Z51tJngkFiWp6I=;
	b=549nby3BsSdxF4qgTF03aqvKCUWfK6YYKyV+fmMoM/hscJjKMtYEpkmQJGplyZgWXW2J2v
	B8GJULBPBeY9gOCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ykQTyMem;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=549nby3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFKEjjkIm78Ad6srk/hCg61amYwn0Z51tJngkFiWp6I=;
	b=ykQTyMemgcDeUgX3A1DRVqRAcDbTN1CFSySAqMMOPcHtUZX0SNSR22wfzUj5p9kMxcMCw7
	ibNpQ7U+gxZHsk8CjbB+UwaozPXqDZXqlh1HLp8mAW4EFtR0+X0Nh6dS0UHqnc+MpZxepm
	LzcWgqAeMpN/R9WQpYXdL6EN1/1E2BE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFKEjjkIm78Ad6srk/hCg61amYwn0Z51tJngkFiWp6I=;
	b=549nby3BsSdxF4qgTF03aqvKCUWfK6YYKyV+fmMoM/hscJjKMtYEpkmQJGplyZgWXW2J2v
	B8GJULBPBeY9gOCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A9C113A24;
	Thu, 13 Mar 2025 17:42:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EBpRIPAY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 83/89] ASoC: tegra186: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:41:28 +0100
Message-ID: <20250313174139.29942-84-tiwai@suse.de>
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
X-Rspamd-Queue-Id: B13611F7B4
X-Spam-Score: -3.01
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: linux-tegra@vger.kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/tegra/tegra186_asrc.c | 13 ++++++-------
 sound/soc/tegra/tegra186_dspk.c | 13 ++++++-------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index d914dba56013..5c67e1f01d9b 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -76,7 +76,7 @@ static void tegra186_asrc_lock_stream(struct tegra186_asrc *asrc,
 		     1);
 }
 
-static int __maybe_unused tegra186_asrc_runtime_suspend(struct device *dev)
+static int tegra186_asrc_runtime_suspend(struct device *dev)
 {
 	struct tegra186_asrc *asrc = dev_get_drvdata(dev);
 
@@ -86,7 +86,7 @@ static int __maybe_unused tegra186_asrc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra186_asrc_runtime_resume(struct device *dev)
+static int tegra186_asrc_runtime_resume(struct device *dev)
 {
 	struct tegra186_asrc *asrc = dev_get_drvdata(dev);
 	int id;
@@ -1021,17 +1021,16 @@ static void tegra186_asrc_platform_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra186_asrc_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra186_asrc_runtime_suspend,
-			   tegra186_asrc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra186_asrc_runtime_suspend,
+		       tegra186_asrc_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra186_asrc_driver = {
 	.driver = {
 		.name = "tegra186-asrc",
 		.of_match_table = tegra186_asrc_of_match,
-		.pm = &tegra186_asrc_pm_ops,
+		.pm = pm_ptr(&tegra186_asrc_pm_ops),
 	},
 	.probe = tegra186_asrc_platform_probe,
 	.remove = tegra186_asrc_platform_remove,
diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index 1be6c09cbe1a..21fdab2a1977 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -181,7 +181,7 @@ static int tegra186_dspk_put_stereo_to_mono(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static int __maybe_unused tegra186_dspk_runtime_suspend(struct device *dev)
+static int tegra186_dspk_runtime_suspend(struct device *dev)
 {
 	struct tegra186_dspk *dspk = dev_get_drvdata(dev);
 
@@ -193,7 +193,7 @@ static int __maybe_unused tegra186_dspk_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra186_dspk_runtime_resume(struct device *dev)
+static int tegra186_dspk_runtime_resume(struct device *dev)
 {
 	struct tegra186_dspk *dspk = dev_get_drvdata(dev);
 	int err;
@@ -532,17 +532,16 @@ static void tegra186_dspk_platform_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra186_dspk_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra186_dspk_runtime_suspend,
-			   tegra186_dspk_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra186_dspk_runtime_suspend,
+		       tegra186_dspk_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra186_dspk_driver = {
 	.driver = {
 		.name = "tegra186-dspk",
 		.of_match_table = tegra186_dspk_of_match,
-		.pm = &tegra186_dspk_pm_ops,
+		.pm = pm_ptr(&tegra186_dspk_pm_ops),
 	},
 	.probe = tegra186_dspk_platform_probe,
 	.remove = tegra186_dspk_platform_remove,
-- 
2.43.0

