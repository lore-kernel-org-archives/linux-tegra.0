Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D1080C02
	for <linux-tegra@vger.kernel.org>; Sun,  4 Jan 2026 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767525793; cv=none; b=AIXC9AjAcb05r5ybUioCTvdPDouOr1WlUUExEg+D+pxyOuDUReQcffl/nXHbz1OgeTSudR26SUmyFgipI+zDRMqSJKrrHgW8mKXBGpfnELVrLx7UPiOhWTMkMm3az2bG1Lc1dp4IVFiDQDps1oL2MKvUiikdLKDLum5Kaj1X5Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767525793; c=relaxed/simple;
	bh=npSTI0tSsTDDUZL6ZjT89SNLiAlyAlKWqP8kIF7GmEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j6iiOmZKeEP4gXg8LVr7AVnHqJYjl0rDjMyPtfqgxf1H4cR/aOoLKZCz28fT+viu8ogoGGWSzxrK4bs+sOOBA40H07I+TF5do5FEu3nugHWOAdKMCZ8QvgwDHX1eoLQlrafCjClGEEtzLV/vyzchyjjz1HZQ8Cx2/rxk/WaBrE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8UsvlGB; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8UsvlGB"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34ccb7ad166so12154588a91.2
        for <linux-tegra@vger.kernel.org>; Sun, 04 Jan 2026 03:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767525791; x=1768130591; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G96jDgA1E2l3Yn0qNuopB/AyEGtTf6lIYwJ3Mkdboew=;
        b=f8UsvlGBnsAuhMc6ydNozooG1Euko85CLay2bwOui/G3CQbxH6kUSujwzsm8wmtaw0
         Ze/PzAHFLtiaIvPGgvKAjiKpgEnj8Erth1MH/bqyGE9da+JusMCA7+zi6eC5jKJkvBc+
         q8mS6K6yAK81hWnS4XqD0txZLGu+vcxorp2pcHsN8cQAsu2/zE+d5xF949jGrCnMWmpy
         fqoVMLQ9T/+/voC47j/KJNmkTID4GyZQ8W2bu8Z06yU80NLR1kyPTgxIRA8GtCRwb5q2
         on/W5Q6C9nWz+4IM1ng2R91whM1Dr2PCBMP+LlOIx0totaw7gosdg5aMLU5F105hlaH6
         e2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767525791; x=1768130591;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G96jDgA1E2l3Yn0qNuopB/AyEGtTf6lIYwJ3Mkdboew=;
        b=WU+7RyT4/Lz4pl8trWIOTCI/scScYuHrIvGGZkPCbmQi8I16mtdLylPhgTkPZuj776
         KRcTdH36PULQ0q1pcXe/QBDix/Ig+sDwSwJFJ8PM5WFjSmn/4kFHdFAdZv05B4l2jCnp
         gdQGld/HKU8lL07oyNPCd4LCVy1CSJczVBEuTdshX7/9FoVgZV/oecPHhFH1+vpjAZz7
         X/MrhT61lYbsghBjGo8ncHIgZ4LXUKh9pNGTOBmjnnKeBnxoZHLIb9DZJBbHTx12qgXi
         kT8gvIu/165USA9jKXbZ/dRbR9hohB15TMTrDome8g59LF5SroRH2ijYpJxqUbLodq3r
         AAHg==
X-Forwarded-Encrypted: i=1; AJvYcCU4g7slWCHnLPs58ljX2wj+ZI4lDsxYUVB+1kK0DwQ1X0naVLgc2N+03wSjEk4xMJ5Ei98J3WBNKJ0CqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO2HQ/7ZVvYcUrblPiYY+Oi4t5zdUlZQdInILFSWzxjGekp8CV
	SglWEP9M5FumKgmGr4mG2HWedEPFHIWifqorJjBW4gidB2u3m63IJFQ1
X-Gm-Gg: AY/fxX67987MlYfWiIhW1fjVFCYqneV9m72DloV5dDUpbhCiEIuLvbvEwVgrQWftATF
	2fEtbaEAW4axIk+vCTfKkvIweuhr5KUOiaAPzXaUHnqJO+tMA0PkSttcs0cycsy4LstPGCLLgdO
	ooNy4XyWOSlKVtiEYoK19zMLd6wCG/v1w/611QJfrU/HfiJcGNtVEdD7xeuE9h+GzX370k76gwK
	aN5sglIy9Fvtd5ehHSqqeRfYWB91ppMf5+CUA8W8JjWYFL2xICbuWBTIB4PjJ1UF9pGLRpG8c/z
	+wgW7SQV5NE34eh62nJn8bJN9IwP/S8KthsIO6G7L+UqJ7NuGVBlvX9cJVy0QHDVNV4TVHtMoJ8
	fjNnJ73Oo3uot+QEU5yRa6/b+IdKf+RnVyYiIdv+2VIzm3ieNYAd9S4Fdd439CcJYXZgeZF1083
	uM9PIywEK/StPaRRY0RwYABXcV28hYsFF16Q==
X-Google-Smtp-Source: AGHT+IEPGCXrVIijArtHz2L+XXcTUNqsrO8wR5x/CMAdqzled4QYnZbK0goA5DKpZXsrONGlwN9SJA==
X-Received: by 2002:a17:90b:4d87:b0:340:e521:bc73 with SMTP id 98e67ed59e1d1-34e921371c5mr38458142a91.5.1767525791257;
        Sun, 04 Jan 2026 03:23:11 -0800 (PST)
Received: from Black-Pearl.localdomain ([115.99.253.182])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-34f45cf5ff9sm2072867a91.6.2026.01.04.03.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 03:23:10 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sun, 04 Jan 2026 11:23:04 +0000
Subject: [PATCH v5] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260104-nvidia-nand-v5-1-0e147e416b4b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJdNWmkC/13OwW7CMAzG8VdBOS8odlyHcuI9ph3SxgVLI0XtF
 G1CffcFtAnK8bP0+8tXM8ukMpv95momKTrrmOto3jamP8V8FKupboMOG3AANhdNGm2OOVmH1Pc
 hyq5z0VRxmWTQ73vt/aPuk85f4/Rzjxe4Xf863q06BSzYwEAChDts8XA8R/3c9uPZ3DoFHxaxX
 VustuM2pDYgda57tf7J+vX/xVeLwoGZkudAr5b+Lbv69NpStR4aHogHHxt5tsuy/AKR9TQOWgE
 AAA==
X-Change-ID: 20251011-nvidia-nand-024cc7ae8b0a
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3

Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
Changes during Conversion:
- Define new properties `power-domains` and `operating-points-v2`
  because the existing in tree DTS uses them.
- Modify MAINTAINERS references to point the created YAML file.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v5:
- Modify MAINTAINERS references to point YAML instead of TEXT file.
- Link to v4: https://lore.kernel.org/r/20260103-nvidia-nand-v4-1-3156f46f3a5e@gmail.com

Changes in v4:
- Changed the the reg property for nand child node.
- Link to v3: https://lore.kernel.org/r/20251231-nvidia-nand-v3-1-2e67664d3674@gmail.com

Changes in v3:
- Removed pattern properties for partition.
- Used single quotes for nand string in pattern properties.
- Modified maxItems value and added minItems to reg property under nand child node.
- Link to v2: https://lore.kernel.org/r/20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com

Changes in v2:
- Edited the commit description to match the updated changes.
- Modified the description for the YAML.
- Removed all the duplicated properties, defined a proper ref for both parent
  and child nodes.
- Removed unnecessary properties from the required following the old
  text binding.
- Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
---
 .../bindings/mtd/nvidia,tegra20-nand.yaml          | 102 +++++++++++++++++++++
 .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 -------------
 MAINTAINERS                                        |   2 +-
 3 files changed, 103 insertions(+), 65 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
new file mode 100644
index 000000000000..b417d72fa0de
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nvidia,tegra20-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra NAND Flash Controller
+
+maintainers:
+  - Jonathan Hunter <jonathanh@nvidia.com>
+
+allOf:
+  - $ref: nand-controller.yaml
+
+description:
+  The NVIDIA NAND controller provides an interface between NVIDIA SoCs
+  and raw NAND flash devices. It supports standard NAND operations,
+  hardware-assisted ECC, OOB data access, and DMA transfers, and
+  integrates with the Linux MTD NAND subsystem for reliable flash management.
+
+properties:
+  compatible:
+    const: nvidia,tegra20-nand
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: nand
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: nand
+
+  power-domains:
+    maxItems: 1
+
+  operating-points-v2:
+    maxItems: 1
+
+patternProperties:
+  '^nand@':
+    type: object
+    description: Individual NAND chip connected to the NAND controller
+    $ref: raw-nand-chip.yaml#
+
+    properties:
+      reg:
+        maximum: 5
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/gpio/tegra-gpio.h>
+
+    nand-controller@70008000 {
+        compatible = "nvidia,tegra20-nand";
+        reg = <0x70008000 0x100>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
+        clock-names = "nand";
+        resets = <&tegra_car 13>;
+        reset-names = "nand";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nand@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            nand-bus-width = <8>;
+            nand-on-flash-bbt;
+            nand-ecc-algo = "bch";
+            nand-ecc-strength = <8>;
+            wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt b/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
deleted file mode 100644
index 4a00ec2b2540..000000000000
--- a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-NVIDIA Tegra NAND Flash controller
-
-Required properties:
-- compatible: Must be one of:
-  - "nvidia,tegra20-nand"
-- reg: MMIO address range
-- interrupts: interrupt output of the NFC controller
-- clocks: Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: Must include the following entries:
-  - nand
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must include the following entries:
-  - nand
-
-Optional children nodes:
-Individual NAND chips are children of the NAND controller node. Currently
-only one NAND chip supported.
-
-Required children node properties:
-- reg: An integer ranging from 1 to 6 representing the CS line to use.
-
-Optional children node properties:
-- nand-ecc-mode: String, operation mode of the NAND ecc mode. Currently only
-		 "hw" is supported.
-- nand-ecc-algo: string, algorithm of NAND ECC.
-		 Supported values with "hw" ECC mode are: "rs", "bch".
-- nand-bus-width : See nand-controller.yaml
-- nand-on-flash-bbt: See nand-controller.yaml
-- nand-ecc-strength: integer representing the number of bits to correct
-		     per ECC step (always 512). Supported strength using HW ECC
-		     modes are:
-		     - RS: 4, 6, 8
-		     - BCH: 4, 8, 14, 16
-- nand-ecc-maximize: See nand-controller.yaml
-- nand-is-boot-medium: Makes sure only ECC strengths supported by the boot ROM
-		       are chosen.
-- wp-gpios: GPIO specifier for the write protect pin.
-
-Optional child node of NAND chip nodes:
-Partitions: see mtd.yaml
-
-  Example:
-	nand-controller@70008000 {
-		compatible = "nvidia,tegra20-nand";
-		reg = <0x70008000 0x100>;
-		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
-		clock-names = "nand";
-		resets = <&tegra_car 13>;
-		reset-names = "nand";
-
-		nand@0 {
-			reg = <0>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			nand-bus-width = <8>;
-			nand-on-flash-bbt;
-			nand-ecc-algo = "bch";
-			nand-ecc-strength = <8>;
-			wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
-		};
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index e791f18b61d8..519dac4cc9c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24829,7 +24829,7 @@ TEGRA NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
 M:	Lucas Stach <dev@lynxeye.de>
 S:	Maintained
-F:	Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
+F:	Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
 F:	drivers/mtd/nand/raw/tegra_nand.c
 
 TEGRA PWM DRIVER

---
base-commit: 43edce71d70c603d3f3f1b1c886f65cd02d80c24
change-id: 20251011-nvidia-nand-024cc7ae8b0a

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>

