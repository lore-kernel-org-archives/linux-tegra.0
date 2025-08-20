Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001CA36CDF0;
	Wed, 20 Aug 2025 15:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702829; cv=none; b=bFF2nQX0Hb0ie9i+xIlFupN7E0yI4QL1UDVpE9G6vBRXZ77RFNxQcKtEDF7CCelwtddkumXwl9cmH4id2o7jLq+UMdzrPr440GTew/vgiW2VxjKlI4CriaAVGCJWLjTA5TLUllhGO3/pnujnRokSmptK7rnFUrR5KBghwPWySKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702829; c=relaxed/simple;
	bh=tBWwt1KFlQYci+RQzMUhNvIEG45FGCSWOle6xpiB7so=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jw7yF//BkeM4t/W9uQU+E3JmnQW1Dd+Gg4jucf0IjJgTAWlq/W13DzwMTY+KvJ1pWsagkkoSGMTqCsnh+iXQD54XQNaXYsn0qa3VAZHMhKwvQHJ4MlqBlHAAvBZC7sahBNuBPAkJ6cmULdXSvwcC63OmDKCMxhTNZ9o5lz2mMK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X36jNCW6; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X36jNCW6"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb78fb04cso946114066b.1;
        Wed, 20 Aug 2025 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755702826; x=1756307626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkHiC6+9zpjiUKXkqcqISiGjRHrQsYKvlg5KDMCOJv4=;
        b=X36jNCW6DU4fKw8suIwmZ0WzMHIcOdNvGuSIxJcTv2QYpBSKzFdUQyH9363eV9a9Jw
         8TzRKrsOV2+M5nI9QcJ5T9RXasPlLROSq5d1v+0aAqiVVtWkB8BvnnrzkRCNdiArjbSn
         tHoW8PgJClkmwW6/HlNn1fKx0UOQpBtFA/OAg1s2veHVmVifZdumPbps1CdCszyEtRdO
         qs2QhZvBY9kxkx0Laro7hN3Ogfy1rsFP3d+lJIDI/0W1CaPu4sY+F8EKNgtLGFhd1Ajg
         v3InabYz7LUFJGYF6buFjKfiHbz4DylKSUKgy0YCmfoX4ay1RJLlpEtP9MQKwuSk+Kfq
         Yz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755702826; x=1756307626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkHiC6+9zpjiUKXkqcqISiGjRHrQsYKvlg5KDMCOJv4=;
        b=eiTYyCjF8k6r4fz8XVv2FgZknbyq2HmzYMdkE/spS/FCfr0/kpf3uU3jbLuT2B6T3N
         ZiyMyaKnh+ZcNQHYTh0N1FOyAc2VzAE+gJrfJ/zWME8N7kbQrkgs0VC3wMMaCbws6rCM
         fI6bRJkzbcsVBslJ7WFQX3w5dWUMd5mIr2EfG5T8Ei3egj4icLC84HGJGWAe9+pDLYMJ
         GYv4sLkci/HHIi/sYkU1SqcjaMV0zAXc2PInR3nYjj987qZZAvGQ7xq0teAcHY0xD7iG
         QPnLJkFxXebfrDTwGngWDmjIfyCtVyTYO66Su4C2f00qun9JNumUy6DstSOxXR9hLCDt
         QC6g==
X-Forwarded-Encrypted: i=1; AJvYcCVqCGaXzliesHnx7hVJifVK6Q78+u3pB0ezTrXsqdVyla4j8+msUqOVHPfpi7zjdwK7aoFeciMAWCcxzcs=@vger.kernel.org, AJvYcCVvD/8rQAJNyISPzIRXExOrrxDXSM95SpE5GU6T9nvY+oHZeNKJPWTEmRtGNPE5NETjDOtlXNmttIOO@vger.kernel.org, AJvYcCWRYi6UdWgA3+EFy0I4hRb0Q8ZXdUbGaCVrtdeWwrTjC6gtb5I8478jjOTqkIvb3KgG/viJw58nuNuv@vger.kernel.org
X-Gm-Message-State: AOJu0YySnRYreqnQ+NucYP9OVSVXDvbvBGf0nVnsbuMzP7eX0OSRlmX+
	5IxhDQQHIp8eqGASIfm7wV41bfYDa7QdJq364Q0o9LeGXGFfI+r0uLXt
X-Gm-Gg: ASbGnctPE44Jb5QUt8MJLsbYTxwqLTu21RLSJX0f6F2gDj98jnyyvsYRasZ0Z/dKxkG
	WGzW39uWb9u4KjIjw5DJSn3H/HvdWeYoY1ciyVj24qQjNNW3ucTA8yJ46tYvZ6cM2TpTBWQXI5z
	RJbnON1p5cm/L0IMNKNqOGwkrAKoEt8nZnhxz1PeP9+Frq8RgQx60UMMSyiFVpJSTphUtGQT6qG
	aVl1SJN9Am7KJGQyYE6zJgQDMrcIdvGEHzajSZuzep+wZujb/J4N2bDuGL5fnKIFq6Yc2w5tca/
	Ldz9KGG6K1AebG/HK09r6RNS1Y3NTueqfQNirL2fZ/N2YiZsg3TYqAitaL2TeHz9rbMWCJtA7Y1
	L1+i0jFAKjwuiMA==
X-Google-Smtp-Source: AGHT+IHK5gx9PX4Gqg9rN232F1FoJaOx6U/EUFiXeHt3ZUSqH4zoApoUsTbFn8LZSDpeLVrDKCe7Og==
X-Received: by 2002:a17:907:2d24:b0:af9:9d7b:6f44 with SMTP id a640c23a62f3a-afdf015f3acmr308303766b.19.1755702826068;
        Wed, 20 Aug 2025 08:13:46 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdef1d34f8sm175905166b.83.2025.08.20.08.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:13:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 2/9] dt-bindings: memory: Document Tegra114 Memory Controller
Date: Wed, 20 Aug 2025 18:13:16 +0300
Message-ID: <20250820151323.167772-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820151323.167772-1-clamor95@gmail.com>
References: <20250820151323.167772-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Tegra114 suffort into existing Tegra124 MC schema with the most notable
difference in the amount of EMEM timings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../nvidia,tegra124-mc.yaml                   | 106 +++++++++++++-----
 1 file changed, 80 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
index 7b18b4d11e0a..e2568040213d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
@@ -19,7 +19,9 @@ description: |
 
 properties:
   compatible:
-    const: nvidia,tegra124-mc
+    enum:
+      - nvidia,tegra114-mc
+      - nvidia,tegra124-mc
 
   reg:
     maxItems: 1
@@ -62,31 +64,7 @@ patternProperties:
             minimum: 1000000
             maximum: 1066000000
 
-          nvidia,emem-configuration:
-            $ref: /schemas/types.yaml#/definitions/uint32-array
-            description: |
-              Values to be written to the EMEM register block. See section
-              "15.6.1 MC Registers" in the TRM.
-            items:
-              - description: MC_EMEM_ARB_CFG
-              - description: MC_EMEM_ARB_OUTSTANDING_REQ
-              - description: MC_EMEM_ARB_TIMING_RCD
-              - description: MC_EMEM_ARB_TIMING_RP
-              - description: MC_EMEM_ARB_TIMING_RC
-              - description: MC_EMEM_ARB_TIMING_RAS
-              - description: MC_EMEM_ARB_TIMING_FAW
-              - description: MC_EMEM_ARB_TIMING_RRD
-              - description: MC_EMEM_ARB_TIMING_RAP2PRE
-              - description: MC_EMEM_ARB_TIMING_WAP2PRE
-              - description: MC_EMEM_ARB_TIMING_R2R
-              - description: MC_EMEM_ARB_TIMING_W2W
-              - description: MC_EMEM_ARB_TIMING_R2W
-              - description: MC_EMEM_ARB_TIMING_W2R
-              - description: MC_EMEM_ARB_DA_TURNS
-              - description: MC_EMEM_ARB_DA_COVERS
-              - description: MC_EMEM_ARB_MISC0
-              - description: MC_EMEM_ARB_MISC1
-              - description: MC_EMEM_ARB_RING1_THROTTLE
+          nvidia,emem-configuration: true
 
         required:
           - clock-frequency
@@ -109,6 +87,82 @@ required:
   - "#iommu-cells"
   - "#interconnect-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-mc
+    then:
+      patternProperties:
+        "^emc-timings-[0-9]+$":
+          patternProperties:
+            "^timing-[0-9]+$":
+              properties:
+                nvidia,emem-configuration:
+                  $ref: /schemas/types.yaml#/definitions/uint32-array
+                  description: |
+                    Values to be written to the EMEM register block. See section
+                    "20.11.1 MC Registers" in the TRM.
+                  items:
+                    - description: MC_EMEM_ARB_CFG
+                    - description: MC_EMEM_ARB_OUTSTANDING_REQ
+                    - description: MC_EMEM_ARB_TIMING_RCD
+                    - description: MC_EMEM_ARB_TIMING_RP
+                    - description: MC_EMEM_ARB_TIMING_RC
+                    - description: MC_EMEM_ARB_TIMING_RAS
+                    - description: MC_EMEM_ARB_TIMING_FAW
+                    - description: MC_EMEM_ARB_TIMING_RRD
+                    - description: MC_EMEM_ARB_TIMING_RAP2PRE
+                    - description: MC_EMEM_ARB_TIMING_WAP2PRE
+                    - description: MC_EMEM_ARB_TIMING_R2R
+                    - description: MC_EMEM_ARB_TIMING_W2W
+                    - description: MC_EMEM_ARB_TIMING_R2W
+                    - description: MC_EMEM_ARB_TIMING_W2R
+                    - description: MC_EMEM_ARB_DA_TURNS
+                    - description: MC_EMEM_ARB_DA_COVERS
+                    - description: MC_EMEM_ARB_MISC0
+                    - description: MC_EMEM_ARB_RING1_THROTTLE
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra124-mc
+    then:
+      patternProperties:
+        "^emc-timings-[0-9]+$":
+          patternProperties:
+            "^timing-[0-9]+$":
+              properties:
+                nvidia,emem-configuration:
+                  $ref: /schemas/types.yaml#/definitions/uint32-array
+                  description: |
+                    Values to be written to the EMEM register block. See section
+                    "15.6.1 MC Registers" in the TRM.
+                  items:
+                    - description: MC_EMEM_ARB_CFG
+                    - description: MC_EMEM_ARB_OUTSTANDING_REQ
+                    - description: MC_EMEM_ARB_TIMING_RCD
+                    - description: MC_EMEM_ARB_TIMING_RP
+                    - description: MC_EMEM_ARB_TIMING_RC
+                    - description: MC_EMEM_ARB_TIMING_RAS
+                    - description: MC_EMEM_ARB_TIMING_FAW
+                    - description: MC_EMEM_ARB_TIMING_RRD
+                    - description: MC_EMEM_ARB_TIMING_RAP2PRE
+                    - description: MC_EMEM_ARB_TIMING_WAP2PRE
+                    - description: MC_EMEM_ARB_TIMING_R2R
+                    - description: MC_EMEM_ARB_TIMING_W2W
+                    - description: MC_EMEM_ARB_TIMING_R2W
+                    - description: MC_EMEM_ARB_TIMING_W2R
+                    - description: MC_EMEM_ARB_DA_TURNS
+                    - description: MC_EMEM_ARB_DA_COVERS
+                    - description: MC_EMEM_ARB_MISC0
+                    - description: MC_EMEM_ARB_MISC1
+                    - description: MC_EMEM_ARB_RING1_THROTTLE
+
 additionalProperties: false
 
 examples:
-- 
2.48.1

