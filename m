Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75437329E62
	for <linux-tegra@vger.kernel.org>; Mon, 29 Dec 2025 14:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767020136; cv=none; b=a4VRoTmjTP8UmggCnnFn4BBmfPdwpithDrtJQ+N/SCI3zC0/dNTt/tLW05tpRDASR1dYLA8NRH0nCtzoO7t2iuhW2YY2jeQPdi+soARW1ZpinioA9WjmM8fx4/OEEzv3f+tkjd0QMC3+/HbSfzWBUf/vbZFMGKbMI2yjXePqeDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767020136; c=relaxed/simple;
	bh=OGLBdBSIOl/MhJ8GSEViWbYQdr4diYSrviffLN6Oxk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WOJoFrCpnd2qfnzeuhAfqIbyaAKs4W2lKCOMpXwqCXmcdoDqpLADaOB5BYwrRavl5CfsL+DG+/sdQPafQcxMBfbRJ0xSvLNDo11BHzKNoeu3/XyqkX+bnfomtli0GvdIP1i2g7IkMU5DEN84PpXAyzQi8dCytZWrBqW2BccDeCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izqPmlmE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izqPmlmE"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a09757004cso117147645ad.3
        for <linux-tegra@vger.kernel.org>; Mon, 29 Dec 2025 06:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767020134; x=1767624934; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c3Rvbx0SUF5LIMmW++u/8q0FjAyi1zNAmH9287WODhQ=;
        b=izqPmlmEHvyn9HWRMDH8n77K9Ukov1uXGlItCxTG8sNg5l688Jmr5CjVwK3VoiHnuX
         M14RTEVl3wYbruzxYME1OnIMdaItSr6gggI8df5DGsLH/5KoyghKIW7inOedm39W83pf
         OkwIZt0sZRnAOkfKfpkkWNAm4BAn1a1S88ZKR1/kNvFEq3r1GHhRAVxxdWhf8joRHBwK
         rePuL+24J4rqPpcOg2XUO7SeUUEFXaC1WwVS1D3Uj3xQZgQWtmWiqlb4WXHd2gu6413r
         SIsN4Xz9Poaf5b+vgJy45KJ0icF4jzHEbOmKa6oJKDI1eg5nHBt2Zu119Nvd0XubV+Ci
         bM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767020134; x=1767624934;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3Rvbx0SUF5LIMmW++u/8q0FjAyi1zNAmH9287WODhQ=;
        b=m4k+CdPBX7L7js0WTRnVuMAmpQYsv/UZuKtrrNDuZ3GxxTf7jytiMXoK09QMYNnyro
         gkf0W9c/+LcRQA04KdIGs74nqJLxN7yYgXcYMgSlkBi2fbblUHANUIkAOx9XXwhMwDwU
         hMtZ5QL6rdtcyJQAWb2BQ+npjXuBEZPu4TL9pMSuAHozhSCy7De1QaE3Qfus0Mo3eHeT
         CYJnnJCvFiEy4sT/fIcSJ6JGw7rZQyBMItxiO1APtpaOWyOnzlvJ012pMYnHG+Kfj7oz
         aMS/RAKddGo9DPxW/+hXi07bSkO8gTgUM80ADoZHVTJzjfySYjuDTy1oroIaKSz6YzgW
         ID3w==
X-Forwarded-Encrypted: i=1; AJvYcCUWUUFwhlpjNjqrIe+3CGe0gJsszbCQS5j4NopDZNVHSVD0qzOKnnF4o0NNTxSbHxu+ZFacrcqPrLGBjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5WJR0mgk5SC/U6EcijsXBC4PV8+jfVXlhJKzC9SXgaHLZwX03
	fe/xxC+gNXNP/gQbaQpFt7pp6sRyFsjgWWBbAHhOOnsLnwwIQ4/oRcF3KtsCew==
X-Gm-Gg: AY/fxX4JXfAbyR9TM7cKVBgPARV4MQPhn9exu1DnSIezVaBXzia2NrscfL9aZnMg+IH
	21T93xuKuzEJVCpj+bwt9XKQokPCOVGTRb1pKNyZOjRDCRlRY/qSGewLyvQIVzg5O5Qec19MyB5
	UQhQ9ErE4aCu9AJ8iyp10Rr0MA61M9n78fQu2+E6ZDCx1I+qyAcUHttXWJtASzOd3ebaF2OAyQu
	cuJWYroHphLLbajsXg5qn+stKJHY961xQdvnADE7E8fRlqb3OdiMbIJ7iNKK6dfpnqroecIq+Bg
	5lWJNXqE2cAtmXQXFJP1n24iCLQYKBBnMefZ4cRik7dsJIYY67+HwoEJ3omtWYs5j2gCy+ZO1Rm
	Mk6wceJE790dgWY6g84wsCvKN+Lph/NRU0C568/YQqYCDkZBiZ7TWx0C0sy552QaSlUEEQu8rKA
	h7MIxLvns4vkody4Oyj4MWgzItodVYajsA
X-Google-Smtp-Source: AGHT+IHCF/iIi9x1kfokHvV7XRjScNJIW1j4ikCcQAyZ1AHZ+5mJnfca+Vk/PMrdq42tlxFbIXPYAg==
X-Received: by 2002:a17:903:ac4:b0:2a0:d5bf:b27c with SMTP id d9443c01a7336-2a2f2a4f768mr268011635ad.45.1767020133688;
        Mon, 29 Dec 2025 06:55:33 -0800 (PST)
Received: from Black-Pearl.localdomain ([122.164.226.1])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d76ceesm279217045ad.91.2025.12.29.06.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:55:33 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Mon, 29 Dec 2025 14:31:12 +0000
Subject: [PATCH v2] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAK+QUmkC/1XMQQrCMBCF4auUWRvJjNFWV95DuojJ2A7YVBIJS
 sndjcWNy//B+xZIHIUTnJoFImdJMocatGnAjTYMrMTXBtK0R42oQhYvVgUbvNJknGstd1dtoT4
 ekW/yWrVLX3uU9Jzje8Uzftefs9N/TkaFqj2gYTTU0ZHOw2TlvnXzBH0p5QNygrCHpgAAAA==
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
Changes in v2:
- Edited the commit description to match the updated changes.
- Modified the description for the YAML.
- Removed all the duplicated properties, defined a proper ref for both parent
  and child nodes.
- Removed unnecessary properties from the required following the old
  text binding.
- Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
---
 .../bindings/mtd/nvidia,tegra20-nand.yaml          | 107 +++++++++++++++++++++
 .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 ------------
 2 files changed, 107 insertions(+), 64 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
new file mode 100644
index 000000000000..f34eaad67e11
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
@@ -0,0 +1,107 @@
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
+  "^nand@[0-5]$":
+    type: object
+    description: Individual NAND chip connected to the NAND controller
+    $ref: raw-nand-chip.yaml#
+
+    patternProperties:
+      "^partition@[0-9a-f]+$":
+        description:
+          Optional MTD partitions for the NAND chip, as defined in mtd.yaml
+        $ref: mtd.yaml#
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

