Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7CE2D8769;
	Tue,  8 Jul 2025 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971978; cv=none; b=GMj8HBsHxVP2uJKExFrOphsEUbTrzqIAiTy9JcCAbx3cBdHwypNwI/T5rWu6vmL+e8+ZBkU74xshB8UG0s8xDHXPL4WwpLPqgFfby4WmhYG4B5g2j6BjVakZgvnKShi8LdPEwxspZ49KLYzk83+aiu1v9+KeS+smCKh134PeqUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971978; c=relaxed/simple;
	bh=TSpBBbL7dPWV8zLAKK1w7X5ANe208TsE6aLeo0awRiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7h7+2y7k2dBjuIqLlpwnQKQ/1o/uRkvKGwj6CgrZ+/6lp6ULgjdMLYGIHl7cafndi7fcNsVR0RdMZj7XZfhwJhQVGo9IeLzxPpyPgECwf6R0oWDMhZBhT9SuuTC/ALFe12AWjK8J0xP7+lQdxxM7P7zxmQLEs6Kk06pHTRuIaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNhK2ycj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNhK2ycj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso35803905e9.0;
        Tue, 08 Jul 2025 03:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751971974; x=1752576774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7OFax7SIi5NPIT8GXUtxoR8oyjCAZI9M9j9amsabWw=;
        b=aNhK2ycjiAFQrxO+9jSdERkwYlwJZOin1KHsx6g4Uhb+o5UBtw4KK3YwUsf4BwfJPi
         ludkQrfnD7inoCbA3alKxzwObKUM7MD8w/C1xDlUKXi5MikfUF6of+bMi7bRyNASjKxU
         p5LJGfahknazQbBdK5vdON5JzNJ1Kx9l+Q88QJqD+zGcOV+H2Uzeke6q7n/QUGdKUPge
         Chx987l1ngJZO601HDf135sMK6W9TyFqrYUKs3FwGIXzT6x4DX88MxygWI7D5lUPyPe9
         mFvQrASRPKxB1ykCeMfr7O0fDWR70F4fUkWKfYaW0HLsyuuPQDCGsKG14ECWu50GCEgq
         uzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751971974; x=1752576774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7OFax7SIi5NPIT8GXUtxoR8oyjCAZI9M9j9amsabWw=;
        b=aPPbX+/fpmotOHfIUako5g++7l8n7gjMmdwFxlQAMEAuSWxz1MFqApsclanMvaloOf
         1jpatPkmWDuReaeDzyseomutHfsAvMW54dvqwnrFDCSmQIdtcmbwbxFoVLBwsujCeonb
         HyPX79g3yiKgvFISKYrDkAdrWlQCDrhf+jCQSp5yoRilHwJa079eHPoPjUepfyrdiB5M
         oITcGA/eEMWtse5bu5ilWyvYL7DrFSTnYNLvF1S6APscjMyIBqbzNgL6czbPXKT3ZPiR
         t9yp+1zZ/e0iPPNFVDz+91e225xo5TXjSZKR9vkeSvLMZ0ubaD6+Q6QA2KhQkayP5oOd
         Txkw==
X-Forwarded-Encrypted: i=1; AJvYcCVR3J4QG7Meye6XH6DSza6lBh8g6zUxxsSW4CMZHMVk5yE39BOFeayEcxA1kNsgb9xjUj2h4dkQE4f1@vger.kernel.org, AJvYcCXRIBQvlz7gLC6Ozff3Do12a8O48vp0w3lQRFBjaorCpc3dlOMnI7ziFcR9dg0/Y7J7mOcXmCLzVAfD8Gc=@vger.kernel.org, AJvYcCXaMKBfdcn/YICyh99U/mHWCz09CJrKG7pxXLk5jnXUcI70JNOR6V9Uu5WwJYeqiw3n1V6QHMefaTRXaR+l@vger.kernel.org
X-Gm-Message-State: AOJu0YyUB32l59NVirKvu7Hu/aCF8dvw5I1mcYlPdXfeYIHMHjSY8/4x
	44lh2BHewhAFA2Sxw6o23mHp0g4o/WLHe3ZMKhKfVKkkDFCaoXz/aZfa
X-Gm-Gg: ASbGnctowrla4P+pT553AK+HzPhIiySYvHTxTL1njJvSntfGQiybRZc+pslUpnostLe
	laD1t6GTzkiNDwYfPGcTXAQlQXTJCMlkP3V2pSmjP2cqqi4a9s3Emrwadf26+YT/GLqqlvDjnfr
	0rco0iqmMT/gS0Fkinq5RW3J0TR888zerGvNs0zD5/6Jikp+0yb9rvQwSJToNr1oFYwY8aLvwKa
	XTai0QEEJewAHb3e0bQwRf30YvJnsqmz8ZjjFZ0MFPehk0z1Mgdr1PCtEvcjtL3EDKziOh04UUQ
	CWKQZu9DqXfC6u6rLsKj2lykrahQaedZU5YEIxfOJWx6FFLqk4fVoPei7bfA/V0k/3rV0uCtjyc
	2xYw2qhJnJYgnoEP4vnwBWQ7SZkFY8q0ZXmzKK4XaLh5OYP+rDX9oBg==
X-Google-Smtp-Source: AGHT+IG1JaHJo7wX3dVzWr661xLF96lGhUSG8XuOGEiyKaS4rLH9vQfnukA38xr+M9jNeDgXDoGyrA==
X-Received: by 2002:a05:600c:524a:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-454caa4d70fmr55077285e9.4.1751971973880;
        Tue, 08 Jul 2025 03:52:53 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454cd43c6besm18557475e9.7.2025.07.08.03.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:52:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: memory: tegra: Add Tegra264 support
Date: Tue,  8 Jul 2025 12:52:42 +0200
Message-ID: <20250708105245.1516143-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708105245.1516143-1-thierry.reding@gmail.com>
References: <20250708105245.1516143-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sumit Gupta <sumitg@nvidia.com>

Add bindings for the Memory Controller (MC) and External Memory
Controller (EMC) found on the Tegra264 SoC. Tegra264 SoC has a different
number of interrupt lines for MC sub-units: UCF_SOC, hub, hub common,
syncpoint and MC channel. The total number of interrupt lines is eight.
Update maxItems for MC interrupts accordingly.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia,tegra186-mc.yaml                   | 65 ++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
index 935d63d181d9..52575a16349b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
@@ -32,6 +32,7 @@ properties:
           - nvidia,tegra186-mc
           - nvidia,tegra194-mc
           - nvidia,tegra234-mc
+          - nvidia,tegra264-mc
 
   reg:
     minItems: 6
@@ -42,8 +43,12 @@ properties:
     maxItems: 18
 
   interrupts:
-    items:
-      - description: MC general interrupt
+    minItems: 1
+    maxItems: 8
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 8
 
   "#address-cells":
     const: 2
@@ -74,6 +79,7 @@ patternProperties:
               - nvidia,tegra186-emc
               - nvidia,tegra194-emc
               - nvidia,tegra234-emc
+              - nvidia,tegra264-emc
 
       reg:
         minItems: 1
@@ -127,6 +133,15 @@ patternProperties:
             reg:
               minItems: 2
 
+      - if:
+          properties:
+            compatible:
+              const: nvidia,tegra264-emc
+        then:
+          properties:
+            reg:
+              minItems: 2
+
     additionalProperties: false
 
     required:
@@ -220,6 +235,52 @@ allOf:
             - const: ch14
             - const: ch15
 
+  - if:
+      properties:
+        compatible:
+          const: nvidia,tegra264-mc
+    then:
+      properties:
+        reg:
+          minItems: 17
+          description: 17 memory controller channels
+
+        reg-names:
+          items:
+            - const: broadcast
+            - const: ch0
+            - const: ch1
+            - const: ch2
+            - const: ch3
+            - const: ch4
+            - const: ch5
+            - const: ch6
+            - const: ch7
+            - const: ch8
+            - const: ch9
+            - const: ch10
+            - const: ch11
+            - const: ch12
+            - const: ch13
+            - const: ch14
+            - const: ch15
+
+        interrupts:
+          minItems: 8
+          maxItems: 8
+          description: One interrupt line for each MC component
+
+        interrupt-names:
+          items:
+            - const: mcf
+            - const: hub1
+            - const: hub2
+            - const: hub3
+            - const: hub4
+            - const: hub5
+            - const: sbs
+            - const: channel
+
 additionalProperties: false
 
 required:
-- 
2.50.0

