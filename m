Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8099C4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Nov 2022 14:42:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbiKCOmG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Nov 2022 10:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiKCOmF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Nov 2022 10:42:05 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF9925E5;
        Thu,  3 Nov 2022 07:42:03 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id 13so5876345ejn.3;
        Thu, 03 Nov 2022 07:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dsy+SZPWKk7IzSjLPzP/1bIdoH5ZhUyefYszhy8ECI4=;
        b=eiNCsPyajmyESK7cLRlWmOTYIX53+5eEosY9Za8F3llLVFfp3uHgXgVC6lJI5ua7wU
         s2Xah2G/2G2xYke0c1DRTdUtKYdm/QDWmHejS9QyXtmoI2xHlA4g1fcT7Dt7FPSXqAva
         LgDD5rJqY8wntWHpXDwwWvwL+Dm0GuWOppQdjkmD6aAVabZQswem6JyZGSAqXdRshV7W
         KpeVNzkMwqxcra90yoABL3i7Zh4Q9jAROSL1LkCIIssQJ7s/+c1VF2wwR44gzZIa3Hw9
         k/AqF7yI0oajaInjyMcLI1q4gHg7Sa5MFSMj7dSySYflLsLKhpWCmoA4NtjLe9Nfbz6m
         4tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsy+SZPWKk7IzSjLPzP/1bIdoH5ZhUyefYszhy8ECI4=;
        b=lxcgqnsU7W3hv64vtdrXKNOa0XXWFTWnON3ET6f8Dm2fegximFjrMBq/V1zCQwDxxB
         WqAnNi63Ko+rbqflYPYr7K0BOwZ1MIm1VuOOFmKv0Fyje600MAvH7xWy0DyUmF7Ay3GO
         QeG0NATou5qO8Uvzbt1KfMrWxBOZbiNavMiCmNVRXG6tXKny/VsNEWbhPD0w0mIZsaY3
         zEQX859jrk9eL2+N4RTgiQEWDk91WngoIB8sjJ9KnFv1/RAgjaNZG7N33cd87/h9pYen
         yQUXIl3lioe2Tv48HOXNoJZGmUNBaiyoV4B9jxmG+/kAhTAK63yPvw2wFkcpGvO21mH+
         0GXg==
X-Gm-Message-State: ACrzQf0WEeGnphuNjDvDjwQORZQlzOky/qOy2WkpYG3FX/yy1ia52qe8
        1CrsN3xvIaRpR1iFUmrzE7E=
X-Google-Smtp-Source: AMsMyM4i7+y/ESpVOR5au9p7ulnpr2N4Lb7SJ8EroeYB08Ra359KG1q87DtzMCAqr/KOYNLVUOkMSw==
X-Received: by 2002:a17:907:2c74:b0:7a1:d333:f214 with SMTP id ib20-20020a1709072c7400b007a1d333f214mr30087754ejc.14.1667486521563;
        Thu, 03 Nov 2022 07:42:01 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y14-20020a17090668ce00b0078b03d57fa7sm571638ejr.34.2022.11.03.07.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 07:42:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Wayne Chang <waynec@nvidia.com>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2] dt-bindings: usb: tegra-xusb: Convert to json-schema
Date:   Thu,  3 Nov 2022 15:42:00 +0100
Message-Id: <20221103144200.1479640-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the Tegra XUSB controller bindings from the free-form text
format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Wayne, going forward it might make sense for you to pick this up into
your Tegra234 series and add the Tegra234 bindings on top of this.

Changes in v2:
- use minItems/maxItems/items instead of contains/anyOf for phy-names
- add missing compatible string to USB device example
- drop unneeded phys property description
- drop unneeded USB bus properties
- add reference to usb-xhci.yaml

 .../bindings/usb/nvidia,tegra124-xusb.txt     | 132 -----------
 .../bindings/usb/nvidia,tegra124-xusb.yaml    | 202 +++++++++++++++++
 .../bindings/usb/nvidia,tegra186-xusb.yaml    | 181 +++++++++++++++
 .../bindings/usb/nvidia,tegra194-xusb.yaml    | 187 ++++++++++++++++
 .../bindings/usb/nvidia,tegra210-xusb.yaml    | 207 ++++++++++++++++++
 5 files changed, 777 insertions(+), 132 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra194-xusb.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
deleted file mode 100644
index 5bfcc0b4d6b9..000000000000
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
+++ /dev/null
@@ -1,132 +0,0 @@
-NVIDIA Tegra xHCI controller
-============================
-
-The Tegra xHCI controller supports both USB2 and USB3 interfaces exposed by
-the Tegra XUSB pad controller.
-
-Required properties:
---------------------
-- compatible: Must be:
-  - Tegra124: "nvidia,tegra124-xusb"
-  - Tegra132: "nvidia,tegra132-xusb", "nvidia,tegra124-xusb"
-  - Tegra210: "nvidia,tegra210-xusb"
-  - Tegra186: "nvidia,tegra186-xusb"
-- reg: Must contain the base and length of the xHCI host registers, XUSB FPCI
-  registers and XUSB IPFS registers.
-- reg-names: Must contain the following entries:
-  - "hcd"
-  - "fpci"
-  - "ipfs"
-- interrupts: Must contain the xHCI host interrupt and the mailbox interrupt.
-- clocks: Must contain an entry for each entry in clock-names.
-  See ../clock/clock-bindings.txt for details.
-- clock-names: Must include the following entries:
-   - xusb_host
-   - xusb_host_src
-   - xusb_falcon_src
-   - xusb_ss
-   - xusb_ss_src
-   - xusb_ss_div2
-   - xusb_hs_src
-   - xusb_fs_src
-   - pll_u_480m
-   - clk_m
-   - pll_e
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must include the following entries:
-  - xusb_host
-  - xusb_ss
-  - xusb_src
-  Note that xusb_src is the shared reset for xusb_{ss,hs,fs,falcon,host}_src.
-- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used to
-  configure the USB pads used by the XHCI controller
-
-For Tegra124 and Tegra132:
-- avddio-pex-supply: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
-- dvddio-pex-supply: PCIe/USB3 digital logic power supply. Must supply 1.05 V.
-- avdd-usb-supply: USB controller power supply. Must supply 3.3 V.
-- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
-- avdd-pll-erefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
-- avdd-usb-ss-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
-- hvdd-usb-ss-supply: High-voltage PCIe/USB3 power supply. Must supply 3.3 V.
-- hvdd-usb-ss-pll-e-supply: High-voltage PLLE power supply. Must supply 3.3 V.
-
-For Tegra210:
-- dvddio-pex-supply: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
-- hvddio-pex-supply: High-voltage PCIe/USB3 power supply. Must supply 1.8 V.
-- avdd-usb-supply: USB controller power supply. Must supply 3.3 V.
-- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
-- avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
-- dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
-- hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V.
-
-For Tegra210 and Tegra186:
-- power-domains: A list of PM domain specifiers that reference each power-domain
-  used by the xHCI controller. This list must comprise of a specifier for the
-  XUSBA and XUSBC power-domains. See ../power/power_domain.txt and
-  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
-- power-domain-names: A list of names that represent each of the specifiers in
-  the 'power-domains' property. Must include 'xusb_ss' and 'xusb_host' which
-  represent the power-domains XUSBA and XUSBC, respectively. See
-  ../power/power_domain.txt for details.
-
-Optional properties:
---------------------
-- phys: Must contain an entry for each entry in phy-names.
-  See ../phy/phy-bindings.txt for details.
-- phy-names: Should include an entry for each PHY used by the controller. The
-  following PHYs are available:
-  - Tegra124: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
-  - Tegra132: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
-  - Tegra210: usb2-0, usb2-1, usb2-2, usb2-3, hsic-0, usb3-0, usb3-1, usb3-2,
-              usb3-3
-  - Tegra186: usb2-0, usb2-1, usb2-2, hsic-0, usb3-0, usb3-1, usb3-2
-
-Example:
---------
-
-	usb@0,70090000 {
-		compatible = "nvidia,tegra124-xusb";
-		reg = <0x0 0x70090000 0x0 0x8000>,
-		      <0x0 0x70098000 0x0 0x1000>,
-		      <0x0 0x70099000 0x0 0x1000>;
-		reg-names = "hcd", "fpci", "ipfs";
-
-		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
-
-		clocks = <&tegra_car TEGRA124_CLK_XUSB_HOST>,
-			 <&tegra_car TEGRA124_CLK_XUSB_HOST_SRC>,
-			 <&tegra_car TEGRA124_CLK_XUSB_FALCON_SRC>,
-			 <&tegra_car TEGRA124_CLK_XUSB_SS>,
-			 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
-			 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
-			 <&tegra_car TEGRA124_CLK_XUSB_HS_SRC>,
-			 <&tegra_car TEGRA124_CLK_XUSB_FS_SRC>,
-			 <&tegra_car TEGRA124_CLK_PLL_U_480M>,
-			 <&tegra_car TEGRA124_CLK_CLK_M>,
-			 <&tegra_car TEGRA124_CLK_PLL_E>;
-		clock-names = "xusb_host", "xusb_host_src", "xusb_falcon_src",
-			      "xusb_ss", "xusb_ss_div2", "xusb_ss_src",
-			      "xusb_hs_src", "xusb_fs_src", "pll_u_480m",
-			      "clk_m", "pll_e";
-		resets = <&tegra_car 89>, <&tegra_car 156>, <&tegra_car 143>;
-		reset-names = "xusb_host", "xusb_ss", "xusb_src";
-
-		nvidia,xusb-padctl = <&padctl>;
-
-		phys = <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}>, /* mini-PCIe USB */
-		       <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-2}>, /* USB A */
-		       <&{/padctl@0,7009f000/pads/pcie/lanes/pcie-0}>; /* USB A */
-		phy-names = "usb2-1", "usb2-2", "usb3-0";
-
-		avddio-pex-supply = <&vdd_1v05_run>;
-		dvddio-pex-supply = <&vdd_1v05_run>;
-		avdd-usb-supply = <&vdd_3v3_lp0>;
-		avdd-pll-utmip-supply = <&vddio_1v8>;
-		avdd-pll-erefe-supply = <&avdd_1v05_run>;
-		avdd-usb-ss-pll-supply = <&vdd_1v05_run>;
-		hvdd-usb-ss-supply = <&vdd_3v3_lp0>;
-		hvdd-usb-ss-pll-e-supply = <&vdd_3v3_lp0>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
new file mode 100644
index 000000000000..4a6616bf9bab
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/nvidia,tegra124-xusb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra124 xHCI controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: The Tegra xHCI controller supports both USB2 and USB3 interfaces
+  exposed by the Tegra XUSB pad controller.
+
+properties:
+  # required
+  compatible:
+    oneOf:
+      - description: NVIDIA Tegra124
+        const: nvidia,tegra124-xusb
+
+      - description: NVIDIA Tegra132
+        items:
+          - const: nvidia,tegra132-xusb
+          - const: nvidia,tegra124-xusb
+
+  reg:
+    items:
+      - description: base and length of the xHCI host registers
+      - description: base and length of the XUSB FPCI registers
+      - description: base and length of the XUSB IPFS registers
+
+  reg-names:
+    items:
+      - const: hcd
+      - const: fpci
+      - const: ipfs
+
+  interrupts:
+    items:
+      - description: xHCI host interrupt
+      - description: mailbox interrupt
+
+  clocks:
+    items:
+      - description: XUSB host clock
+      - description: XUSB host source clock
+      - description: XUSB Falcon source clock
+      - description: XUSB SuperSpeed clock
+      - description: XUSB SuperSpeed clock divider
+      - description: XUSB SuperSpeed source clock
+      - description: XUSB HighSpeed clock source
+      - description: XUSB FullSpeed clock source
+      - description: USB PLL
+      - description: reference clock
+      - description: I/O PLL
+
+  clock-names:
+    items:
+      - const: xusb_host
+      - const: xusb_host_src
+      - const: xusb_falcon_src
+      - const: xusb_ss
+      - const: xusb_ss_div2
+      - const: xusb_ss_src
+      - const: xusb_hs_src
+      - const: xusb_fs_src
+      - const: pll_u_480m
+      - const: clk_m
+      - const: pll_e
+
+  resets:
+    items:
+      - description: reset for the XUSB host controller
+      - description: reset for the SuperSpeed logic
+      - description: shared reset for xusb_{ss,hs,fs,falcon,host}_src.
+
+  reset-names:
+    items:
+      - const: xusb_host
+      - const: xusb_ss
+      - const: xusb_src
+
+  nvidia,xusb-padctl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the XUSB pad controller that is used to configure
+      the USB pads used by the XHCI controller
+
+  # optional
+  phys:
+    minItems: 1
+    maxItems: 7
+
+  phy-names:
+    minItems: 1
+    maxItems: 7
+    items:
+      enum:
+        - usb2-0
+        - usb2-1
+        - usb2-2
+        - hsic-0
+        - hsic-1
+        - usb3-0
+        - usb3-1
+
+  avddio-pex-supply:
+    description: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
+
+  dvddio-pex-supply:
+    description: PCIe/USB3 digital logic power supply. Must supply 1.05 V.
+
+  avdd-usb-supply:
+    description: USB controller power supply. Must supply 3.3 V.
+
+  avdd-pll-utmip-supply:
+    description: UTMI PLL power supply. Must supply 1.8 V.
+
+  avdd-pll-erefe-supply:
+    description: PLLE reference PLL power supply. Must supply 1.05 V.
+
+  avdd-usb-ss-pll-supply:
+    description: PCIe/USB3 PLL power supply. Must supply 1.05 V.
+
+  hvdd-usb-ss-supply:
+    description: High-voltage PCIe/USB3 power supply. Must supply 3.3 V.
+
+  hvdd-usb-ss-pll-e-supply:
+    description: High-voltage PLLE power supply. Must supply 3.3 V.
+
+allOf:
+  - $ref: usb-xhci.yaml
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - nvidia,xusb-padctl
+  - phys
+  - phy-names
+  - avddio-pex-supply
+  - dvddio-pex-supply
+  - avdd-usb-supply
+  - hvdd-usb-ss-supply
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra124-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@70090000 {
+        compatible = "nvidia,tegra124-xusb";
+        reg = <0x70090000 0x8000>,
+              <0x70098000 0x1000>,
+              <0x70099000 0x1000>;
+        reg-names = "hcd", "fpci", "ipfs";
+
+        interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&tegra_car TEGRA124_CLK_XUSB_HOST>,
+                 <&tegra_car TEGRA124_CLK_XUSB_HOST_SRC>,
+                 <&tegra_car TEGRA124_CLK_XUSB_FALCON_SRC>,
+                 <&tegra_car TEGRA124_CLK_XUSB_SS>,
+                 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
+                 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
+                 <&tegra_car TEGRA124_CLK_XUSB_HS_SRC>,
+                 <&tegra_car TEGRA124_CLK_XUSB_FS_SRC>,
+                 <&tegra_car TEGRA124_CLK_PLL_U_480M>,
+                 <&tegra_car TEGRA124_CLK_CLK_M>,
+                 <&tegra_car TEGRA124_CLK_PLL_E>;
+        clock-names = "xusb_host", "xusb_host_src", "xusb_falcon_src",
+                      "xusb_ss", "xusb_ss_div2", "xusb_ss_src",
+                      "xusb_hs_src", "xusb_fs_src", "pll_u_480m",
+                      "clk_m", "pll_e";
+        resets = <&tegra_car 89>, <&tegra_car 156>, <&tegra_car 143>;
+        reset-names = "xusb_host", "xusb_ss", "xusb_src";
+
+        nvidia,xusb-padctl = <&padctl>;
+
+        phys = <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}>, /* mini-PCIe USB */
+               <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-2}>, /* USB A */
+               <&{/padctl@0,7009f000/pads/pcie/lanes/pcie-0}>; /* USB A */
+        phy-names = "usb2-1", "usb2-2", "usb3-0";
+
+        avddio-pex-supply = <&vdd_1v05_run>;
+        dvddio-pex-supply = <&vdd_1v05_run>;
+        avdd-usb-supply = <&vdd_3v3_lp0>;
+        avdd-pll-utmip-supply = <&vddio_1v8>;
+        avdd-pll-erefe-supply = <&avdd_1v05_run>;
+        avdd-usb-ss-pll-supply = <&vdd_1v05_run>;
+        hvdd-usb-ss-supply = <&vdd_3v3_lp0>;
+        hvdd-usb-ss-pll-e-supply = <&vdd_3v3_lp0>;
+    };
diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
new file mode 100644
index 000000000000..7126d137133a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
@@ -0,0 +1,181 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/nvidia,tegra186-xusb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra186 xHCI controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: The Tegra xHCI controller supports both USB2 and USB3 interfaces
+  exposed by the Tegra XUSB pad controller.
+
+properties:
+  compatible:
+    const: nvidia,tegra186-xusb
+
+  reg:
+    items:
+      - description: base and length of the xHCI host registers
+      - description: base and length of the XUSB FPCI registers
+
+  reg-names:
+    items:
+      - const: hcd
+      - const: fpci
+
+  interrupts:
+    items:
+      - description: xHCI host interrupt
+      - description: mailbox interrupt
+
+  clocks:
+    items:
+      - description: XUSB host clock
+      - description: XUSB Falcon source clock
+      - description: XUSB SuperSpeed clock
+      - description: XUSB SuperSpeed source clock
+      - description: XUSB HighSpeed clock source
+      - description: XUSB FullSpeed clock source
+      - description: USB PLL
+      - description: reference clock
+      - description: I/O PLL
+
+  clock-names:
+    items:
+      - const: xusb_host
+      - const: xusb_falcon_src
+      - const: xusb_ss
+      - const: xusb_ss_src
+      - const: xusb_hs_src
+      - const: xusb_fs_src
+      - const: pll_u_480m
+      - const: clk_m
+      - const: pll_e
+
+  interconnects:
+    items:
+      - description: read client
+      - description: write client
+
+  interconnect-names:
+    items:
+      - const: dma-mem # read
+      - const: write
+
+  iommus:
+    maxItems: 1
+
+  nvidia,xusb-padctl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the XUSB pad controller that is used to configure
+      the USB pads used by the XHCI controller
+
+  phys:
+    minItems: 1
+    maxItems: 7
+
+  phy-names:
+    minItems: 1
+    maxItems: 7
+    items:
+      enum:
+        - usb2-0
+        - usb2-1
+        - usb2-2
+        - hsic-0
+        - usb3-0
+        - usb3-1
+        - usb3-2
+
+  power-domains:
+    description: A list of PM domain specifiers that reference each power-
+      domain used by the xHCI controller. This list must comprise of a
+      specifier for the XUSBA and XUSBC power-domains.
+
+      See ../power/power_domain.txt and ../arm/tegra/nvidia,tegra20-pmc.txt
+      for details.
+    items:
+      - description: XUSBC power domain
+      - description: XUSBA power domain
+
+  power-domain-names:
+    description: A list of names that represent each of the specifiers in the
+      'power-domains' property. See ../power/power_domain.txt for details.
+    items:
+      - const: xusb_host
+      - const: xusb_ss
+
+  dvddio-pex-supply:
+    description: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
+
+  hvddio-pex-supply:
+    description: High-voltage PCIe/USB3 power supply. Must supply 1.8 V.
+
+  avdd-usb-supply:
+    description: USB controller power supply. Must supply 3.3 V.
+
+  avdd-pll-utmip-supply:
+    description: UTMI PLL power supply. Must supply 1.8 V.
+
+  avdd-pll-uerefe-supply:
+    description: PLLE reference PLL power supply. Must supply 1.05 V.
+
+  dvdd-usb-ss-pll-supply:
+    description: PCIe/USB3 PLL power supply. Must supply 1.05 V.
+
+  hvdd-usb-ss-pll-e-supply:
+    description: High-voltage PLLE power supply. Must supply 1.8 V.
+
+allOf:
+  - $ref: usb-xhci.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra186-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/tegra186-mc.h>
+    #include <dt-bindings/power/tegra186-powergate.h>
+    #include <dt-bindings/reset/tegra186-reset.h>
+
+    usb@3530000 {
+        compatible = "nvidia,tegra186-xusb";
+        reg = <0x03530000 0x8000>,
+              <0x03538000 0x1000>;
+        reg-names = "hcd", "fpci";
+        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&bpmp TEGRA186_CLK_XUSB_HOST>,
+                 <&bpmp TEGRA186_CLK_XUSB_FALCON>,
+                 <&bpmp TEGRA186_CLK_XUSB_SS>,
+                 <&bpmp TEGRA186_CLK_XUSB_CORE_SS>,
+                 <&bpmp TEGRA186_CLK_CLK_M>,
+                 <&bpmp TEGRA186_CLK_XUSB_FS>,
+                 <&bpmp TEGRA186_CLK_PLLU>,
+                 <&bpmp TEGRA186_CLK_CLK_M>,
+                 <&bpmp TEGRA186_CLK_PLLE>;
+        clock-names = "xusb_host", "xusb_falcon_src", "xusb_ss",
+                      "xusb_ss_src", "xusb_hs_src", "xusb_fs_src",
+                      "pll_u_480m", "clk_m", "pll_e";
+        power-domains = <&bpmp TEGRA186_POWER_DOMAIN_XUSBC>,
+                        <&bpmp TEGRA186_POWER_DOMAIN_XUSBA>;
+        power-domain-names = "xusb_host", "xusb_ss";
+        interconnects = <&mc TEGRA186_MEMORY_CLIENT_XUSB_HOSTR &emc>,
+                        <&mc TEGRA186_MEMORY_CLIENT_XUSB_HOSTW &emc>;
+        interconnect-names = "dma-mem", "write";
+        iommus = <&smmu TEGRA186_SID_XUSB_HOST>;
+        nvidia,xusb-padctl = <&padctl>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        phys = <&{/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+               <&{/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+               <&{/padctl@3520000/pads/usb3/lanes/usb3-0}>;
+        phy-names = "usb2-0", "usb2-1", "usb3-0";
+    };
diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra194-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra194-xusb.yaml
new file mode 100644
index 000000000000..7697a0dbae15
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra194-xusb.yaml
@@ -0,0 +1,187 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/nvidia,tegra194-xusb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra194 xHCI controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: The Tegra xHCI controller supports both USB2 and USB3 interfaces
+  exposed by the Tegra XUSB pad controller.
+
+properties:
+  compatible:
+    const: nvidia,tegra194-xusb
+
+  reg:
+    items:
+      - description: base and length of the xHCI host registers
+      - description: base and length of the XUSB FPCI registers
+
+  reg-names:
+    items:
+      - const: hcd
+      - const: fpci
+
+  interrupts:
+    items:
+      - description: xHCI host interrupt
+      - description: mailbox interrupt
+
+  clocks:
+    items:
+      - description: XUSB host clock
+      - description: XUSB Falcon source clock
+      - description: XUSB SuperSpeed clock
+      - description: XUSB SuperSpeed source clock
+      - description: XUSB HighSpeed clock source
+      - description: XUSB FullSpeed clock source
+      - description: USB PLL
+      - description: reference clock
+      - description: I/O PLL
+
+  clock-names:
+    items:
+      - const: xusb_host
+      - const: xusb_falcon_src
+      - const: xusb_ss
+      - const: xusb_ss_src
+      - const: xusb_hs_src
+      - const: xusb_fs_src
+      - const: pll_u_480m
+      - const: clk_m
+      - const: pll_e
+
+  interconnects:
+    items:
+      - description: read client
+      - description: write client
+
+  interconnect-names:
+    items:
+      - const: dma-mem # read
+      - const: write
+
+  iommus:
+    maxItems: 1
+
+  nvidia,xusb-padctl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the XUSB pad controller that is used to configure
+      the USB pads used by the XHCI controller
+
+  phys:
+    minItems: 1
+    maxItems: 8
+
+  phy-names:
+    minItems: 1
+    maxItems: 8
+    items:
+      enum:
+        - usb2-0
+        - usb2-1
+        - usb2-2
+        - usb2-3
+        - usb3-0
+        - usb3-1
+        - usb3-2
+        - usb3-3
+
+  power-domains:
+    description: A list of PM domain specifiers that reference each power-
+      domain used by the xHCI controller. This list must comprise of a
+      specifier for the XUSBA and XUSBC power-domains.
+
+      See ../power/power_domain.txt and ../arm/tegra/nvidia,tegra20-pmc.txt
+      for details.
+    items:
+      - description: XUSBC power domain
+      - description: XUSBA power domain
+
+  power-domain-names:
+    description: A list of names that represent each of the specifiers in the
+      'power-domains' property. See ../power/power_domain.txt for details.
+    items:
+      - const: xusb_host
+      - const: xusb_ss
+
+  dvddio-pex-supply:
+    description: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
+
+  hvddio-pex-supply:
+    description: High-voltage PCIe/USB3 power supply. Must supply 1.8 V.
+
+  avdd-usb-supply:
+    description: USB controller power supply. Must supply 3.3 V.
+
+  avdd-pll-utmip-supply:
+    description: UTMI PLL power supply. Must supply 1.8 V.
+
+  avdd-pll-uerefe-supply:
+    description: PLLE reference PLL power supply. Must supply 1.05 V.
+
+  dvdd-usb-ss-pll-supply:
+    description: PCIe/USB3 PLL power supply. Must supply 1.05 V.
+
+  hvdd-usb-ss-pll-e-supply:
+    description: High-voltage PLLE power supply. Must supply 1.8 V.
+
+allOf:
+  - $ref: usb-xhci.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra194-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/tegra194-mc.h>
+    #include <dt-bindings/power/tegra194-powergate.h>
+    #include <dt-bindings/reset/tegra194-reset.h>
+
+    usb@3610000 {
+        compatible = "nvidia,tegra194-xusb";
+        reg = <0x03610000 0x40000>,
+              <0x03600000 0x10000>;
+        reg-names = "hcd", "fpci";
+
+        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&bpmp TEGRA194_CLK_XUSB_CORE_HOST>,
+                 <&bpmp TEGRA194_CLK_XUSB_FALCON>,
+                 <&bpmp TEGRA194_CLK_XUSB_CORE_SS>,
+                 <&bpmp TEGRA194_CLK_XUSB_SS>,
+                 <&bpmp TEGRA194_CLK_CLK_M>,
+                 <&bpmp TEGRA194_CLK_XUSB_FS>,
+                 <&bpmp TEGRA194_CLK_UTMIPLL>,
+                 <&bpmp TEGRA194_CLK_CLK_M>,
+                 <&bpmp TEGRA194_CLK_PLLE>;
+        clock-names = "xusb_host", "xusb_falcon_src",
+                      "xusb_ss", "xusb_ss_src", "xusb_hs_src",
+                      "xusb_fs_src", "pll_u_480m", "clk_m",
+                      "pll_e";
+        interconnects = <&mc TEGRA194_MEMORY_CLIENT_XUSB_HOSTR &emc>,
+                        <&mc TEGRA194_MEMORY_CLIENT_XUSB_HOSTW &emc>;
+        interconnect-names = "dma-mem", "write";
+        iommus = <&smmu TEGRA194_SID_XUSB_HOST>;
+
+        power-domains = <&bpmp TEGRA194_POWER_DOMAIN_XUSBC>,
+                        <&bpmp TEGRA194_POWER_DOMAIN_XUSBA>;
+        power-domain-names = "xusb_host", "xusb_ss";
+
+        nvidia,xusb-padctl = <&xusb_padctl>;
+
+        phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+               <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+               <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
+               <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
+               <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>,
+               <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-3}>;
+        phy-names = "usb2-0", "usb2-1", "usb2-3", "usb3-0", "usb3-2", "usb3-3";
+    };
diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml
new file mode 100644
index 000000000000..5c8bef1f482b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml
@@ -0,0 +1,207 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/nvidia,tegra210-xusb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra210 xHCI controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: The Tegra xHCI controller supports both USB2 and USB3 interfaces
+  exposed by the Tegra XUSB pad controller.
+
+properties:
+  compatible:
+    const: nvidia,tegra210-xusb
+
+  reg:
+    items:
+      - description: base and length of the xHCI host registers
+      - description: base and length of the XUSB FPCI registers
+      - description: base and length of the XUSB IPFS registers
+
+  reg-names:
+    items:
+      - const: hcd
+      - const: fpci
+      - const: ipfs
+
+  interrupts:
+    items:
+      - description: xHCI host interrupt
+      - description: mailbox interrupt
+
+  clocks:
+    items:
+      - description: XUSB host clock
+      - description: XUSB host source clock
+      - description: XUSB Falcon source clock
+      - description: XUSB SuperSpeed clock
+      - description: XUSB SuperSpeed clock divider
+      - description: XUSB SuperSpeed source clock
+      - description: XUSB HighSpeed clock source
+      - description: XUSB FullSpeed clock source
+      - description: USB PLL
+      - description: reference clock
+      - description: I/O PLL
+
+  clock-names:
+    items:
+      - const: xusb_host
+      - const: xusb_host_src
+      - const: xusb_falcon_src
+      - const: xusb_ss
+      - const: xusb_ss_div2
+      - const: xusb_ss_src
+      - const: xusb_hs_src
+      - const: xusb_fs_src
+      - const: pll_u_480m
+      - const: clk_m
+      - const: pll_e
+
+  resets:
+    items:
+      - description: reset for the XUSB host controller
+      - description: reset for the SuperSpeed logic
+      - description: shared reset for xusb_{ss,hs,fs,falcon,host}_src.
+
+  reset-names:
+    items:
+      - const: xusb_host
+      - const: xusb_ss
+      - const: xusb_src
+
+  nvidia,xusb-padctl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the XUSB pad controller that is used to configure
+      the USB pads used by the XHCI controller
+
+  phys:
+    minItems: 1
+    maxItems: 9
+
+  phy-names:
+    minItems: 1
+    maxItems: 9
+    items:
+      enum:
+        - usb2-0
+        - usb2-1
+        - usb2-2
+        - usb2-3
+        - hsic-0
+        - usb3-0
+        - usb3-1
+        - usb3-2
+        - usb3-3
+
+  power-domains:
+    description: A list of PM domain specifiers that reference each power-
+      domain used by the xHCI controller. This list must comprise of a
+      specifier for the XUSBA and XUSBC power-domains.
+
+      See ../power/power_domain.txt and ../arm/tegra/nvidia,tegra20-pmc.txt
+      for details.
+    items:
+      - description: XUSBC power domain
+      - description: XUSBA power domain
+
+  power-domain-names:
+    description: A list of names that represent each of the specifiers in the
+      'power-domains' property. See ../power/power_domain.txt for details.
+    items:
+      - const: xusb_host
+      - const: xusb_ss
+
+  dvddio-pex-supply:
+    description: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
+
+  hvddio-pex-supply:
+    description: High-voltage PCIe/USB3 power supply. Must supply 1.8 V.
+
+  avdd-usb-supply:
+    description: USB controller power supply. Must supply 3.3 V.
+
+  avdd-pll-utmip-supply:
+    description: UTMI PLL power supply. Must supply 1.8 V.
+
+  avdd-pll-uerefe-supply:
+    description: PLLE reference PLL power supply. Must supply 1.05 V.
+
+  dvdd-usb-ss-pll-supply:
+    description: PCIe/USB3 PLL power supply. Must supply 1.05 V.
+
+  hvdd-usb-ss-pll-e-supply:
+    description: High-voltage PLLE power supply. Must supply 1.8 V.
+
+allOf:
+  - $ref: usb-xhci.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@70090000 {
+        compatible = "nvidia,tegra210-xusb";
+        reg = <0x70090000 0x8000>,
+              <0x70098000 0x1000>,
+              <0x70099000 0x1000>;
+        reg-names = "hcd", "fpci", "ipfs";
+
+        interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&tegra_car TEGRA210_CLK_XUSB_HOST>,
+                 <&tegra_car TEGRA210_CLK_XUSB_HOST_SRC>,
+                 <&tegra_car TEGRA210_CLK_XUSB_FALCON_SRC>,
+                 <&tegra_car TEGRA210_CLK_XUSB_SS>,
+                 <&tegra_car TEGRA210_CLK_XUSB_SS_DIV2>,
+                 <&tegra_car TEGRA210_CLK_XUSB_SS_SRC>,
+                 <&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
+                 <&tegra_car TEGRA210_CLK_XUSB_FS_SRC>,
+                 <&tegra_car TEGRA210_CLK_PLL_U_480M>,
+                 <&tegra_car TEGRA210_CLK_CLK_M>,
+                 <&tegra_car TEGRA210_CLK_PLL_E>;
+        clock-names = "xusb_host", "xusb_host_src",
+                      "xusb_falcon_src", "xusb_ss",
+                      "xusb_ss_div2", "xusb_ss_src",
+                      "xusb_hs_src", "xusb_fs_src",
+                      "pll_u_480m", "clk_m", "pll_e";
+        resets = <&tegra_car 89>, <&tegra_car 156>,
+                 <&tegra_car 143>;
+        reset-names = "xusb_host", "xusb_ss", "xusb_src";
+        power-domains = <&pd_xusbhost>, <&pd_xusbss>;
+        power-domain-names = "xusb_host", "xusb_ss";
+
+        nvidia,xusb-padctl = <&padctl>;
+
+        phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>,
+               <&{/padctl@7009f000/pads/usb2/lanes/usb2-1}>,
+               <&{/padctl@7009f000/pads/usb2/lanes/usb2-2}>,
+               <&{/padctl@7009f000/pads/usb2/lanes/usb2-3}>,
+               <&{/padctl@7009f000/pads/pcie/lanes/pcie-6}>,
+               <&{/padctl@7009f000/pads/pcie/lanes/pcie-5}>;
+        phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3", "usb3-0",
+                    "usb3-1";
+        dvddio-pex-supply = <&vdd_pex_1v05>;
+        hvddio-pex-supply = <&vdd_1v8>;
+        avdd-usb-supply = <&vdd_3v3_sys>;
+        avdd-pll-utmip-supply = <&vdd_1v8>;
+        avdd-pll-uerefe-supply = <&vdd_pex_1v05>;
+        dvdd-usb-ss-pll-supply = <&vdd_pex_1v05>;
+        hvdd-usb-ss-pll-e-supply = <&vdd_1v8>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet@1 {
+                compatible = "usb955,9ff";
+                reg = <1>;
+        };
+    };
-- 
2.38.1

