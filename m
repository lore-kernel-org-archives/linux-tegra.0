Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045972;
	b=EWDoDXkJ3DIcTlQIU+CI8bQbMo0ibrXnibpEUqAd0dnXO4aCnvBD4/hA/DzJoMxE6i++
	 AfJ0wf4rCti524AkrdL9YZIOZ6D5PIt1EFHosBFIWxFfaFXF9N2Dfa+KiBFkhvKpsU4gS
	 xzKUUz/fhsYwJiPZyNQ/UwLxHTJdVNk4Psync1wM9/m+IZkzD+t1yRUcjtR6Lql/UCsJl
	 gRc8p005SWeDh3fBfyqHtezWDAbGF7slEN3+SN1wQ4B5UeeSSDmNMTNAeeRc65AkWOYC/
	 t4BFeMRsibC/ATNW8rwvOiudC/2vjsFa7Rh9C7XO/r23OiH3pJYnLK7fCiwILydQbgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045972;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PIDy0lUPypJcsVGwwSX0/t4dFazyyI1jm04tJ/ots9U=;
	b=sY+/RgBUGCWnqlcp/e/GYM3rVocv32n3hf3OPR9jEaby/idn15viHpfL8aJRzA7kfnTM
	 sGdIfZWpoZXMx3TKnQW51B3C+a9zL8pTxdSsV0+pCYvQ160khe/Nf5HVuPX/Bi8AyPA5L
	 ID0anKSzuXtUuz1StWpRxKAFrrkecFoCTq0ZIpfnqLvdR0ZfGHmQ7DMhAdq3pqQzGvpib
	 I3Gvw5L4gNe0b0HLYUaGrjyMhCIAJft4fSoSDrqUPz7Zk53j8KwpqLcwItdD9LpnB+4pg
	 /d4CShGS50fsOJvtCcB5YX2MOyymvz95kUtoCYtc/fdcHb6d7eFsG2KBnwwStY5blxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=xqt7ftly;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3A0606A31D;
	Mon, 26 Oct 2026 20:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC3A0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=xqt7ftly
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793045964;
	bh=PIDy0lUPypJcsVGwwSX0/t4dFazyyI1jm04tJ/ots9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xqt7ftlyK0jJcxtKWUGYadXWTvE9HrVBieYRhIOULu+iPrtNmRAHfP4CClt9A12jK
	 g+dJ5VDpfoi49otImfTccELYfJHW0d42dwtVFtn0uCZw2UZSo43WIG/GuutTIU/WW/
	 Gxr8JCjvc6OD/acvdPCCty7inijMT7c0TctiFHKz1zDO84yX71h1PqJQbOHBFcn64d
	 9pTQ+f67wohSJ4LxmgCfSn8t2Jh8CDoFVfIDd31VapufdUcWBRT1eevzX+QG6wgq8Q
	 eQEFu7SiwJeNYQK1wGx4Ym3h37aeJmD1bWnFmlwT3jn6IdJk7gHN5kP+FGx2b1pQ0s
	 g9NThffkuw46g==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 1DE831BE018;
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
Subject: [PATCH 02/12] ASoC: codecs: wm8962: Implement set_jack callback
Date: Mon, 26 Oct 2026 21:19:05 +0100
Message-ID: <20261026201915.57184-3-amade@asmblr.net>
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
the driver-specific wm8962_mic_detect() helper.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/wm8962.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index db8b86d522ff..b36e73fabbdd 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3601,9 +3601,16 @@ static void wm8962_remove(struct snd_soc_component *component)
 	wm8962_free_beep(component);
 }
 
+static int wm8962_set_jack(struct snd_soc_component *component,
+			   struct snd_soc_jack *jack, void *data)
+{
+	return wm8962_mic_detect(component, jack);
+}
+
 static const struct snd_soc_component_driver soc_component_dev_wm8962 = {
 	.probe			= wm8962_probe,
 	.remove			= wm8962_remove,
+	.set_jack		= wm8962_set_jack,
 	.set_bias_level		= wm8962_set_bias_level,
 	.set_pll		= wm8962_set_fll,
 	.use_pmdown_time	= 1,
-- 
2.56.0

