Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2414F55B9
	for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2026 13:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564448; cv=none; b=k5klHT8FdE9tLKpiMrjUYddeJhbv5A0m46F7o2gtCuzCj/miK2lIQfGg+dmtFnO1O2ra7cUzM4TjI2m77Vj8RbJodXH7VAWbbHpoPCBW5fcUtQEixtp8KHGJ7DKL9GD8MRAhntHmGypYcAHxk6oYZo4Lpqk6SKLn+2cGvTv7nkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564448; c=relaxed/simple;
	bh=Co/FuuwQTAJHp+zfOvsnW4jKaJGU3w7YpCQXjFi9wF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QuIX4DasKxlDRlly6MMfC4PzENh0+D3Fa6rFn4Pvy2U8mX1KqFQB8ccnzSFP78qZFV2ZIP2kLnFrtLklsKBz2KlpKioZRlEH0uaZ9veqMcpD/PCgityhLMC8OIsygXqR0lEIyFQBDVmvjcto2NmWzkuyO2qTlDLPWQdmvkThMoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuOrxGUp; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuOrxGUp"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso102554a91.3
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2026 06:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564446; x=1790169246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvH662dOnIBtA8vIbuF/kJDS4lP+vMorwMZVPkvKzh8=;
        b=WuOrxGUpLMZbLSt+nVIMdWzjdJoEdzM5Fy2RMju81M0JpquoVMkpuHpQmaLSC884vN
         jPe8TZaGfzgU03aoitlRcHUzastGRfS2DqM0VPsA5FkxiObpTR0R5cocGGXNrkOPel3u
         siuVmJNte5w+I/mMteJ6SS2iFjzVE0AazrrrtqDXVocQjp8+7HM+4RsaUFfI/eLlg9db
         1SJPqMyAcoe6z9ZR9hactHlfg2mPt1A6NWxDp4MdThf2RKm1SY/qyFaRAHeajkuAE2uO
         8zxPN5J1cv80NeYy0oxMbwihC1QhqYdfnYt+IQg/suwWnSTna/gh3+Xtivm1Wht+hvsS
         2mdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564446; x=1790169246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvH662dOnIBtA8vIbuF/kJDS4lP+vMorwMZVPkvKzh8=;
        b=pXDlgQWO2ujRCOEkXlemg/9t9FZhWzEj1Tqm/ww+f1X4+8gsx1e2tefNuotWtSYeXQ
         lV8UeYN5elf6Bza+TxkeUDoZDrZSBwhqy+pVZw3Tu0oIGuC2VlexD3yf2O4wVDvhgm4F
         W2x9cM2jtq6qleHqRhWfLKnIuLoje7lRm9+BlZ9OEZ702LO8YJAfGIh4OglU6spRMvtP
         t6EkL7/jkc0COwpv9r4t/9dtRde2EzZTTrC9MYgvakAp34xwyFqRIjn2uaGSPWMDevAI
         wV4WHEcS5Gf8h/koGff+JnlIUEpQnFrRxrXNCUtew09DN5xIPRam73C3fAlIpxOpOBD5
         uO/w==
X-Forwarded-Encrypted: i=1; AKwUvBzZlqxLIH9OrpeLtLtBPcY4eHBogpn8Sb0iakf6PZk6KJrX/17yhQbz9PgGIAFBfTyD6MrD7lKalD1IGg==@vger.kernel.org
X-Gm-Message-State: AFuF++lGVtFaqNBIo7nes/RJCWaxDH5ySNW7SnZOG9flgTGyx89ONBly
	Wd5YRW8wJlOrTsFgGgrGUIkqbd5MsoXxRJjjW9RaJUL2uUVTMooOH5NQ
X-Gm-Gg: AYBFou2XHlfXAt8JGCOQtzKTDFEB/lxmkNgX8RkbfsXYeUmvVbAi+QqHO94n5pdA1Xi
	6voCkWTR/54BTPQHVsMSvajrXujXY3AryoCNKg3OZoQ+IvnGd4xgv8dUEC17+XUeK0VaC1Isuj/
	dZdpzjAAYov8+v7Kn0qsr2IBoAFhbYq3deHVGF3aQW+BzxF0BNbviqnT6/L+hgFxcQBjq/d4k0e
	ZgjHq6wOE+w1lP076xVFTs5pZiFJ1Tc7oBmAUPHnlvCjcZWKDC+Gvjqvtc2c8vnZ5IMQxIjhTmh
	ySmNbQwqzRq4oMq+ZVgUW08YvX+JDu6BUBkBf5hUOHHecUrAuA83WaNNWlCFu6FauQvrCNIdC/d
	BHyQau2YowSfahyYEkdQYb+qvMjLgC5Gy1dxmv0gbBgWqPyvmuek94SKt0JDqreLKXkAZxW84GN
	x7o7akup3QfX5hRpcKZKA2TZm6LEZkbr0QwcY3qvMjwQICloPkYp2/GexXDG9PsDMH9Sr90wBGB
	gzq/Hsceo3pDbM3moptMQ==
X-Received: by 2002:a17:90b:4c49:b0:39b:3510:4af7 with SMTP id 98e67ed59e1d1-39e1e2655f1mr4104606a91.1.1789564446036;
        Wed, 16 Sep 2026 06:14:06 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm9422972eec.14.2026.09.16.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:14:05 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 18:41:29 +0530
Subject: [PATCH v2 4/4] regulator: dt-bindings: ti,tps6586x: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-tps6586x-v2-4-f12cfdfb446c@gmail.com>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
In-Reply-To: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564321; l=10374;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Co/FuuwQTAJHp+zfOvsnW4jKaJGU3w7YpCQXjFi9wF8=;
 b=trvJkb/BTxF/UoaOp+8twTlQVAKaroMcYVW3hMh74EPDUNt2Qi0Qtn6iIRknGMy6Gud95wz0a
 33kUASyJ65wAuvX/Qo9Bm6ugnAwIx2X6dFV7J6hLVDpa/bJHrlURWlj
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments tps6586x regulator binding from text to DT
schema. Reference to nvidia,tegra-regulators-coupling in child regulator
nodes.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/regulator/ti,tps6586x.yaml | 196 +++++++++++++++++++++
 .../devicetree/bindings/regulator/tps6586x.txt     | 135 --------------
 2 files changed, 196 insertions(+), 135 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
new file mode 100644
index 000000000000..1f7c7b35066f
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
@@ -0,0 +1,196 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,tps6586x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TPS6586x family of regulators
+
+maintainers:
+  - Thierry Reding <thierry.reding@avionic-design.de>
+
+properties:
+  compatible:
+    const: ti,tps6586x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  sys-supply:
+    description: The input supply for SYS.
+
+  ti,system-power-controller:
+    type: boolean
+    description:
+      Whether or not this PMIC is controlling the system power.
+
+  regulators:
+    type: object
+    additionalProperties: false
+    description:
+      list of regulators provided by this controller, LDO5 and LDO_RTC is
+      supplied by SYS regulator internally and driver take care of making
+      proper parent child relationship.
+
+    properties:
+      sys:
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+    patternProperties:
+      "^ldo([0-9]|_rtc)$":
+        type: object
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+        unevaluatedProperties: false
+
+      "^sm[0-2]$":
+        type: object
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+        unevaluatedProperties: false
+
+patternProperties:
+  "^vin-sm[0-2]-supply$":
+    description: The input supply for the corresponding SM (SM0, SM1, or SM2).
+
+  "^vinldo(01|23|4|678|9)-supply$":
+    description: The input supply for the corresponding LDO or group of LDOs.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - regulators
+  - "#gpio-cells"
+  - gpio-controller
+  - sys-supply
+  - vin-sm0-supply
+  - vin-sm1-supply
+  - vin-sm2-supply
+  - vinldo01-supply
+  - vinldo23-supply
+  - vinldo4-supply
+  - vinldo678-supply
+  - vinldo9-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic@34 {
+          compatible = "ti,tps6586x";
+          reg = <0x34>;
+          interrupts = <0 88 0x4>;
+
+          #gpio-cells = <2>;
+          gpio-controller;
+
+          ti,system-power-controller;
+
+          sys-supply = <&vdd_5v0_sys>;
+          vin-sm0-supply = <&sys_reg>;
+          vin-sm1-supply = <&sys_reg>;
+          vin-sm2-supply = <&sys_reg>;
+          vinldo01-supply = <&sm2_reg>;
+          vinldo23-supply = <&sm2_reg>;
+          vinldo4-supply = <&sm2_reg>;
+          vinldo678-supply = <&sm2_reg>;
+          vinldo9-supply = <&sm2_reg>;
+
+          regulators {
+              sys {
+                  regulator-name = "vdd_sys";
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              sm0 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              sm1 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              sm2 {
+                  regulator-min-microvolt = <3000000>;
+                  regulator-max-microvolt = <4550000>;
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              ldo0 {
+                  regulator-name = "PCIE CLK";
+                  regulator-min-microvolt = <3300000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo1 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+              };
+
+              ldo2 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+              };
+
+              ldo3 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo4 {
+                  regulator-min-microvolt = <1700000>;
+                  regulator-max-microvolt = <2475000>;
+              };
+
+              ldo5 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo6 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo7 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo8 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo9 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+          };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/tps6586x.txt b/Documentation/devicetree/bindings/regulator/tps6586x.txt
deleted file mode 100644
index 8b40cac24d93..000000000000
--- a/Documentation/devicetree/bindings/regulator/tps6586x.txt
+++ /dev/null
@@ -1,135 +0,0 @@
-TPS6586x family of regulators
-
-Required properties:
-- compatible: "ti,tps6586x"
-- reg: I2C slave address
-- interrupts: the interrupt outputs of the controller
-- #gpio-cells: number of cells to describe a GPIO
-- gpio-controller: mark the device as a GPIO controller
-- regulators: A node that houses a sub-node for each regulator within the
-  device. Each sub-node is identified using the node's name (or the deprecated
-  regulator-compatible property if present), with valid values listed below.
-  The content of each sub-node is defined by the standard binding for
-  regulators; see regulator.txt.
-  sys, sm[0-2], ldo[0-9] and ldo_rtc
-- sys-supply: The input supply for SYS.
-- vin-sm0-supply: The input supply for the SM0.
-- vin-sm1-supply: The input supply for the SM1.
-- vin-sm2-supply: The input supply for the SM2.
-- vinldo01-supply: The input supply for the LDO1 and LDO2
-- vinldo23-supply: The input supply for the LDO2 and LDO3
-- vinldo4-supply: The input supply for the LDO4
-- vinldo678-supply: The input supply for the LDO6, LDO7 and LDO8
-- vinldo9-supply: The input supply for the LDO9
-
-Optional properties:
-- ti,system-power-controller: Telling whether or not this pmic is controlling
-  the system power.
-
-Each regulator is defined using the standard binding for regulators.
-
-Note: LDO5 and LDO_RTC is supplied by SYS regulator internally and driver
-      take care of making proper parent child relationship.
-
-Example:
-
-	pmu: tps6586x@34 {
-		compatible = "ti,tps6586x";
-		reg = <0x34>;
-		interrupts = <0 88 0x4>;
-
-		#gpio-cells = <2>;
-		gpio-controller;
-
-		ti,system-power-controller;
-
-		sys-supply = <&some_reg>;
-		vin-sm0-supply = <&some_reg>;
-		vin-sm1-supply = <&some_reg>;
-		vin-sm2-supply = <&some_reg>;
-		vinldo01-supply = <...>;
-		vinldo23-supply = <...>;
-		vinldo4-supply = <...>;
-		vinldo678-supply = <...>;
-		vinldo9-supply = <...>;
-
-		regulators {
-			sys_reg: sys {
-				regulator-name = "vdd_sys";
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sm0_reg: sm0 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sm1_reg: sm1 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sm2_reg: sm2 {
-				regulator-min-microvolt = <3000000>;
-				regulator-max-microvolt = <4550000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo0_reg: ldo0 {
-				regulator-name = "PCIE CLK";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo1_reg: ldo1 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-			};
-
-			ldo2_reg: ldo2 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-			};
-
-			ldo3_reg: ldo3 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo4_reg: ldo4 {
-				regulator-min-microvolt = <1700000>;
-				regulator-max-microvolt = <2475000>;
-			};
-
-			ldo5_reg: ldo5 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo6_reg: ldo6 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo7_reg: ldo7 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo8_reg: ldo8 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo9_reg: ldo9 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-		};
-	};

-- 
2.55.0

