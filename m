Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696AA3033D1
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 13:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780090; cv=none; b=Xpo297WOvnvl1pzg5sTVhzwMgUo2YT+cYySU8U+wgXLTHrDY2tjAX1MnjLEtiGUliAhaHZF4T+REm6f1sEphhujLkzsJ+NZZzjFmpE2ytFQ5NWiehOW6Q1ZZWI7V9R/0/sw73HRF18GX7x+4HIZRQLqOnWINnDtNST4r0Zhq+u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780090; c=relaxed/simple;
	bh=Ywe9bPVypE5wkrLXuYYavaxat+KMj7tKegs5WxEIihs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EkzOLBR7hXI5N147svedLGWgI7QQ0vVpQGJvz7KJr0qRQwjHivJdHCYCNpSxAT98gPxU/jaFtr1/zI8CbdnbIxcYdOShp/cEkcEvJlhcVVJ2kyH7fmbpjGmIvcu+ESXA/fR0E2yTYsjV3AM4W+JiWlP+dDTPQBXINzb+Gr4tc2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvlYOdjL; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvlYOdjL"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-435a11957f6so1792203f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 05:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769780087; x=1770384887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vcw3yENIvlldxKIBwPqE+wjXhTrfY3vndqTsUZd8d80=;
        b=ZvlYOdjL9bok27WwllLtYYOj3wChHo70r+ULhziffZ7UkEiBIOjuBCLPDoJ2JlNv7a
         ecUW7Q1m6WUIoVnyJ4R9Fo6ROpdh+OH9vBUdAHvgkZD3egnYOcyoQ1K1pFcyW8RzKELx
         +w2YN8f4FlRk198rg09Fd+c6WD8/amh7dDOVA3N0uA4I+hs4IVdG1szPfGmiN+idbiwI
         Kp6C2bwULdTiFhA4gtj9imTXlsNkekjpBtEaki/MF6i4lcwFWnhSbWbjTtMU8nbbCKBH
         nljWhgSa57bdqLIb/w2hVmrO25cDAmfGWHzxmdg06CRE1/Mp4glc2HWTjl13mWBX44fR
         fXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769780087; x=1770384887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vcw3yENIvlldxKIBwPqE+wjXhTrfY3vndqTsUZd8d80=;
        b=jyywPWiFaBmRqNQ1lhGdb/XzCJ/xq/6jxYfCSaCWla3dDWlJ+sHGORuoI/MNU7At0W
         kIsJgTeI8+biezxNa69dxdTuJ0gz03uMCeJ7cV0B+Fsqhb32p3AstY2PZS6B7CDGVcPB
         +3xhjh8HWTyaz0QgjSOzgz0VRTiTR96BYytJWkC6OcJhNJhPOJ/K6WKLDppxa/foEyO+
         jgAfpGvAM1mjtw9QW64ASFW/LCYhXQz8kWG8gQL6lyKpz1CPZcPUwKBfkrFuIuofA7QS
         x12jF/3WGahq4lGLppQfHAoq0PY9sJukMlv6IIb4eJkkfvrwEjy7eN9GS1GPLN2uJ1kb
         D4jg==
X-Forwarded-Encrypted: i=1; AJvYcCU3JIsqAB/UQYxQcogOnoxwpsClrKdnw7K/WLl7Sw7wJ2NYCPYwtwLqIGMFSmrKlCic0+LXwcMO4bChdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6iBuXAlbNXbrvejzmKO7lCI9T77B99LiSUlK3WBiWvhROiBSV
	a/JANNUl+6S49Y/jvU/3yjGyHQdV2oiAP9+VeTjkQag3dErEv71H9YsH
X-Gm-Gg: AZuq6aJFbyd/K2iyyw8ENOFzWACzKwa3P1mp2VjREwLTWtVVTTfSRQ36kB6iS86DOy1
	f7QblILlCVZyyGoDLKpb9bVt1AgZItV3eFkqPJXthmj+rQcXMb49T2DEA9NaizfaKAA9EaVRkGl
	npHo6XXatGeXpvzR7JJqEC7Pjh1DCOByMyNPIK041/vDTv/sN8j4gM917P51uKfg/aKKZXrn6tx
	zOvssfwgTku78NzRpkaDOMPM3aKA2Iekx3MykJ0v3hWeYeFtxrRr9VONvpT/z2JqZR/a0tLgMrh
	y6MMJIRlDp22xsFi2l3qmlJcPRXWM8m9zuUmuksNMLptZWwXOWnvUdFqYNl3j0WK0eMUfnbMeUC
	zn8w7WdJLX4isX4K0kFLrFHTlQ+Vt6GYIPOO0WVl1tlQdx5/+e3mVR+JyeEs2u/82JUq+6GndKM
	Dt
X-Received: by 2002:a05:6000:2905:b0:432:5bac:3915 with SMTP id ffacd0b85a97d-435f3aaa63fmr4508396f8f.39.1769780086599;
        Fri, 30 Jan 2026 05:34:46 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce93sm21536837f8f.24.2026.01.30.05.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:34:46 -0800 (PST)
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
Subject: [PATCH v1 2/4] ASoC: tegra: Support CPCAP by machine driver
Date: Fri, 30 Jan 2026 15:34:32 +0200
Message-ID: <20260130133434.353353-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130133434.353353-1-clamor95@gmail.com>
References: <20260130133434.353353-1-clamor95@gmail.com>
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
index 9dbd589879fb..f9257830daa1 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -294,6 +294,15 @@ config SND_SOC_TEGRA_SGTL5000
 	  boards using the SGTL5000 codec, such as Apalis T30, Apalis TK1 or
 	  Colibri T30.
 
+config SND_SOC_TEGRA_CPCAP
+	tristate "SoC Audio support for Tegra boards using a CPCAP codec"
+	depends on I2C && GPIOLIB
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

