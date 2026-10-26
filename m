Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045974;
	b=Y9rA7NGgkolwshvhBh84rloyJ1FGqpJOMFzoj6OOn9yI1+lYLRLjtpMON1ywcrCvUk3J
	 bGCvk7Ksm1a2vL328wAnqdWuBlJ/Cyl/2qlhWecsSaBb8Ab6I5Nzr0Bi660Tnxb4AKNAH
	 TtCUdLIsfM84WXArOxkv9VngZueeOg4NTQ/VN3JoJR+zg363ykxUT1OEJ1piK3dAW5tRD
	 +Oyr9Awd5nDLk0+QB0r01L08vBOD3KccwGQ48jeIw8xdXHXQ36qlCh/HpCPXacDOe8RfG
	 duItcksoXRj1ZpIBHvCWcDvU0iVVzf/dmrV0D+qiHTCm7hmZVu0DZfK1OQUU1i1Roow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045974;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ol9jwtIumKD96M8cRzWrWYkzF3LFwH8iuYE9zdfwBHk=;
	b=GA5FmbgySnTYiXBO7UODvcCuU9kuRwh/N3LznME7j/+wYCnDxQbm6ghQCKqhHib8DEFi
	 xk0dGrhqsru3fYU2tAx+yvfvbAhAAO3RsYZhCFP1lP37jpA3THToMWiglpvMAU0y3xxon
	 1QbuCLTYrK1ZcgGR0UaTJN7vXRV8nH2gFLd9HARzbFIVYpR/5OWccnERkL0EuYQosHa54
	 xZLdyiH5BIQt3AHobRejpxrPQjE7VbwTyL//Xf/0oEzGu5c/J7VDQcN27InzGYEp01xrP
	 eal/+Eq/gejGG2YjcT2h1+bPAQNnOm4rfr/0sodiuoJnXvc3cUwkswlyCnkriM/e07w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=cbQj4UAJ;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB6F606A325;
	Mon, 26 Oct 2026 20:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DB6F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=cbQj4UAJ
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793045965;
	bh=Ol9jwtIumKD96M8cRzWrWYkzF3LFwH8iuYE9zdfwBHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cbQj4UAJjLz1DZeliVig7UcdKa1tSx0GP01wq1zVvV2oWxYuVKk9yzoalQZnb2rlj
	 FQoRVzKu9QMm/iCjai+9JcCl0BJeRxMrdH63dge5bvnG1WStUp+53IwigIN2CMgAqk
	 FkkppkO4jjPjh+Hmz5dQl0WnbnUYVcF4tZ0YMepQzZXeyfPwiGRaQ34dSylXL0M1KG
	 vwuwnl60OdFmk/7x8w8l1SDGG1mZ1SLTEfU5QEKbfuVxHMl6ELmCxhaCqnBeDXP2JP
	 rjr7zFFWlUmrx3KDHaXhFOW4kMtrj1Y6e0FdoLh7yU2XrhgZE0xYhoCnvsPQ9HeGsb
	 uuuRfZa7o34CQ==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 16BEE1BC688;
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
Subject: [PATCH 04/12] ASoC: tegra: tegra_wm8903: Use standard callback to set jack
Date: Mon, 26 Oct 2026 21:19:07 +0100
Message-ID: <20261026201915.57184-5-amade@asmblr.net>
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
wm8903_mic_detect() callback.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/tegra/tegra_wm8903.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 91180f4cfe17..efd46d4407e6 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -93,8 +93,7 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 		if (of_property_read_bool(card->dev->of_node, "nvidia,headset"))
 			shrt = SND_JACK_MICROPHONE;
 
-		wm8903_mic_detect(component, machine->mic_jack,
-				  SND_JACK_MICROPHONE, shrt);
+		snd_soc_component_set_jack(component, machine->mic_jack, &shrt);
 	}
 
 	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
@@ -109,7 +108,7 @@ static int tegra_wm8903_remove(struct snd_soc_card *card)
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 
-	wm8903_mic_detect(component, NULL, 0, 0);
+	snd_soc_component_set_jack(component, NULL, NULL);
 
 	return 0;
 }
-- 
2.56.0

