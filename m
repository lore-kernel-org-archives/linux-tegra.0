Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BEE272916;
	Tue, 25 Feb 2025 14:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494141; cv=none; b=oyalp+ZPLLNx3GdOSci8GKi2yNimdajdovKf49azLP3UUTHBtAXUydwlHbfIsHkPrGfCankHMjEEYMz1uhqX60cc3Wtrzit5fUTCqAeTMqyrGix1g3XV0gVarL4KN4TjU2QP11wpcsulnonoKHEy222PtkB1GEohm0a52XT26c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494141; c=relaxed/simple;
	bh=nqLS2GMz82IPZznhxcV+wdHhRE8XOPEWX6cbezVNNFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7RquVudSvCzDhxeMn5ZCVDv6TkoXIkwlHLprerjRSinuy5Clfi3Bz8Niljfd4lLGMnAZr/tvyoPyGys/zOtR/wZ3xwcAukzkJ0WuVFs8jBZLhjSGfss0Lgtpru9h4+1Corw+f46gd+RHg2Q+nblHJDYp0RnkyoaZbR3fjrzbw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmEnsUTU; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmEnsUTU"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abbac134a19so870231966b.0;
        Tue, 25 Feb 2025 06:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740494137; x=1741098937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tn/clckfC/oyjOKPsL4QeecaVR8Q3aXGo4xvxXiw/DQ=;
        b=VmEnsUTUTuYaPuWOk91iUXmdZqu5Ad2TA2vu21V2lGLQQOcSGdUSRqs5Y6K/pj2Htg
         bu5wENJaRJzhr4uwihTuc4NSoR46R4RRDsbI9jSy5FNvpiSE/2PHOmQb9fJRH1N1uUzG
         52UI7XEXyUfwmP+ICl6KCgRt2vrNvHTQabXwU0dv7awRHnX4C3qIPkanAYQjqEK4TUgL
         le9VNbtKfpHaeZjSh0s9F87AL4TC6l7JjK2F7a2Ou0b7xCpscPz82CB24ujW4qkhtI0W
         yihBxKcs8XY37T7ksJA7rOV8Qoe3qwUX2KVQnGFA97GX1meB8RQoai/tpQhjyjrpDtGq
         3SNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494137; x=1741098937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn/clckfC/oyjOKPsL4QeecaVR8Q3aXGo4xvxXiw/DQ=;
        b=US+szKFidUTnd2XzuZLi56o9HKGDJkuZPLGSV8UsPY+9IgjFZOPkkmAhwke3lePMdn
         h1ZDzfr8HavYavlYBdKPCxx25UMar8z/OpWCE6bpjgewbuo7swETfygLBLU4xUJEcylW
         RjkVOb4DMYQqI9DMErd2WAY4Rv0qrrlybnj1saRo8qRv+x419xp9roQu7J3PqSX7cqg9
         5629VYLInTu1Tp41F5ecaKHaEucmkXFDfbGhzJrxTOiqnyirNGDyLFXcbtye9ma++LIL
         KNm2hWXtcGo/pfn57UcYfXryphl8t8ZAGyoFD5Uf+49auPSaqsyiAwdPgPRefjXn1MBo
         J70w==
X-Forwarded-Encrypted: i=1; AJvYcCV0qXQRJd+UlZE/dRznykgdzn+y80bG+iWzh5piFx/WhTRhxAsx30IeXij9d3Cx6qvwIO0BZDzvNg24@vger.kernel.org, AJvYcCWBprTQ9yiMlUBhhksq3yjgEB0gCX93VWzOjLU/a/zicYC9p2lx3+sA3Q35ZjOAV24FrjNAP1W7VQDqlsI=@vger.kernel.org, AJvYcCWRdN5KSctQ9MddBoUbb27FhDd4TcW/un9U+qh4RkIT0yuJPDYOYoswr9UwwQ1GgY3oKiSSLNbBpmnr@vger.kernel.org
X-Gm-Message-State: AOJu0YxxaJ7OcEF3LxwWviwulg9gFmVupsYz5jz2Zda7WDm3UpOvQfSB
	QFKNgQHxTqOV29DrTzlt1Zqr9CPQ8STvzSW8pDDH3/azeTe4Q2yp
X-Gm-Gg: ASbGncs/lSDRacNQ/CZehOzjJVBLqjeSzCSPl9TkEPY2uDaGVSaU/8Ls+piryPTgoa+
	vysTYs9lbU1MB+RA0tVV6Isbt8fTPoRFFCPSi+VBbcH+ei8pl3k4Qc3IqGZAxINNHYYpoHx0LES
	4RmBHW0dHNRttyIJF+kIg5cO9NDLbL6iqsFaRFsMS5KHJeoQtV9byKmHNsWMsSp1Tpgu5xgsuA4
	2fHnHlthBYf1bTPo1CG6Js2wkzUBOjDnCA/WAvdJ84FZ6Sb1AiHTGmlNw8luwAAO9OHad2v1hNc
	EnRbpnZqvpcBjCcZ7Q==
X-Google-Smtp-Source: AGHT+IF+2EWGOd0BMA1rKPQgFk9BpdePNuJjy0V/3k42WfaWKYSb/1fdy1kxQM6C7xepyDVuU6X28g==
X-Received: by 2002:a17:906:30d9:b0:abb:cdc2:a2d5 with SMTP id a640c23a62f3a-abed100eeb9mr337905366b.40.1740494137116;
        Tue, 25 Feb 2025 06:35:37 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460ff8629sm1298750a12.59.2025.02.25.06.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:35:36 -0800 (PST)
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
Subject: [PATCH v1 6/9] dt-bindings: memory: Document Tegra114 External Memory Controller
Date: Tue, 25 Feb 2025 16:34:58 +0200
Message-ID: <20250225143501.68966-7-clamor95@gmail.com>
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

Document External Memory Controller found in the Tegra 4 SoC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../nvidia,tegra114-emc.yaml                  | 431 ++++++++++++++++++
 1 file changed, 431 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-emc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-emc.yaml
new file mode 100644
index 000000000000..dfa9d31cf483
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-emc.yaml
@@ -0,0 +1,431 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra114-emc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra114 SoC External Memory Controller
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  The EMC interfaces with the off-chip SDRAM to service the request stream sent
+  from the memory controller.
+
+properties:
+  compatible:
+    const: nvidia,tegra114-emc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: emc
+
+  interrupts:
+    maxItems: 1
+
+  "#interconnect-cells":
+    const: 0
+
+  nvidia,memory-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle of the memory controller node
+
+  power-domains:
+    maxItems: 1
+    description:
+      Phandle of the SoC "core" power domain.
+
+  operating-points-v2:
+    description:
+      Should contain freqs and voltages and opp-supported-hw property, which is
+      a bitfield indicating SoC speedo ID mask.
+
+patternProperties:
+  "^emc-timings-[0-9]+$":
+    type: object
+    additionalProperties: false
+    properties:
+      nvidia,ram-code:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          value of the RAM_CODE field in the PMC_STRAPPING_OPT_A register that
+          this timing set is used for
+
+    patternProperties:
+      "^timing-[0-9]+$":
+        type: object
+        properties:
+          clock-frequency:
+            description:
+              external memory clock rate in Hz
+            minimum: 1000000
+            maximum: 1000000000
+
+          nvidia,emc-auto-cal-config:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_AUTO_CAL_CONFIG register for this set of timings
+
+          nvidia,emc-auto-cal-config2:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_AUTO_CAL_CONFIG2 register for this set of timings
+
+          nvidia,emc-auto-cal-config3:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_AUTO_CAL_CONFIG3 register for this set of timings
+
+          nvidia,emc-auto-cal-interval:
+            description:
+              pad calibration interval in microseconds
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 2097151
+
+          nvidia,emc-cfg:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_CFG register for this set of timings
+
+          nvidia,emc-ctt-term-ctrl:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_CTT_TERM_CTRL register for this set of timings
+
+          nvidia,emc-mode-1:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_MRW register for this set of timings
+
+          nvidia,emc-mode-2:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_MRW2 register for this set of timings
+
+          nvidia,emc-mode-4:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_MRW4 register for this set of timings
+
+          nvidia,emc-mode-reset:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              reset value of the EMC_MRS register for this set of timings
+
+          nvidia,emc-mrs-wait-cnt:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMR_MRS_WAIT_CNT register for this set of timings
+
+          nvidia,emc-sel-dpd-ctrl:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_SEL_DPD_CTRL register for this set of timings
+
+          nvidia,emc-xm2dqspadctrl2:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_XM2DQSPADCTRL2 register for this set of timings
+
+          nvidia,emc-zcal-cnt-long:
+            description:
+              number of EMC clocks to wait before issuing any commands after
+              clock change
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 1023
+
+          nvidia,emc-zcal-interval:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_ZCAL_INTERVAL register for this set of timings
+
+          nvidia,emc-configuration:
+            description:
+              EMC timing characterization data. These are the registers (see
+              section "20.11.2 EMC Registers" in the TRM) whose values need to
+              be specified, according to the board documentation.
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            items:
+              - description: EMC_RC
+              - description: EMC_RFC
+              - description: EMC_RAS
+              - description: EMC_RP
+              - description: EMC_R2W
+              - description: EMC_W2R
+              - description: EMC_R2P
+              - description: EMC_W2P
+              - description: EMC_RD_RCD
+              - description: EMC_WR_RCD
+              - description: EMC_RRD
+              - description: EMC_REXT
+              - description: EMC_WEXT
+              - description: EMC_WDV
+              - description: EMC_WDV_MASK
+              - description: EMC_QUSE
+              - description: EMC_IBDLY
+              - description: EMC_EINPUT
+              - description: EMC_EINPUT_DURATION
+              - description: EMC_PUTERM_EXTRA
+              - description: EMC_CDB_CNTL_1
+              - description: EMC_CDB_CNTL_2
+              - description: EMC_QRST
+              - description: EMC_QSAFE
+              - description: EMC_RDV
+              - description: EMC_RDV_MASK
+              - description: EMC_REFRESH
+              - description: EMC_BURST_REFRESH_NUM
+              - description: EMC_PRE_REFRESH_REQ_CNT
+              - description: EMC_PDEX2WR
+              - description: EMC_PDEX2RD
+              - description: EMC_PCHG2PDEN
+              - description: EMC_ACT2PDEN
+              - description: EMC_AR2PDEN
+              - description: EMC_RW2PDEN
+              - description: EMC_TXSR
+              - description: EMC_TXSRDLL
+              - description: EMC_TCKE
+              - description: EMC_TCKESR
+              - description: EMC_TPD
+              - description: EMC_TFAW
+              - description: EMC_TRPAB
+              - description: EMC_TCLKSTABLE
+              - description: EMC_TCLKSTOP
+              - description: EMC_TREFBW
+              - description: EMC_QUSE_EXTRA
+              - description: EMC_FBIO_CFG6
+              - description: EMC_ODT_WRITE
+              - description: EMC_ODT_READ
+              - description: EMC_FBIO_CFG5
+              - description: EMC_CFG_DIG_DLL
+              - description: EMC_CFG_DIG_DLL_PERIOD
+              - description: EMC_DLL_XFORM_DQS0
+              - description: EMC_DLL_XFORM_DQS1
+              - description: EMC_DLL_XFORM_DQS2
+              - description: EMC_DLL_XFORM_DQS3
+              - description: EMC_DLL_XFORM_DQS4
+              - description: EMC_DLL_XFORM_DQS5
+              - description: EMC_DLL_XFORM_DQS6
+              - description: EMC_DLL_XFORM_DQS7
+              - description: EMC_DLL_XFORM_QUSE0
+              - description: EMC_DLL_XFORM_QUSE1
+              - description: EMC_DLL_XFORM_QUSE2
+              - description: EMC_DLL_XFORM_QUSE3
+              - description: EMC_DLL_XFORM_QUSE4
+              - description: EMC_DLL_XFORM_QUSE5
+              - description: EMC_DLL_XFORM_QUSE6
+              - description: EMC_DLL_XFORM_QUSE7
+              - description: EMC_DLI_TRIM_TXDQS0
+              - description: EMC_DLI_TRIM_TXDQS1
+              - description: EMC_DLI_TRIM_TXDQS2
+              - description: EMC_DLI_TRIM_TXDQS3
+              - description: EMC_DLI_TRIM_TXDQS4
+              - description: EMC_DLI_TRIM_TXDQS5
+              - description: EMC_DLI_TRIM_TXDQS6
+              - description: EMC_DLI_TRIM_TXDQS7
+              - description: EMC_DLL_XFORM_DQ0
+              - description: EMC_DLL_XFORM_DQ1
+              - description: EMC_DLL_XFORM_DQ2
+              - description: EMC_DLL_XFORM_DQ3
+              - description: EMC_XM2CMDPADCTRL
+              - description: EMC_XM2CMDPADCTRL4
+              - description: EMC_XM2DQPADCTRL2
+              - description: EMC_XM2CLKPADCTRL
+              - description: EMC_XM2COMPPADCTRL
+              - description: EMC_XM2VTTGENPADCTRL
+              - description: EMC_XM2VTTGENPADCTRL2
+              - description: EMC_XM2DQSPADCTRL3
+              - description: EMC_XM2DQSPADCTRL4
+              - description: EMC_DSR_VTTGEN_DRV
+              - description: EMC_TXDSRVTTGEN
+              - description: EMC_FBIO_SPARE
+              - description: EMC_ZCAL_WAIT_CNT
+              - description: EMC_MRS_WAIT_CNT2
+              - description: EMC_CTT
+              - description: EMC_CTT_DURATION
+              - description: EMC_DYN_SELF_REF_CONTROL
+
+        required:
+          - clock-frequency
+          - nvidia,emc-auto-cal-config
+          - nvidia,emc-auto-cal-config2
+          - nvidia,emc-auto-cal-config3
+          - nvidia,emc-auto-cal-interval
+          - nvidia,emc-cfg
+          - nvidia,emc-ctt-term-ctrl
+          - nvidia,emc-mode-1
+          - nvidia,emc-mode-2
+          - nvidia,emc-mode-4
+          - nvidia,emc-mode-reset
+          - nvidia,emc-mrs-wait-cnt
+          - nvidia,emc-sel-dpd-ctrl
+          - nvidia,emc-xm2dqspadctrl2
+          - nvidia,emc-zcal-cnt-long
+          - nvidia,emc-zcal-interval
+          - nvidia,emc-configuration
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - nvidia,memory-controller
+  - "#interconnect-cells"
+  - operating-points-v2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra114-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    external-memory-controller@7001b000 {
+        compatible = "nvidia,tegra114-emc";
+        reg = <0x7001b000 0x1000>;
+        interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA114_CLK_EMC>;
+        clock-names = "emc";
+
+        nvidia,memory-controller = <&mc>;
+        operating-points-v2 = <&dvfs_opp_table>;
+        power-domains = <&domain>;
+
+        #interconnect-cells = <0>;
+
+        emc-timings-0 {
+            nvidia,ram-code = <0>;
+
+            timing-0 {
+                clock-frequency = <12750000>;
+
+                nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+                nvidia,emc-auto-cal-config2 = <0x00000000>;
+                nvidia,emc-auto-cal-config3 = <0x00000000>;
+                nvidia,emc-auto-cal-interval = <0x001fffff>;
+                nvidia,emc-cfg = <0x7324000e>;
+                nvidia,emc-ctt-term-ctrl = <0x00000802>;
+                nvidia,emc-mode-1 = <0x80100003>;
+                nvidia,emc-mode-2 = <0x80200008>;
+                nvidia,emc-mode-4 = <0x00000000>;
+                nvidia,emc-mode-reset = <0x80001221>;
+                nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+                nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+                nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+                nvidia,emc-zcal-cnt-long = <0x00000042>;
+                nvidia,emc-zcal-interval = <0x00000000>;
+
+                nvidia,emc-configuration = <
+                    0x00000000 /* EMC_RC */
+                    0x00000003 /* EMC_RFC */
+                    0x00000000 /* EMC_RAS */
+                    0x00000000 /* EMC_RP */
+                    0x00000004 /* EMC_R2W */
+                    0x0000000a /* EMC_W2R */
+                    0x00000003 /* EMC_R2P */
+                    0x0000000b /* EMC_W2P */
+                    0x00000000 /* EMC_RD_RCD */
+                    0x00000000 /* EMC_WR_RCD */
+                    0x00000003 /* EMC_RRD */
+                    0x00000001 /* EMC_REXT */
+                    0x00000000 /* EMC_WEXT */
+                    0x00000005 /* EMC_WDV */
+                    0x0000000f /* EMC_WDV_MASK */
+                    0x00000006 /* EMC_QUSE */
+                    0x00000006 /* EMC_IBDLY */
+                    0x00000004 /* EMC_EINPUT */
+                    0x00000004 /* EMC_EINPUT_DURATION */
+                    0x00010000 /* EMC_PUTERM_EXTRA */
+                    0x00000000 /* EMC_CDB_CNTL_1 */
+                    0x00000000 /* EMC_CDB_CNTL_2 */
+                    0x00000004 /* EMC_QRST */
+                    0x00000009 /* EMC_QSAFE */
+                    0x0000000d /* EMC_RDV */
+                    0x0000000f /* EMC_RDV_MASK */
+                    0x00000060 /* EMC_REFRESH */
+                    0x00000000 /* EMC_BURST_REFRESH_NUM */
+                    0x00000018 /* EMC_PRE_REFRESH_REQ_CNT */
+                    0x00000002 /* EMC_PDEX2WR */
+                    0x00000002 /* EMC_PDEX2RD */
+                    0x00000001 /* EMC_PCHG2PDEN */
+                    0x00000000 /* EMC_ACT2PDEN */
+                    0x00000007 /* EMC_AR2PDEN */
+                    0x0000000f /* EMC_RW2PDEN */
+                    0x00000005 /* EMC_TXSR */
+                    0x00000005 /* EMC_TXSRDLL */
+                    0x00000004 /* EMC_TCKE */
+                    0x00000004 /* EMC_TCKESR */
+                    0x00000004 /* EMC_TPD */
+                    0x00000004 /* EMC_TFAW */
+                    0x00000000 /* EMC_TRPAB */
+                    0x00000004 /* EMC_TCLKSTABLE */
+                    0x00000005 /* EMC_TCLKSTOP */
+                    0x00000064 /* EMC_TREFBW */
+                    0x00000005 /* EMC_QUSE_EXTRA */
+                    0x00000006 /* EMC_FBIO_CFG6 */
+                    0x00000020 /* EMC_ODT_WRITE */
+                    0x00000000 /* EMC_ODT_READ */
+                    0x0000aa88 /* EMC_FBIO_CFG5 */
+                    0x002c00a0 /* EMC_CFG_DIG_DLL */
+                    0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+                    0x00064000 /* EMC_DLL_XFORM_DQS0 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS1 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS2 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS3 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS4 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS5 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS6 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS7 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+                    0x0007c000 /* EMC_DLL_XFORM_DQ0 */
+                    0x0007c000 /* EMC_DLL_XFORM_DQ1 */
+                    0x0007c000 /* EMC_DLL_XFORM_DQ2 */
+                    0x0007c000 /* EMC_DLL_XFORM_DQ3 */
+                    0x001112a0 /* EMC_XM2CMDPADCTRL */
+                    0x00000000 /* EMC_XM2CMDPADCTRL4 */
+                    0x00000000 /* EMC_XM2DQPADCTRL2 */
+                    0x77ffc085 /* EMC_XM2CLKPADCTRL */
+                    0x81f1f108 /* EMC_XM2COMPPADCTRL */
+                    0x03037504 /* EMC_XM2VTTGENPADCTRL */
+                    0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+                    0x20820800 /* EMC_XM2DQSPADCTRL3 */
+                    0x00249249 /* EMC_XM2DQSPADCTRL4 */
+                    0x0000003f /* EMC_DSR_VTTGEN_DRV */
+                    0x00000007 /* EMC_TXDSRVTTGEN */
+                    0x02000000 /* EMC_FBIO_SPARE */
+                    0x00000042 /* EMC_ZCAL_WAIT_CNT */
+                    0x000c000c /* EMC_MRS_WAIT_CNT2 */
+                    0x00000000 /* EMC_CTT */
+                    0x00000000 /* EMC_CTT_DURATION */
+                    0x800001c5 /* EMC_DYN_SELF_REF_CONTROL */
+                >;
+            };
+        };
+    };
-- 
2.43.0

