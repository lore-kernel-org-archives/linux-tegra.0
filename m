Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB0CC433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 16:53:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241389AbhLIQ5X (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 11:57:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238120AbhLIQ5X (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 11:57:23 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6936AC061746;
        Thu,  9 Dec 2021 08:53:49 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id a9so10762806wrr.8;
        Thu, 09 Dec 2021 08:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uNURXSimh8puKNrB1paQTZYoT7tYYJxuFq7IwpwZpvA=;
        b=IJQwSMwquOUHMBQNCBe2u9XcfAyIstOygEKrR7+hE2112o7fXDex6niymDzONOO6Zi
         ri5fA08gtTbDCkTD+yZRE4PzHxzFG8KnTERvL0DP91Gr7gsdF1QQnj0T/ISvfEG/NV5N
         /+RhxBV1ZC6eBqVn6vSHkUAgYLezop3ASmRvV5Ca/EofI6sPCdpeJRzalzAQvQhVUWHs
         VPbtcf1i3Spi4vaKGze5gafxGghbjY9hN6bEuSmBMkKTMXCId4Mo50uRQIjctmaYimJ0
         v1xzgJXYLVVNZzrEkE4IccwxYneMdPLMx8q2uT2LMM96hsBYhrTTgiNgdJKJMlvQjU2V
         JK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uNURXSimh8puKNrB1paQTZYoT7tYYJxuFq7IwpwZpvA=;
        b=PK156vN2V8Cbh+lET9/Z2yHS7P5p3+cTbdxWh6O7+NHHpDs4jfBWFTQzHjjn5khlXd
         Ir6vpxdfkmllAX9+VvlFIMOsHYy6ZTtkpsFm6YvL3CEa9HSpudIfsPpuxmkeH0q6iBUF
         tfhyVpOQn2X/E222AwBLXLmk85CtwRe0bfff4ZIO8ZY18L1xd/HItPCm57xB0TKiq+Gh
         SPhJDMv/C6Dit1fTjCwuObRISwdN5KzsD/5d8+nKpYhcltTVFEwjhVf6yFzC2mgp6DvL
         +ZkeFQtvgJ54P7P2g0K8jfkLrr4LEylZiDLl7O897jHnHw/w7JfcN04qteZdL05fP8g/
         SOPg==
X-Gm-Message-State: AOAM531nhFh2lz1zItLA3iuWnRWAGE7OoCMXqCevKVRIf5DUWAcRaX3F
        KcF6ivqNkzZyY558DllMrt0=
X-Google-Smtp-Source: ABdhPJxxTB0spup6RIwqjFggqWaY718RMke8ExHNvQN6ZBCNSOBFFNeDdsQeEWi3ibz9+uQpKriZ1g==
X-Received: by 2002:adf:cd89:: with SMTP id q9mr7707311wrj.205.1639068827920;
        Thu, 09 Dec 2021 08:53:47 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id z8sm228215wrh.54.2021.12.09.08.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 08:53:47 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@freescale.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: usb: tegra: Convert to json-schema
Date:   Thu,  9 Dec 2021 17:53:37 +0100
Message-Id: <20211209165339.614498-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209165339.614498-1-thierry.reding@gmail.com>
References: <20211209165339.614498-1-thierry.reding@gmail.com>
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
Changes in v2:
- include usb-hcd.yaml and usb-drd.yaml
- drop redundant phy_type property

 .../bindings/clock/nvidia,tegra124-car.yaml   |   5 +
 .../bindings/clock/nvidia,tegra20-car.yaml    |   5 +
 .../bindings/usb/nvidia,tegra20-ehci.txt      |  23 ---
 .../bindings/usb/nvidia,tegra20-ehci.yaml     | 156 ++++++++++++++++++
 4 files changed, 166 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
index ec7ab1483652..bcd812378cfb 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
@@ -99,6 +99,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/tegra124-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     car: clock-controller@60006000 {
         compatible = "nvidia,tegra124-car";
@@ -110,6 +111,10 @@ examples:
     usb-controller@c5004000 {
         compatible = "nvidia,tegra20-ehci";
         reg = <0xc5004000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&car TEGRA124_CLK_USB2>;
         resets = <&car TEGRA124_CLK_USB2>;
+        reset-names = "usb";
+        phy_type = "utmi";
+        nvidia,phy = <&phy1>;
     };
diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
index 459d2a525393..aba52e56a99a 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
@@ -53,6 +53,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     car: clock-controller@60006000 {
         compatible = "nvidia,tegra20-car";
@@ -64,6 +65,10 @@ examples:
     usb-controller@c5004000 {
         compatible = "nvidia,tegra20-ehci";
         reg = <0xc5004000 0x4000>;
+        interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&car TEGRA20_CLK_USB2>;
         resets = <&car TEGRA20_CLK_USB2>;
+        reset-names = "usb";
+        phy_type = "utmi";
+        nvidia,phy = <&phy1>;
     };
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
index 000000000000..aa00e58f9ee6
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml
@@ -0,0 +1,156 @@
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
+          - enum:
+              - nvidia,tegra210-ehci
+              - nvidia,tegra124-ehci
+              - nvidia,tegra114-ehci
+          - const: nvidia,tegra30-ehci
+      - items:
+          - const: nvidia,tegra30-ehci
+      - items:
+          - const: nvidia,tegra20-ehci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: module clock
+
+  clock-names:
+    items:
+      - const: usb
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
+allOf:
+  - $ref: usb-drd.yaml
+  - $ref: usb-hcd.yaml
+
+unevaluatedProperties: false
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
+        resets = <&tegra_car 22>;
+        reset-names = "usb";
+        nvidia,phy = <&phy1>;
+    };
-- 
2.34.1

