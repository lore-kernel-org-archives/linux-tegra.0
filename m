Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1805C290BC4
	for <linux-tegra@vger.kernel.org>; Thu, 31 Jul 2025 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953075; cv=none; b=jUTyovjqs4xt+3Qc9AbKwXLUBU9jBHB6L95nSRlcA76W6f2aQN9XYlwNtid1ho5fI4+EFU+xI9eUL1YVz7Th4lmN3tgAbyjVNkozf6gCn+oztkvePT3kr+OWbuQ3ngJjHPvJqb/zp71UmEMI39DDI/ZPm4cwM1xW5da+t3BYXV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953075; c=relaxed/simple;
	bh=dZcQBOI9ETYE8hlXwAq2LbPQYDIdVxr0PY241hOh3Fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJ3IvBr6hrGG1EMei9zmFpiVjrz7LqQ4OWucSJWqpK0JKiz1k6LyP93mFYQWO8BY42TH3aU6Hjs5ChoC3JmSHtyhI+l/Fg1psFY3jx3L1s1q1zwvoeoCuc31Zzkyt808tTasY9y2ivY4H/0qZ+/GTNxmCiqQwifjqou/S32OIr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v3SeA3Td; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QifXzsW3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v3SeA3Td; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QifXzsW3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v3SeA3Td";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QifXzsW3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v3SeA3Td";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QifXzsW3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 20C1821AC9;
	Thu, 31 Jul 2025 09:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753953072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9vd8fxwv/8K/TPU0BWLEZQUt3TnGM4XnkHVpNxgaOs=;
	b=v3SeA3TdQfjLQuouP+kaVyIRAvEUpVpGxXYXD4PR0IEQg4NsbvkTwQPPYgpsYuLIipOsKp
	kGG5YmJPUxR4EwEgb6VJe8jSwp88XA+aQ6ABtuDwwl8OyhPwAeXmvoGS0NbeGvlo0K9Psq
	+brOnP5ZNRPvHeEK4plycDMZ4puPZzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753953072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9vd8fxwv/8K/TPU0BWLEZQUt3TnGM4XnkHVpNxgaOs=;
	b=QifXzsW3g7F/0CBhBGP5AwmTmBqnz4dlRWx5IDi14xB3BH4700BKhlPpvAERC4/5xZBPzo
	YYp3wGLhTH/zOQAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753953072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9vd8fxwv/8K/TPU0BWLEZQUt3TnGM4XnkHVpNxgaOs=;
	b=v3SeA3TdQfjLQuouP+kaVyIRAvEUpVpGxXYXD4PR0IEQg4NsbvkTwQPPYgpsYuLIipOsKp
	kGG5YmJPUxR4EwEgb6VJe8jSwp88XA+aQ6ABtuDwwl8OyhPwAeXmvoGS0NbeGvlo0K9Psq
	+brOnP5ZNRPvHeEK4plycDMZ4puPZzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753953072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9vd8fxwv/8K/TPU0BWLEZQUt3TnGM4XnkHVpNxgaOs=;
	b=QifXzsW3g7F/0CBhBGP5AwmTmBqnz4dlRWx5IDi14xB3BH4700BKhlPpvAERC4/5xZBPzo
	YYp3wGLhTH/zOQAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECF1213A8A;
	Thu, 31 Jul 2025 09:11:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yN6xOC8zi2j6FQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 31 Jul 2025 09:11:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/3] arm: Update HD-audio configs again
Date: Thu, 31 Jul 2025 11:11:05 +0200
Message-ID: <20250731091109.16901-2-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731091109.16901-1-tiwai@suse.de>
References: <20250731091109.16901-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

The Realtek and HDMI HD-audio codec configs have been slightly updated
again since the previous change.  Follow the new kconfig changes for
multi_v7_defconfig and tegra_defconfig, and add a few other configs
for HDMI codecs, too.

Fixes: 1d8dd982c409 ("ALSA: hda/realtek: Enable drivers as default")
Fixes: 81231ad173d8 ("ALSA: hda/hdmi: Enable drivers as default")
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: Select more HDMI codec drivers too

The changes are only in sound.git tree, so I'll pick up this there, too

 arch/arm/configs/multi_v7_defconfig | 4 +++-
 arch/arm/configs/tegra_defconfig    | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 02ddd7ce9e3e..3df90c4b30b1 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -791,10 +791,12 @@ CONFIG_SND=m
 CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_INPUT_BEEP=y
 CONFIG_SND_HDA_PATCH_LOADER=y
-CONFIG_SND_HDA_CODEC_REALTEK=y
+CONFIG_SND_HDA_CODEC_REALTEK=m
 CONFIG_SND_HDA_CODEC_REALTEK_LIB=m
 CONFIG_SND_HDA_CODEC_ALC269=m
 CONFIG_SND_HDA_CODEC_HDMI=m
+CONFIG_SND_HDA_CODEC_HDMI_GENERIC=m
+CONFIG_SND_HDA_CODEC_HDMI_NVIDIA=m
 CONFIG_SND_HDA_CODEC_HDMI_TEGRA=m
 CONFIG_SND_USB_AUDIO=m
 CONFIG_SND_SOC=m
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 3a9bda2bf422..ba863b445417 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -225,7 +225,12 @@ CONFIG_SND_HDA_TEGRA=y
 CONFIG_SND_HDA_INPUT_BEEP=y
 CONFIG_SND_HDA_PATCH_LOADER=y
 CONFIG_SND_HDA_CODEC_REALTEK=y
+CONFIG_SND_HDA_CODEC_REALTEK_LIB=y
+CONFIG_SND_HDA_CODEC_ALC269=y
 CONFIG_SND_HDA_CODEC_HDMI=y
+CONFIG_SND_HDA_CODEC_HDMI_GENERIC=y
+CONFIG_SND_HDA_CODEC_HDMI_NVIDIA=y
+CONFIG_SND_HDA_CODEC_HDMI_TEGRA=y
 # CONFIG_SND_ARM is not set
 # CONFIG_SND_SPI is not set
 # CONFIG_SND_USB is not set
-- 
2.50.1

