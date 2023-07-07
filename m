Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD2BC001B0
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 13:17:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjGGNRU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 09:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjGGNRT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 09:17:19 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777F91FC9;
        Fri,  7 Jul 2023 06:17:17 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fb8574a3a1so2859958e87.1;
        Fri, 07 Jul 2023 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688735836; x=1691327836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NjW7KoRCDV8Jc0MWFIIb1Qt0B39sgkHOYdwi4ltUWdg=;
        b=mMGXtaXZB0onqJwWxvXQ1p+n4SqWr4gB2xYYxhHDq2ZOQ1fYn3tGP+z1WEOuggD2bX
         xsT1RpSXLM61XR1fSoU49e1zB93YhDTOYXsC3fiqs4DFK2KmQliuNDMUAxCzXqUb3zWE
         b9c5lxk5oPjIXUyN7QCekCz+u04dLUYP9NP2L5gKD3ItfrqWy4dJ/d9q4S3DczHGW+k+
         2J8NKDMoSFNm3XW41r8Kc0PfI2zP/vWIn4h6hAzB9u3esnyKuElPogs4/V10sZucvERG
         CSBqfrZ+m5X99UatLTYvHnHd/n/sucpRZqN/MvJHlVsum+jVxwWpVngJI8K0uPc22wlr
         1Fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688735836; x=1691327836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjW7KoRCDV8Jc0MWFIIb1Qt0B39sgkHOYdwi4ltUWdg=;
        b=XwhWtMjL/zNlROMBvfTdIrK6iEplrrykx0hiKplceOOqqMuSvokd+xfawOnzJa9II7
         BpPICx1UyytLeyOLD5LduprVLWnMejpHv1JNFQHoBuMlYp/xNihmwgkp5sELVIkIGDTg
         xpq0GvNQsEjuOYhswPmyGKcjutlS6kVmfgIpFqrxK1sk/0DAJSZml8lZQJVOSBmRADTA
         Ybuh/haTN9vFceovKmAUdLJpycJnfHyR1nJyCLLrwygaxa6NzWE0iSU5iI+o7Itb29/N
         oaVmUXC0b29z2DZsYlBLWr+giFdASNnt/4kx8IEpfNRdiMWeVaQD9TWkAMRPAniUq3+w
         ersw==
X-Gm-Message-State: ABy/qLbps182pnPrBDoyRDm2F3KvJn2FEpq/9r36cZIdxtKuEycMesuL
        OiEsi/Jsga7nXpoxZPO55vA=
X-Google-Smtp-Source: APBJJlHMKOqOebIze0oyQEHlrdB0YZclTDs/GKBdOzMguECKZYPPyhrPTmC5uAwErv4uLKHbbLsz5Q==
X-Received: by 2002:ac2:4c49:0:b0:4f8:6b7f:c6d6 with SMTP id o9-20020ac24c49000000b004f86b7fc6d6mr4959560lfk.48.1688735835285;
        Fri, 07 Jul 2023 06:17:15 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bce16000000b003fc01189b0dsm895243wmc.42.2023.07.07.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:17:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: arm: tegra: pmc: Improve property descriptions
Date:   Fri,  7 Jul 2023 15:17:05 +0200
Message-ID: <20230707131711.2997956-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Reformat the description of various properties to make them more
consistent with existing ones. Make use of json-schema's ability to
provide a description for individual list items to make improve the
documentation further.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm/tegra/nvidia,tegra20-pmc.yaml         | 215 +++++++++---------
 1 file changed, 104 insertions(+), 111 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index 89191cfdf619..a90f01678775 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -21,17 +21,14 @@ properties:
 
   reg:
     maxItems: 1
-    description:
-      Offset and length of the register set for the device.
+    description: Offset and length of the register set for the device.
 
   clock-names:
     items:
+      # Tegra clock of the same name
       - const: pclk
+      # 32 KHz clock input
       - const: clk32k_in
-    description:
-      Must includes entries pclk and clk32k_in.
-      pclk is the Tegra clock of that name and clk32k_in is 32KHz clock
-      input to Tegra.
 
   clocks:
     maxItems: 2
@@ -41,105 +38,103 @@ properties:
 
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
 
   core-supply:
-    description:
-      Phandle to voltage regulator connected to the SoC Core power rail.
+    description: phandle to voltage regulator connected to the SoC core power
+      rail
 
   core-domain:
     type: object
-    description: |
-      The vast majority of hardware blocks of Tegra SoC belong to a
-      Core power domain, which has a dedicated voltage rail that powers
-      the blocks.
-
+    description: The vast majority of hardware blocks of Tegra SoC belong to a
+      core power domain, which has a dedicated voltage rail that powers the
+      blocks.
     properties:
       operating-points-v2:
-        description:
-          Should contain level, voltages and opp-supported-hw property.
-          The supported-hw is a bitfield indicating SoC speedo or process
-          ID mask.
+        description: Should contain level, voltages and opp-supported-hw
+          property. The supported-hw is a bitfield indicating SoC speedo or
+          process ID mask.
 
       "#power-domain-cells":
         const: 0
@@ -152,37 +147,32 @@ properties:
 
   i2c-thermtrip:
     type: object
-    description:
-      On Tegra30, Tegra114 and Tegra124 if i2c-thermtrip subnode exists,
-      hardware-triggered thermal reset will be enabled.
-
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
@@ -195,41 +185,44 @@ properties:
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
-- 
2.41.0

