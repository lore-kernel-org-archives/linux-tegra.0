Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B1B3E8321
	for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2026 15:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782401342; cv=none; b=Q7z5G1k8sF0BjbAyRGdCmZcmO97gpFhGsYilT5XPwk+512WdfCmLDSa12Bj884BHr+rqbe3qqo3pN6LIHPFQXGbQVEgd64NUFlQTxI2l6j4qJfwNEVAFmBhKDkDFgT05721Dcg1gXP+/IfOIi2yMc8DMBWLsxt/yKUl/uIvmq7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782401342; c=relaxed/simple;
	bh=A/M7gP2ggKRXz+cidJVmlL5bJf9us559MomwqlClaU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=srvgcFoT4puhjWu/G4QZKMipOIroXUGEMRA00a02CFllzoqRcKQyN6bSvC5nbkXGem0+kFHqmoGTB0FlQF5NDtzROYkqmJq0IlYrhUoECK+V9f1oM/wYvp12Viucagm6dNb4cy77SsA+fzx6UpBRZrDcueiXNYAbh16cIq0ZA0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c55PPGRE; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c55PPGRE"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13986d61b4eso17897c88.0
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2026 08:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782401340; x=1783006140; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ELJpRRWVEPEyA+tUppkYfBJhu/rFd652LB2QumVysgg=;
        b=c55PPGRE8dYWI9rYsn1VI5lml1ajpfqYI6xq7f1YHH9J8Uj1i6L/q5/8dRQpRaPS+s
         uoTrFQhLyV7jWKIGRpk9bXo3rp7ILK2EHdMPgKE3JFOv9hY35ht1xiKVKJNW0rMBb+lF
         wcZptQMDjcr46jLPf6nit0sVtpoFbcfx4tXpfetJYawGhOtQvqG4MFPqdL4/coU5hvx2
         fGI166vb9bEGLvnjFIudZGVjmrFQ4ujam9Xgowt7C9Ks5yiUnIICC/uHHMfjc/Lxfc+w
         p1+7NtLVJ4ZyqnrLPnOEIVTHtA3P9500CrQJNuoJFrUpSlzi8h6aBJuX6kS0knYsIqum
         8G0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782401340; x=1783006140;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELJpRRWVEPEyA+tUppkYfBJhu/rFd652LB2QumVysgg=;
        b=VwL98l5/PLrSoCRf96Qxaq0dLA6yzsIzPjdbNrLF+IuDcAEvNvZ6i8meJFqRzKVvP2
         JTS6i2/VZVe546RRoEQW8FURPPiDjxcWdVQnPSvGL63b6OT30P2hS1SIcEhgruUNEnbz
         xKRY2EINVJTo7tFtSS3pu2Sh9fMMvyMyy9zxJ4iAgfekFpXdFvZJNOnyXxTn77hK8vFO
         XGuxx6HIso/eG63OV9UmAT/PZ+/TQPlt8jIBW2hbJfRKGrpZ0LIiRMReNJnOK8BRCDsE
         yCubslOv4tXo1ScD4f6c0BmwgTONT9qPwqBup/F1AMQ58GPmoNkEuCDgM8IdQqh/TzKJ
         8JUA==
X-Forwarded-Encrypted: i=1; AHgh+RrMCc49JnW4neAo651W55QriIkN8ZMJStQ5z/7XhpWYDKJ5IMC7THfU2WrQGO0bnhXMvga7EVJ7U6uhnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrCP3dxUHQY18gIyzvpeRc3PdOvWgQMrMQyg4HeOkJfYPkC3an
	KRXsAiQm9MCsRQbtZocIsyhrKoTcU8fNo66dyNCm5eKN9BmSITb5Asz8
X-Gm-Gg: AfdE7cnE1NCLmGWiNQ6OBC0vpyyllmGguGp/hnKN1DwNnO3F9/IOKsv0lYEgaF7ZqIk
	a8TaPa//J27XAZMQirQJPt4fxVNa2iLHFiB6zBCDriS0pYLDFjBuzxlrcO6CG4cNEwQLkaaKVbm
	BqzLTQ9Llo+ao4BLwVDPUB6YmkAHdpKPA4f3DxHE16cdGQ/kDZiWxWeZvd0AyXHQPtBUkIlIW9p
	y0cOn1bDPVp5syg4K1H8wvpxjh+5jDgHIQ3Z1SPD8KVt4MSQJmqaiJWmgWK6oIReRfhYYBIquVx
	EoUf0yIQOlGLN8bpkkPnrrM5uxbYscgSUwPiNUfPbDcM+eX5apUYlXKpWMsTwykGZ/cT9eZIyRn
	Ou7NGLik2o7w9w+Y61seG6owashhoOqJG/tH5ueuwWaZmQhTsLSipgoHgSXur4im2BX532/s9L1
	KOuLW5CGbTIoEjPpNb/TWGMsDXb8Oo0o8JWg==
X-Received: by 2002:a05:693c:2c92:b0:304:cd60:b6a6 with SMTP id 5a478bee46e88-30c84db6bbdmr2836748eec.30.1782401339440;
        Thu, 25 Jun 2026 08:28:59 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.56.32])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-30c7cac87dcsm10593005eec.31.2026.06.25.08.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 08:28:59 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Thu, 25 Jun 2026 15:28:48 +0000
Subject: [PATCH v2] ASoC: dt-bindings: sound: nvidia,tegra30-ahub: Convert
 to DT schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-nvidia-ahub-v2-1-eb041c30f1f8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAC9JPWoC/1WNyw6CMBBFf4XM2pp2CtS48j8Mi7aMMEbAtNBoC
 P8uj5XLk5x77gyRAlOEazZDoMSRh34FPGXgW9s3JLheGVBiKXNE0Seu2QrbTk7U6MlJbdDkOay
 Ld6AHf/bavTo4Tu5JftwSm9FyHIfw3e+S2ryjXCr9V05KKFE4Q5dCS2V0eWs6y6+zHzqolmX5A
 RJPV4S4AAAA
X-Change-ID: 20260422-nvidia-ahub-d2ceb0372744
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2

Convert NVIDIA Tegra Audio Hub (AHUB) binding to DT schema.

Per-SoC differences in reg, reset-names, and dma-names are enforced
via allOf conditionals.

Add patternProperties for i2s child nodes referencing
nvidia,tegra30-i2s.yaml, reflecting actual DTSI usage where i2s
controllers are placed directly under ahub. nvidia,ahub-cif-ids is
not redeclared here as it is defined in the child i2s schema.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v2:
- Modify the subject line to match with upstreaming standards and change
  commit message to exaplin the changes.
- compatible: collapsed three standalone const entries into an enum,
  sorted alphanumerically (tegra114 < tegra124 < tegra30)
- reset-names: moved per-SoC ordered items lists from a top-level oneOf
  into the allOf if/then blocks; top-level now has only minItems/maxItems
- dma-names: dropped oneOf, kept single 20-item items list with minItems: 8;
  per-SoC min/maxItems constraints moved into allOf if/then blocks
- "#address-cells": replaced $ref: types with enum: [1, 2] at top level;
  added const: 1 in tegra30 and tegra114 if/then blocks, const: 2 in
  tegra124 if/then block to match actual dtsi values
- "#size-cells": same treatment as #address-cells
- patternProperties i2s child: replaced allOf + $ref wrapper with direct
  $ref; removed properties/required block (nvidia,ahub-cif-ids belongs in
  the i2s schema).
- Link to v1: https://patch.msgid.link/20260613-nvidia-ahub-v1-1-5b7e85301736@gmail.com
---
 .../bindings/sound/nvidia,tegra30-ahub.txt         |  88 ------
 .../bindings/sound/nvidia,tegra30-ahub.yaml        | 297 +++++++++++++++++++++
 2 files changed, 297 insertions(+), 88 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
deleted file mode 100644
index 0e9a1895d7fb..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-NVIDIA Tegra30 AHUB (Audio Hub)
-
-Required properties:
-- compatible : For Tegra30, must contain "nvidia,tegra30-ahub".  For Tegra114,
-  must contain "nvidia,tegra114-ahub".  For Tegra124, must contain
-  "nvidia,tegra124-ahub".  Otherwise, must contain "nvidia,<chip>-ahub",
-  plus at least one of the above, where <chip> is tegra132.
-- reg : Should contain the register physical address and length for each of
-  the AHUB's register blocks.
-  - Tegra30 requires 2 entries, for the APBIF and AHUB/AUDIO register blocks.
-  - Tegra114 requires an additional entry, for the APBIF2 register block.
-- interrupts : Should contain AHUB interrupt
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  - d_audio
-  - apbif
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries:
-  Tegra30 and later:
-  - d_audio
-  - apbif
-  - i2s0
-  - i2s1
-  - i2s2
-  - i2s3
-  - i2s4
-  - dam0
-  - dam1
-  - dam2
-  - spdif
-  Tegra114 and later additionally require:
-  - amx
-  - adx
-  Tegra124 and later additionally require:
-  - amx1
-  - adx1
-  - afc0
-  - afc1
-  - afc2
-  - afc3
-  - afc4
-  - afc5
-- ranges : The bus address mapping for the configlink register bus.
-  Can be empty since the mapping is 1:1.
-- dmas : Must contain an entry for each entry in clock-names.
-  See ../dma/dma.txt for details.
-- dma-names : Must include the following entries:
-  - rx0 .. rx<n>
-  - tx0 .. tx<n>
-  ... where n is:
-  Tegra30: 3
-  Tegra114, Tegra124: 9
-- #address-cells : For the configlink bus. Should be <1>;
-- #size-cells : For the configlink bus. Should be <1>.
-
-AHUB client modules need to specify the IDs of their CIFs (Client InterFaces).
-For RX CIFs, the numbers indicate the register number within AHUB routing
-register space (APBIF 0..3 RX, I2S 0..5 RX, DAM 0..2 RX 0..1, SPDIF RX 0..1).
-For TX CIFs, the numbers indicate the bit position within the AHUB routing
-registers (APBIF 0..3 TX, I2S 0..5 TX, DAM 0..2 TX, SPDIF TX 0..1).
-
-Example:
-
-ahub@70080000 {
-	compatible = "nvidia,tegra30-ahub";
-	reg = <0x70080000 0x200 0x70080200 0x100>;
-	interrupts = < 0 103 0x04 >;
-	nvidia,dma-request-selector = <&apbdma 1>;
-	clocks = <&tegra_car 106>, <&tegra_car 107>;
-	clock-names = "d_audio", "apbif";
-	resets = <&tegra_car 106>, <&tegra_car 107>, <&tegra_car 30>,
-		<&tegra_car 11>, <&tegra_car 18>, <&tegra_car 101>,
-		<&tegra_car 102>, <&tegra_car 108>, <&tegra_car 109>,
-		<&tegra_car 110>, <&tegra_car 10>;
-	reset-names = "d_audio", "apbif", "i2s0", "i2s1", "i2s2",
-		"i2s3", "i2s4", "dam0", "dam1", "dam2",
-		"spdif";
-	dmas = <&apbdma 1>, <&apbdma 1>;
-	       <&apbdma 2>, <&apbdma 2>;
-	       <&apbdma 3>, <&apbdma 3>;
-	       <&apbdma 4>, <&apbdma 4>;
-	dma-names = "rx0", "tx0", "rx1", "tx1", "rx2", "tx2", "rx3", "tx3";
-	ranges;
-	#address-cells = <1>;
-	#size-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
new file mode 100644
index 000000000000..1c3fc7a97465
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
@@ -0,0 +1,297 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra30-ahub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Audio Hub (AHUB)
+
+maintainers:
+  - Jonathan Hunter <jonathanh@nvidia.com>
+
+description:
+  The NVIDIA Tegra AHUB (Audio Hub) is an audio interconnect block used to
+  route data between various audio clients such as I2S, DAM, SPDIF, and
+  APBIF. It exposes multiple register regions and supports different
+  configurations depending on the Tegra SoC generation. The AHUB also
+  provides a configlink bus for child audio components, which use CIF
+  (Client Interface) IDs to identify their data paths. The number of DMA
+  channels, reset lines, and additional modules varies across Tegra30,
+  Tegra114, and Tegra124 platforms.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra114-ahub
+          - nvidia,tegra124-ahub
+          - nvidia,tegra30-ahub
+      - items:
+          - const: nvidia,tegra132-ahub
+          - const: nvidia,tegra124-ahub
+
+  reg:
+    minItems: 2
+    maxItems: 3
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Clock for the D_AUDIO domain
+      - description: Clock for the APBIF interface
+
+  clock-names:
+    items:
+      - const: d_audio
+      - const: apbif
+
+  resets:
+    minItems: 11
+    maxItems: 21
+
+  reset-names:
+    minItems: 11
+    maxItems: 21
+
+  dmas:
+    minItems: 8
+    maxItems: 20
+
+  dma-names:
+    minItems: 8
+    items:
+      - const: rx0
+      - const: tx0
+      - const: rx1
+      - const: tx1
+      - const: rx2
+      - const: tx2
+      - const: rx3
+      - const: tx3
+      - const: rx4
+      - const: tx4
+      - const: rx5
+      - const: tx5
+      - const: rx6
+      - const: tx6
+      - const: rx7
+      - const: tx7
+      - const: rx8
+      - const: tx8
+      - const: rx9
+      - const: tx9
+
+  "#address-cells":
+    enum: [1, 2]
+
+  "#size-cells":
+    enum: [1, 2]
+
+  ranges: true
+
+patternProperties:
+  "^i2s@[0-9a-f]+$":
+    $ref: /schemas/sound/nvidia,tegra30-i2s.yaml#
+    unevaluatedProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra30-ahub
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        resets:
+          minItems: 11
+          maxItems: 11
+
+        reset-names:
+          items:
+            - const: d_audio
+            - const: apbif
+            - const: i2s0
+            - const: i2s1
+            - const: i2s2
+            - const: i2s3
+            - const: i2s4
+            - const: dam0
+            - const: dam1
+            - const: dam2
+            - const: spdif
+
+        dmas:
+          minItems: 8
+          maxItems: 8
+
+        dma-names:
+          minItems: 8
+          maxItems: 8
+
+        "#address-cells":
+          const: 1
+
+        "#size-cells":
+          const: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra114-ahub
+    then:
+      properties:
+        reg:
+          minItems: 3
+          maxItems: 3
+
+        resets:
+          minItems: 13
+          maxItems: 13
+
+        reset-names:
+          items:
+            - const: d_audio
+            - const: apbif
+            - const: i2s0
+            - const: i2s1
+            - const: i2s2
+            - const: i2s3
+            - const: i2s4
+            - const: dam0
+            - const: dam1
+            - const: dam2
+            - const: spdif
+            - const: amx
+            - const: adx
+
+        dmas:
+          minItems: 20
+          maxItems: 20
+
+        dma-names:
+          minItems: 20
+          maxItems: 20
+
+        "#address-cells":
+          const: 1
+
+        "#size-cells":
+          const: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra124-ahub
+    then:
+      properties:
+        reg:
+          minItems: 3
+          maxItems: 3
+
+        resets:
+          minItems: 21
+          maxItems: 21
+
+        reset-names:
+          items:
+            - const: d_audio
+            - const: apbif
+            - const: i2s0
+            - const: i2s1
+            - const: i2s2
+            - const: i2s3
+            - const: i2s4
+            - const: dam0
+            - const: dam1
+            - const: dam2
+            - const: spdif
+            - const: amx
+            - const: amx1
+            - const: adx
+            - const: adx1
+            - const: afc0
+            - const: afc1
+            - const: afc2
+            - const: afc3
+            - const: afc4
+            - const: afc5
+
+        dmas:
+          minItems: 20
+          maxItems: 20
+
+        dma-names:
+          minItems: 20
+          maxItems: 20
+
+        "#address-cells":
+          const: 2
+
+        "#size-cells":
+          const: 2
+
+required:
+  - reg
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - dmas
+  - dma-names
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/tegra30-car.h>
+    ahub@70080000 {
+        compatible = "nvidia,tegra30-ahub";
+        reg = <0x70080000 0x200>, <0x70080200 0x100>;
+        interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA30_CLK_D_AUDIO>,
+                 <&tegra_car TEGRA30_CLK_APBIF>;
+        clock-names = "d_audio", "apbif";
+        resets = <&tegra_car 106>, <&tegra_car 107>,
+                 <&tegra_car 30>, <&tegra_car 11>,
+                 <&tegra_car 18>, <&tegra_car 101>,
+                 <&tegra_car 102>, <&tegra_car 108>,
+                 <&tegra_car 109>, <&tegra_car 110>,
+                 <&tegra_car 10>;
+        reset-names = "d_audio", "apbif",
+                      "i2s0", "i2s1", "i2s2", "i2s3", "i2s4",
+                      "dam0", "dam1", "dam2",
+                      "spdif";
+        dmas = <&apbdma 1>, <&apbdma 1>,
+               <&apbdma 2>, <&apbdma 2>,
+               <&apbdma 3>, <&apbdma 3>,
+               <&apbdma 4>, <&apbdma 4>;
+        dma-names = "rx0", "tx0", "rx1", "tx1",
+                    "rx2", "tx2", "rx3", "tx3";
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        i2s@70080300 {
+            compatible = "nvidia,tegra30-i2s";
+            reg = <0x70080300 0x100>;
+            nvidia,ahub-cif-ids = <4 4>;
+            clocks = <&tegra_car TEGRA30_CLK_I2S0>;
+            resets = <&tegra_car 30>;
+            reset-names = "i2s";
+        };
+    };
+...

---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260422-nvidia-ahub-d2ceb0372744

Best regards,
--  
Charan Pedumuru <charan.pedumuru@gmail.com>

