Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD2463CB
	for <linux-tegra@vger.kernel.org>; Sat,  3 Jan 2026 05:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767416954; cv=none; b=SzOCx/93klnc/uXcMCTJ99UMPe8+qivi92h3vh6yWFzZzk9z7Qn+5tMV/jpvHDcIIl7rPGPX0UslSKkQ62DDsiWDyyU9HcgdSebrNeO3GsQogP+6MdUmja22xPj2QgPqU14YA9j9Ux+VOrSUds9j75CwAF+mmJLqOxGdHV/2wjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767416954; c=relaxed/simple;
	bh=PugwIf1PTeDTsgwTth9O71CLUk6w7Dby4OTpfRIHbIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Lo0u65kF0Wt8UqhQIiWcIJ4M8Gm+968Qxs0lJCAfKw368TCP2Vy+S8HC54tfh1OvKmgu7W/sU2saRsLRqHznmmou1Fn/iJ8cKDu/S/w4sTGyPAY8VjUIoAVyXmCX8x+Iyefj+BfwOTOkF+Tm7nX1Hd1J9ImfaIEyxq+gHb8PFgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX+dHBk3; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX+dHBk3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a110548cdeso170037445ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 02 Jan 2026 21:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767416952; x=1768021752; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T8+CQv8mpkcn2J1lV6g4DbhVMQ5AvRmITHsSXIikepw=;
        b=EX+dHBk3jYXu69oPEwKUwZVCV+OJHgh2qnnKZbb1UwC9JDtSUYR1F7OKqc553L8lyg
         zjzIeujo3AfQXBtbBvUJ4nIA338RSvRIfANg153ofnHxogh80WoOZBEvxdsAJUIsm2tK
         7pTpyRJ6+ToKVrQh1PLLty7s2mVy3j7vxi5jYq6R4PyczKygyO/lqhP71C1EO/9kYdOY
         dY9XHh04W6xLeNCQyjiBesGpxB3pf50+z1iQKJgpvOa/oudBDleZrtZmUe36xkV789Qo
         BpeyKbnFJkcdfNq5MZ2EVsRYRnNQJls5bCAMORU8zsAZ/pWiYeC6dY6PTsYHhJOmDCaU
         ZibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767416952; x=1768021752;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8+CQv8mpkcn2J1lV6g4DbhVMQ5AvRmITHsSXIikepw=;
        b=htMPd0faCCI/vVruU1FNoAVh6WIsaYaKn/o3u50Sb+wXr0JNdbY4tg83+efTfp2dtF
         NgaxaZS5GcFOGYZC04Qk5zJtmk7RpsZXKnwx2NOgx5gnpskRX7V6+qyGdkOS/dgE0HVV
         g+1AsvLOuZNaRf2u3SnGXeJ30mK+J5mAXRiItKuYbkTRo39VrJro70ec3jjTd3d10lc0
         9lKk/vVTxpZNp+Tne0a0WKT0UvtEv12qzDS2ONhhVZq2WiDrfUnURQeQqpmwEv2tGsHn
         QApuzx/bQwliIFszD5bSVzr86ZTQdppzVawZ7XzsqJOKDZhGFE8C/ib2sTG8JME5T5lM
         Y6HA==
X-Forwarded-Encrypted: i=1; AJvYcCU/jmI9vIQ0D4i8B2OYSoRg3JXLvUdFHLZ+JcqPCHu8Ectoo74ZBAOo4EvEJqgAYTkzJW0oZjKhImxETw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMKzrWhCCb5euMUB4HJRBj/u//nky2BxkRtwJl+NvpfdoyfYQw
	0J8kpUfqLdsgaLH3rR6swmQijCtdzh6zSVHRxHNmmaDRZ3tZvWqOm2Z2
X-Gm-Gg: AY/fxX4UPfFp06tQMzZX9qMQDKBWvPZ4VGdUN3Jl3q2KLYP+SyRys4se1qPrrVt7nwS
	PMJv0Q7JDg/SJPT3ymmloXaiIqNinNs+/3aKHMYlRolE+XHmeaJzpJZ7vL4OFP88vYxQDF/HiC/
	QwdEH35IQKmLbhpkUqwFVa1/nyaxkA8RtT+MjeNF8mwLioq/udG0n705uOaEcxsBb/MEbEBA7RE
	RqrTbAlTJrt2EFBM/2dQvs32bY8IeDhoaEpvfTomDmEYFV/fHa9xT3QF5Epaeyb9SWAw9bO/2ZW
	pKyZWJclent1pDPSNsBZcta1h4c80FbqsmzwY2rR5XNCtkoR2KqyBK1Yn/MCZMyKznCYck/D8J+
	dVTz6kThVoJ9Ma+cDQdV7MKSUuOWwKuAJqffJb04GpYyvv6BGGMJCgMCQuy+bvApuy3FzKGxeg8
	LKAejLzKiaz1dwyMG7fNxOXTjJNa/jpda6Ew==
X-Google-Smtp-Source: AGHT+IHTfufJ/COdXwRuMAWT7oXqPfmJjDOSy+SnVq08RYmkgw57v883SQY7Br9m7vBEu9FM9Q73bg==
X-Received: by 2002:a17:902:e94f:b0:267:a5df:9b07 with SMTP id d9443c01a7336-2a2f2212844mr375644785ad.12.1767416951595;
        Fri, 02 Jan 2026 21:09:11 -0800 (PST)
Received: from Black-Pearl.localdomain ([122.181.60.165])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3c8a8e3sm386171725ad.41.2026.01.02.21.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 21:09:11 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 03 Jan 2026 05:09:05 +0000
Subject: [PATCH v4] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-nvidia-nand-v4-1-3156f46f3a5e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHCkWGkC/13O0QrCIBTG8VcJrzP0aDq76j2iC6e2HWguXEgx9
 u65EbR1+R34/TkjGULCMJDTbiQpZBywj2XI/Y641sYmUPRlE2Bw5IxzGjN6tDTa6CkD6Zy2oaq
 ZJUU8Urjha6ldrmW3ODz79F7imc/Xb0ewTSdzyqlWXAYuoQID56azeD+4viNzJ8PPApithWJrZ
 bQ3GmTN6n8rVlZs/8+iWAhKKyW9UFqu7TRNHzhsaHoeAQAA
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

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
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
 2 files changed, 102 insertions(+), 64 deletions(-)

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

---
base-commit: 43edce71d70c603d3f3f1b1c886f65cd02d80c24
change-id: 20251011-nvidia-nand-024cc7ae8b0a

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>

