Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830808634C
	for <linux-tegra@vger.kernel.org>; Wed, 31 Dec 2025 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767173381; cv=none; b=Y37gexzZr49+C9t/H8yMKQlxMbD0vvaffsp1JIzaTHHpOR11Rbv+2BzqiaX7wcnaW9PFTm/rJq1ZHg+C0YxEhDt/zk6mQ/9TVIyzJN2ck4hbrzLx/iw1XLRYU9QKH3BDr1FLkKzPr0hn/908cqyW0xpUgm0oEEIJdNwpkdykIDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767173381; c=relaxed/simple;
	bh=U4c/tdOVxuOX7gewG3E/xo4Npiih75FUdUzfWUJFMjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HAU1H6RJgNsKKCDy7N/SXBtyBahQLnoAwJYKp5cRxkUMNrjwBGb2YGqzrsIYncM5SKeVNN9/JdYw9Iu1aN54k76fsuLRP4tzSc1Bqs//sSsTXbdTHFFZvlUBmCmKE9Mrr1jdIvOKn9/UD0cH8HQGjibcpeYxSuzU+frnzMJ4nH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzH+ikmw; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzH+ikmw"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so8268901b3a.1
        for <linux-tegra@vger.kernel.org>; Wed, 31 Dec 2025 01:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767173379; x=1767778179; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XlUkiQe3shGzaepuEQZNl8iLgTbjOz9KQR01AkzdzDQ=;
        b=ZzH+ikmwrQJV1e+lK2rqG758g/z1eSJ8yc4kjJS1sTvSgampoxtIGkfN7nzTYbPeQ5
         CHhJ6J5JxNFTg1yEE0awTDWp9lfOtEJm02aft7nNlCVsI0Qx1c1EvKf2JxkF5S58nk/+
         ClH4Xzfzs1TyjHAXiBSeVES85vuTtV+CgNmJRUgPPUB8T0ioFTWeOF3q8r8AEjYvcTt3
         BKH/Z4kjxcIU7buAOsaZmog2sLI1qoAGgvSVbXKc/OBSaSsPSLWyV6+YaK9IDEWszmkE
         cVbeolr9M9zQ3wH29GnygO2ZKZdgueJ4HPgsgy8LPxHV6o++9NQ5xHr51MVMz5gpyVUB
         jZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767173379; x=1767778179;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlUkiQe3shGzaepuEQZNl8iLgTbjOz9KQR01AkzdzDQ=;
        b=RCwMQYTzHgZDCxGliSdNFc/BpJht4+OaxrfeSocmnZAGE8ot5UaUrGkMqUZCjXNd3N
         VE0S/J0gECVvjBdzBMPYoy2j/+evIGhQlTkSKokEpCxiYc+61qXTkitXpmmsfkd1nEfi
         8YYSin9QlbViWHgPHwJjKzQrgg9DjObbSHn7ZtIVupkeLY2h/+92y/tltCJdbnr9QBBV
         G8DacwTcpoVNcktI/7K0yupoHl3Mh7B/Z5gT8Rpvjh9qyvCHVxJZV/bqV4mz24u8cQr4
         Qx3rTCdqs7dclugeA2rvdHbRiG3uYTGRTMUA8CoTZnC7yIS22ARbhsZAyeXgK8KLa9py
         CoKg==
X-Forwarded-Encrypted: i=1; AJvYcCUzOtz44pemHoPIrHnw/ds8oU4eP2/WRzdC6PmTAkxR1NwnU9Ys1/n5gnw7r5TBlopNsUvpUAG794bHng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK1lN91S1GVng58cXHZtZNVcCSFploH33fvDJBA5KmoRTMKW1v
	gKADxEXSKdv1WQsWg4YZEVDUy5H2ZXPu3c7f82XtP9F5fr3d+d7FUeat
X-Gm-Gg: AY/fxX5UGk3h7cWtS0FOwj9Ktw/hlBrkfCNuLyd4CYvKOUWGLkv0IeeRKocT9Sqdk1u
	vx/kKRnHmj4uSvAJ7F5Th9Oqy/gxqBo26V7mi9OZPWONpWeD0HYrf0PpTJwc2pIbi5nsLxQPlQn
	g1+5wAd8pXXmAuZuGZJAl+GrsEdLlHX82RVC74QPGzLDwt1es77u8QUnpJCNPqr+n2A0MqXe4ga
	tn0Bp5fC09Z4oHHx7xrnrYZpzta0BrEK1x7VIy9E3KIiRYbK44dUHVG3C/qeZJds5PCZ0pNGhD8
	XkBEv35eyXIFFBM+Omx3XhB9cBHysPb8xnFupyAi/BF305qt8vo//sLRC7V1kQJ2O195TpVrSyG
	aCwdWrF27nWZOtgmGZwNN+7wL+dcwSeo5C0ZrGHraLFtQUVewLdBFkktIa9pX+vI4v04VDWWOCJ
	VtBbFgO4P6QGdhtpn4Fcw3nmdt3OPF6Af5iFs=
X-Google-Smtp-Source: AGHT+IEM19+eKNuqVecjwUqc/sRWedNv4BdcwYLzC9ecNUMeqdSw3+habfFBNKgjfULtZcfn5hMkqw==
X-Received: by 2002:a05:6a20:3c8d:b0:35d:5d40:6d77 with SMTP id adf61e73a8af0-376a7cecaedmr35366526637.31.1767173378624;
        Wed, 31 Dec 2025 01:29:38 -0800 (PST)
Received: from Black-Pearl.localdomain ([122.162.204.179])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7961fbb9sm29842795a12.2.2025.12.31.01.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 01:29:38 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Wed, 31 Dec 2025 09:29:32 +0000
Subject: [PATCH v3] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-nvidia-nand-v3-1-2e67664d3674@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPvsVGkC/1XMSwrCMBSF4a1IxkZyb2PTOnIf4iAv2ws2lUSCU
 rp30yJoh+fA/00s+Ug+sdNuYtFnSjSGMqr9jtleh85zcmUzFHgEAcBDJkeaBx0cFyitVdo3Rmh
 Wikf0N3qt2uVadk/pOcb3imdY3q9TiY2TgQNXNUgPEhts8dwNmu4HOw5scTL+WsR222JpTd0q1
 yqURpj/dp7nD1ymRAziAAAA
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
 .../bindings/mtd/nvidia,tegra20-nand.yaml          | 103 +++++++++++++++++++++
 .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 -------------
 2 files changed, 103 insertions(+), 64 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
new file mode 100644
index 000000000000..632cfd7dc5e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
@@ -0,0 +1,103 @@
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
+        minItems: 1
+        maxItems: 5
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

