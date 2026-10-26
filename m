Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045974;
	b=nafGc9UipOZT+H2VRzhSVrPzysUQg0ElBqYdOhgrs0SKEGNFSkJRENLabBBp5fU1Fkdl
	 5wYTevEtn/XcE8SFfTQfy1nrHXwTGn/V5WVTTU/0S92k9xXJn0TCCeoqikL6U8XGe7rBd
	 s5uRI5f7x818A2fPBeUXqvTbtHg7YwAMK6eM0DygAonU320LxKZkpLyjDa3CVNUraFxT4
	 ll1vA6RaOunvkFK+IJ27uu29yWYF4jpK//EAQhFrQ2Ea4Pl+mzBYXYxSnJ8Ner/ilR+9g
	 30x5yFIYGJQnKJ5xjzRepmGyRTZxeXKw94IaVdX0wzPU4bT5yo/2AHos4k1fQrP/u/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045974;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iPX2qthI0O9mfJYcVBu9OtySl3TNAfSkBh1dT8qb/uU=;
	b=oofyMJI/V3/sW7h0rwaLI0h5en9rZe5RCc5PyHigpXLOvjnehtKcwM6DLCCdEcMNl1Tc
	 UhRzzmG8Q8I/chBNFqn6e7GLvXsq9s6xPU1HewkYFcwFKza+/k024z0EvE6boVZxl4LZF
	 eQubZeeMTV+w5IUIEwnkYhegS+r3/lXbe1vwubo7vNBJv98bVgKZdev+F6ILgHiQbEGLd
	 +T1J+pWPOiD+81giObOUtk/BN+vRSdDa2BTqJ3oifqoFWAIyCNtEp5++EpGEp6+/cWPzy
	 yQmkLSEgceAeUkGS88Zc7h0ejhvb8jtoODzclxVQb5hfYpLEcnZiWQqxCUrVA29Y9ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=mGQj6Nbg;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6926B606A31E;
	Mon, 26 Oct 2026 20:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6926B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=mGQj6Nbg
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793045966;
	bh=iPX2qthI0O9mfJYcVBu9OtySl3TNAfSkBh1dT8qb/uU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mGQj6NbgK3+b+hyPiD5u5xqIMClA78diPSflPWaF5qgAmXNsbe/UbDx3MxaUxvA50
	 m7U/uVak8rqwns/bYWPO7pXm0mFN2OsNlwCS7EVIbSrZRv4T5KAszHxntPZafwTgOr
	 JUFSlcB0w76bnq4DheNNt0cC+Z8AhDaxBhuH0/TzQQZh7eNNTta+F+0xoCzfyeHiVx
	 H5jSiL9j3xWfyrTbDGBdu5m+04YK4W0W+TfqNDm6jPFt7cnJFuCBs3wjwosXPGjlE7
	 FQ7lnkGFJtmBNCEazKbreCqeeZTL68xd/VdnU0T66zKbyN4sh0PFN0tleb+2RvQ8L2
	 kRUIjTgKsmKpg==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 80AA11BE09B;
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
Subject: [PATCH 07/12] ASoC: samsung: littlemill: Use standard callback to set jack
Date: Mon, 26 Oct 2026 21:19:10 +0100
Message-ID: <20261026201915.57184-8-amade@asmblr.net>
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

Use snd_soc_component_set_jack() instead of driver-specific
wm8958_mic_detect() and wm8994_mic_detect() callbacks.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/samsung/littlemill.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index d0d1b1ee326e..fca2e18877f2 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -302,11 +302,7 @@ static int littlemill_late_probe(struct snd_soc_card *card)
 	if (ret)
 		return ret;
 
-	/* This will check device compatibility itself */
-	wm8958_mic_detect(component, &littlemill_headset, NULL, NULL, NULL, NULL);
-
-	/* As will this */
-	wm8994_mic_detect(component, &littlemill_headset, 1);
+	snd_soc_component_set_jack(component, &littlemill_headset, NULL);
 
 	return 0;
 }
-- 
2.56.0

