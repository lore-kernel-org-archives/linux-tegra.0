Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045975;
	b=0xlDQdS0xYzTdpztD3qXvcmS7FrFH+bW8oXJs7Oo31NOdAjFQnWrjP/hFCdPrNwT+IsI
	 WjysCL+L3WnH+CNfL0YC5+i6BCXute3uVe+8Qmp3ivY5wBSVO520Qn38cj3V3el9iUKWd
	 gUhGEvPPRCZt/Ez4Rd0BPBD4S9bArd/79bNbEmbW7q1yHQayxjQkM17qoWhEv+10qtZ0q
	 s07tD9mE5wZQAngjsSOnTd8S+MAhjLjnWd3W9/k0ibSez5FgBw/07cnSEQ9ouAuvr9m6z
	 fJ9PMrrPTDUE3kCDuYLbKH5W8So2igKqvz76KX3M9s+zXV+ZIVKH2BMbDUT/qX7bN/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045975;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=vlII2/qtcJJlxnRGWV5yyCu365dW9Hqkfzduga/N16k=;
	b=yxdY74m164+WdJO4uFoMXcTIQslvWLeGhAcV1jRciPRB5DWH6f8I3joki1yFH4Usqxlo
	 qQ2qs0Qg548HGpuktXFemHYdcS1mDnODVj91mR20A4/tpqNfcgK+V/DTDSE2NQlg9HCvf
	 H6iOXMKSL1eAP72wTE8mUEmgjJQO10hX9ygjVmJ5OQvy9sQT/38hzLoQbcExrDQIfxwiu
	 vgH2UdTZlPyyXDM799rxiT9+9rSR1xnmc4BjGSc6fkBRRceIANEb+mKwmFo4B3zpb0RS8
	 W6Fy4gqUHx4FWL4xTGkx2exghVMk7uSnoM8ob4F7fplbX9ZxD5FUNwPR0ilyapdHrzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=HALFafi3;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582E4606A335;
	Mon, 26 Oct 2026 20:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 582E4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=HALFafi3
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793045966;
	bh=vlII2/qtcJJlxnRGWV5yyCu365dW9Hqkfzduga/N16k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HALFafi3RyW3SbiaYmVPaY894UDx/i4Tv8R4PJ/2Q+I0Sti+tCd7aJqLAZH6m2vBQ
	 lZOCwGL4UQ3nkY3KGulm3rvthVdlEwkQUzUlBuO2ocClsVQ8QZzsVatBwihfKQh/Kg
	 r8BXANx/MnZ4cQvjQmLmUbNwAXvmv4Z09Gth8kgLVpeGgCiurcdPUGXH6xv0z347PJ
	 fzIsX/FdCSFVJ1kR4S2FWMOuI3XgJpsP6BsBzt7j/c4AG6it8gPZ+jq3YdlToTZu0p
	 /kRyFpEbxtW2gXNVkGPe1S+dIeqS3UqieeJgUS9sF9S1u6oBewdUQc5KOsH/SMJdnR
	 ExQtgoePNGYxg==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 097BD1BE084;
	Mon, 26 Oct 2026 21:19:26 +0100 (CET)
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
Subject: [PATCH 06/12] ASoC: tegra: tegra_wm8994: Use standard callback to set jack
Date: Mon, 26 Oct 2026 21:19:09 +0100
Message-ID: <20261026201915.57184-7-amade@asmblr.net>
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
wm8994_mic_detect() callback.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/tegra/tegra_wm8994.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8994.c b/sound/soc/tegra/tegra_wm8994.c
index 1550faeba725..11e0ad96caf4 100644
--- a/sound/soc/tegra/tegra_wm8994.c
+++ b/sound/soc/tegra/tegra_wm8994.c
@@ -98,7 +98,7 @@ static int tegra_wm8994_init(struct snd_soc_pcm_runtime *rtd)
 			return err;
 		}
 
-		wm8994_mic_detect(component, machine->mic_jack, 1);
+		snd_soc_component_set_jack(component, machine->mic_jack, NULL);
 	}
 
 	return 0;
@@ -113,7 +113,7 @@ static int tegra_wm8994_remove(struct snd_soc_card *card)
 	struct snd_soc_component *component = codec_dai->component;
 
 	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack)
-		wm8994_mic_detect(component, NULL, 1);
+		snd_soc_component_set_jack(component, NULL, NULL);
 
 	return 0;
 }
-- 
2.56.0

