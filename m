Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FDA2288F4
	for <linux-tegra@vger.kernel.org>; Mon, 17 Mar 2025 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205391; cv=none; b=rJ5IE4phWG7NpxNPCyMuq+cJO5prxCeq8c8VqpKSTc7Y1FYwY6VZT7QDCvRQileNU/IAuLGxfsQR/Bf2J9j3syUBZb+Je02SoeG5BZfZ3g+48hXUTERO5q40p/IbX1JKPv+SxW3ESJ5NSF8Nq4afeN5aC5xYjzhaSupfekap/Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205391; c=relaxed/simple;
	bh=TJrd6RoTEXVna6WdAiw4BMIpBFKHdpUX5MN1/we8FPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y39QrWb/xp6SYuDnv0eQRn17EJBY6TCQ6ta9EGGACL4tm8qpQ3GPiQAkHo3R7JnvaZHzWcXx5wFtkWFdFiPjekNQP/jhSDmgOIP+e0gg9F+sdBJbxJTCo3DVUthR62MSu/kGshuYqrnHyyggNGxSrtluNEs/MYvcFaqNuPIvGaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 46C5A20244;
	Mon, 17 Mar 2025 09:56:28 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F94A13A2C;
	Mon, 17 Mar 2025 09:56:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2JN5Bszx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 84/88] ASoC: tegra20: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:55:46 +0100
Message-ID: <20250317095603.20073-85-tiwai@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 46C5A20244
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

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

