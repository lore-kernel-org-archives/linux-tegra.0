Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42923EF0D4
	for <linux-tegra@vger.kernel.org>; Fri,  6 Feb 2026 17:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399281; cv=none; b=fSWYFuqwlLjaGc/vfcfxxtogu8JRpd31jaigyZ3VBWhjhxYNFVbKMyMyyjLIgWNIbeYsCAVhnpPzRe75byVWEsfNKR9yyawFG/uJokV1RpFlub5WK+rADC9loENFUfGKSq7CQMEteCVYTUQNCvESxloLSzK3PNYEddmAgDtQtaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399281; c=relaxed/simple;
	bh=xM19W5y6sBZhK63TGYfPq7Dcx+S+y11DhFbKJgJ2kiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Blr+mdy5A0zDOu+tI/TUKb6SQYSjT73pEIJjmA6nU7TK0eOBtZqs0xo4we/TvfEhG4M7zqvTsY+ihwg98T6wO8buw9onDj6yvvAuQ/0KU3/tVczjU2hnfOpDUMgbEug52qkrEl23nUPgtWoJ+PGNNDNueQYjgRYrWWuNDyAEQXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCBLrlXm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCBLrlXm"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48068127f00so22569455e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 06 Feb 2026 09:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770399279; x=1771004079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1uE9SbozYnquR9REkQsKIr4GVqaAJFPEg6pyN2tdEE=;
        b=LCBLrlXmGPDxM+vdCHjLYlxhSDszn0WfxISbJVKJYEL6IjQJ1WaSAFawaE1/hd6WjS
         lLgCj2wFxzIvz8BI23nSkEMKJMqTp8soqYS1qwQTGRiS6QMhn/PPdvSpIMo2GpomzJJ/
         6iA6MbKsouvpZeiKJrR80Ap6VjdwjEdLbkKQvJupfn4IDril9Je2mV06s2admJHaSyEa
         JocKfoX3+APeJxoitxyEgVs851iiNyT7JsHjUlJY5JGzy86/xN8Uea1FDceKrg8CGi3S
         TyoVLkxQtvOJU5aixf+ol+K3RwWPgu02gGdCg/5P4Gyq5FBM9zZUEl0kRzG5ExDXZPAI
         Bo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399279; x=1771004079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S1uE9SbozYnquR9REkQsKIr4GVqaAJFPEg6pyN2tdEE=;
        b=DcnbCr5DU4hsQhLiQsz7+yYwOp/LRu1cDwUC/rKTPl5u4i0Cfmu2+ZVa4UIaIAxaTd
         HRGxZRqHE4WD/WCJ/VOKYEXW1apPKRJAumVohyEYDh08MS31yxnnU5TiihF3IiNkO8bW
         zxZojJq70Ab3a2CqhHqCSiHtLZRatGp3vBwGWJze3vsQPLu0GN3WYl3pPGS2ZZs/SC+a
         lBuYtCuG8h+VqMJGcZjfRh0KLDljJgNAQ684kGafjZjqT0lz2NXP0soyhnoR4g4/VCt0
         2TtKuLU+a5qyfJhB4N5FnYSpznTzuFeKb8XViWgw1YIktrNoP/CBB+/0Cl2o2i5GxP6o
         9vFA==
X-Forwarded-Encrypted: i=1; AJvYcCVQMwm7lk36S6xNKaQsyhEUPOq/6P/xWf1SbCiQXUwEIKeV7m2ie84M9PazNv4KqpbhMmtcHnJh1bhDlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuP1jaoGvQOZe6VGaUkP39BwKUW/XVsAmEKTagBkf0Z3KG62oP
	+WHp0Y5YtPLasqTpN08lVozwi6min2O0PyuvGCjWnlsqVaWZU9/tJXw8
X-Gm-Gg: AZuq6aI627sWJ9B7r9CG2vEH9dLHxW8bmlAinbH97fGv6Ej7KQI9dPEVNQ+POZcig8A
	pfKLF/fIczZNKGkoPIoqkldvI1qOEEGmyS3dwS5kDqs24473t5am0LPcdRReZsQzNPU/oHbtcVp
	BnUXbaFLxCTEifsZzCiGfDStCtqeH3aPJBdcZiuaDGeYOAWqonvbtq80PzlvYZF62IdROg2uB0/
	9NECt50ieo9dSAmK6JSnn0iSqm2nmqcr6K7BKCrLIac80qaX6RDAJp1CPqrJDQsoYq7gu9D9/Kw
	Tcv2rqxhXYZFm7w82RNqMP6/h8ymzr9GiSPtzjYODzwYnEZNX5hWqhFf7gXCuwXBhiGmLqeyvry
	MmjJfKYmKm1yiB+UtkwvZ85VwQW9VegOTRCdSgELmtka4E7LxoNZX5SygvAmd9H6WMapvadpyby
	Er
X-Received: by 2002:a05:6000:186d:b0:433:42d1:f71f with SMTP id ffacd0b85a97d-4362934c50amr5948476f8f.38.1770399279228;
        Fri, 06 Feb 2026 09:34:39 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4a1sm7454523f8f.17.2026.02.06.09.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:34:38 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] ASoC: tegra: Support CPCAP by machine driver
Date: Fri,  6 Feb 2026 19:34:19 +0200
Message-ID: <20260206173423.145954-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206173423.145954-1-clamor95@gmail.com>
References: <20260206173423.145954-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPCAP codec support to the Tegra ASoC machine driver. This codec is
found in Motorola T20 devices like Atrix 4G and Droid X2.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/Kconfig              |  9 +++++
 sound/soc/tegra/tegra_asoc_machine.c | 52 ++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 9dbd589879fb..dd58525b7079 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -294,6 +294,15 @@ config SND_SOC_TEGRA_SGTL5000
 	  boards using the SGTL5000 codec, such as Apalis T30, Apalis TK1 or
 	  Colibri T30.
 
+config SND_SOC_TEGRA_CPCAP
+	tristate "SoC Audio support for Tegra boards using a CPCAP codec"
+	depends on I2C && GPIOLIB && MFD_CPCAP
+	select SND_SOC_TEGRA_MACHINE_DRV
+	select SND_SOC_CPCAP
+	help
+	  Say Y or M here if you want to add support for SoC audio on Tegra
+	  boards using the CPCAP codec, such as Motorola Atrix 4G or Droid X2.
+
 endif
 
 endmenu
diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index d48463ac16fc..10834f9c3422 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -287,6 +287,25 @@ static unsigned int tegra_machine_mclk_rate_6mhz(unsigned int srate)
 	return mclk;
 }
 
+static unsigned int tegra_machine_mclk_rate_cpcap(unsigned int srate)
+{
+	unsigned int mclk;
+
+	switch (srate) {
+	case 11025:
+	case 22050:
+	case 44100:
+	case 88200:
+		mclk = 26000000;
+		break;
+	default:
+		mclk = 256 * srate;
+		break;
+	}
+
+	return mclk;
+}
+
 static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
@@ -985,6 +1004,38 @@ static const struct tegra_asoc_data tegra_rt5631_data = {
 	.add_hp_jack = true,
 };
 
+/* CPCAP machine */
+
+SND_SOC_DAILINK_DEFS(cpcap_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "cpcap-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_cpcap_dai = {
+	.name = "CPCAP",
+	.stream_name = "CPCAP PCM",
+	.init = tegra_asoc_machine_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBP_CFP,
+	SND_SOC_DAILINK_REG(cpcap_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_cpcap = {
+	.components = "codec:cpcap",
+	.dai_link = &tegra_cpcap_dai,
+	.num_links = 1,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_cpcap_data = {
+	.mclk_rate = tegra_machine_mclk_rate_cpcap,
+	.card = &snd_soc_tegra_cpcap,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+};
+
 static const struct of_device_id tegra_machine_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-trimslice", .data = &tegra_trimslice_data },
 	{ .compatible = "nvidia,tegra-audio-max98090", .data = &tegra_max98090_data },
@@ -997,6 +1048,7 @@ static const struct of_device_id tegra_machine_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-rt5640", .data = &tegra_rt5640_data },
 	{ .compatible = "nvidia,tegra-audio-alc5632", .data = &tegra_rt5632_data },
 	{ .compatible = "nvidia,tegra-audio-rt5631", .data = &tegra_rt5631_data },
+	{ .compatible = "nvidia,tegra-audio-cpcap", .data = &tegra_cpcap_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra_machine_of_match);
-- 
2.51.0

