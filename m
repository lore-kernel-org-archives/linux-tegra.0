Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045976;
	b=uJ840scSZ5jmCRHLFJBJX1vNW1DKZ9naDi/qMcwftSh4ziKWmTBiopiQRTsYqBklZhED
	 TeKGGFQLzqJkL79ehEzabhgzuSwA53f9sS38VLjcF3IJLjy3KTsrn/g53CfGF7J6/e2Tb
	 5AdXyIEPlscKFfepsX/So4bZci7WDJQH65LWslIAE4u0s9ecYayzzze3LQwlMVjqn3x86
	 cGgpNwY7HuGZX/ZProXzYljinzP8VR0nGspAZDiDILgKajHpQVQm4YaKghTHpuBOt2o1D
	 fkgm6Zv0ofaIjBgkOuiJa9rK7JtWLhF2aOXWHH7rX5ZPE2+YF5xfY94AGDTdJQR6ahw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045976;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=JceYktI76pDB6ceyV3GSagbvZadfVLow2KLbXGF8VvE=;
	b=12lHANAl+6TI7+oVzMQCURz4RcuJZnn6zqI/Bp/vTmE6VzK6w+Jmc1YdtRKkYndhCHgF
	 MaFR71Ax3SaSChhZdLQI2x5IUL3EuoNeka87KfGmnEbAPCNN3ipLc+kKYilUjAUtTN760
	 TTCOsUrCY3pUhuUe1IyE1IsPVxPpiaSfTOa3Jx6PxDnn3rg/toHzSzJiEIKHpjYAVeRn2
	 z+r+7vJnRi2xDHTXSH/3Zr6UBfoPcjE+yoQOPMbVnQD3N0UelrBhssssNDmmDQCE3/sck
	 cc/MgbKQMMtO0NrSk+hFduCS/ZEUn9o5E/6XHNMpj1olKvRgx04Uq63v3xar0ALFqgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=VFCaPsIV;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667C9606A32D;
	Mon, 26 Oct 2026 20:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 667C9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=VFCaPsIV
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793045969;
	bh=JceYktI76pDB6ceyV3GSagbvZadfVLow2KLbXGF8VvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VFCaPsIVc1a/BTw/D9h/ojds6dJe3kHu2H2p3R1h6id2u64BzSJ3+Jm7a/4S5XL8P
	 wsg0yhQnqjuSl/e2zjygiONRvNlTWEteaISrYWB6rgGPie+HNTPZdYaaHp3KSlS6fc
	 fmS9Xk4otoLKXlygNBbuabTqmOZNwIF4vg+0RHyuW0PFm8YnAYX/ri5xAT+qz51gxW
	 3/ylyHO2utYwKRrxI3enP9JrUdgxHAtKVXxDXpfWrIIBtv3cx886oH9l6f6axoAj3E
	 ZD+hswbi61iAdp23LRMG5nmTqa9MMbRhmrsblJIZwU3csvL0l+bR3F9i1vSgTJ4HmG
	 403vCOUvXf/+A==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id E027D1BE0D9;
	Mon, 26 Oct 2026 21:19:28 +0100 (CET)
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
Subject: [PATCH 12/12] ASoC: codecs: wm8994: Make mic detect functions static
Date: Mon, 26 Oct 2026 21:19:15 +0100
Message-ID: <20261026201915.57184-13-amade@asmblr.net>
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

Now that all callers have been switched to snd_soc_component_set_jack(),
make wm8994_mic_detect() and wm8958_mic_detect() static and unexport
them.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/wm8994.c | 12 +++++-------
 sound/soc/codecs/wm8994.h |  6 ------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 69afba1764eb..43b5a05253d4 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -3540,8 +3540,8 @@ static void wm8994_handle_pdata(struct wm8994_priv *wm8994)
  * Configuration of detection levels is available via the micbias1_lvl
  * and micbias2_lvl platform data members.
  */
-int wm8994_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack,
-		      int micbias)
+static int wm8994_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack,
+			     int micbias)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
@@ -3608,7 +3608,6 @@ int wm8994_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(wm8994_mic_detect);
 
 static void wm8994_mic_work(struct work_struct *work)
 {
@@ -3959,9 +3958,9 @@ static void wm1811_jackdet_bootstrap(struct work_struct *work)
  * flexiblity a callback is provided which allows a completely custom
  * detection algorithm.
  */
-int wm8958_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack,
-		      wm1811_micdet_cb det_cb, void *det_cb_data,
-		      wm1811_mic_id_cb id_cb, void *id_cb_data)
+static int wm8958_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack,
+			     wm1811_micdet_cb det_cb, void *det_cb_data,
+			     wm1811_mic_id_cb id_cb, void *id_cb_data)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
@@ -4050,7 +4049,6 @@ int wm8958_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(wm8958_mic_detect);
 
 static void wm8958_mic_work(struct work_struct *work)
 {
diff --git a/sound/soc/codecs/wm8994.h b/sound/soc/codecs/wm8994.h
index e7df0a1a2314..7ed5f5e50fc0 100644
--- a/sound/soc/codecs/wm8994.h
+++ b/sound/soc/codecs/wm8994.h
@@ -47,12 +47,6 @@ enum wm8994_vmid_mode {
 typedef void (*wm1811_micdet_cb)(void *data);
 typedef void (*wm1811_mic_id_cb)(void *data, u16 status);
 
-int wm8994_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack,
-		      int micbias);
-int wm8958_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack,
-		      wm1811_micdet_cb det_cb, void *det_cb_data,
-		      wm1811_mic_id_cb id_cb, void *id_cb_data);
-
 int wm8994_vmid_mode(struct snd_soc_component *component, enum wm8994_vmid_mode mode);
 
 int wm8958_aif_ev(struct snd_soc_dapm_widget *w,
-- 
2.56.0

