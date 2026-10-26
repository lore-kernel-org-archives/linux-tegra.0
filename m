Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045974;
	b=MfJenTMv4axGYRHomsjr6Ns1smmdDm8+1hS53u1IFmW39fbNqHmbSxRQCjM7Tz5Tg0if
	 GSahkkAhTLHF4zyGYqzGy3M2tyu6Y968psRC6gLRdoe1K99h8vdU6ESuieAougWb4AEvN
	 m8L07MF+deuonArPTFVvsQwgt+YM/iYeCy0pWCz7qAs7tkhLlEV0kRQg1x7JecVCgG0x/
	 U5kn6LIHliPgpheHdn/A025zaEn7uaJzOVApJg1IQTF8Jc3DCmD56DrX1LYSN7r/2+QcC
	 y1LdJnPkLGgLDwbDkELXa8RLIt/wH7fGKvE4HDSuqHU5XYJLWn90gEHQujHUcez95Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045974;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+ebMdbbb0DTIZyZCU6uHESV06HEd0fPstWZv5PQxNIs=;
	b=mBwQ47KtFMBcyrLDQRFrwDnYYCmhrc4xKLcSRDLdl+RSmAIWb7JW/1p5RC4OYWQlqGZD
	 9z0AWPbZKglh0Eu3K6g3hGi9K+F56lIcAFmHpULPnnTcs8Rubp8/LolpX1QRDpmB4SCfU
	 iL8QbM1GF/t5T6Vl+Ix4nRBFrKGGpJNUWNuP50DvhXHwAHZhf5X4GuDZVuP42h3Zv7JWa
	 +EOlmsTVZcTx9u2IzEgqOI93g+gfxMBPMnEcCnwTZvrSzT6jllFqCecpTj7aJZ/flwiEp
	 Gwtaj4N3HEjnJpiK6er/TllNfXio51505fOW4+BsTd4GEd9eYq2x54ZQfXwQL56LYHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b="JgmtLN/j";
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582B7606A334;
	Mon, 26 Oct 2026 20:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 582B7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=JgmtLN/j
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793045965;
	bh=+ebMdbbb0DTIZyZCU6uHESV06HEd0fPstWZv5PQxNIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JgmtLN/j6qfUfYG5GcnlHzD3A7hYvuy32vR46J4uWxHUgNxqI2Iy3YDX6h09rJ+c2
	 9efqmOdRdu5xcw3u37yisfygnM157RaAf0AxWy2k7Vgg59zrfU2veMWfUALilk7PZr
	 TwmtHddkgqZXGnAUnh5vhxoTZ6aVdvBKP3Mb9xorWGuzC9h30V9sqOKfgcsU2BeewG
	 epQVDPAkx1U+vf/Wjz7N/90N/3YK0P2vBiit6uUPA4/OOodqHch5Ulw7LmpNRJPlYz
	 Q1Pwh7SIzjK0VjJcl32TBvfq0bIuIM+EekoTA99UjRSjQ0XCJh10Hrw4Imuyd7W6PS
	 HbEyXGjUzXRhg==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 891D51BE07B;
	Mon, 26 Oct 2026 21:19:25 +0100 (CET)
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
Subject: [PATCH 05/12] ASoC: tegra: tegra_wm8962: Use standard callback to set jack
Date: Mon, 26 Oct 2026 21:19:08 +0100
Message-ID: <20261026201915.57184-6-amade@asmblr.net>
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

Use snd_soc_component_set_jack() instead of the driver-specific
wm8962_mic_detect() callback.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/tegra/tegra_wm8962.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8962.c b/sound/soc/tegra/tegra_wm8962.c
index 31f9d9181595..1ace9261a0f3 100644
--- a/sound/soc/tegra/tegra_wm8962.c
+++ b/sound/soc/tegra/tegra_wm8962.c
@@ -89,7 +89,7 @@ static int tegra_wm8962_init(struct snd_soc_pcm_runtime *rtd)
 			return err;
 		}
 
-		wm8962_mic_detect(component, machine->mic_jack);
+		snd_soc_component_set_jack(component, machine->mic_jack, NULL);
 	}
 
 	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
@@ -104,7 +104,7 @@ static int tegra_wm8962_remove(struct snd_soc_card *card)
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 
-	wm8962_mic_detect(component, NULL);
+	snd_soc_component_set_jack(component, NULL, NULL);
 
 	return 0;
 }
-- 
2.56.0

