Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045973;
	b=k/L+W0Cwn30c5drFQUrKEYUcgYiSejIr4x/sg40iu460CoUvm7G1yQsB33VujMmvzE1e
	 phxOFEInTtosYdDp+/Hw6LF/kmuX72rP7xiXvJy8MkAIzISPV66345pWRs96uioB1m7fK
	 Qw8ZdTEJ334URHVNrURmHY9szAFPzeD1vM5qeAC0M78Wdf9LtCoOZjuidHWmky+kdQusO
	 bYRms3xQ3P+8o+RzK5/rDEpxje/KWUEg3KZ7kjBSM3NUucO4gkD2i9wpKYR+bJIifU1vh
	 dkMMW14IGvWtwpzmTqEKOi5li8BuQU6djx2orE8Ys4hWsx0ziFPOots0rkyZUOK5pgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045973;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=53PNC2wkDbsyj6bt3J0W8B9yZwkL6gqzMBBzJLbSiYw=;
	b=jxNm/F3YD9mM0hQ/vggxQxCqlu/UAT0mgPO56ajscXjzlROsqT9Gb/FIiJkpaD/RnB3K
	 xPMkr0EoiEpJJR0yQ1IQ8b21K7nAkc0oFo3r13EkeLSxSdOiJXZOrSdmMnCVQJlX4pO9N
	 dPDbLlaPq4uqkFBQQYqvXn4LfyiJvXKjCI2RP8F6fK3HrXifFbeoZDtbYJib8xZq+zfoy
	 afyIn8cRFq6JJhOql71nNVQCbJvuQbeD0ec2//GOswLNiYvdotfYrZghYEK9/raQhfFiZ
	 aZ58K9PrvsBgw7tkm9GrgcPLqiYH8i2suWrBwXlLmnwItsY1Dh9oA2Vpg0J2p4jfPaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=cAkcfaU1;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB45606A324;
	Mon, 26 Oct 2026 20:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DB45606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=cAkcfaU1
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793045964;
	bh=53PNC2wkDbsyj6bt3J0W8B9yZwkL6gqzMBBzJLbSiYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cAkcfaU1L0Q5LNn618KA368IwFUTDPHala8Z+swdSoIuzTiRKE+Iq9iOWcxHxdapv
	 p8hQE6pahDS/GQtOTSCUpqL4ZkWwi1A+Rx9kHD29rX/F1+sblAhGs8VSfFkQkEoDJt
	 6oZ8tculhu4WN+TEgxmeaMDP4WJAA75Mb/nDoaAknP7WXMBHghjdNT4plIiQhBeskK
	 3nO+rWJRkboikH0ooZYeaUwKzXq904FQRcDRTLlgkNKYElIcBIue2LVRkkHyYwWuON
	 8uPj84Aq9QseTgM2dXnEg2xxknxTGq6FCce/x1znxEYCusfzXU4Pxp3QsJo+ywQOub
	 bA3aXJECsM8Vw==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 8EF111BDEAC;
	Mon, 26 Oct 2026 21:19:24 +0100 (CET)
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
Subject: [PATCH 03/12] ASoC: codecs: wm8994: Implement set_jack callback
Date: Mon, 26 Oct 2026 21:19:06 +0100
Message-ID: <20261026201915.57184-4-amade@asmblr.net>
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
driver-specific wm8994_mic_detect() and wm8958_mic_detect() helpers.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/wm8994.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 6b91e02f130b..69afba1764eb 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4642,12 +4642,30 @@ static void wm8994_component_remove(struct snd_soc_component *component)
 	kfree(wm8994->retune_mobile_texts);
 }
 
+static int wm8994_set_jack(struct snd_soc_component *component,
+			   struct snd_soc_jack *jack, void *data)
+{
+	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
+	struct wm8994 *control = wm8994->wm8994;
+
+	switch (control->type) {
+	case WM8994:
+		return wm8994_mic_detect(component, jack, data ? *(int *)data : 1);
+	case WM1811:
+	case WM8958:
+		return wm8958_mic_detect(component, jack, NULL, NULL, NULL, NULL);
+	default:
+		return -EINVAL;
+	}
+}
+
 static const struct snd_soc_component_driver soc_component_dev_wm8994 = {
 	.probe			= wm8994_component_probe,
 	.remove			= wm8994_component_remove,
 	.suspend		= wm8994_component_suspend,
 	.resume			= wm8994_component_resume,
 	.set_bias_level		= wm8994_set_bias_level,
+	.set_jack		= wm8994_set_jack,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-- 
2.56.0

