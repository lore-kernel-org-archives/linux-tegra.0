Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5AA26D4DD
	for <linux-tegra@vger.kernel.org>; Sun,  5 Jul 2026 06:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783233166; cv=none; b=gPnN2B0DGnPRvgWEpm4dOf2eNsEJrj3mRhGTU7NM5e+zyEGhse21Tf5/bxHQtXOUYGn4WAN8cePFemlx+KzXE1fUc26xn04bVFt5srjO4y3eCIthg/DMWtNPnG90QdGkv5CnlpLY/GzX7SQlAQdnRqxyZPrpybgCqUAFLc2QZeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783233166; c=relaxed/simple;
	bh=Uy9t3i/+5/iZQkr0cD2zFs06fHLnmgjxIp6Ka4JbEvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E307jz8k6E6I6xmmpPYoUPglQQxeZsDvZX5J7JCNSK+NcYR+QL/j39GnagSxy+4FHqQsWu6JLdKH0lthFewiTErA3eQ2QrSSXkkQTuVKPGYMJkeT9ZU5zgeVs2U5dhbY9u4AfO/2JMIo+R0H4sTNfqhDct1gK1jubGbzQM+I4gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p296X9r/; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p296X9r/"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8479f1a86ecso1134398b3a.1
        for <linux-tegra@vger.kernel.org>; Sat, 04 Jul 2026 23:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783233164; x=1783837964; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJggn43oD/0VX63t4A/m6JnBIAg53KRXM9fkagzEJ6k=;
        b=p296X9r/GsfbqSiR+PK0iM+qfoTvRquFTYtT1v2UupclHvwlPsm+m0zpYuDgL0a3JX
         kC1xEAclvxUruGE4XB1E8mC9HLfKIwrFstgwecjAfYIE+qU6BMG4Sdv9Q2IPRn4OOdz3
         n0A6s9XhVfJaVFNcglk8W9xIxShJ23CWWOCtINPWI2xjQ0hUiFFe4BWRabBgZDvy/Wwv
         wBcSR4irZMc/2WL6DPbv5iSNOcVkgvhD8vV2f0T1V+VhKypDBdBSvC4MkhFQvAG06PoT
         PDMnBs4H/UT/qqQ9v4r4gZEv+XQbVCxJ103nxPb/WhjSveoA9+PPUtSKc0LkVbLKwckR
         n1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783233164; x=1783837964;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJggn43oD/0VX63t4A/m6JnBIAg53KRXM9fkagzEJ6k=;
        b=jOBC1cGLxADCzTQBRFKhYK+fDl4cx4rbuRD3apLxq2fKH2yQuwmBGCy1AQTOKUXSkt
         mjZdPm3TITUXwT1wyjmVRbUsOasqG4BGJ6h0PXAP/A0iZpxgnOmEnnsLfFmTdKsZnuaX
         /dbGOCvHgs+W0GwL841iVJRsdpErVedECnSJcNNlMmit+8lsWQcA/5Bag6NI7jo4VRbh
         6IjQPjrhF3NfDsom9VtLoxmrJhnp2xTlfRnbnj9BCMYRK20Q76HdJOCA1UBHXMvM7ORm
         3t+Y2Buc6zAynGnrDTTdUNVeon/Gr5d3aBUGt9ueWduE29W8nvpVApp8xO/LFiNpryLw
         R+zA==
X-Forwarded-Encrypted: i=1; AFNElJ8cvlVKmnKnbbyANj5VD39IsaHaPtAsgGRiWfBxdTsKKqYQFQr/Ufsk9jFh0s7oQual/FP/xNjDR6Bdyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpVBPpPwC+Afcn6BVuR16gvfq9A7Hlw4+M3BP7026qgQs+K39G
	XdroxVNfXIBBy16DvGcC9A4IgNRrzsu80S0CQ1znlWnuGEO6vBtEgAsz
X-Gm-Gg: AfdE7cmiI2v1Aan+NO01C+QWKz5to1HTylQ61J8niuDrCad3Bi7pVE8WkivV/4jAulT
	4vKc8l/S8oZ4WesuDzqnvsYkYoHIrkQnufxxsPNgDRYRziyPmuofrv2IgqkmQiNyXGPtk19qXTv
	ED2DOWyoWrNJws7SvUL793ufjPW6xDlUiLQf23oVFqsyBB//cxq13QhT2YlExInuw4CE6SICwHB
	+oxcdxKQlF5SXANxMRipYPrFWBLKzwB3URzDp7mV762yCx/Ywj2mzoK/BqdRSCpSjPp3H9KtHqW
	YJ1BId++A3XWO5BTNDlcBSAqNtOOT/SeisyO6cGdrXtTyug7RVkKwTZqY2cWrz41xcl89uwINzS
	fcb5GhiiWSyblho23UAN6iWVYUqXYotriT8QSxlQxjZLw/tfqZhCqk6sa3oamExsvVUxXTRHHLv
	SB6FBQjXolI8uUnPcd3EpA++Z4aq4QCXCwMbg=
X-Received: by 2002:a05:6a20:9185:b0:3b4:8300:7019 with SMTP id adf61e73a8af0-3c03e2a2ab7mr6036863637.18.1783233164068;
        Sat, 04 Jul 2026 23:32:44 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.62.139])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm58164478c88.10.2026.07.04.23.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 23:32:43 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sun, 05 Jul 2026 06:32:32 +0000
Subject: [PATCH v3] ASoC: dt-bindings: sound: nvidia,tegra30-ahub: Convert
 to DT schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-nvidia-ahub-v3-1-bacb7e05bf68@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH/6SWoC/1WOzQ6DIBAGX8VwLg0s+JOe+h5ND4Co21RtQEkb4
 7sX9KLHSb6Z3YV469B6cssW4mxAj+MQQVwyYjo1tJZiHZkAg4JJADoErFFR1c2a1mCsZqKEUko
 SjY+zDX632uO5s5/1y5opJdKiQz+N7redCzzt9nLBxakcOOU016WtcsF4KYp72yt8X83Yk1QOc
 HAhP7sQ3fiX5EawhjfV0V3X9Q+AD0mM9AAAAA==
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
Changes in v3:
- Added reg-names to document what each reg entry represents.
- Removed redundant minItems/maxItems in the per-SoC allOf blocks
  where the value just repeated what the top-level schema already
  set (reg, resets, reset-names, dmas, dma-names).
- Added missing blank line between #include lines and the node body
  in the example.
- Link to v2: https://patch.msgid.link/20260625-nvidia-ahub-v2-1-eb041c30f1f8@gmail.com

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
 .../bindings/sound/nvidia,tegra30-ahub.txt         |  88 -------
 .../bindings/sound/nvidia,tegra30-ahub.yaml        | 292 +++++++++++++++++++++
 2 files changed, 292 insertions(+), 88 deletions(-)

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
index 000000000000..348e32c1ed92
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
@@ -0,0 +1,292 @@
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
+    items:
+      - description: APBIF register region
+      - description: AHUB register region
+      - description: AHUB configlink register region (Tegra114/Tegra124 only)
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
+          maxItems: 2
+
+        resets:
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
+          maxItems: 8
+
+        dma-names:
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
+
+        dma-names:
+          minItems: 20
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
+
+        dma-names:
+          minItems: 20
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
+
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

