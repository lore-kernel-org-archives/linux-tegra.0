Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7298B27816B;
	Thu,  6 Mar 2025 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283979; cv=none; b=NsnvsFl3CLQ1e8l1EWTKwOckcCuWGc0NwXKzJPQdJWwIXv2FGjBoJHrSBQxiXnC47whu1VvVZvf2tuqjDXQ58qAqnbFBmzlKOAqbm8HCxT1pUWhcsPFKTXdUGkLa7C9snGCh2zpnUmiQnkclcHuQqOrRC1Ihkv1s5gG12PF8SE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283979; c=relaxed/simple;
	bh=LZvSOJTiRZNMh6xKBxByJLjrB/hGqczgwOUZ3Z4O9qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SIYt53sd/Cz9SsfCvDo0zZtu3AEYRSFFJZyjDZUC6ur67PB4cPgFOSYCc9lgWCCbehZUoKX1GEh6xflpBGeec3KX1YaSbnhqopQUjjKpDEX/KU06tKIk/IeEJSvd0+s73UPJRfI9KBLAG6v111Rd50JRsf060PYdaDfBf9MmHoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPARXzam; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPARXzam"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so5935305e9.0;
        Thu, 06 Mar 2025 09:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741283976; x=1741888776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUEg/tW9320QM2l/zquEPiEPNy78Woa31rtMedi65n8=;
        b=IPARXzamkwOnYgRCSxho8CMJVAzkN6rw44oQQUPOqMurjNZ9/2kuQOQ+moWeWNF6qd
         eTHjdNG7K6SbRVqOHKPCB6JUf3CRK7WYs/4ni2VCYZf14GXb4dGlRk84mRr0MVwZ+nsM
         yWjix1MuhLbynUX/K+fN1pB5HwRHp2yIYagY2pa4xdxLcifkdzoV8oelBBVBi+j4PCyj
         S5ePS9fIWOs7/PCytRvY2+J3XuJbqTESK/fAXvvanq/gefRYW682h10mF/M7L4KcmgtF
         6D4Y+6qZEIZA6zV0RSUxKvRhxn+psrIyR0hjSwf8F2WSFd87oHMhWS4xxOhUBvW+wnKB
         MfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741283976; x=1741888776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUEg/tW9320QM2l/zquEPiEPNy78Woa31rtMedi65n8=;
        b=YAXqfi0HXwH4sIO/YDrh5BPmZUkRFvb9NR31XsjUccHeTsbE9mL2CgCpGLynl2lx1A
         UJOQ4yUjYCDhceEekxhSqIT0xSogiAnCcow+X38y1Jhf65qLOplkquaH05pd+ttNF4xr
         g/4t+4donmZLoPxweBCLNwRmmEwJRJmtbrwvWNbbMmEuAH+EBUaRwpXjZRRLuXLxJcpJ
         bqbap5934Ce2pnr922nLIZfOdWLdL7rP5enKgWGrhCfAxfgmcv7hXTot7oTu33XIVQfl
         kTKN2ZsQZyQh+jXQE7brzx4PRva2rmIQMhkoT6Yhuv/+sOd/JX/OEjqPdxfh4Vr9gPGr
         D0Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWdAlsAPLOFVgwkhE2dUVEaHxDeUwwfE4x1vJpN/4HpF5wO0dE1KlbF1FqQeIm6i81cSlhy2jGe2jw8@vger.kernel.org, AJvYcCX2c7x6hLf+IiA4w41C2YzpS3fxmAJiC8S4ZcvtpWZNc3g+PwXiQdETgC092ADR2lqukqTJ1lqGuexWs3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz34peSqJe4NAGzMl3LeF02SFYh1H+od0vXZhOH4yCK3KmKgZ2R
	q24ZjTvdaauGmBEyD8nMhnJ8tEGLEqnU90/WjzGdJj/P/pDL3KKdttig8Q==
X-Gm-Gg: ASbGnctae5TmWgaKJnHrZAz5e2jEjleAIPhj0q81gZvxiTvezjZC55OOVvePgjf1Phv
	M3pFZ4yHcFN6qAt/NT1u2Pw2nU2/Lmn2DxO5bk7xJYcRh71RGasXRyfcmeKGH4KMsFEypoyvJTn
	9gn+b+/pZcNo1n8RLfRSgDlxYCJjI+Q+zleCj6qvEiRcynvjVk/2xUD35G69cUowPApWa9kK8Rs
	eEyeQ2DYTNIIOlsHTFenqh2MUVZ9G0B+09m1QbGj1eUdG2fjIa2KgnaREzf1OGKAl9t36yEOIX3
	8VohjmHX6hw7pWsse7EySxW/EwC4moSKJ3Q6bzaohLfFiPJdXHHYGHneO97/BO6SXsHuPWk5b4K
	2ERZYOq489JJGoCr4H6HnGe15UTWb7PVZxFix
X-Google-Smtp-Source: AGHT+IE7dYHflv1Ut4A2MnVIRgbW1Q8Vj8JxOsKs90z50v7aJs1az/BU9oAoyjHJ8Ql20T/HfI1MpQ==
X-Received: by 2002:a05:600c:198b:b0:43b:d04b:52b7 with SMTP id 5b1f17b1804b1-43c601d9487mr3533055e9.12.1741283975287;
        Thu, 06 Mar 2025 09:59:35 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd435c88esm55884585e9.36.2025.03.06.09.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:59:34 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: Document Tegra114 HDA support
Date: Thu,  6 Mar 2025 18:59:31 +0100
Message-ID: <20250306175931.2028613-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306175931.2028613-1-thierry.reding@gmail.com>
References: <20250306175931.2028613-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The HDA hardware on Tegra114 is almost identical to the one found on
Tegra30 or Tegra124. Add a compatible string to allow matching in case
it's ever needed. Typically the match on Tegra30 should be sufficient.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
index 12c31b4b99e1..3ca9affb79a2 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -28,6 +28,7 @@ properties:
               - nvidia,tegra186-hda
               - nvidia,tegra210-hda
               - nvidia,tegra124-hda
+              - nvidia,tegra114-hda
           - const: nvidia,tegra30-hda
       - items:
           - const: nvidia,tegra132-hda
-- 
2.48.1

