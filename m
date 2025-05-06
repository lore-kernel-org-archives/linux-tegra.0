Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7E8283140;
	Tue,  6 May 2025 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538292; cv=none; b=XOYus/CQC9qQSRn5So5VXodLYI7ExGSr06hnfU+iFqBdNW3OGaZ3btU50Gu0OLdeDrNbl2dm5s7HS0eqjyURydV/Pg/Tjd7Jv1M4DCXm6cqu4dLaTLGVMVGUAYfZ6ZMXE985grdiYr+OAVAWY+IjniTJ/GPBSoz1/HOiloyyBV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538292; c=relaxed/simple;
	bh=btjeNJgN3YB0kjQAJls1FjRe+h+x/w5+rtvNA9zWi3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KAilixWESKkS5fVHZm3bt6v8qkA3Q8bLPxSyByTZ1xT/PMSqgG4h+7+6Va+gJo0n+uNVwtKAoS6Fu5wL4zSOncViB6ZDaV6ugo24y2HbbOvbYBDAid5+pvSppXWpBfQinQPHh5N8m35aqHdH0p9X/YFMLLPGCY/7y4MoI57lc1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6QGLyUS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6QGLyUS"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-391342fc0b5so3368675f8f.3;
        Tue, 06 May 2025 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538288; x=1747143088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CO2ACoq9K/NiDM+5zyO8LOqPTK7/saDpFlE2IMUvDMI=;
        b=D6QGLyUStmGJ5qy4wBUKAcVy6PicVcmatxr71FvpFkSnfev9pKnjWRvjnCr5brsrto
         YEBxo8FCwwXb+caEvKnyJKigZHNcJ2On5RubfsrUydbCF1CH14hbw7iCJ+28YRKA57lp
         oVUD+KxPtHWGZMs13vb8Dxx+UCR16dN2EL1uyUXZZPU7P1q8j0prLm1tWEKeFEr+Zmhx
         8VubjX/sReRNWNdza7k3l9yeFkom3dLjFjVrrzOoq6Uu1zJXnKBz1lbaIzCRYi2Fn8Uj
         asba8afOgRDcchnShgCfYBh2V+oKLhZ+3tK8vHgBDVAY2s/v+vm3R4hNrdb0oJmveHcU
         tbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538288; x=1747143088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CO2ACoq9K/NiDM+5zyO8LOqPTK7/saDpFlE2IMUvDMI=;
        b=nloACoMVan3rBMHxbSWLFf7NNBIBN9K6gmKgk27T3YcA6fOa69a/jfbKjPjzdIyCWA
         PvFipY5Yy/eLGqjq+VjLQIYTumoTMKAMO73OYoGeEyJ+emiY/or1s0s2FRh86wtzroic
         tFMRMRx4eHFO7HthrveZTQxLffR2Yy+QzFEQEnd9mxfpPLcvlbYavO3tJ0LK9gVtKXKz
         43znNT8577R8oO2QoOslCn1lHEilWKfdi3H2W//agx8vgEEQ5XmH6BXY+YOPSyVXZL/7
         hoGaLxEGoAtF+grHHLcdm7mRQbXSd9E9113kzWE7Zl21abAzK8y2LdOulHXKVt6fV/6+
         ldkw==
X-Forwarded-Encrypted: i=1; AJvYcCU2eoqVsxHUQXpESAQGqnDmytEf2i6GBa0ApzKF4tfjEfcZFWGugXq7fqn+E6apx1jldmzZsL0HcMf8@vger.kernel.org, AJvYcCUx+nDHJtp6AMFwZg8G78hMaxwIfe0iidnaMDmC7sDMoslZjSaOYHdGZWBzcDB0GQUysmYz+3YeTs176fM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkbfeGC4yCmxPkmMsGnR6LekmaZtB1Ab80ExowjRP/pby7ywKz
	EB2ewhIHIpk0SBebiyLLVgpaUhrNI5y0mwSjXtISjo3HO9Es2NCL
X-Gm-Gg: ASbGncvP+1qPAE3aW4JZ880IDttE9n7drMAY6JsDb1MxaIF4x/4uo0P6ERsa+GraMVA
	C+8ekB0fL71uqgFDMxV+/h6roE2lfHYQ/eHvZAXyKUhXOIkeb4LxyxV4W5m7/s1gGdTspeB3+1i
	Ja9XwYRYdcinz0RQ9zfdjMSY/u5/E/H5vpKKQWRHRMIJHpOkhsa1p79I749gzYfPSJwcUE83fsR
	8Yh3oSSve6y98OyMjnEFADcdvYTTL3sqyVe6klAiZAr3MNK0rsZWrFEKL4AVAQOAxsla44DpMYc
	BgPoCihUiCf9YEp26VsbVlCoxYHp7DGdLv/X76ZykenjTmgrRGrZNklBhh/JWA4F+axA+xq+dad
	5oWFH3iN5eyC5Lyt+pgohXksGr57F4M3n
X-Google-Smtp-Source: AGHT+IEDaXH62KwwI37pr4wDfcFSHeSXONX0vaETDZcKfgUX5r54cbwZDUoUROuqlyv3IXysrdKtyA==
X-Received: by 2002:a05:6000:2501:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-3a0ac0ec351mr1987214f8f.29.1746538288382;
        Tue, 06 May 2025 06:31:28 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b300873dsm638165f8f.78.2025.05.06.06.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 02/11] dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
Date: Tue,  6 May 2025 15:31:09 +0200
Message-ID: <20250506133118.1011777-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

It turns out that some instances of the HSP block on Tegra264 can have
up to 16 shared interrupts, so bump the maximum number of allowed
interrupts.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
index 2d14fc948999..df6784a7c96a 100644
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -76,7 +76,7 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 9
+    maxItems: 17
 
   interrupt-names:
     oneOf:
@@ -84,6 +84,25 @@ properties:
       - items:
           - const: doorbell
 
+      - items:
+          - const: doorbell
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+          - pattern: "^shared[1]?[0-9]$"
+
       - items:
           - const: doorbell
           - pattern: "^shared[0-7]$"
-- 
2.49.0

