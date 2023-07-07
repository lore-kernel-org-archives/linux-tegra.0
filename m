Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1756DEB64DA
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 13:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbjGGNRY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 09:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbjGGNRX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 09:17:23 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB241FEA;
        Fri,  7 Jul 2023 06:17:21 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so2859731e87.2;
        Fri, 07 Jul 2023 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688735839; x=1691327839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AunBb31YzZUjwaJ31r+ZHgWQ+d/p+0mUIZp67J/ATuk=;
        b=olVa44fi0B69r8C4Ey4sS0yWJUwbihHtJUndtukfR03C1OM7CQtjjvdw4IdvcIB+Ob
         0e3TnBw94LzO+9rC5Ce/oPJpRPDqDDt6/tm9LU1c/PzYlZRv1c1jXqU7cO4PeNz6nyQo
         lPNuVSgNWbkaiLVr99ehCiX8uBI33PPZ1k8h1QpgrR0h0eeOeo2uxfWmZHZRoV7kWsCT
         dPGYZ0hGIDL9e5VkA51GnRH586vKa7/yJ/qORhCJjxfyZ2WLLroMZWNpqDD4uqYF00bD
         mjpTXgNuSV6TjdB1HW1nb4p2i3OZX/aTDaxZ5Rz77WFSx0+p1JtPBwsBQHH68N35rlRG
         Yf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688735839; x=1691327839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AunBb31YzZUjwaJ31r+ZHgWQ+d/p+0mUIZp67J/ATuk=;
        b=ToEgtHMNRzV6CF0SYpY+c4ZguRLF8h3VARYuIaFIq7A9W/qHHsKNXr1RW0gfze7fbw
         H/OUw2IvnMg1+XwAywFU80tql44vWtBzlnQxyA5pz7hE6rAagAVK7OUAdOTWKWoz7rux
         pie3oHGqWg/CvgOFVUGz48YqCVgS9Ao5gxF5OhvZBsxToojRd0wG01oC32dC/NeZoLqp
         93ZhA0X6AbvmUsBd2GUj3+voUWoNxr1iHkmr1qHMmTRbw+3mA0I93L22zgkttQ6ZszB0
         ApS5bQCsETVmZd6QjMdDszxn/udHLGZoZygNEGRlgP7tAIC7hRVPo1oh0MK0qP6cS5Nl
         K5Xg==
X-Gm-Message-State: ABy/qLZMu7gLuLi2TOau85pNnqBhJNBDKIcE3ejYq+boIv5SL27v3JkV
        3IG7WG5KluIMM1oauUFB20U=
X-Google-Smtp-Source: APBJJlFi6xuMV5WqYTrbfSF9nbIsc9fvHJC1b3N0TSlFzrEp5v3x6vjRFsEz5OLhnO1Jj2NUJFhxLA==
X-Received: by 2002:a05:6512:2005:b0:4f9:b032:5361 with SMTP id a5-20020a056512200500b004f9b0325361mr3620424lfb.10.1688735839167;
        Fri, 07 Jul 2023 06:17:19 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b003f9b3829269sm10363055wmo.2.2023.07.07.06.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:17:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: arm: tegra: pmc: Restructure pad configuration node schema
Date:   Fri,  7 Jul 2023 15:17:09 +0200
Message-ID: <20230707131711.2997956-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707131711.2997956-1-thierry.reding@gmail.com>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The pad configuration node schema in its current form can accidentally
match other properties as well. Restructure the schema to better match
how the device trees are using these.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm/tegra/nvidia,tegra20-pmc.yaml         | 181 ++++++++++++------
 1 file changed, 120 insertions(+), 61 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index 82070d47ac7c..271aa8f80a65 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -245,69 +245,82 @@ properties:
           - resets
           - '#power-domain-cells'
 
-patternProperties:
-  "^[a-f0-9]+-[a-f0-9]+$":
+  pinmux:
     type: object
-    description:
-      This is a Pad configuration node. On Tegra SOCs a pad is a set of
-      pins which are configured as a group. The pin grouping is a fixed
-      attribute of the hardware. The PMC can be used to set pad power state
-      and signaling voltage. A pad can be either in active or power down mode.
-      The support for power state and signaling voltage configuration varies
-      depending on the pad in question. 3.3V and 1.8V signaling voltages
-      are supported on pins where software controllable signaling voltage
-      switching is available.
-
-      The pad configuration state nodes are placed under the pmc node and they
-      are referred to by the pinctrl client properties. For more information
-      see Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt.
-      The pad name should be used as the value of the pins property in pin
-      configuration nodes.
-
-      The following pads are present on Tegra124 and Tegra132
-      audio, bb, cam, comp, csia, csb, cse, dsi, dsib, dsic, dsid, hdmi, hsic,
-      hv, lvds, mipi-bias, nand, pex-bias, pex-clk1, pex-clk2, pex-cntrl,
-      sdmmc1, sdmmc3, sdmmc4, sys_ddc, uart, usb0, usb1, usb2, usb_bias.
-
-      The following pads are present on Tegra210
-      audio, audio-hv, cam, csia, csib, csic, csid, csie, csif, dbg,
-      debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2, gpio, hdmi,
-      hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2, pex-cntrl, sdmmc1,
-      sdmmc3, spi, spi-hv, uart, usb0, usb1, usb2, usb3, usb-bias.
-
     properties:
-      pins:
-        $ref: /schemas/types.yaml#/definitions/string
-        description: Must contain name of the pad(s) to be configured.
-
-      low-power-enable:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description: Configure the pad into power down mode.
-
-      low-power-disable:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description: Configure the pad into active mode.
-
-      power-source:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description:
-          Must contain either TEGRA_IO_PAD_VOLTAGE_1V8 or
-          TEGRA_IO_PAD_VOLTAGE_3V3 to select between signaling voltages.
-          The values are defined in
-          include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h.
-          Power state can be configured on all Tegra124 and Tegra132
-          pads. None of the Tegra124 or Tegra132 pads support signaling
-          voltage switching.
-          All of the listed Tegra210 pads except pex-cntrl support power
-          state configuration. Signaling voltage switching is supported
-          on below Tegra210 pads.
-          audio, audio-hv, cam, dbg, dmic, gpio, pex-cntrl, sdmmc1,
-          sdmmc3, spi, spi-hv, and uart.
-
-    required:
-      - pins
-
-    additionalProperties: false
+      status: true
+
+    additionalProperties:
+      type: object
+      description: |
+        This is a pad configuration node. On Tegra SoCs a pad is a set of pins
+        which are configured as a group. The pin grouping is a fixed attribute
+        of the hardware. The PMC can be used to set pad power state and
+        signaling voltage. A pad can be either in active or power down mode.
+        The support for power state and signaling voltage configuration varies
+        depending on the pad in question. 3.3V and 1.8V signaling voltages are
+        supported on pins where software controllable signaling voltage
+        switching is available.
+
+        The pad configuration state nodes are placed under the pmc node and
+        they are referred to by the pinctrl client properties. For more
+        information see:
+
+          Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+
+        The pad name should be used as the value of the pins property in pin
+        configuration nodes.
+
+        The following pads are present on Tegra124 and Tegra132:
+
+          audio, bb, cam, comp, csia, csb, cse, dsi, dsib, dsic, dsid, hdmi,
+          hsic, hv, lvds, mipi-bias, nand, pex-bias, pex-clk1, pex-clk2,
+          pex-cntrl, sdmmc1, sdmmc3, sdmmc4, sys_ddc, uart, usb0, usb1, usb2,
+          usb_bias
+
+        The following pads are present on Tegra210:
+
+          audio, audio-hv, cam, csia, csib, csic, csid, csie, csif, dbg,
+          debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2, gpio,
+          hdmi, hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2, pex-cntrl,
+          sdmmc1, sdmmc3, spi, spi-hv, uart, usb0, usb1, usb2, usb3, usb-bias
+      additionalProperties: false
+      properties:
+        pins:
+          $ref: /schemas/types.yaml#/definitions/string-array
+          description: Must contain name of the pad(s) to be configured.
+
+        low-power-enable:
+          $ref: /schemas/types.yaml#/definitions/flag
+          description: Configure the pad into power down mode.
+
+        low-power-disable:
+          $ref: /schemas/types.yaml#/definitions/flag
+          description: Configure the pad into active mode.
+
+        power-source:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description: |
+            Must contain either TEGRA_IO_PAD_VOLTAGE_1V8 or
+            TEGRA_IO_PAD_VOLTAGE_3V3 to select between signaling voltages. The
+            values are defined in:
+
+              include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h
+
+            Power state can be configured on all Tegra124 and Tegra132 pads.
+            None of the Tegra124 or Tegra132 pads support signaling voltage
+            switching. All of the listed Tegra210 pads except pex-cntrl support
+            power state configuration. Signaling voltage switching is supported
+            on the following Tegra210 pads:
+
+              audio, audio-hv, cam, dbg, dmic, gpio, pex-cntrl, sdmmc1, sdmmc3,
+              spi, spi-hv, uart
+
+        phandle:
+          $ref: /schemas/types.yaml#/definitions/uint32
+
+      required:
+        - pins
 
 required:
   - compatible
@@ -316,6 +329,52 @@ required:
   - clocks
   - '#clock-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra124-pmc
+    then:
+      properties:
+        pinmux:
+          properties:
+            status: true
+
+          additionalProperties:
+            type: object
+            properties:
+              pins:
+                items:
+                  enum: [ audio, bb, cam, comp, csia, csb, cse, dsi, dsib,
+                          dsic, dsid, hdmi, hsic, hv, lvds, mipi-bias, nand,
+                          pex-bias, pex-clk1, pex-clk2, pex-cntrl, sdmmc1,
+                          sdmmc3, sdmmc4, sys_ddc, uart, usb0, usb1, usb2,
+                          usb_bias ]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra210-pmc
+    then:
+      properties:
+        pinmux:
+          properties:
+            status: true
+
+          additionalProperties:
+            type: object
+            properties:
+              pins:
+                items:
+                  enum: [ audio, audio-hv, cam, csia, csib, csic, csid, csie,
+                          csif, dbg, debug-nonao, dmic, dp, dsi, dsib, dsic,
+                          dsid, emmc, emmc2, gpio, hdmi, hsic, lvds, mipi-bias,
+                          pex-bias, pex-clk1, pex-clk2, pex-cntrl, sdmmc1,
+                          sdmmc3, spi, spi-hv, uart, usb0, usb1, usb2, usb3,
+                          usb-bias ]
+
 additionalProperties: false
 
 dependencies:
-- 
2.41.0

