Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821916;
	b=JPHYw3fr0IQVfbRJdIvjMMBeAo/Db25fR0AeY9wEu3uKbdxiGGTycGP+ojnlmCWCJCH1
	 I2uz/F0hDHrvLfEPXiZs5dzHLLbTfct6I62C0cS2/U+mBE1YMmQdt19ZydLMIE1nxZ9Uo
	 l2As1Z9ixK14VpMt1Zy0f7C0bnEXc/1h7R1NISEi+AvsVRJVBJijNlleF9KuiHQTFersK
	 VeejRg+6h7Ty5mSrjk/KGp5DjxX7AvloTBQC18Ks1BoqjR/zqzkPhoc73gjVlSw4CRJ+V
	 sVTdmWlLHzOR7jPEobw2YJLtyQEkJejNDG4boVeLn7heX5KQ7EEuJczwEALNX/M2zaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GRtntifAekkHHJRH34pGQG6MUX974KOGHv0S1Vl70Sw=;
	b=rLNJ6SjPPSOOVnwAyoXMO81IeRvqP1qXvk4LccQiDwDWQbCloa5Nf9TupzaNr/9pcnjT
	 LzdPjFICbh2p/y1ZP9mTLU3+WqtQ4tufPwJtpDz2EYsIzrCCs7rFwqADg07kXrII4FDpT
	 rx201Q3ecNmcP84jv4cTtCqRWLVlHP7WvlsJCu1fLcypmHOCuNAyg6p58/8vgSPfha52k
	 bDIkoP2UPdVSuh6sRn5mLSChhzkZDSL9KXEgtkSBMmEPxoL5Y/owDfeurW85R8z9olpqL
	 CwqIRybbPht/GEVRADwOXU2JgytCFY4VXTlZsmnWKG+I7gro8cdV7bloNeikobYy1sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uyZFe+7b;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02298606A334
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 09:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02298606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uyZFe+7b
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c468bd799ecso464625366b.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 01:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821914; x=1795426714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRtntifAekkHHJRH34pGQG6MUX974KOGHv0S1Vl70Sw=;
        b=uyZFe+7b0599MfdtHX6hsSzcVhPevJlZ6CCL8cr7bJgby3J5D+HWhhQjZnU5KQu0Z6
         m+2lQGGzxQ48aJIFoNqmY/8jRoRKK8TyyJB0aam7QSz4aXIlkL3AbWPBLhkdDEM+nQEQ
         AmjuFfDtomFgc9NVUBEqD7nfj3N8j/UwxHzgfumYEKJuqLX/zMlyvGFnV1K1aMDETxh+
         VdZuhoYoKPgP2Rr/cN9zwfv5ryEyNGQFYgem5gzEpX+oJNcONxeGukM7C0Owp8m7jM4U
         VOXHc5VpcDt5B8tEUDyXlUFIJt+eHtYIIvJooWZ7EHSoxX0EgF892B40kdgGzyBme/+u
         IAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821914; x=1795426714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRtntifAekkHHJRH34pGQG6MUX974KOGHv0S1Vl70Sw=;
        b=IP44KQehK519Z94oj4HQxFjsIrg2Okd1ZBX/JWiPX25kyQyYfhlsOAyH/Gko+au20D
         /q5hMJKdWxl39oVUtIIpwJk390f5NEY4M6MxvoJJGN9a4C8vjOde2stKlGwnxLYZnuJJ
         2oMbig+pBqBZMaaDFsti7MYINi/tN7u11l7bEfYkTWtSYm/Ui9d0FY8H5q42G1oMYI6e
         3Hq96cFkody15zIZam8yhKF5TLJZMNW3bE/KAaJ+01KY9eoXwRVKqsdgNDC2edExoqOz
         GD1tDg6yZNs5dTA4k0jtK0IwOqPYLqY+D/WJ8H9pYIeaBaVHH0c9HRctF7/gmJgSwhGx
         AnoQ==
X-Forwarded-Encrypted: i=1; AL+hErF2Ig22PQJoHY93zXcTZm5X79638SeKnBUoD/hxtl7gCJGKbhPevtb5QzPNUgpacHv94687BUdgFJmuHg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1vKSTWeqERpp/8TIyevo6JMEz+MZrAmGEVyILhGhIDuj1Jt5S
	xrRAnxlx4fk0xwvqxShMK/9yLX5jNGk3e3hEwx1wbBpfUEW5aIWvkwWD
X-Gm-Gg: AYBFou1KI3oFXA6wd1DLZ/NLMLbYBhUKQ0WSf0sNBErcWnPaDhEuIy2KWwM6M3SZyNq
	0xMOILuUReNufbPqDBtv0z5qX+Ln7FG7kWUbi3E1nOQ09zcuUv+z7wcf0bO54GF6YtUdZfdY66M
	dYPmNWE9Zc2Eiogsz4Q1g4I70gk2IHDsLEPbdv9iFl/sdbNZxGA8FSWjEiQ47l1POrejXIUBYgh
	wdzEFbQCEIriXIQdpc4hTCU93YR/UcSPUI98B/lb0LkDCNZEyWn3Mx2wuP4es22jrGJE9cxblOC
	a6i//IAepiyMrRtWgXgUNY0slajFejjRlk/5JrHCzkRTv6G83wKuZX2PyFkropt40tId/1ud6nF
	20IF0Qcu3/cbJ6GWfjZAO/B44FH0FtvtshGLbUdyVozQRk4nik6k56ssFYz7NzgoXZpQSI0dm5C
	nJXL/sMOe2n6b6ooizhj+1AfQXByPA2WbsXb52bp53PcpMo+28QHQNJMT1L1ggec6xUe4qemNix
	xFOl4Q7FEEWy02LiYCgdkmhV4fffTD4POjIB6hPV4MSh9R5FHlNtGGVf3+BVk9xDJGJin6933kw
	n3rh4YIrhqd0EpI+9aZGcoCN/w5+UVousGe8XkO2DLxeVsQZJd5yRjfvmu49MA6tlg1TPOGVLhU
	q2nnHRQAwIB+XR36PGf0BbwQHaYaGl84=
X-Received: by 2002:a17:907:6e87:b0:c40:4965:72cb with SMTP id a640c23a62f3a-c509640bef4mr657832666b.21.1794821914164;
        Mon, 16 Nov 2026 01:38:34 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b72868sm379906166b.65.2026.11.16.01.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:38:33 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/3] ASoC: tegra: Generalize forced DAPM pin enabling via tegra_asoc_data
Date: Mon, 16 Nov 2026 11:38:00 +0200
Message-ID: <20261116093805.73715-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116093805.73715-1-clamor95@gmail.com>
References: <20261116093805.73715-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a dapm_fe_pin_name field in struct tegra_asoc_data to handle
force-enabling DAPM pins (such as "MICBIAS" or "MICBIAS1") directly inside
the common tegra_asoc_machine_init() function.

This cleanup allows the removal of repetitive, boilerplate codec-specific
initialization functions (tegra_rt5677_init(), tegra_wm8903_init(), and
tegra_wm8962_init()) and points their DAI link init callbacks directly to
tegra_asoc_machine_init().

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 62 ++++++----------------------
 sound/soc/tegra/tegra_asoc_machine.h |  1 +
 2 files changed, 14 insertions(+), 49 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 18302119a08d2..ebca41a5db752 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -154,6 +154,7 @@ static const struct snd_kcontrol_new tegra_wm8994_controls[] = {
 static int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
@@ -252,6 +253,9 @@ static int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
 		}
 	}
 
+	if (machine->asoc->dapm_fe_pin_name)
+		snd_soc_dapm_force_enable_pin(dapm, machine->asoc->dapm_fe_pin_name);
+
 	return 0;
 }
 
@@ -908,21 +912,6 @@ static const struct tegra_asoc_data tegra_trimslice_data = {
 
 /* RT5677 machine */
 
-static int tegra_rt5677_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	int err;
-
-	err = tegra_asoc_machine_init(rtd);
-	if (err)
-		return err;
-
-	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS1");
-
-	return 0;
-}
-
 SND_SOC_DAILINK_DEFS(rt5677_aif1,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5677-aif1")),
@@ -931,7 +920,7 @@ SND_SOC_DAILINK_DEFS(rt5677_aif1,
 static struct snd_soc_dai_link tegra_rt5677_dai = {
 	.name = "RT5677",
 	.stream_name = "RT5677 PCM",
-	.init = tegra_rt5677_init,
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
@@ -948,6 +937,7 @@ static struct snd_soc_card snd_soc_tegra_rt5677 = {
 static const struct tegra_asoc_data tegra_rt5677_data = {
 	.mclk_rate = tegra_machine_mclk_rate_256,
 	.card = &snd_soc_tegra_rt5677,
+	.dapm_fe_pin_name = "MICBIAS1",
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
@@ -998,7 +988,7 @@ SND_SOC_DAILINK_DEFS(rt5632_hifi,
 static struct snd_soc_dai_link tegra_rt5632_dai = {
 	.name = "ALC5632",
 	.stream_name = "ALC5632 PCM",
-	.init = tegra_rt5677_init,
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
@@ -1015,6 +1005,7 @@ static struct snd_soc_card snd_soc_tegra_rt5632 = {
 static const struct tegra_asoc_data tegra_rt5632_data = {
 	.mclk_rate = tegra_machine_mclk_rate_512,
 	.card = &snd_soc_tegra_rt5632,
+	.dapm_fe_pin_name = "MICBIAS1",
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
@@ -1089,21 +1080,6 @@ static const struct tegra_asoc_data tegra_cpcap_data = {
 
 /* WM8903 machine */
 
-static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	int err;
-
-	err = tegra_asoc_machine_init(rtd);
-	if (err)
-		return err;
-
-	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
-
-	return 0;
-}
-
 SND_SOC_DAILINK_DEFS(hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8903-hifi")),
@@ -1112,7 +1088,7 @@ SND_SOC_DAILINK_DEFS(hifi,
 static struct snd_soc_dai_link tegra_wm8903_dai = {
 	.name = "WM8903",
 	.stream_name = "WM8903 PCM",
-	.init = tegra_wm8903_init,
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
@@ -1132,6 +1108,7 @@ static struct snd_soc_card snd_soc_tegra_wm8903 = {
 static const struct tegra_asoc_data tegra_wm8903_data_legacy = {
 	.mclk_rate = tegra_machine_mclk_rate_6mhz,
 	.card = &snd_soc_tegra_wm8903,
+	.dapm_fe_pin_name = "MICBIAS",
 	.hp_jack_gpio_active_low = true,
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
@@ -1143,6 +1120,7 @@ static const struct tegra_asoc_data tegra_wm8903_data_legacy = {
 static const struct tegra_asoc_data tegra_wm8903_data = {
 	.mclk_rate = tegra_machine_mclk_rate_6mhz,
 	.card = &snd_soc_tegra_wm8903,
+	.dapm_fe_pin_name = "MICBIAS",
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
@@ -1152,21 +1130,6 @@ static const struct tegra_asoc_data tegra_wm8903_data = {
 
 /* WM8962 machine */
 
-static int tegra_wm8962_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	int err;
-
-	err = tegra_asoc_machine_init(rtd);
-	if (err)
-		return err;
-
-	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
-
-	return 0;
-}
-
 SND_SOC_DAILINK_DEFS(wm8962_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8962")),
@@ -1175,7 +1138,7 @@ SND_SOC_DAILINK_DEFS(wm8962_hifi,
 static struct snd_soc_dai_link tegra_wm8962_dai = {
 	.name = "WM8962",
 	.stream_name = "WM8962 PCM",
-	.init = tegra_wm8962_init,
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
@@ -1194,6 +1157,7 @@ static struct snd_soc_card snd_soc_tegra_wm8962 = {
 static const struct tegra_asoc_data tegra_wm8962_data = {
 	.mclk_rate = tegra_machine_mclk_rate_12mhz,
 	.card = &snd_soc_tegra_wm8962,
+	.dapm_fe_pin_name = "MICBIAS",
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
diff --git a/sound/soc/tegra/tegra_asoc_machine.h b/sound/soc/tegra/tegra_asoc_machine.h
index 2034ce8e0689e..8ff39b53930c5 100644
--- a/sound/soc/tegra/tegra_asoc_machine.h
+++ b/sound/soc/tegra/tegra_asoc_machine.h
@@ -13,6 +13,7 @@ struct snd_soc_pcm_runtime;
 
 struct tegra_asoc_data {
 	unsigned int (*mclk_rate)(unsigned int srate);
+	const char *dapm_fe_pin_name;
 	const char *codec_dev_name;
 	const char *hp_jack_name;
 	struct snd_soc_card *card;
-- 
2.53.0

