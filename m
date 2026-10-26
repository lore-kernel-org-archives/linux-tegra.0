Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045975;
	b=eK1Q69yT8xXcKpyP6+cHvoAVUn4146Wn1Hry5XAEOLZptjEY1VGK+dAztGMzKNEWbGhH
	 gsQxLEbvuPXLUMP7DzJq1TYI7j1bTEpKY6xq3vum7CBaB6zVie6U0gKgYPtcIvRt2/TOT
	 TPMZzrwT+JoTgKHvp3lCf3LPHeUMv4YdafWwwD/fZPVc7EE/QAbaQTbepitVI1S6IsIOl
	 Hv7wP9CfCFmTCXTxj2IhF+GsMWPA9obLEbEMub5CpFapvikZfjOdLTViQjseMccb2d2zw
	 hOeWbB1+sdi/A3EBpbCh0crsolGy/7s6XYAObSxM7tEuZbsU9cRuORQq9I7iAzQs4Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045975;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=n0tvmgl7EVorBye5O13fI6Bksh2SD1mJo86uEXrWXqE=;
	b=5godlE5L2mxJNKI/914wdqgIAE540iZg1fC0ARkEpk3ngq9MXkZ1gsGxo/QqMYkXGx/1
	 bDDYpN65mY2EcaFZlIcQhAUgsZ6GkWZziJe9lpNzdjjdpB/QILfiffCB88hpH66u45ahR
	 oHhtSn0f587MFTLsbO6jPRpieCDFpiRQAJZ2SH6plgMxLU/T0sioPC2gnNAsDASkIs22S
	 rm4s1kU4soZovA0Mc1/hEe6qdnSo78BAaLcwZV71eqLlIpVl4kyZuS8hbNuXKk8k4q0jQ
	 QJNoD+YybDlf7vqjZNKe/alzicHck8n24kMXZ0cXXYR2zSeurpRi6oBgev5oXRBlcvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=JqkUg4Or;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEC0606A32C;
	Mon, 26 Oct 2026 20:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEEC0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=JqkUg4Or
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793045967;
	bh=n0tvmgl7EVorBye5O13fI6Bksh2SD1mJo86uEXrWXqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JqkUg4Or0PZwuJjbG3avx6NA3oqNC3GLtn4WbswotDPOyMC9lOSvqJZSGiEZ9XYVk
	 InbrCfS5Ns/dMCQ7qa3T7L7ASskIZqmRPguSa7IndfRP/jf2FvBAzKYAb5IZ7kksuh
	 V0d90GYbupZWEkca16jmY+USpAR4KrLZ7XwKG5gvUVbAZgxuqaNVx+NIOJ0ndPMqoZ
	 dFkBqbtI4XoNcHIwGiGPIhkMVNzFa2nbk9NwjyaCS817hGBhCZHaP+M6t8ZcGsEU8+
	 f0Yu0rvM7mYf44SNCvWyd+gMGUNIAIlz3VJm1uuryQqmOn5NZLCoVjvl3JL0OEUxd4
	 qFm94deTHAKfw==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 6D8AF1BE07D;
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
Subject: [PATCH 09/12] ASoC: samsung: tobermory: Use standard callback to set jack
Date: Mon, 26 Oct 2026 21:19:12 +0100
Message-ID: <20261026201915.57184-10-amade@asmblr.net>
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
 sound/soc/samsung/tobermory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index 5448c16199bd..2cce1aa0c5ec 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -193,7 +193,7 @@ static int tobermory_late_probe(struct snd_soc_card *card)
 	if (ret)
 		return ret;
 
-	wm8962_mic_detect(component, &tobermory_headset);
+	snd_soc_component_set_jack(component, &tobermory_headset, NULL);
 
 	return 0;
 }
-- 
2.56.0

