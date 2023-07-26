Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5DDC05052
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 16:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231875AbjGZQ2F (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 12:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbjGZQ14 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 12:27:56 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C797D26A6;
        Wed, 26 Jul 2023 09:27:54 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-52227142a27so5375519a12.1;
        Wed, 26 Jul 2023 09:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690388873; x=1690993673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0L6qU+JLeMKGvCz89GoBCTy3/nCx4gl/pCLxBD3xdYk=;
        b=GouSE/QnbBR3XgiJ7iqjva/uK1g7KFEi9xwnxndKG0EHgMlGHyjVbdUWzbMaC/enhc
         z2K6lmXBpBU0P9Bgwblsq/y1g82UPlMVwPbsDBcR6J98USfunrSiCz4RMB14viRD3vqA
         pzkb6JfsriXBGo4tyxRJFnl9LGRYHcYgUTr7IIeLSgB96GRE0HRcrKZuugC8S/Rsj/qr
         iAVamD7PemGjEfwoRfVLA76Yj4+fJ5UXMdWPVQ9njY65cXEiN9LwEXywIA6u+jEZI3Xx
         qJFBM2RSzQBNuG7MQxHmyXarzm1ebn/eHvulUO7LszQ2AvYDh0LAvCeTDJnwsw7mXKrh
         EQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690388873; x=1690993673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0L6qU+JLeMKGvCz89GoBCTy3/nCx4gl/pCLxBD3xdYk=;
        b=Mg9WffXSfcWA8Qx/IyYIwJWai8ZSSiVz1r3EqnwgJjQMidhqzm3Jc6moPmh3C4eaem
         myZjMbijO0lJyAsMb9jKNvEtwhgd9sn4shlyP+ssQT2gZUt9glFlfjbUJ8IJzBSIWA40
         vCRtZ9B69wDd8hOzuN2/rDiHqeUkZLN6fdjTVHKvxBuD5BZnDgav2xOXFbC7Oa0wQ/DD
         WnpEazRtVpKwPm0cO0cI+3L9gS9dOypG8kCKQ1FvPBjLl9hBuVxywtaSjrMfUta1d0JM
         z2vGcV+UBijRC5fQYAGf2+HkeTv8pXe0ds0FTyvqZKwHxksv9CwmiGXj8jQnDviZaY6j
         eqQg==
X-Gm-Message-State: ABy/qLb4UsEnp8XxP90KLQR5+7Lmmw6TzNdZ3FC5g80X/yz1vbVlWL3i
        DnJAMi7YsABAWkAJkkxDZ5c=
X-Google-Smtp-Source: APBJJlG3pbya0WJEyZ6B3LvvC2reSNTwQLjBSjysRvn7AM/+ljIQV/gCZnSefVuwIU38hoCYgYNJBg==
X-Received: by 2002:aa7:c1d2:0:b0:51e:eaf:4fea with SMTP id d18-20020aa7c1d2000000b0051e0eaf4feamr1763282edp.35.1690388873087;
        Wed, 26 Jul 2023 09:27:53 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p6-20020a05640210c600b0052217b3a10dsm6229588edu.63.2023.07.26.09.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 09:27:52 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 5/7] dt-bindings: arm: tegra: pmc: Restructure pad configuration node schema
Date:   Wed, 26 Jul 2023 18:27:42 +0200
Message-ID: <20230726162744.2113008-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726162744.2113008-1-thierry.reding@gmail.com>
References: <20230726162744.2113008-1-thierry.reding@gmail.com>
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
Changes in v3:
- remove quirks that are no longer needed with latest dt-schema

Changes in v2:
- highlight quirks working around possible core schema
- use phandle: true instead of fully redefining it
- drop unneeded status property definition

 .../arm/tegra/nvidia,tegra20-pmc.yaml         | 171 +++++++++++-------
 1 file changed, 109 insertions(+), 62 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index a336a75d8b82..de1b23167658 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -244,69 +244,76 @@ properties:
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
+      required:
+        - pins
 
 required:
   - compatible
@@ -315,6 +322,46 @@ required:
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

