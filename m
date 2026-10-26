Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045980;
	b=EOihUBayxbNAAal6gyVnwiLyO9oaNiQYeyZ2a9RJcPnCq6nGzwg5YGkhxSwSTIzVL4ks
	 FzlayFZ5mOCMFr9UYT10mKCo4Wn4SgUaAFqBPizKfsheCAl3LbQ+O04KHRwCfTFM1hkEO
	 i/JNuqgZXfdjxZ84GoB7x2h1mWQebP5h2VGvandUDGM5boUlQjxSrXw93JbIWlav73K+9
	 SY5tJu0koQyUHfp0FnqONA8U9/Ak+dX1O106m8wB2Q60hOySG5fS9Lfo+fu5QDmjsaJZ6
	 uDrdvbjjdBK2hlZQZNBBodJHMzUPfYNyOnJ02/HzOUcXlsZHaegjRZSi+WNohs4JCMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045980;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3YBgOvuoc5BP18qovwMrtCo/ufvTD09IPG+GVuNdkxs=;
	b=oplngwOSDEDhSOOtcTZfdkeM35gY5uCGtJRX1RYS3iRlDD9yctHa85/QqGBnDC+QhPDq
	 TYPjLFc7sxQTpsqyEz05oF2OU4cv0ODs8fY+HPeQMwavPHeQmLxQy66TNmlo1FyTq2a5y
	 CaH9AkrT6IRvCTrLROd5bb503jofJ66BHkHnTHDHsyJyDVRsNTQN1V6xA/BVJ196uIuRB
	 lYi23tMf2c8qAU61qn8viUfnRAekTdtudZxslDufUMQ+v4NmMJ7PXSrm/rBIjcLH8XHDq
	 1QwzFcChFpmBourY796wvhbdr5JRoXvCIfJIeolGUoLk+DDV6zjNbUtW7+sc/h/38MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=Zbr3PtKT;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFA2606A336;
	Mon, 26 Oct 2026 20:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEFA2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=Zbr3PtKT
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793045968;
	bh=3YBgOvuoc5BP18qovwMrtCo/ufvTD09IPG+GVuNdkxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Zbr3PtKTox2X7tk3ME8hABQG1cup6LULE+eyYhdPq7rn+eqj/wvJN7vuO8mkp0g2A
	 Uc4h2RR7lRejAYZ77IZsp/pyaBnv4k5n8VpxZ9WjJHgIwr3Wb9mazDdla0GKAzN1QB
	 zHorXKHZsiayCsiFMH+98qR6e+Xcqe9cY6mj6sWH2ViIvQyjPNrcdLaD42jEk26mrz
	 lSQ38mj/Q3ONx09ctv4BsArU5S91JP6W4DCaQIysc8gSBtw17whmMHH/MON8NlACiA
	 hM+zovxjYyw4k/eIW392SUfyKACjWV6JW0W9zcCcfqTN8QUObVvxN6W+XW9UdoaWF6
	 aFBp/bWaFdR4A==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id E5D761BE094;
	Mon, 26 Oct 2026 21:19:27 +0100 (CET)
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
Subject: [PATCH 10/12] ASoC: codecs: wm8903: Make wm8903_mic_detect() static
Date: Mon, 26 Oct 2026 21:19:13 +0100
Message-ID: <20261026201915.57184-11-amade@asmblr.net>
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
make wm8903_mic_detect() static and unexport it.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/wm8903.c | 6 +++---
 sound/soc/codecs/wm8903.h | 5 -----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 25a488f589a7..9dbc295b0889 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1598,8 +1598,9 @@ static int wm8903_hw_params(struct snd_pcm_substream *substream,
  * micdet_cfg in the platform data.  Using this function will force on
  * the microphone bias for the device.
  */
-int wm8903_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack,
-		      int det, int shrt)
+static int wm8903_mic_detect(struct snd_soc_component *component,
+			     struct snd_soc_jack *jack,
+			     int det, int shrt)
 {
 	struct wm8903_priv *wm8903 = snd_soc_component_get_drvdata(component);
 	int irq_mask = WM8903_MICDET_EINT | WM8903_MICSHRT_EINT;
@@ -1636,7 +1637,6 @@ int wm8903_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(wm8903_mic_detect);
 
 static int wm8903_set_jack(struct snd_soc_component *component,
 			   struct snd_soc_jack *jack, void *data)
diff --git a/sound/soc/codecs/wm8903.h b/sound/soc/codecs/wm8903.h
index 4b036f4b755e..2526d0c69029 100644
--- a/sound/soc/codecs/wm8903.h
+++ b/sound/soc/codecs/wm8903.h
@@ -11,11 +11,6 @@
 
 #include <linux/i2c.h>
 
-extern int wm8903_mic_detect(struct snd_soc_component *component,
-			     struct snd_soc_jack *jack,
-			     int det, int shrt);
-
-
 /*
  * Register values.
  */
-- 
2.56.0

