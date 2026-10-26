Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045975;
	b=buZGW9mNsNjPxMc3WCQ8zSHG/vZsobnpLf2G+k60IDsz1S+RwiUeIUXygCbGKBo1EGMx
	 +IJOH7QbUpaaONP6VhhpbpnAzJphbmBZxXDbAwvWKdntNV9RaqrYrJEws8vO6QYms30KL
	 V1UEJ/PNIYnEW+A895A4kdpILsIwIzufzgyfl8TUUvuyhgnBTFUJ4wlOD8aFl7iAJJmIM
	 uc+3T5FdFBjZWia/t3YxMQxoUugHUT73X5criUtVXIIDYQLF8MZQuzOw2yMd99Vr99AZ0
	 HW7EJzOnrrWBrXrwTqs2pQkHg74Bxyoo1RfGx/Z0nowI/anTvqpAKw8QUuhN4Yku7Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045975;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1g9jwwou7V27cT8YBwJj5mCRlkzBXId6baxySojA018=;
	b=F1XExGWMNitRmOPhdQXh3q7TxxIbKTSsNbxlptNA4zpICcmgOhKDP4OwntNMjWtYrC2e
	 PIGurElojBL0FnqJFYzPcpYEOAXF9XzStN8sjQu88h2g2006Ng044ZvksqUHvur5FIHWJ
	 kGWZJK5OmoMc0pxn9NR7pZVFfRViQhtyXzNt0lGsel1YbYJmrULP0NrLbyVxXje9/+0Pv
	 XDT47UlPlCIcDMiy6wIQom6p2zZCSgLN7cOCQn1wH5q9zrR70IyMkKIc57IhLq+Q2uOeE
	 0n4Bv79yl3uSlE4F05a9fVmGDv9OoQrHtmRVBAH4IHjmKdoI3S+9RMzD+ZcSQkpiZXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=bwMHUXxu;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66808606A337;
	Mon, 26 Oct 2026 20:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66808606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=bwMHUXxu
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793045968;
	bh=1g9jwwou7V27cT8YBwJj5mCRlkzBXId6baxySojA018=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bwMHUXxuwBRv4nCvtsOzgKGGWGj2Bg5TOAHHSLH4nAIwX1Lt4Ejdg9mKRJ3nuBxX1
	 4YeQ0gZh/Tk4lQ5pRlf5QJINC1Buekn8zms3dUGNQOCA+Lco6DKRC31ouhIIw2n8JU
	 ML0NbdJERN5eZryb4qISf9397NI3vBULxoyMWQwl2G7QwI7i6GahEojWqjWWjSIfWT
	 Pp+JpF4T0Pty4GYi2s8wEE07TUnzc1jQ8XGW+rUoQhxZeUTSx3jWHQbXKtUyipXjw/
	 hDaQwt57kaxyzJlUqyVhqT9VQAJvPjc6Vog06oz0N7+q1VdsQxinT5JGYljIQHiZG/
	 MdhU8lkSqXw5w==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 669EC1BE0B6;
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
Subject: [PATCH 11/12] ASoC: codecs: wm8962: Make wm8962_mic_detect() static
Date: Mon, 26 Oct 2026 21:19:14 +0100
Message-ID: <20261026201915.57184-12-amade@asmblr.net>
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
make wm8962_mic_detect() static and unexport it.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/wm8962.c | 3 +--
 sound/soc/codecs/wm8962.h | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index b36e73fabbdd..31c9080cd814 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3244,7 +3244,7 @@ static irqreturn_t wm8962_irq(int irq, void *data)
  *
  * If no jack is supplied detection will be disabled.
  */
-int wm8962_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack)
+static int wm8962_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack)
 {
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
@@ -3282,7 +3282,6 @@ int wm8962_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(wm8962_mic_detect);
 
 static int beep_rates[] = {
 	500, 1000, 2000, 4000,
diff --git a/sound/soc/codecs/wm8962.h b/sound/soc/codecs/wm8962.h
index e7f4a70ab8a4..f7e886978a50 100644
--- a/sound/soc/codecs/wm8962.h
+++ b/sound/soc/codecs/wm8962.h
@@ -3776,6 +3776,4 @@
 #define WM8962_VSS_ENA_SHIFT                         0  /* VSS_ENA */
 #define WM8962_VSS_ENA_WIDTH                         1  /* VSS_ENA */
 
-int wm8962_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack);
-
 #endif
-- 
2.56.0

