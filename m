Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796076;
	b=ywLp8EsVdk4KYiTuJBwbI/vlGdo38VvBshPRAHhISOY8tiZzCkl/GpqQIRbmyRZ5z89N
	 VJXYsH1oo12lcJRPPe6CxWQfrDNh8pJNm3tLTRYoxgXwyV4V/yunsdCXDASPF0nqKwRQF
	 iZq0ORTFhjvO2PBQKD5lSiEARIANddE9K4RxFW7mDitBrfE5/k8JiERwGkAyqe70r7n/7
	 SPpHTC0U+JWBvotna1ks05gHp1mPwFZUrplXSk9WEPkq7ziJxykClF1OBXwvLnvBok+en
	 0X1DLcyhOAcoF4NOdr7kimCqXwhN2RMGDbniLlRks4+8/wtXNXKdEsKWU81Gky/4IdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
	b=0HinBT8rnwB+fSOOljLsxI32abs9QGbR46BZlM3Wglm88Y9MDoK6d0yez5RGmQFu0Bfv
	 36BUbXUPsiPGNdbSsoj6Q7o0gqobwwnrm5zpEqcFJ2xaLxprcHqhqTG3sK3dyFonrvErD
	 qfVVZhgxRwla2q4bScjhnHkQy2bwC78VtvOZ3MFsKBa7b9wUikQurl2z+IIfoTZyGzK0G
	 0Jj/SZd2EV4D4KDP69U15LExAC9BavJMew0pg78m3nmuTRkjs1QvR/Ln1gGiXBUO/3x0K
	 6DLEYAIRGauFt+IRrlUT2jsrCgWHYvBSe1/3sKF82nB94a49RRr8DR/emE6I0FyrJWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSqtwQi2;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DB3606A32E
	for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2026 12:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20DB3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSqtwQi2
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso5726395e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2026 04:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796074; x=1794400874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=OSqtwQi2DvYdW/9NDnsfd4FgY18hSmMQL1OgPhtx7ddG+pD8os18yaDsqXQNiF6K5X
         VfzHIMbUnVLQipkK7O2+ICU4WweZWaeNl8oYNGHQ3ZNFu2wsz266jOZQ93OMmmUgB667
         d4kkuvpbx69nmjeyhn0Hyulzm4QxVRNGNsMEjYdBp2L8tQYEk49N91F3CL/98GmGUJ9/
         c+hRjuXNqwZSLEtMhj0CoNtvytO8U5NlcqcODMUb8BJSKRSRB8PNkbnkHSVQNoxF3p4Y
         rg0lTVu9OdjgDya8m1qSsJeLYCrU/vefTFGv4R/X8Xc/OAK2QAPPHfYO+HRO2YBdIMSt
         xyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796074; x=1794400874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=W9WHB3NXbEIsRV97WzNrBcXLAhuuGNUEMlVaQ5llQhnMQqj1fjwiXaVAM7yjUv4wHP
         JR4IM4AzjpyA3fgkQnw6yuu36WqPWXXne03iQPpUKWCaILYriGiKy0gKR1njK+pLcIoK
         lQCuqXTjVJp8nmPM3Q8GSXfwd/wx8Z0kBPw2a3/g8vaT5wXTn3R6yxjuAg1HlF+Z28pr
         10LrvG3EVpZLWSTBsCkjvt1jYQdZpus1xctDuLOOT91EQEaA+gmm9ij8RfJDiMVuNKC2
         of8elQ1NPJRQ4zpl/KI81UCvlEDOX+Dn1oFpxjtAoIlUnxDXKWzv3nvbU26ptPkDDE86
         sATg==
X-Forwarded-Encrypted: i=1; AKwUvBxT6TAX/6JXptzz5yaNcj3FllWinLzP+S6Wfw3vddDqKBa9WmShod1eyPm9IQEvyzd/H7K5FA/gy9+6iw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9qCj88LbrJ5PYniHlD4VId0cHr0J8pKZAjc60fzjNCjJyr1807
	bCN0GqmIaM0KT6dA85kCY/7G6gNlfKByerrsYKKftKBTVgJNlMaVU1tF
X-Gm-Gg: AYBFou1TL6iYqZlUInZRT5LStkUVW7hC2UOpHS8Ore1Wu+rGAM1DTTZtLlvlEtZUFjL
	DFUFW2kHSSqM4GepxxIpc+MeJLZz8Rn216taGlhnKDZO8LTIYVzfQS2r4gITE8Iz7arnO/Xn+4k
	u2S8wiAdV5cGpiV0NreDHRcffzVgvQGhls8xfJg1uXdYYbQ+HUhSEH/TJJitvqPVS6EbucBmzJU
	GOIwfAZEvfnQv3d2gEY2diDP+OhSmvU2A74wTs3+U8qZGl4NCvD4TSlvE+sEEVU/UnGhnaljNDn
	PDawDqQiEZ+d0nH6gKuWhfhMK96J3pKxtM8i2nbZx6nMRiHtXcLkJcl9Hv7SzO34UQs0eVweFmA
	m4B6Pc7NIGeF1IZFVmhhvSNNPTpMahbfbSxU+RYnE+Jyr4zXhEgtDC8HUNmJ81ZAGmLqO0RoJGZ
	JzyoZoa+gd6TJ24UBMdU01WSv0AJ9V90G2LGgO85XW6er1IfYVnLkWJc72fSCkcrEKBcadhSgI0
	lzt/bPxcBGS7c2S3oDUed8X51YxoY1oCK35J0spvopoyx0QQ6qtKCZr6RVeUj7ueGzflE4v+J2/
	4oxopzXan9QYuxJH4/KHpjJJQqArlwmA6wFdvm3lcyn4KL6y9A==
X-Received: by 2002:a05:600c:524d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ac18993ca7mr370091705e9.32.1793796074373;
        Wed, 04 Nov 2026 04:41:14 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:13 -0800 (PST)
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
Subject: [PATCH v2 3/7] ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:53 +0200
Message-ID: <20261104124057.240288-4-clamor95@gmail.com>
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

The Realtek RT5631 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
index 747a731c44c99..3f5f7638cf84c 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
@@ -36,6 +36,9 @@ description: |
       * MICBIAS1
       * MICBIAS2
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -49,11 +52,14 @@ properties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

