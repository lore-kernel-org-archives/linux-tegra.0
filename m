Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045973;
	b=ccCfWl+B+zkxRkNudjCJrGo6i4QnsxyVzlsnmrSfhBhNPGxoq0dEl0vVttjteDjd8jty
	 Omr+mbZOYsUVQVuWwHQFUlQd6d6/Qz+3EFyt54y1BjgS/qFTOv9/k5xtjaQWHfyZCvUyA
	 mnb1p8tc5RAb03p9JFVTz7Og3QV2c2Pfm7O0t1nuMqETF3F2ugIwDl7tKmggLj1WisE1Y
	 wsR3NK1HjKFTquwL3A5bRS/xcEV4bf20d6/sgHOBH/b3OwlJb0s9eTfndfF86k1KPc1dO
	 +ol/zhfSTN+cMnws8/lrM3vow53E+AP0KhoHga5mY6AYUykMNuDbx67vc2ir5yUBZOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045973;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5QFfRB3gJstIBf93il+NE0bYEqnnk9cS2mY0kRa653Y=;
	b=kS3yGoAaGXjeIhEiE2b7qe89hFfMzcUkYM+TYLAG6KZbdosN5YtuW6AoeDhw9KUwTIf5
	 /xwmmSM+QKTvhuPrsBt30DiasJXXZwZgjleE+eu4CnLcTNrIKBc9nITOt3MvkqfpHWmlU
	 d6tH0JwiArpFTW/cFg9hBdjYvMwnyJTrWmwvhS7dMXWq8KU6HbcOeKnd1lj2X1AiV7E/Q
	 da7SgveHCN4QwV1sAniGiINxbI8182QSNdvCHJFHdw6DdCSMJ5SqJENDlrtWoNLrQBZH4
	 B6W3q+aUBJtGCOktwV6gMQRLMxj5HzMybC/AOKdaCZtJFBKOmmfYjsoLX9lKffo6vAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=HG64+uDc;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC291606A31B;
	Mon, 26 Oct 2026 20:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC291606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=HG64+uDc
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793045963;
	bh=5QFfRB3gJstIBf93il+NE0bYEqnnk9cS2mY0kRa653Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HG64+uDcOQ8Sp9dTIb8FSBAlNE7m0AEmZVdzvMGiCu1TdFg62C+GDBGE9CBJKgsf6
	 LKSkIkA5kNi5qNBSroeMCPnb3gIHkwJgmO+TUWPEvZ5ezvUE/rwlF1DapjFIXA7l6q
	 /nZIO9+osXfZegYE45BXrcf9mH19ko0KcBjPw3bOuT2I7X0JvsA9C6uuVz3aa+s7lI
	 AhljHQ06u/Lya7e+cd3ufC8REy/vvdbuLSCRn/QrtU7wx2lvac/8kwtKV99jmp6t7r
	 btnJgthny2B83G5s6fWp7znlDryFsmKG1EL4THEKCKOH1/NOktf5I5nkxHYYNVntht
	 Syw9yE/0HEzjA==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 9DBCD1BDEE9;
	Mon, 26 Oct 2026 21:19:23 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-tegra@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 01/12] ASoC: codecs: wm8903: Implement set_jack callback
Date: Mon, 26 Oct 2026 21:19:04 +0100
Message-ID: <20261026201915.57184-2-amade@asmblr.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026201915.57184-1-amade@asmblr.net>
References: <20261026201915.57184-1-amade@asmblr.net>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add set_jack callback to the component driver so machine drivers
can use the standard snd_soc_component_set_jack() API instead of
the driver-specific wm8903_mic_detect() helper.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/wm8903.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 553f8d68a546..25a488f589a7 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1638,6 +1638,17 @@ int wm8903_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 }
 EXPORT_SYMBOL_GPL(wm8903_mic_detect);
 
+static int wm8903_set_jack(struct snd_soc_component *component,
+			   struct snd_soc_jack *jack, void *data)
+{
+	int *shrt = data;
+
+	if (!jack)
+		return wm8903_mic_detect(component, NULL, 0, 0);
+
+	return wm8903_mic_detect(component, jack, SND_JACK_MICROPHONE, shrt ? *shrt : 0);
+}
+
 static irqreturn_t wm8903_irq(int irq, void *data)
 {
 	struct wm8903_priv *wm8903 = data;
@@ -1902,6 +1913,7 @@ static void wm8903_free_gpio(struct wm8903_priv *wm8903)
 static const struct snd_soc_component_driver soc_component_dev_wm8903 = {
 	.resume			= wm8903_resume,
 	.set_bias_level		= wm8903_set_bias_level,
+	.set_jack		= wm8903_set_jack,
 	.seq_notifier		= wm8903_seq_notifier,
 	.controls		= wm8903_snd_controls,
 	.num_controls		= ARRAY_SIZE(wm8903_snd_controls),
-- 
2.56.0

