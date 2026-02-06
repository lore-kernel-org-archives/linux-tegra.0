Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EC242189B
	for <linux-tegra@vger.kernel.org>; Fri,  6 Feb 2026 17:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399286; cv=none; b=oHxouw+kFaWCOuo/vqXnbtCIlzeMNRRNRVzV3BkhKXdTPK0AyQvfEvYleqShpqFH8fQ72dALbjie7UZWjaFwfdwnVS/mUnftxOqybBXsunYseGrHomYTdIbrDQR3whoEd/EXs3RhjCxNfu0TwduLDLTTmzA/36k39aXuXFKoKnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399286; c=relaxed/simple;
	bh=NpuLlSvp0rt7DE2FRksRcz4gv2u4yN/jMLTiXBFh070=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=miob15aWHl37xFCTHcvy9mIIJlE1U9wdL9zRGRM/U4GXyMALdDS7xx1Rv5KoZqVjHXtASV9XdF1ATOuN48DudGeWu80YDRcR/UccXGBgqBMe/sMJXG1YLOtCAji03x8ci0YHGVYj06SDpwA1E+r39uDJ4jR3z29ycv7dXzhh4s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYDRu9Bl; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYDRu9Bl"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-482f454be5bso28482575e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 06 Feb 2026 09:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770399283; x=1771004083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WG1BWUJ7TOLktFU2J54JTHa25r13uiqnW4MFnSd73FU=;
        b=RYDRu9BlkXYIIJCpOEfJvhBKgylOBGDe+7YY8VIvDB//PpqghpwxYmtl6LOESxPtgG
         kc2ip49N4wAgA6TdGUBCH+MDgmn7WwMUz6fZ79iKRmp/JN/TOBzZU0KtCRInDj2Rr71i
         jLTlLQ6kGVzDRSgowMlMZjOmTQNoy4+ovKhj8kw/mQogcC03c8nQk7ZGFvnUMDeBB+rZ
         VYm/BkNIiUdXNpD3FUT1IWhg2c88iZvDViipLPGfrH7dzv4rlbcAnh8rmw6l4J3T/x0H
         l6MFco2YsmC/zjXbW5DUMCiHj+P3SRgE4klPOYlMhpyjWkIlicCyRkqItECyVTsbLcEs
         xwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399283; x=1771004083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WG1BWUJ7TOLktFU2J54JTHa25r13uiqnW4MFnSd73FU=;
        b=l6iw+z+uZKArA3dELxmDzZwrHT583G3o1kdWXKTcWD9OFM1sEU7Gg3kxPMU90hZiiV
         X57bygT2Z4F7/3X+acP60PZ28a5htJKp3lJ1SXoq8cv+JF+lo6Pd+lvTFePOX2hxREo1
         fOGDSnK8ZKNa1NKPO3v+g1CJGoZi1Y+z4sLNW5QBbfbjJJ1XYzqN3CedmuBrLDWVyxzt
         uLUcJs88QQ1GaJjnHDjDyTwQ9qY/KHNt3tdt2oDtA2+HptWqlf0STkR+G2eko6JyBEVL
         CvXXlmL000YPO+zvmxyXjujQ9C1cqSSp4iVXWZJ0bubNEM11oTRNwLAy0u/AljlFq10I
         EUag==
X-Forwarded-Encrypted: i=1; AJvYcCVJZA2Zo72Qy0fCXL7mhcia77rDvbu3WGhKTtAQqAdXgnxbruVbdEBlI0FqdfyL1WPYiv75okyMFnngVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6v2luFRKrThXpZVqsGqs+SUYgwbc6U1pzibG0Lmz54d2ZtznO
	KBKzpZTfd8+Ak4BmXOTcuARYNILQiuqIdtKaAP7wUwZpy2OsSspo4dRo
X-Gm-Gg: AZuq6aJzlTolDDj1Wxl8Y0EF+sXZd83RE9hWTzDcjSO49GZNZAoSIEWr+VluDmlPd1S
	+wP+AmuNZqhOoxCR4HB2WDS47yg3Bg8F20rh3Dv78gUMUu0Sleauco1J+64lmSPe9JRoMKG49hT
	YCCkl6O5DYQ3QaLiHu8PYcNSvIeJxOg9Bp4d/8APYG65hYykhhNntOhU1FgkIJGvSzBTN6Ficvc
	Fpy2YDO4LHkLDgYqP2S3R+Sn9TBppi0Z67+hjrb1cG/ncXqJtQuMVP3Nle4D3qIVgH8QePWMJV9
	/FO7EGs7NsD4bSxBARe/ypYUzCTS1I4Xuc+03ndcJbkvYDjBxc5ifhdRlRDeKfZ7fjqLaM+aWnj
	I/ME0ep0vowR8cf2OeiRrVvWCxCumWSqpSMuOa3fFdx7F4Jf5t6K2H4k8dp9mG26C1Z9hm6Xge8
	gv
X-Received: by 2002:a05:600c:3588:b0:481:a662:b3f3 with SMTP id 5b1f17b1804b1-483203ab7b0mr59042215e9.7.1770399282694;
        Fri, 06 Feb 2026 09:34:42 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4a1sm7454523f8f.17.2026.02.06.09.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:34:42 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] ASoC: dt-bindings: nvidia,tegra-audio-max9808x: document additional board pins
Date: Fri,  6 Feb 2026 19:34:22 +0200
Message-ID: <20260206173423.145954-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206173423.145954-1-clamor95@gmail.com>
References: <20260206173423.145954-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document additional board pins that may be used in routing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/sound/nvidia,tegra-audio-max9808x.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
index 241d20f3aad0..4957645a8e03 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
@@ -35,10 +35,15 @@ properties:
     items:
       enum:
         # Board Connectors
+        - Speakers
         - Int Spk
+        - Headphone
+        - Headphones
         - Headphone Jack
         - Earpiece
         - Headset Mic
+        - Mic Jack
+        - Int Mic
         - Internal Mic 1
         - Internal Mic 2
 
-- 
2.51.0

