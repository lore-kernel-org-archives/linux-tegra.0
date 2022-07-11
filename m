Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184F0C43334
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jul 2022 15:20:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbiGKPUe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiGKPUd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jul 2022 11:20:33 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534F04B0E0;
        Mon, 11 Jul 2022 08:20:31 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id y8so6692554eda.3;
        Mon, 11 Jul 2022 08:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ClRfJRhEpCh3RM9OVDqrADuXPxnO5plmMnxKMpoS2Qg=;
        b=F+ZCFn3/TibP9VuxuNLappnxlwA6G5LDVjJBT8zeG1XdfQHvTjefIAwv8EEqDF+bMP
         Jf3nINnQrKGHBTg8Tf9nBCY98/1kiiW4W9b7Wz7nN9lrEtQaTgyxxsWbKPCx/YDs5ZgI
         MPSGK60a4sCIgGwhpA7i2mLp7y2JA4mVHkzuVgsIqqRK2Tezf3evDcYAUzYXaYbKk1pB
         Q//kdtDAS7V92eExY9ZW+X7J9JZ7pAW/QceUu3tUGWW+9QX5mZV0Q8vycTD6F0qXb6aL
         AFR3KKIcyJafRVA7MdhOdu6dHbGb82HFD77+qQqftk0qNHXniVn2pUZqBHsnWoV50R1S
         RE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ClRfJRhEpCh3RM9OVDqrADuXPxnO5plmMnxKMpoS2Qg=;
        b=oiyYManh5IcFNKu/TkDRtI34C3wj40mU8sIkUqjzMzc/CpCLEMpZbLqUDh+Eqo6Zmd
         AmyL305ulqEbzCHzy5TmWSlzoZc3I14GnVMWnQ7LwSSEnOvEBGAv8TvopXzTpRkKyRak
         A/MSWurIm2uMwKtVAJO7GuROOmorcORZqQ2Mj5qauhktBcDYoVD3e48j0r6nhL0XqezH
         XEOPerk17XFiwMsqP6dwTTZazkMB5+ZfFTzrAUoq8dnUwl6XHj6ecqgTaT5w/WUM8lBr
         V+zlwp1pmVpQntTKQwwbONSuhy/zYU/9jOLKE495Jc87a/vlVWi+/xZvkbEsoUDpUOCU
         9IeQ==
X-Gm-Message-State: AJIora/ZZNDGop+K+otg5J7JqRuFfRADRzVX8EqUobO45JKhh+e/rom3
        w8bwlfK3LUqbWLLIG+e72qdnr8E5IB8=
X-Google-Smtp-Source: AGRyM1upFoQ/YMhXR1zqg/LASemd1gWt65N58XmpWGplhtVhVdUkaj3T5D+cLbAbd8rc4qyW+JTvLw==
X-Received: by 2002:a05:6402:240a:b0:437:d2b6:3dde with SMTP id t10-20020a056402240a00b00437d2b63ddemr25794043eda.62.1657552829528;
        Mon, 11 Jul 2022 08:20:29 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906318f00b0072b2ffc662esm2774705ejy.156.2022.07.11.08.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:20:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: arm: tegra: Revise Tegra20 PMC bindings
Date:   Mon, 11 Jul 2022 17:20:19 +0200
Message-Id: <20220711152020.688461-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152020.688461-1-thierry.reding@gmail.com>
References: <20220711152020.688461-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Update the Tegra20 PMC bindings to make use of some advanced json-schema
features such as describing list elements or validating the contents of
string arrays.

While at it, also restructure the pad configuration node schema to make
sure it doesn't accidentally match other properties.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm/tegra/nvidia,tegra20-pmc.yaml         | 512 ++++++++++--------
 1 file changed, 282 insertions(+), 230 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index 564ae6aaccf7..6894addb3c9a 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20-pmc.yaml#
@@ -21,141 +21,134 @@ properties:
 
   reg:
     maxItems: 1
-    description:
-      Offset and length of the register set for the device.
+    description: Offset and length of the register set for the device.
 
   clock-names:
     items:
       - const: pclk
       - const: clk32k_in
-    description:
-      Must includes entries pclk and clk32k_in.
-      pclk is the Tegra clock of that name and clk32k_in is 32KHz clock
-      input to Tegra.
+    description: Must includes entries pclk and clk32k_in. pclk is the Tegra
+      clock of that name and clk32k_in is 32KHz clock input to Tegra.
 
   clocks:
     maxItems: 2
-    description:
-      Must contain an entry for each entry in clock-names.
-      See ../clocks/clocks-bindings.txt for details.
+    description: Must contain an entry for each entry in clock-names. See
+      ../clocks/clocks-bindings.txt for details.
 
   '#clock-cells':
     const: 1
-    description:
-      Tegra PMC has clk_out_1, clk_out_2, and clk_out_3.
-      PMC also has blink control which allows 32Khz clock output to
-      Tegra blink pad.
-      Consumer of PMC clock should specify the desired clock by having
-      the clock ID in its "clocks" phandle cell with pmc clock provider.
-      See include/dt-bindings/soc/tegra-pmc.h for the list of Tegra PMC
-      clock IDs.
+    description: |
+      Tegra PMC has clk_out_1, clk_out_2, and clk_out_3. PMC also has blink
+      control which allows 32Khz clock output to Tegra blink pad.
+
+      Consumer of PMC clock should specify the desired clock by having the
+      clock ID in its "clocks" phandle cell with PMC clock provider. See
+      include/dt-bindings/soc/tegra-pmc.h for the list of Tegra PMC clock IDs.
 
   '#interrupt-cells':
     const: 2
-    description:
-      Specifies number of cells needed to encode an interrupt source.
-      The value must be 2.
+    description: Specifies number of cells needed to encode an interrupt
+      source.
 
   interrupt-controller: true
 
   nvidia,invert-interrupt:
     $ref: /schemas/types.yaml#/definitions/flag
-    description: Inverts the PMU interrupt signal.
-      The PMU is an external Power Management Unit, whose interrupt output
-      signal is fed into the PMC. This signal is optionally inverted, and
-      then fed into the ARM GIC. The PMC is not involved in the detection
-      or handling of this interrupt signal, merely its inversion.
+    description: Inverts the PMU interrupt signal. The PMU is an external Power
+      Management Unit, whose interrupt output signal is fed into the PMC. This
+      signal is optionally inverted, and then fed into the ARM GIC. The PMC is
+      not involved in the detection or handling of this interrupt signal,
+      merely its inversion.
 
   nvidia,core-power-req-active-high:
     $ref: /schemas/types.yaml#/definitions/flag
-    description: Core power request active-high.
+    description: core power request active-high
 
   nvidia,sys-clock-req-active-high:
     $ref: /schemas/types.yaml#/definitions/flag
-    description: System clock request active-high.
+    description: system clock request active-high
 
   nvidia,combined-power-req:
     $ref: /schemas/types.yaml#/definitions/flag
-    description: combined power request for CPU and Core.
+    description: combined power request for CPU and core
 
   nvidia,cpu-pwr-good-en:
     $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      CPU power good signal from external PMIC to PMC is enabled.
+    description: CPU power good signal from external PMIC to PMC is enabled
 
   nvidia,suspend-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2]
-    description:
-      The suspend mode that the platform should use.
-      Mode 0 is for LP0, CPU + Core voltage off and DRAM in self-refresh
-      Mode 1 is for LP1, CPU voltage off and DRAM in self-refresh
-      Mode 2 is for LP2, CPU voltage off
+    description: the suspend mode that the platform should use
+    oneOf:
+      - description: LP0, CPU + Core voltage off and DRAM in self-refresh
+        const: 0
+      - description: LP1, CPU voltage off and DRAM in self-refresh
+        const: 1
+      - description: LP2, CPU voltage off
+        const: 2
 
   nvidia,cpu-pwr-good-time:
     $ref: /schemas/types.yaml#/definitions/uint32
-    description: CPU power good time in uSec.
+    description: CPU power good time in microseconds
 
   nvidia,cpu-pwr-off-time:
     $ref: /schemas/types.yaml#/definitions/uint32
-    description: CPU power off time in uSec.
+    description: CPU power off time in microseconds
 
   nvidia,core-pwr-good-time:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-    description:
-      <Oscillator-stable-time Power-stable-time>
-      Core power good time in uSec.
+    description: core power good time in microseconds
+    items:
+      - description: oscillator stable time
+      - description: power stable time
 
   nvidia,core-pwr-off-time:
     $ref: /schemas/types.yaml#/definitions/uint32
-    description: Core power off time in uSec.
+    description: core power off time in microseconds
 
   nvidia,lp0-vec:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-    description:
-      <start length> Starting address and length of LP0 vector.
-      The LP0 vector contains the warm boot code that is executed
-      by AVP when resuming from the LP0 state.
-      The AVP (Audio-Video Processor) is an ARM7 processor and
-      always being the first boot processor when chip is power on
-      or resume from deep sleep mode. When the system is resumed
-      from the deep sleep mode, the warm boot code will restore
-      some PLLs, clocks and then brings up CPU0 for resuming the
-      system.
+    description: |
+      Starting address and length of LP0 vector. The LP0 vector contains the
+      warm boot code that is executed by AVP when resuming from the LP0 state.
+      The AVP (Audio-Video Processor) is an ARM7 processor and always being
+      the first boot processor when chip is power on or resume from deep sleep
+      mode. When the system is resumed from the deep sleep mode, the warm boot
+      code will restore some PLLs, clocks and then brings up CPU0 for resuming
+      the system.
+    items:
+      - description: starting address of LP0 vector
+      - description: length of LP0 vector
 
   i2c-thermtrip:
     type: object
-    description:
-      On Tegra30, Tegra114 and Tegra124 if i2c-thermtrip subnode exists,
-      hardware-triggered thermal reset will be enabled.
+    description: On Tegra30, Tegra114 and Tegra124 if i2c-thermtrip subnode
+      exists, hardware-triggered thermal reset will be enabled.
 
     properties:
       nvidia,i2c-controller-id:
         $ref: /schemas/types.yaml#/definitions/uint32
-        description:
-          ID of I2C controller to send poweroff command to PMU.
-          Valid values are described in section 9.2.148
-          "APBDEV_PMC_SCRATCH53_0" of the Tegra K1 Technical Reference
-          Manual.
+        description: ID of I2C controller to send poweroff command to PMU.
+          Valid values are described in section 9.2.148 "APBDEV_PMC_SCRATCH53_0"
+          of the Tegra K1 Technical Reference Manual.
 
       nvidia,bus-addr:
         $ref: /schemas/types.yaml#/definitions/uint32
-        description: Bus address of the PMU on the I2C bus.
+        description: bus address of the PMU on the I2C bus
 
       nvidia,reg-addr:
         $ref: /schemas/types.yaml#/definitions/uint32
-        description: PMU I2C register address to issue poweroff command.
+        description: PMU I2C register address to issue poweroff command
 
       nvidia,reg-data:
         $ref: /schemas/types.yaml#/definitions/uint32
-        description: Poweroff command to write to PMU.
+        description: power-off command to write to PMU
 
       nvidia,pinmux-id:
         $ref: /schemas/types.yaml#/definitions/uint32
-        description:
-          Pinmux used by the hardware when issuing Poweroff command.
-          Defaults to 0. Valid values are described in section 12.5.2
-          "Pinmux Support" of the Tegra4 Technical Reference Manual.
+        description: Pinmux used by the hardware when issuing power-off command.
+          Defaults to 0. Valid values are described in section 12.5.2 "Pinmux
+          Support" of the Tegra4 Technical Reference Manual.
 
     required:
       - nvidia,i2c-controller-id
@@ -165,65 +158,91 @@ properties:
 
     additionalProperties: false
 
+  core-domain:
+    type: object
+    description: The vast majority of hardware blocks of Tegra SoC belong to a
+      core power domain, which has a dedicated voltage rail that powers the
+      blocks.
+
+    properties:
+      operating-points-v2:
+        description: Should contain level, voltages and opp-supported-hw
+          property. The supported-hw is a bitfield indicating SoC speedo or
+          process ID mask.
+
+      "#power-domain-cells":
+        const: 0
+
+    required:
+      - operating-points-v2
+      - "#power-domain-cells"
+
+    additionalProperties: false
+
+  core-supply:
+    description: phandle to voltage regulator connected to the SoC core power
+      rail
+
   powergates:
     type: object
     description: |
-      This node contains a hierarchy of power domain nodes, which should
-      match the powergates on the Tegra SoC. Each powergate node
-      represents a power-domain on the Tegra SoC that can be power-gated
-      by the Tegra PMC.
-      Hardware blocks belonging to a power domain should contain
-      "power-domains" property that is a phandle pointing to corresponding
-      powergate node.
-      The name of the powergate node should be one of the below. Note that
-      not every powergate is applicable to all Tegra devices and the following
-      list shows which powergates are applicable to which devices.
-      Please refer to Tegra TRM for mode details on the powergate nodes to
-      use for each power-gate block inside Tegra.
-      Name		Description			            Devices Applicable
-      3d		  3D Graphics			            Tegra20/114/124/210
-      3d0		  3D Graphics 0		            Tegra30
-      3d1		  3D Graphics 1		            Tegra30
-      aud		  Audio				                Tegra210
-      dfd		  Debug				                Tegra210
-      dis		  Display A			              Tegra114/124/210
-      disb		Display B			              Tegra114/124/210
-      heg		  2D Graphics		            	Tegra30/114/124/210
-      iram		Internal RAM		            Tegra124/210
-      mpe		  MPEG Encode			            All
-      nvdec		NVIDIA Video Decode Engine	Tegra210
-      nvjpg		NVIDIA JPEG Engine		      Tegra210
-      pcie		PCIE				                Tegra20/30/124/210
-      sata		SATA				                Tegra30/124/210
-      sor		  Display interfaces       		Tegra124/210
-      ve2		  Video Encode Engine 2		    Tegra210
-      venc		Video Encode Engine		      All
-      vdec		Video Decode Engine		      Tegra20/30/114/124
-      vic		  Video Imaging Compositor	  Tegra124/210
-      xusba		USB Partition A			        Tegra114/124/210
-      xusbb		USB Partition B 		        Tegra114/124/210
-      xusbc		USB Partition C			        Tegra114/124/210
+      This node contains a hierarchy of power domain nodes, which should match
+      the powergates on the Tegra SoC. Each powergate node represents a power-
+      domain on the Tegra SoC that can be power-gated by the Tegra PMC.
+
+      Hardware blocks belonging to a power domain should contain "power-domains"
+      property that is a phandle pointing to corresponding powergate node.
+
+      The name of the powergate node should be one of the below. Note that not
+      every powergate is applicable to all Tegra devices and the following list
+      shows which powergates are applicable to which devices.
+
+      Please refer to Tegra TRM for mode details on the powergate nodes to use
+      for each power-gate block inside Tegra.
+
+        Name     Description                   Devices Applicable
+        --------------------------------------------------------------
+        3d       3D Graphics                   Tegra20/114/124/210
+        3d0      3D Graphics 0                 Tegra30
+        3d1      3D Graphics 1                 Tegra30
+        aud      Audio                         Tegra210
+        dfd      Debug                         Tegra210
+        dis      Display A                     Tegra114/124/210
+        disb     Display B                     Tegra114/124/210
+        heg      2D Graphics                   Tegra30/114/124/210
+        iram     Internal RAM                  Tegra124/210
+        mpe      MPEG Encode                   All
+        nvdec    NVIDIA Video Decode Engine    Tegra210
+        nvjpg    NVIDIA JPEG Engine            Tegra210
+        pcie     PCIE                          Tegra20/30/124/210
+        sata     SATA                          Tegra30/124/210
+        sor      Display interfaces            Tegra124/210
+        ve2      Video Encode Engine 2         Tegra210
+        venc     Video Encode Engine           All
+        vdec     Video Decode Engine           Tegra20/30/114/124
+        vic      Video Imaging Compositor      Tegra124/210
+        xusba    USB Partition A               Tegra114/124/210
+        xusbb    USB Partition B               Tegra114/124/210
+        xusbc    USB Partition C               Tegra114/124/210
 
     patternProperties:
       "^[a-z0-9]+$":
         type: object
-
-        patternProperties:
+        properties:
           clocks:
             minItems: 1
-            maxItems: 8
-            description:
-              Must contain an entry for each clock required by the PMC
-              for controlling a power-gate.
-              See ../clocks/clock-bindings.txt document for more details.
+            maxItems: 10
+            description: |
+              Must contain an entry for each clock required by the PMC for
+              controlling a powergate. See ../clocks/clock-bindings.txt document
+              for more details.
 
           resets:
             minItems: 1
             maxItems: 8
-            description:
-              Must contain an entry for each reset required by the PMC
-              for controlling a power-gate.
-              See ../reset/reset.txt for more details.
+            description: |
+              Must contain an entry for each reset required by the PMC for
+              controlling a powergate. See ../reset/reset.txt for more details.
 
           '#power-domain-cells':
             const: 0
@@ -236,96 +255,84 @@ properties:
 
     additionalProperties: false
 
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
+      status: true
 
-      low-power-enable:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description: Configure the pad into power down mode.
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
 
-      low-power-disable:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description: Configure the pad into active mode.
+        The pad configuration state nodes are placed under the pmc node and
+        they are referred to by the pinctrl client properties. For more
+        information see:
 
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
+          Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
 
-    required:
-      - pins
+        The pad name should be used as the value of the pins property in pin
+        configuration nodes.
 
-    additionalProperties: false
+        The following pads are present on Tegra124 and Tegra132:
 
-  core-domain:
-    type: object
-    description: |
-      The vast majority of hardware blocks of Tegra SoC belong to a
-      Core power domain, which has a dedicated voltage rail that powers
-      the blocks.
+          audio, bb, cam, comp, csia, csb, cse, dsi, dsib, dsic, dsid, hdmi,
+          hsic, hv, lvds, mipi-bias, nand, pex-bias, pex-clk1, pex-clk2,
+          pex-cntrl, sdmmc1, sdmmc3, sdmmc4, sys_ddc, uart, usb0, usb1, usb2,
+          usb_bias
 
-    properties:
-      operating-points-v2:
-        description:
-          Should contain level, voltages and opp-supported-hw property.
-          The supported-hw is a bitfield indicating SoC speedo or process
-          ID mask.
+        The following pads are present on Tegra210:
 
-      "#power-domain-cells":
-        const: 0
+          audio, audio-hv, cam, csia, csib, csic, csid, csie, csif, dbg,
+          debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2, gpio,
+          hdmi, hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2, pex-cntrl,
+          sdmmc1, sdmmc3, spi, spi-hv, uart, usb0, usb1, usb2, usb3, usb-bias
 
-    required:
-      - operating-points-v2
-      - "#power-domain-cells"
+      properties:
+        pins:
+          $ref: /schemas/types.yaml#/definitions/string-array
+          description: Must contain name of the pad(s) to be configured.
 
-    additionalProperties: false
+        low-power-enable:
+          $ref: /schemas/types.yaml#/definitions/flag
+          description: Configure the pad into power down mode.
 
-  core-supply:
-    description:
-      Phandle to voltage regulator connected to the SoC Core power rail.
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
+
+      additionalProperties: false
 
 required:
   - compatible
@@ -334,6 +341,52 @@ required:
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
@@ -343,47 +396,46 @@ dependencies:
 
 examples:
   - |
-
     #include <dt-bindings/clock/tegra210-car.h>
     #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
     #include <dt-bindings/soc/tegra-pmc.h>
 
-    tegra_pmc: pmc@7000e400 {
-              compatible = "nvidia,tegra210-pmc";
-              reg = <0x7000e400 0x400>;
-              core-supply = <&regulator>;
-              clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
-              clock-names = "pclk", "clk32k_in";
-              #clock-cells = <1>;
-
-              nvidia,invert-interrupt;
-              nvidia,suspend-mode = <0>;
-              nvidia,cpu-pwr-good-time = <0>;
-              nvidia,cpu-pwr-off-time = <0>;
-              nvidia,core-pwr-good-time = <4587 3876>;
-              nvidia,core-pwr-off-time = <39065>;
-              nvidia,core-power-req-active-high;
-              nvidia,sys-clock-req-active-high;
-
-              pd_core: core-domain {
-                      operating-points-v2 = <&core_opp_table>;
-                      #power-domain-cells = <0>;
-              };
-
-              powergates {
-                    pd_audio: aud {
-                            clocks = <&tegra_car TEGRA210_CLK_APE>,
-                                     <&tegra_car TEGRA210_CLK_APB2APE>;
-                            resets = <&tegra_car 198>;
-                            power-domains = <&pd_core>;
-                            #power-domain-cells = <0>;
-                    };
-
-                    pd_xusbss: xusba {
-                            clocks = <&tegra_car TEGRA210_CLK_XUSB_SS>;
-                            resets = <&tegra_car TEGRA210_CLK_XUSB_SS>;
-                            power-domains = <&pd_core>;
-                            #power-domain-cells = <0>;
-                    };
-              };
+    pmc@7000e400 {
+      compatible = "nvidia,tegra210-pmc";
+      reg = <0x7000e400 0x400>;
+      core-supply = <&regulator>;
+      clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
+      clock-names = "pclk", "clk32k_in";
+      #clock-cells = <1>;
+
+      nvidia,invert-interrupt;
+      nvidia,suspend-mode = <0>;
+      nvidia,cpu-pwr-good-time = <0>;
+      nvidia,cpu-pwr-off-time = <0>;
+      nvidia,core-pwr-good-time = <4587 3876>;
+      nvidia,core-pwr-off-time = <39065>;
+      nvidia,core-power-req-active-high;
+      nvidia,sys-clock-req-active-high;
+
+      pd_core: core-domain {
+        operating-points-v2 = <&core_opp_table>;
+        #power-domain-cells = <0>;
+      };
+
+      powergates {
+        pd_audio: aud {
+          clocks = <&tegra_car TEGRA210_CLK_APE>,
+                   <&tegra_car TEGRA210_CLK_APB2APE>;
+          resets = <&tegra_car 198>;
+          power-domains = <&pd_core>;
+          #power-domain-cells = <0>;
+        };
+
+        pd_xusbss: xusba {
+          clocks = <&tegra_car TEGRA210_CLK_XUSB_SS>;
+          resets = <&tegra_car TEGRA210_CLK_XUSB_SS>;
+          power-domains = <&pd_core>;
+          #power-domain-cells = <0>;
+        };
+      };
     };
-- 
2.36.1

