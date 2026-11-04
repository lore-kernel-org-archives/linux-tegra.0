Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796085;
	b=KsURKAiuyReBOcFvBhJIuCu9Ua7eUWFanQdFg026+p0aySh6vSj/qKofzs6EWhzcXF6/
	 y3fBrgf4PiBsXjtf76TvfRe3u00RPPzgvM/hvBVVQvQkJYWdxNK9sr6ZMVi0HWPuGVeb3
	 8cGGxc36Y7MHvWcjWYrdjY1Ck3gCSjussW25ez4tg3O6m0Wgm4VXCdLNR5gl5Zm4ze9Jg
	 keP/5K56z2gcKtdkg/7y4oTwrDD3lHhn5OKVK7xMYYnsIAH4JNQWNeZo0xvSC0DDhvWY0
	 gCPyAktxjDBT53+mPHCcXQygqlENJSS+zlqVA34c8EuqbQozb0JQ1wSWx1UjI31F2bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L7Qs5HGELo2q692xBpNFNDpHNpDtILl/fMMlm1q9CCM=;
	b=EG7YykJHIBOjyrR0Fzr38R44GdXNry8yra4NJnngvm+i3shNBQy7IA7+Odr4v1HTc1f8
	 5HF4PQ7znmg9+MZ6jtXAdGyb3TVLBI2Gga9PSq7Y+J0msG4ST3L2vkGCqF5zy8C8S0VEl
	 zVvaIGnBlonfOK/4hrwaMGyReS/LiUpFzQplqhkhuCot4l822vZ/SOCni4OkV2dqJHOm/
	 v9eE0D+lX7XvgqnIuvbAzbuqjRkqADxaDjXRx+BcK6J1KzzQqcR7gtD5inQAFEWQ2nPKL
	 pNxATkYMMTKQos27clFR2tOGi+xrKjY35SPo5gMFhNOn6FA99wPuFXH75DC2wfk51kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2L77hlY;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DED606A330
	for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2026 12:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DED606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2L77hlY
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so4444855e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2026 04:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796078; x=1794400878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7Qs5HGELo2q692xBpNFNDpHNpDtILl/fMMlm1q9CCM=;
        b=S2L77hlY3JFmZzFsMAsKB/5Efv9vC9OzccoH9cJ7Ezw2jZ0jFCFaXti/iQHmqhbrcW
         nwAbU3Z6Cajg92RSkOV9yVzNpWY7QjttNPQjhLfeYb9XmRWyI8o9rWoAfoqV7Ky3qT5j
         +L5QuHt5sijyOSKLYfjfCJaRJwL/a5oKRZT9vvpJgTrfSU9A8gaQHB1KMezWl2jFd6KG
         TxKMIM9S5L+b1lVdRcoiJ+yllC2IzK5JdCnngoGsRHLK+CJeBE2Pq9XCipPJ9oF1KlQH
         2lgc9lVTswJs+yPhXLyxyTTy/YfvbXh3EEpU2o6SFewPxwqAoWY61yFGHDIFLvHz+r2n
         /jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796078; x=1794400878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7Qs5HGELo2q692xBpNFNDpHNpDtILl/fMMlm1q9CCM=;
        b=bHpDPtfa6Js0xy+NoOuH2rUbB7PCxLxt2lYGkvb25ppF099qjT0HfrMH3JLoOzUeaI
         l3zzFWuVqgfajUzmcduAL8oLuMrn1X76yucobnEcqpKEgmtmmH4Pwt32NE0pJL+dYyq4
         yfvFzRYCF2TSu60tAJGGJXcEUD2+2wtug9HXOJ7LsLJDvUN4XSE5cMHF9fJ1mlI8J2hJ
         aVi7nriKRXpHzk9ZjM7wJTajoYYrWHlJqptlPpCaa1ChWfCi539fAUjPNFhpKlEmcHA8
         IJcjjI2g4uCsQNn0LFBcnNrljv3q22k/X2vpVmpFDwY36wpboCR1bJcYDxk5lUKjjsOf
         ZxXA==
X-Forwarded-Encrypted: i=1; AKwUvByZRwQMixynFUqsrMqMWT/oaNQKxhRnZxBCGSd0PQls0uVnc/lXNvZSaV5D4b1BFa7mynuz8Hf5a/pzbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/LYIOiteTQHhDJSRh8tgd/p2WlU5CQbQQUmhU4OYgMr9JRj8P2
	twiQbyaP15M6GZxk4kVkggaOLdH67TAtPK/chbIsNw3SsXq8I9hN5eMT
X-Gm-Gg: AYBFou2uHEPqUiM9X2hf7a30AGDGoOEKzAzk5F4/ZQDQ3QmZUj4WBcrtX/TASvCG3bb
	+V3aKgHFHxC3nQqM8fBawOm8jBsjwVNDklIFF1zcD12hWSZTAJyNSuKrFfZdH9DTgDp/gfK/CKv
	k7eih2jAFtN3yqg4qOksa5qGIR5sz1qFygC5d73zXFMfhsvOhn+DCF5h2lKJkjicZDNg3BrZf30
	av99vDLFUW7IcK6A4QCCD1KHPpx7miVv9XkQUELk3WVD0TnFsqRtNI+CnjURV1HW8x5Ew3ZXpG0
	Xis/E8J93ao8yZ72FmSIXGh7IoAWXrW2PqWFosfljbLVD2cvcdDGjkfVo9rBKw7ocw5BIbqjXxt
	Wtd/1PAiH2gJzDdttquJ5ZkO9fpdZoK/pHvj2YMIC+HlBci41N4udpLku/5p0qxvSRUG1HXXzAo
	2VUY1vRrU4b97thwXiTlL0AG9aZOWvkxR/lg+C/v+42xfL3qcOlu1ICXB/A1M+Xjnae0DhnheCQ
	OsgclHeeA+A3QzVIBWa2pN3e7LYpfhd0My/kbhJa0RemTgo8mEU1zjlPwTTkYy5IS2hQ9Jv905D
	34Y/5IeMbqctYdUdiIyZOw5isvPloKy4YdLEtrG2X2bJuioxbQ==
X-Received: by 2002:a05:600c:5246:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ac1889c7bdmr363754215e9.24.1793796078321;
        Wed, 04 Nov 2026 04:41:18 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:17 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 5/7] ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:55 +0200
Message-ID: <20261104124057.240288-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Wolfson Microelectronics WM8994 codec provides three DAI cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8994.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
index 0db04a90ac6b3..f367c1ee0a947 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
@@ -69,7 +69,7 @@ properties:
   SPKVDD2-supply: true
 
   '#sound-dai-cells':
-    const: 0
+    enum: [0, 1]
 
   wlf,gpio-cfg:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.53.0

