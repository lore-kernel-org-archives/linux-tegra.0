Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796082;
	b=oo8f63VNXe11MilPDY++XifOjPq3/FZnJE2NPBkHS4s7DOtju/r0aOrdFntNHuNghi+7
	 ARnPbDf3kOaIW2yLilgbfJSkZa7AuVHZVnePNi9r1/sznoNzVle2IUHxpKq3uuDn8vamc
	 nDR/XPe9uzz6iwL+Sjy6JJlaGz6U/XBGsmD9MrZKVqqv60ztQsLHrPpdUv4LRF+MOgf8A
	 le2bn8Xzz8dvcaXQwA4a6Eqy5A1HF0ntL0RA/jRVWl3hudi+5nGtdoxSfni5zPs5skhmv
	 Up6WtKg/YS9DiuiHWI/WE9drN+ULuAsngLbrMpCcY4zEtqv+Hjfu6fdDOHVH70RThtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
	b=rofwQ+XYnYFNY6DeuUFCzBe4gil4+ysLkhHnjF1WWCz2oYsnel9FGtT+yuKZ7s5JHzFA
	 tHRHraHkN9bLd1mHWDSu3dp+hLAJh+ccNq2fcf0+gK2tkR1so/ZgAffEIc/okMW5E5Ox+
	 PDoL4NpDXcitXBJk+JegHO7HkS6rlbhxROqdpAKDVHuvwmYhTLmkA2B8XYeZiL02PDJhk
	 EkqAK7Bl8ojTot33TXr2Anzm1pYHuYOAC8L+ck5xRSXlYG7GxFh56EWFu4RUTECx+p2Vf
	 ZXYlyLO+VKWADwDXvRm2rg5WOLxVX1jlzxefqum48o1XzvoDkO2uxF6/kuu0DBH4gMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNhd0UHH;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4CB606D80D
	for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2026 12:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC4CB606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNhd0UHH
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so10488535e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2026 04:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796072; x=1794400872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=eNhd0UHHlwredQE9dCABAE+no7ssHugAHzFNVD852XOpfPGxF8uQ9W5bPcI3+MwqR9
         Cw++Le4R37QwQjXfc7M46J56SV978jsy4//A9Cy2feU8/LlulcdRClN6aPk837nurjgn
         l4TyUixz3zG3gjBQX03Rsnm7rjLh1fJTNlKDUOxYodLhoED3eUn0Mu1xuXAzVGPXWsDL
         dvv50lpMvZDaxqD2yHPFMqfoQ8ZhHJNhlBPenAaQdepaWew5UKtMxAA3Ulo4MhH/eHqA
         FccmAKvd6BxvHxocuIHe4/MNg46zvMZYOffXunaoQYmCQGxfv3vVaKdD1LqcXiY24ExE
         MIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796072; x=1794400872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=STyAm+6UTSrKH/ReA2luOkErk+60oAyGGNgo0F+6J56Abbs48mS06mmIiDD/WKpQGF
         A4thI611VSlwwKPIP2V+Ivp4+lyUPteX1I2aB9/RFnG6aFB6HvwOitOCs9mH5Bm66qnz
         9PXm2nQwaZ3HIw6wVWs9BWkFSfVWnW7Gtu2gwK+OFhGNYV1MxXBN4O/A9/8pKD8gaun0
         hOA9xBh4Ai5/Tlqt007rQ3c6fGPa1P9+zQHM8yFXnngdz9aW6b9Lan6zyjf9Emrxqs20
         2oXd8cD4Wlv/M5aO6BTn20cqpeh/nO9VE3NFctojz+SkjtOktIk/SkSOGaS9twRRkizv
         8qCA==
X-Forwarded-Encrypted: i=1; AKwUvBx7GEK1BqQJsU9Lmzbf+OzE6V0uVDPOqhy7UMXSljk5AFEwSsrxaOr7oBRIw+vgmFkIqwlBCQrVruWjCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9/WebbsYCLgySYSgtwk11icreZnU3S7tAeK9Qy6Yptr1cElKYg
	AeIr3QRdjCUcMFu6mjXQJAmq7O2FNQDnsflex6H3ibWi2Np/7x6NH5Gk
X-Gm-Gg: AYBFou3Qkcw1r8j8woWTdcCA57lWhMTDA3B3no+G7Bw5mvDaRjr1xe9rubMrz6hhI/x
	TJc5H7BoBcN7wwDuUe+ZaY4oYb4uoJ1VT2YMBDzEUwpIYtjcM4WL3YadG5YL3fxMkkna52zli+d
	4wslnupXSDdW/8V1sTOAMV0nPa1lNsJfNrg2hfv8kBh6A+pCssOtJz5EKS+N0rNW59cKkJTd3ZT
	CcgUNVqD6/HJ4Dl18PLQy+zfjR8bRuskCGzhwm19+i1+kmM3REUAeq0SQD9lsCCyCedSS6Bz9aS
	I/sMxbMvPy6aEQbar3Gnv3X4C3LEgMTSr/9Ec+6RvVzUvWilOz3pGoJRlxRmP+/3C30pQD5+oUD
	wd5B9J4dt7s9/BhkPkjuTXbrKFm2rb+34Oo3oKMvb7IIj1r+jkn4DUWiiNtXPNH3CAyr42wKTt1
	4oZx/ZYI4aD67YnwwwDczMYlKnDlE6NKgAgn4+sMfT84Q816tffIdGFT6yIlVUVX7ssJlipq3/m
	XKapOKqD+h/8UpWyTxgkoNzh/EMcKcCryMz8aHVB28hR8W5xhRSZw0LCipsPcqoJ/xCa2vZogkK
	arpeLoJ1XI6ha5+W7pwmGmw0af6npBSZHm8wLxDnl0FZfLrGcQ==
X-Received: by 2002:a05:600c:19d3:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ac1209eafcmr361875015e9.0.1793796072166;
        Wed, 04 Nov 2026 04:41:12 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:11 -0800 (PST)
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
Subject: [PATCH v2 2/7] ASoC: dt-bindings: realtek,alc5632: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:52 +0200
Message-ID: <20261104124057.240288-3-clamor95@gmail.com>
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

The Realtek ALC5632 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,alc5632.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
index fb05988ff7ea0..939b1fbf2afe6 100644
--- a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
@@ -28,6 +28,9 @@ description: |
 maintainers:
   - Leon Romanovsky <leon@leon.nu>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: realtek,alc5632
@@ -40,13 +43,16 @@ properties:
 
   gpio-controller: true
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - '#gpio-cells'
   - gpio-controller
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

