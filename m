Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D3BC001DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 13:58:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbjGUN6g (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 09:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbjGUN6d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 09:58:33 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32762CE;
        Fri, 21 Jul 2023 06:58:08 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fbf1f6c771so3175002e87.1;
        Fri, 21 Jul 2023 06:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689947886; x=1690552686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lqx9rZlOEWBvcbgCTsoEQr6GASQ7BEyeOZtqj7Jp/nw=;
        b=Z9MyjWw/G47mbUd2P3fUTwg7UrRfA56OnXv25E6cdqKbnVonqJnc6NTQNEFy8f+Kht
         A8F6Fkz8zvZXEGm9rL+nXth2XxcIVrs/XHjqFwaU9IMFcG6c2lU53WB4PXEti3ouwJB8
         PA07fnGtpVDmYIyb1e6OxT9Ubl7bF8ZlEIrpO/tqyPWzCVmWD5Fo2PZN766SzaGLdf5L
         MElAjH/KiwlPOfsS9hR0V8LgL7JqG34vG+wiIQzbMb5kZKLV9L4YbxwpbTPxK8nmW7e8
         FWDH8cRo0Xs+m8wJpRQbtz+tmY6onu0gytxLkwIMK4xcI7uB4Ja0mbM84KHDOFv3hGNQ
         Cwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689947886; x=1690552686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lqx9rZlOEWBvcbgCTsoEQr6GASQ7BEyeOZtqj7Jp/nw=;
        b=XEYbiS9YTZSPCeVcOetbZ0lQmEep2Jmt4DEHOf/YAwugAmzSFrjFckvPJ9qOFV8Gsz
         YPTt/FLxWX96gR6WY5myK0/N/mcBBQ9TrgPX1UGFJB0brhhDE12sH0L6Fbxdp5lwJ0CI
         KwweXQYq9R0NevTynAFNkD/zzHAUWwMFaH25Kl3ptmgryR8RjyL2WWUCKqAI8XMNToXB
         tv9Sh2ndBEc9U9lLT0AUmpUQ4yY6ppHN7F0adlShFmyx5zdOdkGNYBJ8ltmk65emTkMl
         wPvv833oIarolQm7Dj9I5LHn3B8zrqV2k8Mx0gXDKiMKBa4qx6zbMPV4SB6obXpt0fqo
         f+xQ==
X-Gm-Message-State: ABy/qLYR5uFUCumPaglCiGux7RyBBLYJj2MDJFexUa/9cz0XnQI7VZAJ
        jwDSgcqMZd1zxtjpCkoQJqAObbh1JFI=
X-Google-Smtp-Source: APBJJlGPLpeNjzvrYUrO86grBKDrTHaFRE/zChFSYNlKHDhF2aAszqvj5g11JhhmLEa6SLC7l96Z0A==
X-Received: by 2002:a05:6512:2208:b0:4fb:c028:d76f with SMTP id h8-20020a056512220800b004fbc028d76fmr1727547lfu.35.1689947885473;
        Fri, 21 Jul 2023 06:58:05 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id c12-20020aa7df0c000000b005217412e18dsm2165471edy.48.2023.07.21.06.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 06:58:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 5/7] dt-bindings: arm: tegra: pmc: Restructure pad configuration node schema
Date:   Fri, 21 Jul 2023 15:57:57 +0200
Message-ID: <20230721135759.2994770-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721135759.2994770-1-thierry.reding@gmail.com>
References: <20230721135759.2994770-1-thierry.reding@gmail.com>
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
Changes in v2:
- highlight quirks working around possible core schema
- use phandle: true instead of fully redefining it
- drop unneeded status property definition

 .../arm/tegra/nvidia,tegra20-pmc.yaml         | 184 ++++++++++++------
 1 file changed, 122 insertions(+), 62 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index a336a75d8b82..0cbc16ec4267 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -244,69 +244,79 @@ properties:
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
-    properties:
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
+        # XXX why is this needed?
+        phandle: true
+
+      required:
+        - pins
 
 required:
   - compatible
@@ -315,6 +325,56 @@ required:
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
+          # XXX shouldn't be needed, but the DT validator complains about
+          # "additionalProperties" if "properties" doesn't exist
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
+          # XXX shouldn't be needed, but the DT validator complains about
+          # "additionalProperties" if "properties" doesn't exist
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

