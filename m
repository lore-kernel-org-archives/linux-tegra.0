Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990B0C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85D2F6103C
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235048AbhKLMI5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234975AbhKLMIt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:08:49 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA60CC06120F;
        Fri, 12 Nov 2021 04:05:58 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id t30so15066997wra.10;
        Fri, 12 Nov 2021 04:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=joTkd7AQdgoW1ygDvjsIMjwJvcE8sGgdUMeUY7smjNc=;
        b=n8a9FsByB6jj4DK6/v+ChG7EUQJyGMG66Tsc3+tQ9pkSOjLxiUXzCJ8eLz33aME1MW
         WXv3+3OgZ6FOYtV6d5gs0a3twdtttYCdvx1lopiCaGzQ8WmZEyCsJ1WXF4Iq2QD3nRFY
         Nd7HDd9ywT/dHRQ6iRwz7Swutkuodgsoc/Br6GGiGC0nEhu4/2TWss0kvC1u7oY0GW28
         ifFlM5D5we0lXRnXlH+It/zZYs+0fhKtwMn9H1MCxjGUOuUxViqjsGYF8bOgFa4r4ktZ
         yfHPbFUYxSuxQGmqjd561sK4dYgT3NOS3XzzmAoHD1mSSWRxkz+mB7QYrfzx3Wib9kEZ
         avqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=joTkd7AQdgoW1ygDvjsIMjwJvcE8sGgdUMeUY7smjNc=;
        b=thQ1OTWvNGdEDzf3O3XZKRbEtUsHGa1v0NxVdxtN4tM7mMkoGyYAb282pFu7hgOo70
         EFRYAefD1082QdOJkeWqvfdYm81fm1LIT+2lAvh5aB5240cGTPZ1VHqzUcX6NpQgSpHk
         bQb1Gv+GunfHMvtpCAVWFLYPTw90wCk712Fz2pol/RjTHfs0MmRmeXHXI8lBWVt69SpF
         GuEsojRN/NmudnjEmpfMODccWM686t30NWjeRVa1Z/OhDCVkK83ocyBl+wJIc7xveAIc
         IyqzQqEc9kP2RsqzyuErt08R5MbKxBvAGvVAXZUbKjCNm4y9tb0CwS+5TkszengdMXHm
         7e5g==
X-Gm-Message-State: AOAM53172oDVCSTgap6EfL5WJ/svjb78fuppaldAZl1qV38Hv1g8CaEb
        WYZTP+aPQiVYt9d7/a2G+sY0ZxXMMzPxZg==
X-Google-Smtp-Source: ABdhPJxZ1TyZ5hj5DN7IaPVoenJ0QLxmdy6bAykmppaLPx8Kg50QkITnQaI4WS50k318OxqLUd5XAQ==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr18617317wrb.50.1636718757157;
        Fri, 12 Nov 2021 04:05:57 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id q84sm13294335wme.3.2021.11.12.04.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:05:56 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 12/15] dt-bindings: firmware: tegra: Convert to json-schema
Date:   Fri, 12 Nov 2021 13:05:15 +0100
Message-Id: <20211112120518.3679793-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112120518.3679793-1-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the NVIDIA Tegra186 (and later) BPMP bindings from the free-form
text format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../firmware/nvidia,tegra186-bpmp.txt         | 107 ------------
 .../firmware/nvidia,tegra186-bpmp.yaml        | 161 ++++++++++++++++++
 2 files changed, 161 insertions(+), 107 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
 create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
deleted file mode 100644
index e44a13bc06ed..000000000000
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
+++ /dev/null
@@ -1,107 +0,0 @@
-NVIDIA Tegra Boot and Power Management Processor (BPMP)
-
-The BPMP is a specific processor in Tegra chip, which is designed for
-booting process handling and offloading the power management, clock
-management, and reset control tasks from the CPU. The binding document
-defines the resources that would be used by the BPMP firmware driver,
-which can create the interprocessor communication (IPC) between the CPU
-and BPMP.
-
-Required properties:
-- compatible
-    Array of strings
-    One of:
-    - "nvidia,tegra186-bpmp"
-- mboxes : The phandle of mailbox controller and the mailbox specifier.
-- shmem : List of the phandle of the TX and RX shared memory area that
-	  the IPC between CPU and BPMP is based on.
-- #clock-cells : Should be 1.
-- #power-domain-cells : Should be 1.
-- #reset-cells : Should be 1.
-
-This node is a mailbox consumer. See the following files for details of
-the mailbox subsystem, and the specifiers implemented by the relevant
-provider(s):
-
-- .../mailbox/mailbox.txt
-- .../mailbox/nvidia,tegra186-hsp.txt
-
-This node is a clock, power domain, and reset provider. See the following
-files for general documentation of those features, and the specifiers
-implemented by this node:
-
-- .../clock/clock-bindings.txt
-- <dt-bindings/clock/tegra186-clock.h>
-- ../power/power-domain.yaml
-- <dt-bindings/power/tegra186-powergate.h>
-- .../reset/reset.txt
-- <dt-bindings/reset/tegra186-reset.h>
-
-The BPMP implements some services which must be represented by separate nodes.
-For example, it can provide access to certain I2C controllers, and the I2C
-bindings represent each I2C controller as a device tree node. Such nodes should
-be nested directly inside the main BPMP node.
-
-Software can determine whether a child node of the BPMP node represents a device
-by checking for a compatible property. Any node with a compatible property
-represents a device that can be instantiated. Nodes without a compatible
-property may be used to provide configuration information regarding the BPMP
-itself, although no such configuration nodes are currently defined by this
-binding.
-
-The BPMP firmware defines no single global name-/numbering-space for such
-services. Put another way, the numbering scheme for I2C buses is distinct from
-the numbering scheme for any other service the BPMP may provide (e.g. a future
-hypothetical SPI bus service). As such, child device nodes will have no reg
-property, and the BPMP node will have no #address-cells or #size-cells property.
-
-The shared memory bindings for BPMP
------------------------------------
-
-The shared memory area for the IPC TX and RX between CPU and BPMP are
-predefined and work on top of sysram, which is an SRAM inside the chip.
-
-See ".../sram/sram.txt" for the bindings.
-
-Example:
-
-hsp_top0: hsp@3c00000 {
-	...
-	#mbox-cells = <2>;
-};
-
-sysram@30000000 {
-	compatible = "nvidia,tegra186-sysram", "mmio-sram";
-	reg = <0x0 0x30000000 0x0 0x50000>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-	ranges = <0 0x0 0x0 0x30000000 0x0 0x50000>;
-
-	cpu_bpmp_tx: shmem@4e000 {
-		compatible = "nvidia,tegra186-bpmp-shmem";
-		reg = <0x0 0x4e000 0x0 0x1000>;
-		label = "cpu-bpmp-tx";
-		pool;
-	};
-
-	cpu_bpmp_rx: shmem@4f000 {
-		compatible = "nvidia,tegra186-bpmp-shmem";
-		reg = <0x0 0x4f000 0x0 0x1000>;
-		label = "cpu-bpmp-rx";
-		pool;
-	};
-};
-
-bpmp {
-	compatible = "nvidia,tegra186-bpmp";
-	mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
-	shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
-	#clock-cells = <1>;
-	#power-domain-cells = <1>;
-	#reset-cells = <1>;
-
-	i2c {
-		compatible = "...";
-		...
-	};
-};
diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
new file mode 100644
index 000000000000..b1dacb8953cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
@@ -0,0 +1,161 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/nvidia,tegra186-bpmp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Boot and Power Management Processor (BPMP)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The BPMP is a specific processor in Tegra chip, which is designed for
+  booting process handling and offloading the power management, clock
+  management, and reset control tasks from the CPU. The binding document
+  defines the resources that would be used by the BPMP firmware driver,
+  which can create the interprocessor communication (IPC) between the
+  CPU and BPMP.
+
+  This node is a mailbox consumer. See the following files for details
+  of the mailbox subsystem, and the specifiers implemented by the
+  relevant provider(s):
+
+    - .../mailbox/mailbox.txt
+    - .../mailbox/nvidia,tegra186-hsp.yaml
+
+  This node is a clock, power domain, and reset provider. See the
+  following files for general documentation of those features, and the
+  specifiers implemented by this node:
+
+    - .../clock/clock-bindings.txt
+    - <dt-bindings/clock/tegra186-clock.h>
+    - ../power/power-domain.yaml
+    - <dt-bindings/power/tegra186-powergate.h>
+    - .../reset/reset.txt
+    - <dt-bindings/reset/tegra186-reset.h>
+
+  The BPMP implements some services which must be represented by
+  separate nodes. For example, it can provide access to certain I2C
+  controllers, and the I2C bindings represent each I2C controller as a
+  device tree node. Such nodes should be nested directly inside the main
+  BPMP node.
+
+  Software can determine whether a child node of the BPMP node
+  represents a device by checking for a compatible property. Any node
+  with a compatible property represents a device that can be
+  instantiated. Nodes without a compatible property may be used to
+  provide configuration information regarding the BPMP itself, although
+  no such configuration nodes are currently defined by this binding.
+
+  The BPMP firmware defines no single global name-/numbering-space for
+  such services. Put another way, the numbering scheme for I2C buses is
+  distinct from the numbering scheme for any other service the BPMP may
+  provide (e.g. a future hypothetical SPI bus service). As such, child
+  device nodes will have no reg property, and the BPMP node will have no
+  "#address-cells" or "#size-cells" property.
+
+  The shared memory area for the IPC TX and RX between CPU and BPMP are
+  predefined and work on top of sysram, which is an SRAM inside the
+  chip. See ".../sram/sram.yaml" for the bindings.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - nvidia,tegra194-bpmp
+              - nvidia,tegra234-bpmp
+          - const: nvidia,tegra186-bpmp
+      - const: nvidia,tegra186-bpmp
+
+  mboxes:
+    description: A phandle and channel specifier for the mailbox used to
+      communicate with the BPMP.
+    maxItems: 1
+
+  shmem:
+    description: List of the phandle to the TX and RX shared memory area
+      that the IPC between CPU and BPMP is based on.
+    minItems: 2
+    maxItems: 2
+
+  "#clock-cells":
+    const: 1
+
+  "#power-domain-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - mboxes
+  - shmem
+  - "#clock-cells"
+  - "#power-domain-cells"
+  - "#reset-cells"
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/mailbox/tegra186-hsp.h>
+    #include <dt-bindings/memory/tegra186-mc.h>
+
+    hsp_top0: hsp@3c00000 {
+        compatible = "nvidia,tegra186-hsp";
+        reg = <0x03c00000 0xa0000>;
+        interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "doorbell";
+        #mbox-cells = <2>;
+    };
+
+    sram@30000000 {
+        compatible = "nvidia,tegra186-sysram", "mmio-sram";
+        reg = <0x30000000 0x50000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x30000000 0x50000>;
+
+        cpu_bpmp_tx: sram@4e000 {
+            reg = <0x4e000 0x1000>;
+            label = "cpu-bpmp-tx";
+            pool;
+        };
+
+        cpu_bpmp_rx: sram@4f000 {
+            reg = <0x4f000 0x1000>;
+            label = "cpu-bpmp-rx";
+            pool;
+        };
+    };
+
+    bpmp {
+        compatible = "nvidia,tegra186-bpmp";
+        interconnects = <&mc TEGRA186_MEMORY_CLIENT_BPMPR &emc>,
+                        <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc>,
+                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR &emc>,
+                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc>;
+        interconnect-names = "read", "write", "dma-mem", "dma-write";
+        iommus = <&smmu TEGRA186_SID_BPMP>;
+        mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB
+                            TEGRA_HSP_DB_MASTER_BPMP>;
+        shmem = <&cpu_bpmp_tx>, <&cpu_bpmp_rx>;
+        #clock-cells = <1>;
+        #power-domain-cells = <1>;
+        #reset-cells = <1>;
+
+        i2c {
+            compatible = "nvidia,tegra186-bpmp-i2c";
+            nvidia,bpmp-bus-id = <5>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+
+        thermal {
+            compatible = "nvidia,tegra186-bpmp-thermal";
+            #thermal-sensor-cells = <1>;
+        };
+    };
-- 
2.33.1

