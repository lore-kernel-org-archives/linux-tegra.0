Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F0BC49EA2
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 14:14:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5449A6120D
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 14:14:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhFUOQW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Jun 2021 10:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbhFUOQW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Jun 2021 10:16:22 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 332A5C061574;
        Mon, 21 Jun 2021 07:14:07 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id i94so19846922wri.4;
        Mon, 21 Jun 2021 07:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B3taWVflSNylsyETfTA2qz7hFyJkqD7B41nXPhtbmMM=;
        b=ILfXpMfbXFI52bS+OLSGcSm5AdXrhBPsn3GzBXvdhY6d+Gy5rrvJyjXr525xGVvkgt
         zNvLTQY3n5jhCSjKyddoKbM6rfupKP2FPp3gDHaL7QX6vTtT7PimtgAJJnYtY5ls9KA5
         +4gsrzeR1WzHbkVCZcWJ/nMnVrn+3WkbItKSs8gEnuw+DvTOxXQOgIfu6Ar2XlDC/Wtn
         I20qT9EQ88hhZslXiVrsIwjX/WASb7KxTohsAMUYZKcmV56lwiqLRY1MBM3xDfkEmlQQ
         Xa3oLXBA712NOIaVXUSfs29n2LIoEydgoc5GeUe1hJ8uo20lVs3ALYQcQ2gRPJYXzbdq
         wg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B3taWVflSNylsyETfTA2qz7hFyJkqD7B41nXPhtbmMM=;
        b=P/wb4JnQ/JBtr6chqZ8/vUxA6lZ8k120U1KMUgyE8ww0LfGBREXab5ZDgjOZDBPlVa
         xd+Nedrg/WyB0g3MD+DX9YHzUCw27NcOwbbsHMf6lGkZSDpZisELeKmB7oiO52+NRTHU
         B9J/tA9YFtVUtWbipgN/jgWJt24nzGx10nKtiYLibX8JJ/aPF5uvGnzSU2RNrfYG2T5O
         YXDLFf5fkHLPHpCW7u7r5ahvqEHth03LCp69ggPUCAXR6r2EQzRkjNYvEERXuP5lQFqm
         FsiY8F8his0x+wgf1d1uVrRnkU/oiznEEYBYL38WAaNK/XZRklQ8NSsJllr03jz9iEEg
         HDJA==
X-Gm-Message-State: AOAM531+QIMGDVSRGIY8MApjcNdtH8wPEx+SIyd9t2EBAqBpFKkSvxde
        +z4Aggad9HFLzhEBR8L4ezA=
X-Google-Smtp-Source: ABdhPJyJyriNIBCsaFIx9vHLJg93yV6yRIn3ucJeKoI1hXdQtzc1oYE6aE2g0tfId+fVEvfGx4iQYw==
X-Received: by 2002:adf:f946:: with SMTP id q6mr27924025wrr.283.1624284845819;
        Mon, 21 Jun 2021 07:14:05 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r6sm17676638wrz.91.2021.06.21.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 07:14:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: usb: tegra: Convert to json-schema
Date:   Mon, 21 Jun 2021 16:15:59 +0200
Message-Id: <20210621141559.2881667-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621141559.2881667-1-thierry.reding@gmail.com>
References: <20210621141559.2881667-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the old plain-text device tree bindings for the USB EHCI
controller found on NVIDIA Tegra SoCs to the json-schema format.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/usb/nvidia,tegra20-ehci.txt      |  23 ---
 .../bindings/usb/nvidia,tegra20-ehci.yaml     | 151 ++++++++++++++++++
 2 files changed, 151 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
deleted file mode 100644
index f60785f73d3d..000000000000
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Tegra SOC USB controllers
-
-The device node for a USB controller that is part of a Tegra
-SOC is as described in the document "Open Firmware Recommended
-Practice : Universal Serial Bus" with the following modifications
-and additions :
-
-Required properties :
- - compatible : For Tegra20, must contain "nvidia,tegra20-ehci".
-   For Tegra30, must contain "nvidia,tegra30-ehci".  Otherwise, must contain
-   "nvidia,<chip>-ehci" plus at least one of the above, where <chip> is
-   tegra114, tegra124, tegra132, or tegra210.
- - nvidia,phy : phandle of the PHY that the controller is connected to.
- - clocks : Must contain one entry, for the module clock.
-   See ../clocks/clock-bindings.txt for details.
- - resets : Must contain an entry for each entry in reset-names.
-   See ../reset/reset.txt for details.
- - reset-names : Must include the following entries:
-   - usb
-
-Optional properties:
- - nvidia,needs-double-reset : boolean is to be set for some of the Tegra20
-   USB ports, which need reset twice due to hardware issues.
diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml
new file mode 100644
index 000000000000..3d942f598eac
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/nvidia,tegra20-ehci.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Device tree binding for NVIDIA Tegra USB controllers
+
+description: |
+  The device node for a USB controller that is part of a Tegra SOC is as
+  described in the document "Open Firmware Recommended Practice : Universal
+  Serial Bus". Modifications and additions are detailed in this document.
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - nvidia,tegra210-ehci
+          - nvidia,tegra124-ehci
+          - nvidia,tegra114-ehci
+        - const: nvidia,tegra30-ehci
+      - items:
+        - const: nvidia,tegra30-ehci
+      - items:
+        - const: nvidia,tegra20-ehci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  phy_type:
+    $ref: /schemas/types.yaml#/definitions/string
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: usb
+
+  nvidia,phy:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle of the PHY that the controller is connected to
+
+  nvidia,needs-double-reset:
+    type: boolean
+    description:
+      This must be set for some instances of the USB controller found on
+      Tegra20 that need to be reset twice due to some hardware issue.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - reset-names
+  - phy_type
+  - nvidia,phy
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@c5000000 {
+        compatible = "nvidia,tegra20-ehci";
+        reg = <0xc5000000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
+        clocks = <&tegra_car TEGRA20_CLK_USBD>;
+        resets = <&tegra_car 22>;
+        reset-names = "usb";
+        nvidia,needs-double-reset;
+        nvidia,phy = <&phy1>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@7d000000 {
+        compatible = "nvidia,tegra30-ehci";
+        reg = <0x7d000000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
+        clocks = <&tegra_car TEGRA30_CLK_USBD>;
+        resets = <&tegra_car 22>;
+        reset-names = "usb";
+        nvidia,needs-double-reset;
+        nvidia,phy = <&phy1>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra114-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@7d000000 {
+        compatible = "nvidia,tegra114-ehci", "nvidia,tegra30-ehci";
+        reg = <0x7d000000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
+        clocks = <&tegra_car TEGRA114_CLK_USBD>;
+        resets = <&tegra_car 22>;
+        reset-names = "usb";
+        nvidia,phy = <&phy1>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra124-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@7d000000 {
+        compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci";
+        reg = <0x7d000000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
+        clocks = <&tegra_car TEGRA124_CLK_USBD>;
+        resets = <&tegra_car 22>;
+        reset-names = "usb";
+        nvidia,phy = <&phy1>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@7d000000 {
+        compatible = "nvidia,tegra210-ehci", "nvidia,tegra30-ehci";
+        reg = <0x7d000000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
+        clocks = <&tegra_car TEGRA210_CLK_USBD>;
+        clock-names = "usb";
+        resets = <&tegra_car 22>;
+        reset-names = "usb";
+        nvidia,phy = <&phy1>;
+    };
-- 
2.32.0

