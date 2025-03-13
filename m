Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52CD1AAE17
	for <linux-tegra@vger.kernel.org>; Thu, 13 Mar 2025 17:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887732; cv=none; b=g6CRp3eTHLREfwtB555grDkqWyExHWCQyHVSvdDu3GZ+S2DMQUkjBBweRTqcAYmsigTi/INIhMbhylIt693uC/hOCAKgeNuF6KsI32JHE8Y1zN6bJ37h7aKPrzwlPq7ls+6RdGxIaHu1bjAUOuBBTKpmV8guxAzqVkOheL7n8e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887732; c=relaxed/simple;
	bh=TJrd6RoTEXVna6WdAiw4BMIpBFKHdpUX5MN1/we8FPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sc2eS94OMZ008Gas8u5nWbTsStflGXvf0yqBkzBjbjHaAFBy1TVmP3Qxg1KebpJGXdlWWDkeGpVIMQt3EKg12wH66o881CdIkxD+gPq3ufIjHofmjR8x3XiNUV24bvwfZAE8uaCq4xc+csh40+K0M3YJfLu2UWTAJPu4r4F5foo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wdEmAgkK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+C+jhO5+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wdEmAgkK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+C+jhO5+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wdEmAgkK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+C+jhO5+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wdEmAgkK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+C+jhO5+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 20CE9211FD;
	Thu, 13 Mar 2025 17:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PI0KwWmVuhJxiabpkOD4eBGyep2DguTNqxaoLv52Tu4=;
	b=wdEmAgkKnaf49a83KnI9kVOKGQmPNP91j4yJtUJB7Sq2PUDOxdTKXXjt/Q3ng40t72gZIT
	t+Hv/KntERPT5oOBrFT8xkRnL9FTOAD+aFL/RFi/3WHpYTPqT+MZQd+7hJLzP2d2J794pU
	33nX+Fs761q/pwxvYs0z/fFZqo14fg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PI0KwWmVuhJxiabpkOD4eBGyep2DguTNqxaoLv52Tu4=;
	b=+C+jhO5+UblVM4OxjLyq0HFpjgdfND/UCwGKfYWz34i8BdRi2EqN8ZXOK+D9kmNuE1S8LV
	jLcJCiwe4VpU9VDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PI0KwWmVuhJxiabpkOD4eBGyep2DguTNqxaoLv52Tu4=;
	b=wdEmAgkKnaf49a83KnI9kVOKGQmPNP91j4yJtUJB7Sq2PUDOxdTKXXjt/Q3ng40t72gZIT
	t+Hv/KntERPT5oOBrFT8xkRnL9FTOAD+aFL/RFi/3WHpYTPqT+MZQd+7hJLzP2d2J794pU
	33nX+Fs761q/pwxvYs0z/fFZqo14fg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PI0KwWmVuhJxiabpkOD4eBGyep2DguTNqxaoLv52Tu4=;
	b=+C+jhO5+UblVM4OxjLyq0HFpjgdfND/UCwGKfYWz34i8BdRi2EqN8ZXOK+D9kmNuE1S8LV
	jLcJCiwe4VpU9VDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E39AA139D2;
	Thu, 13 Mar 2025 17:42:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iOJPNvAY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 85/89] ASoC: tegra20: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:41:30 +0100
Message-ID: <20250313174139.29942-86-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
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
 sound/soc/tegra/tegra20_i2s.c   | 13 ++++++-------
 sound/soc/tegra/tegra20_spdif.c | 13 ++++++-------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 3b9823d1a87a..51df0835ce3e 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -34,7 +34,7 @@
 
 #define DRV_NAME "tegra20-i2s"
 
-static __maybe_unused int tegra20_i2s_runtime_suspend(struct device *dev)
+static int tegra20_i2s_runtime_suspend(struct device *dev)
 {
 	struct tegra20_i2s *i2s = dev_get_drvdata(dev);
 
@@ -45,7 +45,7 @@ static __maybe_unused int tegra20_i2s_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int tegra20_i2s_runtime_resume(struct device *dev)
+static int tegra20_i2s_runtime_resume(struct device *dev)
 {
 	struct tegra20_i2s *i2s = dev_get_drvdata(dev);
 	int ret;
@@ -487,17 +487,16 @@ static const struct of_device_id tegra20_i2s_of_match[] = {
 };
 
 static const struct dev_pm_ops tegra20_i2s_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra20_i2s_runtime_suspend,
-			   tegra20_i2s_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra20_i2s_runtime_suspend,
+		       tegra20_i2s_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra20_i2s_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = tegra20_i2s_of_match,
-		.pm = &tegra20_i2s_pm_ops,
+		.pm = pm_ptr(&tegra20_i2s_pm_ops),
 	},
 	.probe = tegra20_i2s_platform_probe,
 	.remove = tegra20_i2s_platform_remove,
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 380011233eb1..38661d9b4a7c 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -25,7 +25,7 @@
 
 #include "tegra20_spdif.h"
 
-static __maybe_unused int tegra20_spdif_runtime_suspend(struct device *dev)
+static int tegra20_spdif_runtime_suspend(struct device *dev)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
 
@@ -36,7 +36,7 @@ static __maybe_unused int tegra20_spdif_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int tegra20_spdif_runtime_resume(struct device *dev)
+static int tegra20_spdif_runtime_resume(struct device *dev)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
 	int ret;
@@ -403,10 +403,9 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra20_spdif_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra20_spdif_runtime_suspend,
-			   tegra20_spdif_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra20_spdif_runtime_suspend,
+		       tegra20_spdif_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct of_device_id tegra20_spdif_of_match[] = {
@@ -418,7 +417,7 @@ MODULE_DEVICE_TABLE(of, tegra20_spdif_of_match);
 static struct platform_driver tegra20_spdif_driver = {
 	.driver = {
 		.name = "tegra20-spdif",
-		.pm = &tegra20_spdif_pm_ops,
+		.pm = pm_ptr(&tegra20_spdif_pm_ops),
 		.of_match_table = tegra20_spdif_of_match,
 	},
 	.probe = tegra20_spdif_platform_probe,
-- 
2.43.0

