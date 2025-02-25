Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73257270EA6;
	Tue, 25 Feb 2025 14:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494134; cv=none; b=MSr4PlLWgcbL/xYRhshbYVBSHXVCO/EUeR43jhnS94ukyWyEb9KNZfozJaTEr+zqt5DikbahzPbNzBgQGEVoogeuIWI8wl2+FESFH6pe1ZFy/tfnq5m7gskslJIJ9RClqSKrn92fPzGl7H3GtGtHG1J1ugOTtrV3q6Ltfn4Fi30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494134; c=relaxed/simple;
	bh=B10HPG8NhEZ9IlEcHdQCjOZDDdoTVoi6b2QB8kLjyYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7EkckvA16Ffv5zNwlDt53MiKDezhiKP8+4EJ/iwYqmhGG+hO5j35i6WHdq2PlD31FLQY8AOCuTrjKwFf+hCF9PLb7y6/vxKeTNT7e36U7DzDkyrFVIghJtF98yY7LIpgVOwnFmlZMFjF3QXzn5gCSupbwsE0gZq1U7Ipfy17Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjgJJ85T; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjgJJ85T"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abb999658fbso705370866b.3;
        Tue, 25 Feb 2025 06:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740494131; x=1741098931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMByiLjJLjwgxXphgC6Cd296jNAjFYyJKTYRbj/1xmw=;
        b=EjgJJ85TDZpJUVe1XHltHibw9xVNnIAizW2ikvAut/0LpCAWCAL+W6DbwKcC1khObe
         2h47MuBqzqMYxZIFYbjNlEykHaq0WhCN/+tCDKnjRtbtC5hw7M2URPKpifptDAdAleBg
         sMPh0jShN4NNa8GjZFmJbxh8ZSq7EIEPd49xcPl1zYPKlcZjbK/QRarKTOMbRaGcunI9
         WDEwFtWaZh04kMdNsgwg+G7UStwSVW+ErBk6EDdyq/FiEqqr8UlW6I2Fd+oZNl2xnXWZ
         7jLOtNM6i4jSGuj0XT3yY8tv4wojjNiRw9rA+rXhLzWyu9/mqxE0CBYKD5sZSjVav+Sk
         W/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494131; x=1741098931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMByiLjJLjwgxXphgC6Cd296jNAjFYyJKTYRbj/1xmw=;
        b=Ixc4AxTqLRgVaqFtwLtTA+AxOOw3DH1A7rZd9bl9ii4jzJ/ECd6Mh0NQMLktUg+1zK
         YBVc8dFxTGzLEsI2Rfv/Nc7GIThKAiGQLgdcOly8yiFZKsJjA0CeELGQUdgcsM3LZjtl
         FCLYSWa7AETgD1BEzpnMPctli0XDOd4rMW3DMvXAyNHyg9GUA0to0k9dEafPeFRKnD9Q
         A1abkC1SlLeOZ+fHBfOiaBBUCbyYXprR++jPuC4iN2U8EfYFfKb60DAAI2EfOpMbj9/C
         oqDCFJsvru+VrHmZRr1YzkNjEfhSk/lneDGl+kmEfDxMgUvrck+onexCnHaNoJQU1q4w
         pnZA==
X-Forwarded-Encrypted: i=1; AJvYcCUsRI/3WOESivTPG5eU0VyMORnRB16KWmrcU9tbVTMi03Hyuxa++OMr6DMxgelz2IzJjONIMLqj5LIl@vger.kernel.org, AJvYcCV/4mtLcRoq+NRtvKg3klrDVQeIhL94i3Gyqmb5wEabnSZRSTGA4VxwRDv14ssHNMy4wzewXpxkg01W@vger.kernel.org, AJvYcCVS8/0d2a5JGMrJwZt2uABSS7o3KD/M6ieeu6wQk/4FYwQ33MG8Pnrh+PFp3AmP+JG10SP8hr+aF6xjSkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbZVjWOF8VgyxZEN936m7mO+uz8R6CoMeHyzOVK1TlQleHQttL
	AAxxeXlVK3cfHI+7yphZc/od1U7eIjMdjNq1WxqvLNlxZMb1iPOo
X-Gm-Gg: ASbGncs35JLI3NL7RJDGsCB6RquwQAorXl0N1Plbnm2XwW5UL4y83MQ54Ss55x0bofM
	LJRJBdRg5WxTUt49hVmz0UQ+zUgUB8MgABICMmrVXUc067+E1XRcnsv2P7IR+xkvpJkW9lz55gC
	yrn69B7cNRDFVtL4kYKPw28HZFVbUouLTNI7de17S1PAxSa35/nBYKRdGg1iVSNW2qU43RyTWQl
	28haU8oJqth1RZ3FapEVHbullKEJYUp8HGZ/nrWh/5CLmYlLwz0RYpmxUwpKxMNOvKk/lbZsTc2
	yfSAjiNDDrbjvPRMiA==
X-Google-Smtp-Source: AGHT+IELZ+JLlKXdOsRtZOiArYVmCLPkr9XWoTQIS0xs1GN+fjOn1jIQE3drxYWs1WBcDfrii9oybg==
X-Received: by 2002:a05:6402:35d4:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5e44a256a84mr8311605a12.24.1740494130357;
        Tue, 25 Feb 2025 06:35:30 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460ff8629sm1298750a12.59.2025.02.25.06.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:35:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v1 2/9] dt-bindings: memory: Document Tegra114 Memory Controller
Date: Tue, 25 Feb 2025 16:34:54 +0200
Message-ID: <20250225143501.68966-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225143501.68966-1-clamor95@gmail.com>
References: <20250225143501.68966-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provided schema is based on existing Tegra124 MC schema. The most notable
difference is the amount of EMEM timings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../nvidia,tegra114-mc.yaml                   | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-mc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-mc.yaml
new file mode 100644
index 000000000000..d69fd5211f96
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-mc.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra114-mc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra114 SoC Memory Controller
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  Tegra114 SoC features a hybrid 2x32-bit / 1x64-bit memory controller similar
+  to one found in Tegra 124. These are interleaved to provide high performance
+  with the load shared across two memory channels. The Tegra114 Memory Controller
+  handles memory requests from internal clients and arbitrates among them to
+  allocate memory bandwidth for DDR3L and LPDDR3 SDRAMs.
+
+properties:
+  compatible:
+    const: nvidia,tegra114-mc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: mc
+
+  interrupts:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+  "#iommu-cells":
+    const: 1
+
+  "#interconnect-cells":
+    const: 1
+
+patternProperties:
+  "^emc-timings-[0-9]+$":
+    type: object
+    properties:
+      nvidia,ram-code:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Value of RAM_CODE this timing set is used for.
+
+    patternProperties:
+      "^timing-[0-9]+$":
+        type: object
+        properties:
+          clock-frequency:
+            description:
+              Memory clock rate in Hz.
+            minimum: 1000000
+            maximum: 1066000000
+
+          nvidia,emem-configuration:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            description: |
+              Values to be written to the EMEM register block. See section
+              "20.11.1 MC Registers" in the TRM.
+            items:
+              - description: MC_EMEM_ARB_CFG
+              - description: MC_EMEM_ARB_OUTSTANDING_REQ
+              - description: MC_EMEM_ARB_TIMING_RCD
+              - description: MC_EMEM_ARB_TIMING_RP
+              - description: MC_EMEM_ARB_TIMING_RC
+              - description: MC_EMEM_ARB_TIMING_RAS
+              - description: MC_EMEM_ARB_TIMING_FAW
+              - description: MC_EMEM_ARB_TIMING_RRD
+              - description: MC_EMEM_ARB_TIMING_RAP2PRE
+              - description: MC_EMEM_ARB_TIMING_WAP2PRE
+              - description: MC_EMEM_ARB_TIMING_R2R
+              - description: MC_EMEM_ARB_TIMING_W2W
+              - description: MC_EMEM_ARB_TIMING_R2W
+              - description: MC_EMEM_ARB_TIMING_W2R
+              - description: MC_EMEM_ARB_DA_TURNS
+              - description: MC_EMEM_ARB_DA_COVERS
+              - description: MC_EMEM_ARB_MISC0
+              - description: MC_EMEM_ARB_RING1_THROTTLE
+
+        required:
+          - clock-frequency
+          - nvidia,emem-configuration
+
+        additionalProperties: false
+
+    required:
+      - nvidia,ram-code
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - "#reset-cells"
+  - "#iommu-cells"
+  - "#interconnect-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    memory-controller@70019000 {
+        compatible = "nvidia,tegra114-mc";
+        reg = <0x70019000 0x1000>;
+        clocks = <&tegra_car 32>;
+        clock-names = "mc";
+
+        interrupts = <0 77 4>;
+
+        #iommu-cells = <1>;
+        #reset-cells = <1>;
+        #interconnect-cells = <1>;
+
+        emc-timings-0 {
+            nvidia,ram-code = <0>;
+
+            timing-12750000 {
+                clock-frequency = <12750000>;
+
+                nvidia,emem-configuration = <
+                    0x40040001 /* MC_EMEM_ARB_CFG */
+                    0x8000003f /* MC_EMEM_ARB_OUTSTANDING_REQ */
+                    0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+                    0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+                    0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+                    0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+                    0x00000001 /* MC_EMEM_ARB_TIMING_FAW */
+                    0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+                    0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+                    0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+                    0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+                    0x00000001 /* MC_EMEM_ARB_TIMING_W2W */
+                    0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+                    0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+                    0x06030102 /* MC_EMEM_ARB_DA_TURNS */
+                    0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+                    0x77e30303 /* MC_EMEM_ARB_MISC0 */
+                    0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+                >;
+            };
+        };
+    };
-- 
2.43.0

