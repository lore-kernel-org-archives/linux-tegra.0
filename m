Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7E6C433E6
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5117161996
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbhC2TrS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 15:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231672AbhC2Tq7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 15:46:59 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E138C061574;
        Mon, 29 Mar 2021 12:46:59 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 184so17235996ljf.9;
        Mon, 29 Mar 2021 12:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XH/LVCqLvCaL2Ayt4SmQEAxMJCJ53uI079V0Vyuggh8=;
        b=VhENSp/tJZc0DN6Gk82B52Fv+PMB9qHt1GQB0Ro+910HbafzWgS9jc3UQyPHNgT4Pq
         0yxh7L1NKxY3FZL9pb/wJCNQuywigHTis84iLvjWw3hABLw9RrNrynxCs/oKWwXlKfn2
         aLKvXOSg7/tv9mDHFSKtTTv2RNX67Yvp047PMW9hAB9sdADmRBpqK2ors0r9+6PJtV9q
         GvQVUsd/8o+d2LgSYepmICDVIHtJNehjgJKBWHM3BQwo9sVsK5fGK4ga9yS9/5o3NVke
         eEcjWsLnN9NowY3vWSU2l44yBQ3Fsle2VpWj3p33F4pvMbyEAtsQMVSCPUzsWWYRnrF5
         xCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XH/LVCqLvCaL2Ayt4SmQEAxMJCJ53uI079V0Vyuggh8=;
        b=dWKpwPu45Ll8EbAXgO3AaUe9xttcANMw3Os/4BHSc4hKuUpyjJ3Y0n8nANA47ZnS9E
         kGxigBWha4DDqxr22fZFzIvPRru+FPiDW8ld2a4U6Kw8xJl1B3K2dT/ZLmM6ksVssIbx
         hn0E660sx7/OFuWMkPlH5IFNubPeeaInBJRFc+mZPWGFPgspYFXVLpwFik7cjE2l7QeQ
         Z7ys5nsWFvMliaOER6hmpj9X1KrOAS7IwIfnrnH8wi3c1vgzZN15e/jh0dkGach2c7R6
         hbYxnpe3O6aCFarbCZG1g3Xq81ypz3ICqzNcWtUKi3MlQ7lrSviJwRwDu2w00nAkhHjc
         YEYQ==
X-Gm-Message-State: AOAM5309DAZxxhibWQazF3AIjQsQ/tNLRMpV3Yxe0ClBuwTY+/H7+OI7
        aatnhAK4ybVkBIiFS5TTtiA=
X-Google-Smtp-Source: ABdhPJwzdhGXspTbFGLqYBOm9p8+rW7I842LUQ3AzB1oyuQKFAbL7baolDzVa5NnDoaiAPPgsTG8IQ==
X-Received: by 2002:a2e:9204:: with SMTP id k4mr18358977ljg.203.1617047218073;
        Mon, 29 Mar 2021 12:46:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.gmail.com with ESMTPSA id p24sm1927693lfj.76.2021.03.29.12.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:46:57 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 4/6] dt-bindings: memory: tegra20: mc: Convert to schema
Date:   Mon, 29 Mar 2021 22:46:00 +0300
Message-Id: <20210329194602.17049-5-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329194602.17049-1-digetx@gmail.com>
References: <20210329194602.17049-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert Tegra20 Memory Controller binding to schema.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../memory-controllers/nvidia,tegra20-mc.txt  | 40 ----------
 .../memory-controllers/nvidia,tegra20-mc.yaml | 78 +++++++++++++++++++
 2 files changed, 78 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
deleted file mode 100644
index 739b7c6f2e26..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-NVIDIA Tegra20 MC(Memory Controller)
-
-Required properties:
-- compatible : "nvidia,tegra20-mc-gart"
-- reg : Should contain 2 register ranges: physical base address and length of
-  the controller's registers and the GART aperture respectively.
-- clocks: Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: Must include the following entries:
-  - mc: the module's clock input
-- interrupts : Should contain MC General interrupt.
-- #reset-cells : Should be 1. This cell represents memory client module ID.
-  The assignments may be found in header file <dt-bindings/memory/tegra20-mc.h>
-  or in the TRM documentation.
-- #iommu-cells: Should be 0. This cell represents the number of cells in an
-  IOMMU specifier needed to encode an address. GART supports only a single
-  address space that is shared by all devices, therefore no additional
-  information needed for the address encoding.
-- #interconnect-cells : Should be 1. This cell represents memory client.
-  The assignments may be found in header file <dt-bindings/memory/tegra20-mc.h>.
-
-Example:
-	mc: memory-controller@7000f000 {
-		compatible = "nvidia,tegra20-mc-gart";
-		reg = <0x7000f000 0x400		/* controller registers */
-		       0x58000000 0x02000000>;	/* GART aperture */
-		clocks = <&tegra_car TEGRA20_CLK_MC>;
-		clock-names = "mc";
-		interrupts = <GIC_SPI 77 0x04>;
-		#reset-cells = <1>;
-		#iommu-cells = <0>;
-		#interconnect-cells = <1>;
-	};
-
-	video-codec@6001a000 {
-		compatible = "nvidia,tegra20-vde";
-		...
-		resets = <&mc TEGRA20_MC_RESET_VDE>;
-		iommus = <&mc>;
-	};
diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml
new file mode 100644
index 000000000000..c5731fa41e83
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra20-mc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 SoC Memory Controller
+
+maintainers:
+  - Dmitry Osipenko <digetx@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description: |
+  The Tegra20 Memory Controller merges request streams from various client
+  interfaces into request stream(s) for the various memory target devices,
+  and returns response data to the various clients. The Memory Controller
+  has a configurable arbitration algorithm to allow the user to fine-tune
+  performance among the various clients.
+
+  Tegra20 Memory Controller includes the GART (Graphics Address Relocation
+  Table) which allows Memory Controller to provide a linear view of a
+  fragmented memory pages.
+
+properties:
+  compatible:
+    const: nvidia,tegra20-mc-gart
+
+  reg:
+    minItems: 1
+    maxItems: 2
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
+    const: 0
+
+  "#interconnect-cells":
+    const: 1
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
+    memory-controller@7000f000 {
+        compatible = "nvidia,tegra20-mc";
+        reg = <0x7000f000 0x400>,	/* Controller registers */
+              <0x58000000 0x02000000>;	/* GART aperture */
+        clocks = <&clock_controller 32>;
+        clock-names = "mc";
+
+        interrupts = <0 77 4>;
+
+        #iommu-cells = <0>;
+        #reset-cells = <1>;
+        #interconnect-cells = <1>;
+    };
-- 
2.30.2

