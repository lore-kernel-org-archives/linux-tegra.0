Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F40136CDFD
	for <linux-tegra@vger.kernel.org>; Thu, 30 Oct 2025 18:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761850222; cv=none; b=Fh5s8lEfKwiCX28r/7evQcOVUw8nZoLRda/OEGF4MOCQnSXauKkCebzDU3OkeGNXMBazVvM5RnDKXA8UGPm7EofReP5nX69+obEV5wSI+m3pxaa6TbGFvxNDSaODN9/Yuj0Ikxw5fQZrMo5wX3MgORdFz++w2gl6Mrc54uJolDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761850222; c=relaxed/simple;
	bh=4gIjMMAGtbgq1hRTcxMRTC67PCwdpxHyqj2pa/W2BJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TTqnN7pejZKGluMBtGxSO46nIFjuJFItOCdBF8x+rPXCtodYe/eZHN1nSeSx8aO6lb8/vhBbT+stYVF0pPrsY1J1+L9v3wumw/n74n8ayKKJwEjubuueu8j2KDzkTGJ/NZPNffv/7wPPkt8YvHP4GiD386Cm169y2GHGa1RRUQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAqRxmTL; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAqRxmTL"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so1106245a91.2
        for <linux-tegra@vger.kernel.org>; Thu, 30 Oct 2025 11:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761850220; x=1762455020; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YZE8z4se1dfGoS2Gifk7KhMEMh0JHmONhySpSjiVPL8=;
        b=eAqRxmTL5y31YQzbS3UGbQb7JFCuh6RL/MxRfove//FzVaYQgIDkF5hPs5G+OhkWCb
         mdKoEP9/MHMB2+MxUI8GR+kgplQ/uQrNqz+nd2BzvLMq7brNIlOqQRa22qb+IvF64cCp
         fqhs0Yl0TJWOMigKURHcqgFyzS691HO2QwemuYUegGEVQQcwJcbdUiGQZhgYnKMYAxIZ
         PHg3ER4ncHxUbFgecFmyB/7f22dJ1uGKc23tpBSXfQBGnzWqgd9Hzjsefi0ORZhnPlFE
         fZLe8dhBFkJXvw7wIkdaTbsGzABsd+6cyqdXKbY8LPePfWRO4FQ9eVjZ++Y3VXavY8Ej
         j8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761850220; x=1762455020;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZE8z4se1dfGoS2Gifk7KhMEMh0JHmONhySpSjiVPL8=;
        b=iCeZUJFFsPOdu3GTrxwryo5a9aXbyYDZ7i2WvtK5FHh9GDVaD8v/Fv52iDQrMM83y3
         SWEv1VFyYs8GCEkuze+mWbrf7Qq2zX1IWXl0O9kClQH+J5vdijd5xMXBDIIOoDqKtchN
         EJ8WmUZrXFQ5ybl7pzcE0Oo2Z3CEisa7T+m8+LlkBL9394Qb6I9m8JPed8jW/4qJubqI
         sT/QWddJJ+zCP0boZkV0m0Kp9pSfijI780dkISJDGb5MgngUk2jUglcYDgWUdXU0BAQ3
         3wbDVKuMD6ZVNhjj+MyWhUFAfoVIJiapbT6pI/vGTPUarXgV3yys7FbN06JivCsUSw0m
         gPCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqLgAEBquWpDRylGQz4vnjvbVkH+KnNkjn9/jU30e38dJ8G7OeHWY8F6mzMuOW29rBNxOMmqAWqUII9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSHFRCdrWMXItmUUDp5okNbjiJp95D5U8ahCb3jZ3TmzNfaMj
	8nYa33GOO0N7GNRgh1g1LjUD1yeIqWQ7iOZlsUkIedMFF4VJzsLXaUxY
X-Gm-Gg: ASbGncvUkiJO8fz/a2zkWOHr2VdjyYSZ74MRls6LAsPVvjr9W2PqVhJ6GE1oC7lgBEe
	thY0YYsai9kJ4JArlXkndQy4VPfw1+0QoZlbxJsrS365KWCvQZeipoKmZRznR/0poYJO9G92+bx
	Uu9D02h2hS7/Utn52Qu0scZVi8QPQ5rRiaFZnsdkCLLOeIVKKVnqLt7rbjeaPY1UHaXbxYON7Hx
	gDC+u8xYRhT9i64dsPIiYuLDED8hiahG2f+EwdZhAWaJwb6JKkadn8x94XfKFyT3O2SvpbXHN7o
	/uJURdxjO6b0+5nBi7qaShQbMRRTRdm1FSmxVkCfVCv3oh0MS9EZsHewpl3cS1AhELHrVJiS9gp
	LuBLLjaUc9Hauzzn22R8TOGPp2kXxPeHpjRbt64EJ2WIgwrSLbmfXViRr/j1aZk+1yCXa11dGxL
	55/iHOqQqJVF3p6R3pm2NnjJpSd7Sr8p7QiztwvNzN1w==
X-Google-Smtp-Source: AGHT+IGLHgpq4Cr2uIwiEeob78bCrM6Q5yWeru6WGvDIt4+WcDBZb5URMD5GYG3DxNAGT5rjuDn0DQ==
X-Received: by 2002:a17:90b:388d:b0:32e:1b1c:f8b8 with SMTP id 98e67ed59e1d1-3408308b279mr1006781a91.26.1761850220056;
        Thu, 30 Oct 2025 11:50:20 -0700 (PDT)
Received: from Black-Pearl.localdomain ([27.7.191.116])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-340509a3001sm3386203a91.10.2025.10.30.11.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 11:50:19 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Thu, 30 Oct 2025 18:47:25 +0000
Subject: [PATCH] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-nvidia-nand-v1-1-7614e1428292@gmail.com>
X-B4-Tracking: v=1; b=H4sIALyyA2kC/x3MMQqAMAxA0auUzAbaoiheRRxiGzVLlBaKULy7x
 fEN/1fInIQzzKZC4iJZLm1wnYFwkh6MEpvBWz846xxqkSiEShrR+j6EkXjaLEEr7sS7PP9tWd/
 3A73CBlpdAAAA
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
  to resolve errors generated by `dtb_check`.
- Add the `#address-cells` and `#size-cells` properties to the parent
  node to fix errors reported by `dt_check`, and include these properties
  in the `required` section, as they are not mentioned in the text binding.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/mtd/nvidia,tegra20-nand.yaml          | 157 +++++++++++++++++++++
 .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 ---------
 2 files changed, 157 insertions(+), 64 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
new file mode 100644
index 000000000000..67b3c45566db
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
@@ -0,0 +1,157 @@
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
+description:
+  Device tree bindings for the NVIDIA Tegra NAND Flash Controller (NFC).
+  The controller supports a single NAND chip with specific properties.
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
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  power-domains:
+    maxItems: 1
+
+  operating-points-v2:
+    maxItems: 1
+
+patternProperties:
+  "^nand@[0-5]$":
+    type: object
+    description: Individual NAND chip connected to the NAND controller
+    properties:
+      reg:
+        maxItems: 1
+
+      nand-ecc-mode:
+        description:
+          Operation mode of the NAND ECC, currently only hardware
+          mode supported
+        const: hw
+
+      nand-ecc-algo:
+        description: Algorithm for NAND ECC when using hw ECC mode
+        enum:
+          - rs
+          - bch
+
+      nand-bus-width:
+        description: Width of the NAND flash bus in bits
+        enum: [8, 16]
+        default: 8
+
+      nand-on-flash-bbt:
+        description: Use an on-flash bad block table to track bad blocks
+        type: boolean
+
+      nand-ecc-maximize:
+        description:
+          Maximize ECC strength for the NAND chip, overriding
+          default strength selection
+        type: boolean
+
+      nand-ecc-strength:
+        description: Number of bits to correct per ECC step (512 bytes)
+        enum: [4, 6, 8, 14, 16]
+
+      nand-is-boot-medium:
+        description: Ensures ECC strengths are compatible with the boot ROM
+        type: boolean
+
+      wp-gpios:
+        description: GPIO specifier for the write protect pin
+        maxItems: 1
+
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 1
+
+    patternProperties:
+      "^partition@[0-9a-f]+$":
+        $ref: /schemas/mtd/mtd.yaml#
+        description:
+          Optional MTD partitions for the NAND chip, as defined in mtd.yaml
+
+    required:
+      - reg
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
+  - '#address-cells'
+  - '#size-cells'
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

