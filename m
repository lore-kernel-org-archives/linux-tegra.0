Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794287296;
	b=gfi35Od+b+dFmyvwteMSC0AciQ4UjLyS3CGrcWFgtsW05Qwu9fcR4QqhlmRyhsgkR2bS
	 R00d+fiZ7nhiqajAeWG+kvKeVJ4oI8Zaz/cx4tTBkeZSDs2flXyZoec9CwKeX0IklMvzH
	 8K5N++PuD+GHN0OTMDnioucgHvO5xhrFbykejnvYk8H4HzkuDXyAWgm7qgv5r5UlhcI7f
	 RWW0zsEHGRdYTFjHCOBvnHUgTUgUZrY2XFVaDQ1Ntwkicbm8K/XlfQfN1JXghHXCWk4QN
	 DqYHt8jpOHusYEv/z2YBjb4s61tNSjx1HLp0jS2XyjRNGN9uBbZGMwYOPBU9NOVX9HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uqjEjkaxes0qicdPDD9LDyvBW4T968M1FfYrP68rAAE=;
	b=2WHYBg1gOtuHekBwsoAMOcR91BNWHs2jgTau9H+YmdsRSASY6pVAFnLpLQLVa0uWLJJy
	 cMRLqGzY71TSgYYgFRt+CbdFBl6v3KEVG3VdnEQodupWn6ZpUnHU8JHRKp/NIKV3EjqVj
	 OHTbLR75+ecbMxiIyIHZtz14ZTqrsfgST+aD/AmJLOQVnp0vqx+RamkmA+cpA7v/+GjK6
	 cLyrLOD0ovm97sCXyTPU6T5Zdogw5Z8CcvXdJ2N1P9Cse5V2d1vOPjFep6xIavbR0pHd3
	 zD9LiatjfAOlFna0tIW99lvSIiE1PBJ0EIt57+sYfLgtNpX/sdx+vKoFKEiso9b17dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LM2jeGhl;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22160606A321
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 05:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22160606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LM2jeGhl
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91befbcad6dso18855496d6.3
        for <linux-tegra@vger.kernel.org>; Mon, 09 Nov 2026 21:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794287295; x=1794892095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqjEjkaxes0qicdPDD9LDyvBW4T968M1FfYrP68rAAE=;
        b=LM2jeGhly9EsTrZhPdy9KYDsv7PKM1mEJcgHQAmE8psDhCbkRIYe+q8dXoEoaZV0Wd
         YOkB4gEHGfwYa8wGjFmKQrcnVeetXxHPJO0kbq0e6rLl8DTcgcs0mv1dXkxP40XFtYML
         ux9LEU2Iml+vGvU7ITB7dJMl6Bz9ks2Fa4cBtCCSOpx4Yiwu9VyxF2h9Loy8aiAI5egY
         HNGjvk1W3qFCVijBP+VcrCHkKOf+1RVZKmDm9HlGuxbU/xbsG24DHYtkRIZt3rv6MXyD
         baWqKMVU+5yCdjReo0Ju3TLshoEMT6ZREpoHogh8QL8Afpe+8KLBZtlkTmu7TEDp9aCc
         h6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794287295; x=1794892095;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uqjEjkaxes0qicdPDD9LDyvBW4T968M1FfYrP68rAAE=;
        b=Ass0QyvRxPDT0vVxYLe2lHnWHFVcKzhre94Sd3SA8S0hUn8z8lRuFj1P5swvI1s/sI
         RyNDWhm451s1lnG1GdW3bN+QqZdhYoOScctV9LeVgsHLErHgcclfLPqcgiOH+Cx7Lclg
         C4Y8URjMXeZu978tTKWGLYqa9dcPaIjXT0NqgjuOxYW9RHGE1RPX5r5MdJLIYe2k/Jum
         pfPIuO7YWRj/BxoJzT4TFzw0nKBcyDrLEFwDzz7RrO/KJik/so9VhS6p/IKSm8mR6Hv/
         87koLurDRUNFPIDXjQ0itDyBCIBaTjuyU6MoZQ7RTBJO52xTGDUHI6Yn8Esl5kPKDuK6
         tAUQ==
X-Forwarded-Encrypted: i=1; AL+hErEQgg4eaXLs/CTSW4AK2QfAOetlrKOszH4TS/BlKveT/KU2mC+0onEpC8afpFuAn4PCQHWzez7tEN6M2Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8PYvjvdG8iey7tmMQfk/hOzeF2sFPuJn8AeYVF996zZrncBJDc
	r6KIY8cOxV6oyJlWPWkqH7COeZO7KgvExrwv/0U38HFILhNIPdgB000=
X-Gm-Gg: AYBFou3dfmZ0YeGF+OzOON4aonsDy3bNd0g4DJ+L2p6WxtoVYEHcyZt0TbOWa/T2glg
	tikQhoWyE85wjQQAssnEZ6b27FpqNqPWn6hDrTtNb9EA8Y2eE9J6OHPnpJZZ/PmUOdC6ubyp/3X
	+keRy4DIGpgO0c8BtIctNAGmYRgzBECk9PEDZgoDkRYsZkaBBPDhOU0rKshID6/rAPtWCufd0+f
	/e6Kue2E3PNGBxhIepLOM6pAgR4I69gdXHmWv6bftsW3dwLNffC3N1SMXxjTvJG8//3z3mp5uUI
	DzLgKapReTc6f7KWK6Kd/9igOt5sItcqMRWLNj/bEzsfIflDEUpei17hTTXtVj3M48ntcbTM/Pg
	E8JYhfI2x4GahXb3xWLx5Jals53VElN9PfKkfnSqUeEqlvOrvYMdGIFFkCYFn56t+q+tW8DAMWV
	IJ45jWFJIV2qdQPQgbdrpyJWfSt3rc5lt37ksyzd/L8ooE8FeN7TqZHAkSnJLZAivzLSrdSD6o0
	Os1NgL34K0XZDq9Bw7Det99hhRj9+q64gt77kSbGDxD6JBENhKMdmkb9POlQCF+70dRqIJ9+7a4
	soMogHNlBJ4zxkfptI3l0qt94KIjJT3U1K+Q4APWv2G7O1XU8ELwGD+2tNZi6CeH3t8OQL73/Mv
	+qTUIaxm/VKhrtioM0/IXqf/TEZXSeowGRgURcNpZvGsn0tSC+N7e29KyJ0ruKK59yDcECCzWXv
	81RSAVFj4CKQ==
X-Received: by 2002:a05:6214:2b85:b0:91c:60e8:a8ab with SMTP id 6a1803df08f44-91eef81bda5mr29310036d6.37.1794287295004;
        Mon, 09 Nov 2026 21:08:15 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0547744sm12648546d6.44.2026.11.09.21.08.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 21:08:14 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6] ASoC: wm8962: stop microphone work before component removal
Date: Tue, 10 Nov 2026 00:08:12 -0500
Message-ID: <20261110-wm8962-v6-c78c17edd171@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The I2C-owned IRQ outlives the codec component. Cancelling mic_work during
component removal leaves its producer running, so another microphone event
can queue work for the old component and jack.

Mask microphone sources, synchronize the IRQ and drain mic_work before
changing the jack pointer, regardless of whether a jack was registered.
Disable microphone detection during cleanup only while holding an active
runtime-PM reference, because its control register is volatile. Keep
unrelated IRQ events available.

Run this cleanup unconditionally from codec removal and drop Tegra's late
card remove callback, which runs after component and PCM runtime teardown.

Fixes: 0512615db6db ("ASoC: wm8962: Convert interrupt handler to direct regmap usage")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

Changes in v6:
- Mask microphone IRQs and drain the IRQ/work path even with no old jack.
- Run codec cleanup unconditionally from component removal.
- Retain the active runtime-PM guard and Tegra callback removal.

 sound/soc/codecs/wm8962.c      |   34 +++++++++++++++++++---------------
 sound/soc/tegra/tegra_wm8962.c |   13 -------------
 2 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3248,21 +3248,27 @@
 {
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
-	int irq_mask, enable;
+	int mic_irq_mask = WM8962_MICD_EINT | WM8962_MICSCD_EINT;
+
+	snd_soc_component_update_bits(component, WM8962_INTERRUPT_STATUS_2_MASK,
+				      mic_irq_mask, mic_irq_mask);
+	if (pm_runtime_get_if_active(component->dev) > 0) {
+		snd_soc_component_update_bits(component, WM8962_ADDITIONAL_CONTROL_4,
+					      WM8962_MICDET_ENA, 0);
+		pm_runtime_put(component->dev);
+	}
+	if (wm8962->irq)
+		synchronize_irq(wm8962->irq);
+	cancel_delayed_work_sync(&wm8962->mic_work);
 
 	wm8962->jack = jack;
 	if (jack) {
-		irq_mask = 0;
-		enable = WM8962_MICDET_ENA;
-	} else {
-		irq_mask = WM8962_MICD_EINT | WM8962_MICSCD_EINT;
-		enable = 0;
-	}
-
-	snd_soc_component_update_bits(component, WM8962_INTERRUPT_STATUS_2_MASK,
-			    WM8962_MICD_EINT | WM8962_MICSCD_EINT, irq_mask);
-	snd_soc_component_update_bits(component, WM8962_ADDITIONAL_CONTROL_4,
-			    WM8962_MICDET_ENA, enable);
+		snd_soc_component_update_bits(component,
+					      WM8962_INTERRUPT_STATUS_2_MASK,
+					      mic_irq_mask, 0);
+		snd_soc_component_update_bits(component, WM8962_ADDITIONAL_CONTROL_4,
+					      WM8962_MICDET_ENA, WM8962_MICDET_ENA);
+	}
 
 	/* Send an initial empty report */
 	snd_soc_jack_report(wm8962->jack, 0,
@@ -3592,9 +3598,7 @@
 
 static void wm8962_remove(struct snd_soc_component *component)
 {
-	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
-
-	cancel_delayed_work_sync(&wm8962->mic_work);
+	wm8962_mic_detect(component, NULL);
 
 	wm8962_free_gpio(component);
 	wm8962_free_beep(component);
diff --git a/sound/soc/tegra/tegra_wm8962.c b/sound/soc/tegra/tegra_wm8962.c
--- a/sound/soc/tegra/tegra_wm8962.c
+++ b/sound/soc/tegra/tegra_wm8962.c
@@ -97,18 +97,6 @@
 	return 0;
 }
 
-static int tegra_wm8962_remove(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *link = &card->dai_link[0];
-	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card, link);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = codec_dai->component;
-
-	snd_soc_component_set_jack(component, NULL, NULL);
-
-	return 0;
-}
-
 SND_SOC_DAILINK_DEFS(wm8962_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8962")),
@@ -129,7 +117,6 @@
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8962_dai,
 	.num_links = 1,
-	.remove = tegra_wm8962_remove,
 	.fully_routed = true,
 };
 
