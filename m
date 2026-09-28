Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B574E4C5F;
	Mon, 28 Sep 2026 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612703; cv=none; b=oJ37afSwU+iTTVQ7Cj9pqc87Imi6zvyGzUtn0DAmCqzGq7GDbx+LCWJnuKjTUbDBTE/9Vkx6UZZ7r/W4kLuNE0skYxda9y5NkCSKKkJvle/Odn0WgH/uY5ZjZBRRwl9/3JAXFi2+1rWtquXyolivmCe7AJ33fNfxiR5Gu+lswH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612703; c=relaxed/simple;
	bh=6aYIEYzAX94f8vE7vxOSgHJFn2r9+7dLpC1fS8xLIEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUVXn8fCsmRpAeiuPCCoAlbcTc1RCB9zFKqOd8v/pAYIUpEtioxTJ7YLyHrLlxn+PuhrzkY+vH/GAnNGZ1UXMglUX2dEjCZWe60NDwHYHcjyI2mf9/vr+Y4WB+UcQVk7Rjq+NICGZ9/fGCmmsqgoklNinMghIf+Cfl+XQkxDzPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnlQJjSQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnlQJjSQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFEE1F000FF;
	Mon, 28 Sep 2026 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790612701;
	bh=lIyVTZVzUhkqY9LYXbgs+lEalwgM0Tf5Lhk6NoV2Kds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gnlQJjSQWD4zyzQB5g3umiZOsyfoxgB92+a7nZ/g+jPOJJXqdA5ppr/j7qvWlnyms
	 lZT/JM0ExMEFOd487s3xu+eUs2NnnCk/6pMwfgNkLKKDp4l8vRG44HLS6a76K86ee9
	 0JpjmHhZSK2OfWS2UVomoJOqVVhesdxWWWpOhRQfEN2jiT/b1iPiWYl02Y/msEm8yO
	 xX6Zr9M8NEIsVnkSwqtaccQWD+YY2VvuLQE66Cr4N4ICUMVU2GoNfP/MM8nE2ClAKp
	 Sg89IjGHSQB9CkRWk9xWnPmCJIkOuZujzMy0GQIdSoiILtSEvILCn+2fCpA4SNyDXs
	 CpQFSY1i8y+ug==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Mon, 28 Sep 2026 18:24:41 +0200
Subject: [PATCH 2/2] dt-bindings: sound: tegra-ahub: Convert to json-schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-as3722-bindings-v1-2-35f423a9f2b2@nvidia.com>
References: <20260928-as3722-bindings-v1-0-35f423a9f2b2@nvidia.com>
In-Reply-To: <20260928-as3722-bindings-v1-0-35f423a9f2b2@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10817; i=treding@nvidia.com;
 h=from:subject:message-id; bh=XtR5jmaWNxauqHy57bewWTfedaplFSQXHZDI0Vi4qE4=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqupTUPRkcqf724v33C2Ng5uuApfdEbtGCWCXhh
 gdlLifoc3uJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCarqU1AAKCRDdI6zXfz6z
 oVQQD/49I2a8yObotm7zI8vDp9MBE99/CgJgc4kucWxrRmw0y8tIFCBkLJQcjcEpnVwtyFi9KB8
 ZGOIn5haK7wzdM7ExW4/hyKrXFp9Ius7HC7BkCd6DQZzBc4dppeuzk81YrZYn5RfSJ2TMVK0TUD
 PKetE1IkbcGhy1VHA96mDr8wGwVG7C2eMkaZVA0hopeWHwv4oHdTJecvCKyxboWGjhPOKD5IvAl
 HK1Ft1kOpxO2VY4aKm8vwg6hiOO93Yyj5V49T0wc0tMDBJPo66hsVoct97y7e2oh51WgOmr5xmq
 l9cFbgtQhQsn2eiIPJeJfIzV2pKXvYeLcaltg5Lc0Mp0FGWCaXrh0lGwJay5C9xgD78V8N1eJR7
 NCm1vyE+zah800pz0CB23ZEvf5yitLuRZT+v1v7eHQTYzgQgu17Cys/5lq7VGgiuKMhs3t7qgQj
 UGonKQ2TZvL0njLk2Ux+pu5ihopaMY7wb6yBCd6mk628F5kHFDgsGnXWNFQT6oyilIXT7HKnoFK
 vfRCBviQrgPQHed6hSfzrE0cD0AS3fpDfCYhA4D6/PFlJQvAT+0fKiZqgtWvVVSClaK/sQ7dmOf
 i1lBIGYYDRFJ61rMP29Y0i3n/nNRV/hXG2sifUdY0kmJDniBNH0mFL9dD6BcQWX87tpANPoL8Mn
 A93DQzqE0Ez0Ifg==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Convert Tegra AHUB bindings from the free-form text format to
json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/sound/nvidia,tegra30-ahub.txt         |  88 -------
 .../bindings/sound/nvidia,tegra30-ahub.yaml        | 260 +++++++++++++++++++++
 2 files changed, 260 insertions(+), 88 deletions(-)

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
index 000000000000..c064a2acae5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
@@ -0,0 +1,260 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra30-ahub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra30 AHUB (Audio Hub)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: AHUB client modules need to specify the IDs of their CIFs (Client InterFaces). For RX
+  CIFs, the numbers indicate the register number within AHUB routing register space (APBIF 0..3 RX,
+  I2S 0..5 RX, DAM 0..2 RX 0..1, SPDIF RX 0..1). For TX CIFs, the numbers indicate the bit position
+  within the AHUB routing registers (APBIF 0..3 TX, I2S 0..5 TX, DAM 0..2 TX, SPDIF TX 0..1).
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra30-ahub
+      - nvidia,tegra114-ahub
+      - nvidia,tegra124-ahub
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
+      - description: digital audio clock
+      - description: module clock
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
+  ranges: true
+
+  dmas:
+    minItems: 8
+    maxItems: 20
+
+  dma-names:
+    minItems: 8
+    maxItems: 20
+
+  "#address-cells":
+    enum: [ 1, 2 ]
+
+  "#size-cells":
+    enum: [ 1, 2 ]
+
+patternProperties:
+  "^i2s@[0-9a-f]+$":
+    type: object
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - ranges
+  - dmas
+  - dma-names
+  - "#address-cells"
+  - "#size-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: nvidia,tegra30-ahub
+    then:
+      properties:
+        reg:
+          items:
+            - description: APBIF registers
+            - description: AHUB/AUDIO registers
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
+        dma-names:
+          items:
+            - const: rx0
+            - const: tx0
+            - const: rx1
+            - const: tx1
+            - const: rx2
+            - const: tx2
+            - const: rx3
+            - const: tx3
+
+  - if:
+      properties:
+        compatible:
+          const: nvidia,tegra114-ahub
+    then:
+      properties:
+        reg:
+          items:
+            - description: APBIF registers
+            - description: AHUB/AUDIO registers
+            - description: APBIF2 registers
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
+        dma-names:
+          items:
+            - const: rx0
+            - const: tx0
+            - const: rx1
+            - const: tx1
+            - const: rx2
+            - const: tx2
+            - const: rx3
+            - const: tx3
+            - const: rx4
+            - const: tx4
+            - const: rx5
+            - const: tx5
+            - const: rx6
+            - const: tx6
+            - const: rx7
+            - const: tx7
+            - const: rx8
+            - const: tx8
+            - const: rx9
+            - const: tx9
+
+  - if:
+      properties:
+        compatible:
+          const: nvidia,tegra124-ahub
+    then:
+      properties:
+        reg:
+          items:
+            - description: APBIF registers
+            - description: AHUB/AUDIO registers
+            - description: APBIF2 registers
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
+        dma-names:
+          items:
+            - const: rx0
+            - const: tx0
+            - const: rx1
+            - const: tx1
+            - const: rx2
+            - const: tx2
+            - const: rx3
+            - const: tx3
+            - const: rx4
+            - const: tx4
+            - const: rx5
+            - const: tx5
+            - const: rx6
+            - const: tx6
+            - const: rx7
+            - const: tx7
+            - const: rx8
+            - const: tx8
+            - const: rx9
+            - const: tx9
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ahub@70080000 {
+        compatible = "nvidia,tegra30-ahub";
+        reg = <0x70080000 0x200>,
+              <0x70080200 0x100>;
+        interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA30_CLK_D_AUDIO>, <&tegra_car TEGRA30_CLK_APBIF>;
+        clock-names = "d_audio", "apbif";
+        resets = <&tegra_car 106>, <&tegra_car 107>, <&tegra_car 30>,
+                 <&tegra_car 11>, <&tegra_car 18>, <&tegra_car 101>,
+                 <&tegra_car 102>, <&tegra_car 108>, <&tegra_car 109>,
+                 <&tegra_car 110>, <&tegra_car 10>;
+        reset-names = "d_audio", "apbif", "i2s0", "i2s1", "i2s2",
+                "i2s3", "i2s4", "dam0", "dam1", "dam2",
+                "spdif";
+        dmas = <&apbdma 1>, <&apbdma 1>,
+               <&apbdma 2>, <&apbdma 2>,
+               <&apbdma 3>, <&apbdma 3>,
+               <&apbdma 4>, <&apbdma 4>;
+        dma-names = "rx0", "tx0", "rx1", "tx1", "rx2", "tx2", "rx3", "tx3";
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+    };

-- 
2.55.0

