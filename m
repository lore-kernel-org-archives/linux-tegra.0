Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D68C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39A8B61546
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235980AbhKSOmT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbhKSOmT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:42:19 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1450EC061574;
        Fri, 19 Nov 2021 06:39:17 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id b12so18530639wrh.4;
        Fri, 19 Nov 2021 06:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7lE/eNrmh5JLMaXC38USm8RnDgb6XGjj3Kr3/ClhfYc=;
        b=BXYeS1y/4OVQ4pZAMDc0wSw84ynTkkDK81Sok4opercRQMUDGOhV+mhInjYUmqEleH
         DunU+ln+W+W7+d1TQHVmpnqnRj65rRNqng2EobPLXyUs8HlxcRLqQU88ppY6nelMG13t
         R5wNli4iJtxTAmE4t4y6VzHNxFQ2Ibec3GZif+nqY5Nr4Hb/4/aux2XyJBEayOdnVg4u
         AmFRJ5ESCKQFDhN2cUEFv3lMViRwcC5UIzi6Inblv0mimlLal/vgN3S5Y61DZpOEgy2m
         /YrcbCN/1SRjDU9YGIplqj0k7uTHdZKUGxGLcLu45DMyHVr1BY+B/rHVBgKpnYPJx6nf
         0CDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7lE/eNrmh5JLMaXC38USm8RnDgb6XGjj3Kr3/ClhfYc=;
        b=XimHnIlparyO/RDq51ohwdo+uFZHtS/Oy5O2ZLiiVZHRKCGmnXZnNptrrfi/rOWn6p
         mrMJTsjo4LQFRtOCajcUn4BGIztj5gmt3AV2FFQysKtOGYI0tENB0S8aG0+y5HKPMwUQ
         SbAZgfLYH6VuByqztbe4RdAePfMPJ35VAmUj1bHTyslXhS6GfU/cG2flWFEiComY1ys1
         h7dHWp79ISLJTyjvv+CYEg5paKs7mgcv9YkmRlq1akLuPnDssJVGbue0nXoxjNc76LVi
         TbTxxO4CeHyI24Lp3gGzmk4Eses+chw+EOu/5F3ihXMO7g9vAQZki4I/7L3hqPLrro6J
         Ugmw==
X-Gm-Message-State: AOAM530LC9WW1YYSNojX1XObj9MmGP5VJi5lMlrh2v30b1unFA7zA/1d
        KBQo9iLSgzKyToyFG59BC24=
X-Google-Smtp-Source: ABdhPJwlbj2I/NDBwth/QwScv1INnN50ObEgYUWHVQXpF3xfHFwHe+9Pd5kG/EUtjLI9wdtp5R4C7Q==
X-Received: by 2002:adf:ecca:: with SMTP id s10mr7926468wro.405.1637332755451;
        Fri, 19 Nov 2021 06:39:15 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id 10sm4221586wrb.75.2021.11.19.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:39:14 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 12/16] dt-bindings: firmware: tegra: Convert to json-schema
Date:   Fri, 19 Nov 2021 15:38:35 +0100
Message-Id: <20211119143839.1950739-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
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
Changes in v2:
- add some missing properties and set additionalProperties to false

 .../firmware/nvidia,tegra186-bpmp.txt         | 107 ----------
 .../firmware/nvidia,tegra186-bpmp.yaml        | 186 ++++++++++++++++++
 2 files changed, 186 insertions(+), 107 deletions(-)
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
index 000000000000..833c07f1685c
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
@@ -0,0 +1,186 @@
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
+  interconnects:
+    items:
+      - description: memory read client
+      - description: memory write client
+      - description: DMA read client
+      - description: DMA write client
+
+  interconnect-names:
+    items:
+      - const: read
+      - const: write
+      - const: dma-mem # dma-read
+      - const: dma-write
+
+  iommus:
+    maxItems: 1
+
+  i2c:
+    type: object
+
+  thermal:
+    type: object
+
+additionalProperties: false
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

