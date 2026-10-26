Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045975;
	b=qZcPbaBrWtqFNaVzLiwIPhirdGeIcgWTQvQy5FCtOmd+OW89JjTxZqAXTJcpngTpdyK/
	 iTpq27ue958pTz6IHK1eGDCLxQlr79b6Tiz3RJw7BXbKfU/hRryMaBDoVUycZA+8xOpT2
	 wFrIqARZOqCFlg9BtltbeBb/SPVCaNY/E8yvgcWDWa9ywAbZ6cWsxfqHDmOftK2MkYZW+
	 rjaaAZyLODvqFKvPnNrXqnjaFQZTRPNmu0mirkI84MnKSkd98rq/sWoChNndfjMF5sUL0
	 1r5kg1358BbkMEEqI4Vshq8lZa4kzjuVX/eT8a0bNjmEK/y1OSAgDx5P8GJxwBcL1ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045975;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=RFdsy+jsfiNRYrfFyw7B6NVVNpsUVaA/Rsldywp99gM=;
	b=NHMl6Ue20UfEDlSM9f/DVepPC97N9lVNo1KII2HN3fnKGUKaTqK5g7gl1iJQ5bsOreRv
	 oDY+krAkdxV1P1K9/US1gvVZJSzlYoGzCUQdSbAtbYBqeXY9VTglgD7UdtnYnVFtAuX6J
	 IOu0y471CBRssIZQtX1jOgUCEQuVPqVkbZiPBiQzpzZQBjbRkfQFXGOQEQcYcIXhS+Oph
	 huXDj6iYpiwdd2xLMmRtLXpndaxIycDOqKOTva3vZ/8mU86SBPcX38m1C13d8d0igg8aK
	 8KjyQJEins9piGFnk6Ls9SIQJKIFAehClIhVWbrK+pkT41XWR3ForMfuF5zYWD0V74Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=dcCFzclL;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71022606A323;
	Mon, 26 Oct 2026 20:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71022606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=dcCFzclL
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793045967;
	bh=RFdsy+jsfiNRYrfFyw7B6NVVNpsUVaA/Rsldywp99gM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dcCFzclL/mHD3Tk4PsutPE4w1C87x9qqHiT6vUllbElSBpFgsV/+rsrbBisTmGHg5
	 h9/EnNkain+cv1e1XbZh1FEZl226LR8mY1QS9z+zfl+nxqIFgZioaLxwv2qoIr6gNk
	 NBU3xlgn8jLg52rWCCaljED+aw8zcRzH8CBWK4+0bq5bf+tVoH7wcHfR1jb4vej/t2
	 WJF1QLqiBnBlTIKbOLS9ftkmGsA9IL7dUbpqboBKxChqlq4tbR/zInBow7Je2kYXx8
	 87XqCLEwcNbMN1En8/B6yolq9a3hy4sxTcXLfJ6svKyBJcd2QbKH9P0yz7Resox5wp
	 Am/YlWkucrJ7Q==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id EFE291BE076;
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
Subject: [PATCH 08/12] ASoC: samsung: midas_wm1811: Use standard callback to set jack
Date: Mon, 26 Oct 2026 21:19:11 +0100
Message-ID: <20261026201915.57184-9-amade@asmblr.net>
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
wm8958_mic_detect() callback.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/samsung/midas_wm1811.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 11466dd3539e..9f27f4cad124 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -425,8 +425,7 @@ static int midas_late_probe(struct snd_soc_card *card)
 		if (ret)
 			return ret;
 
-		wm8958_mic_detect(aif1_dai->component, &priv->headset_jack,
-				  NULL, NULL, NULL, NULL);
+		snd_soc_component_set_jack(aif1_dai->component, &priv->headset_jack, NULL);
 	} else {
 		/* Some devices (n8000, t310) use a GPIO to detect the jack. */
 		ret = snd_soc_card_jack_new_pins(card, "Headset",
-- 
2.56.0

