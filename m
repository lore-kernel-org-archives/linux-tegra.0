Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DC0C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:49:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E448D61090
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:49:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239733AbhJFWvK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 18:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239794AbhJFWti (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 18:49:38 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997D1C061764;
        Wed,  6 Oct 2021 15:47:45 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id b65so4180214qkc.13;
        Wed, 06 Oct 2021 15:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8w8i+occt62gTrQveuARNGY9wHRKGULr3p5+LKeShiM=;
        b=bMfrgW4Pbohe7CUUL9rb9E4p+JpRrnDy4nsoxepUyRye31isUqbyqhosVlZQXOTHdy
         KuGfuG2N/uPgUunfvMponEVpygEp9cxjL704KE6hbdgSGiVvoCsDQxVDJLXZPtfc1TL5
         btxChpCJZHI/6RPL1rPQrDiI2sl2yAUa0TRSqfIZDRnVZ20bn0Cj2dxQTABzilJ3NuJW
         78iiJo53weE5lNhOr6c0tcdgDNIh8GJoUbgEGFFfexgW2TyrsDbZnHv4GHzgtOK4bpG4
         423Wl8ueR3A4CXPdksXHsp4CUdyyyfQwPyxQMf0V8b3d/95/qwfUi0vX+hGKPY+66g/E
         so0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8w8i+occt62gTrQveuARNGY9wHRKGULr3p5+LKeShiM=;
        b=rupn5YDnjbq8X6nwsfZk1LFJ50EsyQVqU/HqzGAMI0SOSOhB6K4QQAAZIn6AEOzKpx
         B+WUN/QA4pnwW9VOZCNjvq2Oi2uXBaNEWMajJI5ZbwWQauu4Bz0y1XDlNnd2IzuIRuH6
         l0M3ZkHVO/jc4NllCwwcyR4dXNZhjzDHlFGCy0Au01rXzSYHv3UdkZhrr/kxN4+xziFb
         uIFIRPRlQsVwYv1TuLK3E7BYbi3suhCmB/zQcLiopMeZ3pWYLZJ7yHvO+R53DUqYt1VX
         J+Xt6MjYOXLBjsHp5Hb36DtrNEd/833xMF3IsRCbkN9RGPZGWU3Hv3UrcR3PQujz+lhE
         1ZlQ==
X-Gm-Message-State: AOAM533im98RGkm5/XQGjUedPuV/UWnUCGycpyOoOC1PtnWFT0Xkuv1u
        gMqT/ivHVn+wQVYBVzP2b031bFBWt48=
X-Google-Smtp-Source: ABdhPJw80lIzBx+6SkJDJhaxokCT7zo9yUsM2cDlfsVp4HpjlcJbvh29oA0iUm5yXGN18c38q5/mDw==
X-Received: by 2002:a37:bc47:: with SMTP id m68mr662112qkf.115.1633560464743;
        Wed, 06 Oct 2021 15:47:44 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id n11sm14738166qtk.92.2021.10.06.15.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 15:47:44 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 2/9] dt-bindings: memory: lpddr2: Convert to schema
Date:   Thu,  7 Oct 2021 01:46:52 +0300
Message-Id: <20211006224659.21434-3-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211006224659.21434-1-digetx@gmail.com>
References: <20211006224659.21434-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert LPDDR2 binding to schema. I removed obsolete ti,jedec-lpddr2-*
compatibles since they were never used by device-trees and by the code.
I also changed "Elpida" compatible prefix to lowercase "elpida".

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../memory-controllers/ddr/jedec,lpddr2.yaml  | 208 ++++++++++++++++++
 .../memory-controllers/ddr/lpddr2.txt         | 102 ---------
 2 files changed, 208 insertions(+), 102 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
new file mode 100644
index 000000000000..f931fe910ce5
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,lpddr2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LPDDR2 SDRAM compliant to JEDEC JESD209-2
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - elpida,ECB240ABACN
+          - enum:
+              - jedec,lpddr2-s4
+      - items:
+          - enum:
+              - jedec,lpddr2-s2
+      - items:
+          - enum:
+              - jedec,lpddr2-nvm
+
+  density:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Density in megabits of SDRAM chip. Obtained from device datasheet.
+    enum:
+      - 64
+      - 128
+      - 256
+      - 512
+      - 1024
+      - 2048
+      - 4096
+      - 8192
+      - 16384
+      - 32768
+
+  io-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      IO bus width in bits of SDRAM chip. Obtained from device datasheet.
+    enum:
+      - 32
+      - 16
+      - 8
+
+  tRRD-min-tck:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 16
+    description: |
+      Active bank a to active bank b in terms of number of clock cycles.
+      Obtained from device datasheet.
+
+  tWTR-min-tck:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 16
+    description: |
+      Internal WRITE-to-READ command delay in terms of number of clock cycles.
+      Obtained from device datasheet.
+
+  tXP-min-tck:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 16
+    description: |
+      Exit power-down to next valid command delay in terms of number of clock
+      cycles. Obtained from device datasheet.
+
+  tRTP-min-tck:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 16
+    description: |
+      Internal READ to PRECHARGE command delay in terms of number of clock
+      cycles. Obtained from device datasheet.
+
+  tCKE-min-tck:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 16
+    description: |
+      CKE minimum pulse width (HIGH and LOW pulse width) in terms of number
+      of clock cycles. Obtained from device datasheet.
+
+  tRPab-min-tck:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 16
+    description: |
+      Row precharge time (all banks) in terms of number of clock cycles.
+      Obtained from device datasheet.
+
+  tRCD-min-tck:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 16
+    description: |
+      RAS-to-CAS delay in terms of number of clock cycles. Obtained from
+      device datasheet.
+
+  tWR-min-tck:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 16
+    description: |
+      WRITE recovery time in terms of number of clock cycles. Obtained from
+      device datasheet.
+
+  tRASmin-min-tck:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 16
+    description: |
+      Row active time in terms of number of clock cycles. Obtained from device
+      datasheet.
+
+  tCKESR-min-tck:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 16
+    description: |
+      CKE minimum pulse width during SELF REFRESH (low pulse width during
+      SELF REFRESH) in terms of number of clock cycles. Obtained from device
+      datasheet.
+
+  tFAW-min-tck:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 16
+    description: |
+      Four-bank activate window in terms of number of clock cycles. Obtained
+      from device datasheet.
+
+patternProperties:
+  "^lpddr2-timings":
+    type: object
+    description: |
+      The lpddr2 node may have one or more child nodes of type "lpddr2-timings".
+      "lpddr2-timings" provides AC timing parameters of the device for
+      a given speed-bin. The user may provide the timings for as many
+      speed-bins as is required. Please see Documentation/devicetree/
+      bindings/memory-controllers/ddr/lpddr2-timings.txt for more information
+      on "lpddr2-timings".
+
+required:
+  - compatible
+  - density
+  - io-width
+
+additionalProperties: false
+
+examples:
+  - |
+    elpida_ECB240ABACN: lpddr2 {
+        compatible = "elpida,ECB240ABACN", "jedec,lpddr2-s4";
+        density = <2048>;
+        io-width = <32>;
+
+        tRPab-min-tck = <3>;
+        tRCD-min-tck = <3>;
+        tWR-min-tck = <3>;
+        tRASmin-min-tck = <3>;
+        tRRD-min-tck = <2>;
+        tWTR-min-tck = <2>;
+        tXP-min-tck = <2>;
+        tRTP-min-tck = <2>;
+        tCKE-min-tck = <3>;
+        tCKESR-min-tck = <3>;
+        tFAW-min-tck = <8>;
+
+        timings_elpida_ECB240ABACN_400mhz: lpddr2-timings0 {
+            compatible = "jedec,lpddr2-timings";
+            min-freq = <10000000>;
+            max-freq = <400000000>;
+            tRPab = <21000>;
+            tRCD = <18000>;
+            tWR = <15000>;
+            tRAS-min = <42000>;
+            tRRD = <10000>;
+            tWTR = <7500>;
+            tXP = <7500>;
+            tRTP = <7500>;
+            tCKESR = <15000>;
+            tDQSCK-max = <5500>;
+            tFAW = <50000>;
+            tZQCS = <90000>;
+            tZQCL = <360000>;
+            tZQinit = <1000000>;
+            tRAS-max-ns = <70000>;
+        };
+
+        timings_elpida_ECB240ABACN_200mhz: lpddr2-timings1 {
+            compatible = "jedec,lpddr2-timings";
+            min-freq = <10000000>;
+            max-freq = <200000000>;
+            tRPab = <21000>;
+            tRCD = <18000>;
+            tWR = <15000>;
+            tRAS-min = <42000>;
+            tRRD = <10000>;
+            tWTR = <10000>;
+            tXP = <7500>;
+            tRTP = <7500>;
+            tCKESR = <15000>;
+            tDQSCK-max = <5500>;
+            tFAW = <50000>;
+            tZQCS = <90000>;
+            tZQCL = <360000>;
+            tZQinit = <1000000>;
+            tRAS-max-ns = <70000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2.txt b/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2.txt
deleted file mode 100644
index ddd40121e6f6..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2.txt
+++ /dev/null
@@ -1,102 +0,0 @@
-* LPDDR2 SDRAM memories compliant to JEDEC JESD209-2
-
-Required properties:
-- compatible : Should be one of - "jedec,lpddr2-nvm", "jedec,lpddr2-s2",
-  "jedec,lpddr2-s4"
-
-  "ti,jedec-lpddr2-s2" should be listed if the memory part is LPDDR2-S2 type
-
-  "ti,jedec-lpddr2-s4" should be listed if the memory part is LPDDR2-S4 type
-
-  "ti,jedec-lpddr2-nvm" should be listed if the memory part is LPDDR2-NVM type
-
-- density  : <u32> representing density in Mb (Mega bits)
-
-- io-width : <u32> representing bus width. Possible values are 8, 16, and 32
-
-Optional properties:
-
-The following optional properties represent the minimum value of some AC
-timing parameters of the DDR device in terms of number of clock cycles.
-These values shall be obtained from the device data-sheet.
-- tRRD-min-tck
-- tWTR-min-tck
-- tXP-min-tck
-- tRTP-min-tck
-- tCKE-min-tck
-- tRPab-min-tck
-- tRCD-min-tck
-- tWR-min-tck
-- tRASmin-min-tck
-- tCKESR-min-tck
-- tFAW-min-tck
-
-Child nodes:
-- The lpddr2 node may have one or more child nodes of type "lpddr2-timings".
-  "lpddr2-timings" provides AC timing parameters of the device for
-  a given speed-bin. The user may provide the timings for as many
-  speed-bins as is required. Please see Documentation/devicetree/
-  bindings/ddr/lpddr2-timings.txt for more information on "lpddr2-timings"
-
-Example:
-
-elpida_ECB240ABACN : lpddr2 {
-	compatible	= "Elpida,ECB240ABACN","jedec,lpddr2-s4";
-	density		= <2048>;
-	io-width	= <32>;
-
-	tRPab-min-tck	= <3>;
-	tRCD-min-tck	= <3>;
-	tWR-min-tck	= <3>;
-	tRASmin-min-tck	= <3>;
-	tRRD-min-tck	= <2>;
-	tWTR-min-tck	= <2>;
-	tXP-min-tck	= <2>;
-	tRTP-min-tck	= <2>;
-	tCKE-min-tck	= <3>;
-	tCKESR-min-tck	= <3>;
-	tFAW-min-tck	= <8>;
-
-	timings_elpida_ECB240ABACN_400mhz: lpddr2-timings@0 {
-		compatible	= "jedec,lpddr2-timings";
-		min-freq	= <10000000>;
-		max-freq	= <400000000>;
-		tRPab		= <21000>;
-		tRCD		= <18000>;
-		tWR		= <15000>;
-		tRAS-min	= <42000>;
-		tRRD		= <10000>;
-		tWTR		= <7500>;
-		tXP		= <7500>;
-		tRTP		= <7500>;
-		tCKESR		= <15000>;
-		tDQSCK-max	= <5500>;
-		tFAW		= <50000>;
-		tZQCS		= <90000>;
-		tZQCL		= <360000>;
-		tZQinit		= <1000000>;
-		tRAS-max-ns	= <70000>;
-	};
-
-	timings_elpida_ECB240ABACN_200mhz: lpddr2-timings@1 {
-		compatible	= "jedec,lpddr2-timings";
-		min-freq	= <10000000>;
-		max-freq	= <200000000>;
-		tRPab		= <21000>;
-		tRCD		= <18000>;
-		tWR		= <15000>;
-		tRAS-min	= <42000>;
-		tRRD		= <10000>;
-		tWTR		= <10000>;
-		tXP		= <7500>;
-		tRTP		= <7500>;
-		tCKESR		= <15000>;
-		tDQSCK-max	= <5500>;
-		tFAW		= <50000>;
-		tZQCS		= <90000>;
-		tZQCL		= <360000>;
-		tZQinit		= <1000000>;
-		tRAS-max-ns	= <70000>;
-	};
-
-}
-- 
2.32.0

