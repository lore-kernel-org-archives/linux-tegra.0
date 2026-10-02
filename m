Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D0A443C02;
	Fri,  2 Oct 2026 07:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926756; cv=none; b=r8t3cy7JegyZxUozlTuhVkonOM/7w98Y9dcxppuj0TELvWTFwXAxTxWoTnxK5Cn1EHXrKa+SRcIZiPIcjuJHuA7mvH+WRjgZa83Bg3W7TaNIq+Xkj9oKdSaWdKTkUW7gFsmdnpCJYCTxvly6ebukulauVGXExCvI8ST1dZgwjCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926756; c=relaxed/simple;
	bh=sZCTOabKZ4Mm55sPjZyBa4b9L80szipCIeKoA+aAuYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i7tGGBpnNuJRar6qd5p8ZYMCpBJRXufV6kDxlVwIRSVxCBEfz/2kwT2oEhu8LXxdPLhwagvNwnBwBnHN+c0ahUORLHVC9nvD2b9V/WKfyAbhxnDNTUmT5avzh1MetuyCODqOf30aJ/z6SPYHSFFq8Tux2w557/CYdcdBPAKIxzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqXVx1yt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqXVx1yt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9BC1F00893;
	Fri,  2 Oct 2026 07:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790926753;
	bh=HxGYrLXS+nAHHOrFU/8EkXDQxvkIzVEf9fptDYBDd/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YqXVx1ytVTQ+y0zWtWCcezIwjMZU4/X4C6ulkadIN/5o4RuarH+wa9FHqG/zI+GLj
	 5v0x7IU5JHIF5gpOsQ5POTI7KoSI8FwK7j6rV849dTzoVjD9cJbYJpvK4DX2HQnuxn
	 KM8cLcs/i2CN5pAE1Xce4Ds/N0LYRKoh9JWs4nNfzDgd0aTkgg2SjowGGv8fOWLfnS
	 b4q1CwZCpnOwcCW1c0871cTBPHp3G8bUWlU4u9rpkDwux2v7sodb390iS6EzGT7X6Y
	 FWi699ritAGg4kEGB5aXRCmgcRWSF1Trov+KvdaieP0+BTj3nqZI2oYRqRoofIcIai
	 7oNdCa8dkM32w==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Fri, 02 Oct 2026 09:38:59 +0200
Subject: [PATCH v3 2/3] dt-bindings: ASoC: nvidia,tegra30-ahub: Convert to
 json-schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-as3722-bindings-v3-2-21c179b72a95@nvidia.com>
References: <20261002-as3722-bindings-v3-0-21c179b72a95@nvidia.com>
In-Reply-To: <20261002-as3722-bindings-v3-0-21c179b72a95@nvidia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12167; i=treding@nvidia.com;
 h=from:subject:message-id; bh=RZtfTyblMtM5FY5IpojD3YaH1hZxAG4rUDybvDQ2HUg=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqv1+ZWeGzdRMLeDyITPdDsFVwsdDkw3McYZKhM
 pTVP18SZgeJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCar9fmQAKCRDdI6zXfz6z
 oeJmD/9rtW0nIuiO51bu/HrErro8K4GDZ8THM3s6ivrR6YxU8Kj3sPG0lV/eyepdCqx/Me+4Vsn
 QlKQoJacqNKrdf0g+jxa6dCzFAdVt968KPXM91CI0hkHOQ+TbHffTfeAuzWag4ul6UuJayeXXei
 xRC0ZI4nj6SWnImBuXnzDpfr+0+xgRMLS+5dvc27v1IK6rIu/Po37ON36iQm5gG8ih6HfcEgmA/
 ljTF8zsY5+HvkA9NYQPbibir+kjt4VOzxLqRNC3dsZ/jKoNN7zPt8mm4Y/KBkW7/OacvSfhi7tG
 hsKthjqGeQZDjsyVQ1kuMLdglgVA8VUZmSqsXh1RAn539wqhAPxnGSlCtblXPTSZNpTLNWsAz6/
 /rxo6lG5YGoQhYugAmFZV8/CZ/07I260E6coKEfpYn43CsaV0C8ww8HHVN4Z6bjQ5J7bb1DN0ik
 OHFaR3iu502kTMb+oSxcSHZaLea/LLp9DbTYN72H8KqBpurlWGgB3FZUcpkMMvkGDCEEKkcQqai
 FIZ7y9YRuVAkiLe/ZRVy6oAHNw8AjZgOUfQoLaMNKJME52SyCUcmaXGHZDgTUs+ApVtJDMze1TH
 6B36uJp2lDG6XKZLIkiqNRAv8lfd6E52TMZtTAz2kSp1f4Z6KnGbmaz8KyZlIdjeYriOSg2Utks
 B3Xquj9naqklfNA==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Convert Tegra AHUB bindings from the free-form text format to
json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Rob, you gave a reviewed-by on v2, but Sashiko flagged that the per-SoC
constraints don't properly match on Tegra132. The only change (well, in
addition to the subject prefix fixup) compared to v2 is changing the

    const: nvidia,tegra124-ahub

match to:

    contains:
      const: nvidia,tegra124-ahub

It's a really minor change and I suspect your Reviewed-by would stand
regardless, but I thought it best to resend this to make sure.

Changes in v3:
- use correct matching for per-SoC property constraints
- fix subject prefix

Changes in v2:
- add compatible to the list of required properties for i2s child nodes
- use consistent style for description properties
- add correct set of possible compatible strings
- add per-SoC constraints for resets and dmas
- wrap overly long lines
- fix yamllint warnings
---
 .../bindings/sound/nvidia,tegra30-ahub.txt         |  88 -------
 .../bindings/sound/nvidia,tegra30-ahub.yaml        | 289 +++++++++++++++++++++
 2 files changed, 289 insertions(+), 88 deletions(-)

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
index 000000000000..26077c3ce198
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
@@ -0,0 +1,289 @@
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
+description:
+  AHUB client modules need to specify the IDs of their CIFs (Client
+  InterFaces). For RX CIFs, the numbers indicate the register number within
+  AHUB routing register space (APBIF 0..3 RX, I2S 0..5 RX, DAM 0..2 RX 0..1,
+  SPDIF RX 0..1). For TX CIFs, the numbers indicate the bit position within
+  the AHUB routing registers (APBIF 0..3 TX, I2S 0..5 TX, DAM 0..2 TX, SPDIF
+  TX 0..1).
+
+properties:
+  compatible:
+    oneOf:
+      - const: nvidia,tegra30-ahub
+      - const: nvidia,tegra114-ahub
+      - const: nvidia,tegra124-ahub
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
+    enum: [1, 2]
+
+  "#size-cells":
+    enum: [1, 2]
+
+patternProperties:
+  "^i2s@[0-9a-f]+$":
+    type: object
+    required:
+      - compatible
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
+          contains:
+            const: nvidia,tegra124-ahub
+    then:
+      properties:
+        reg:
+          items:
+            - description: APBIF registers
+            - description: AHUB/AUDIO registers
+            - description: APBIF2 registers
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
+        clocks = <&tegra_car TEGRA30_CLK_D_AUDIO>,
+                 <&tegra_car TEGRA30_CLK_APBIF>;
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

