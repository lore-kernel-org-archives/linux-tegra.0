Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4980C433E4
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 23:06:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3E9F619D6
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 23:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbhC3XFb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 19:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbhC3XFY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 19:05:24 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4870EC061574;
        Tue, 30 Mar 2021 16:05:24 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id iu14so3482273qvb.4;
        Tue, 30 Mar 2021 16:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=peNVppBARBLCgsqxF1x4RU4hqaSXt28ZBbCndisB5s4=;
        b=DzywFBD7aIQ/JFHzKhgp8UZpn8iOFAHufzCmo1JT9JggzOEMQQdgCTX8og+X4GQvLv
         lQ5JmfXXrsy5XLyEgPNjRdanWeMZRcgNb0vjHbuEPTbNHTnuvzSuVgvL/0Z/Ofc5fICr
         oXDYK/GvCS38A2R1gOI+/RNaMhMd3TvpXChKCPMdPpl7zSo05XjRHe3WeSTATNTZp4iR
         EOxf33QZ6CrlEKQ8N6ZxnPptBmPqa7dnaw4E2pQ77tOaDe9nc1iVSKChBWFH1FxseNSU
         SeoCQOqCLUHVpMMjM75IwhpNw72zFNNwFIthipvRPDnesVoUtHSKl7H/qzZdgSQg5KR9
         oJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=peNVppBARBLCgsqxF1x4RU4hqaSXt28ZBbCndisB5s4=;
        b=aXY6y1ZmqpIEGwkoCHGGd7b4YXXRrUuAaRqZ62lHFW7N+kABdmsap1zlCGld7Msi8u
         2QmiQwe6SGBKZe89ncgIVQWIhckzGWzsepBnY0shGLEzKYCRJrZtqa5j4AQXlwO8N4vA
         KKPoNWBaSV/t0rxcyjk35ruqR+K9v1QM3P/vDtuRRPg5J2qlf3wA8NSH/bFDRK7FVgd2
         L1kCwEV/viJYSE4x3tJqxYiXYflfbUw3bxbxpOAu2vy15rwsf2V99KwA1kLV4cUplAsT
         AKOqB/5WdB8seGO91HDLJPdv4oYjLnxPRL3B4Z8zlNnBqTZjq3CaQUvs61FgnkhxUD/B
         1uWg==
X-Gm-Message-State: AOAM530Ow5IudFfX7qqy/LIqOtgzVnGONIeEOYBNEdLjaKiBHKDT48n1
        xUl+XuPLj1rBLVGKwPVyJVY=
X-Google-Smtp-Source: ABdhPJxpasvWrmRcSQ4o9Xg1VSS7GifN1kEt8IsiqWxKeS4ox9X97hHWJlCoTbQNeP7B4NrLlnTP6g==
X-Received: by 2002:ad4:44a9:: with SMTP id n9mr530985qvt.60.1617145523527;
        Tue, 30 Mar 2021 16:05:23 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.gmail.com with ESMTPSA id 10sm160061qkc.83.2021.03.30.16.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 16:05:23 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 4/6] dt-bindings: memory: tegra20: mc: Convert to schema
Date:   Wed, 31 Mar 2021 02:04:43 +0300
Message-Id: <20210330230445.26619-5-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210330230445.26619-1-digetx@gmail.com>
References: <20210330230445.26619-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert Tegra20 Memory Controller binding to schema.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../memory-controllers/nvidia,tegra20-mc.txt  | 40 ----------
 .../memory-controllers/nvidia,tegra20-mc.yaml | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 40 deletions(-)
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
index 000000000000..55caf6905399
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml
@@ -0,0 +1,79 @@
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
+    items:
+      - description: controller registers
+      - description: GART registers
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
+        compatible = "nvidia,tegra20-mc-gart";
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

