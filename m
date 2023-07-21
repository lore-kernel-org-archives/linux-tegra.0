Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDCFEB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 13:58:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbjGUN62 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 09:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjGUN61 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 09:58:27 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809D130F4;
        Fri, 21 Jul 2023 06:58:02 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso2614083a12.3;
        Fri, 21 Jul 2023 06:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689947881; x=1690552681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QoSMNchEXwuX3x9QSSuoNR4qaNrXEAa88B7oBatCh9k=;
        b=iRZA/5Ne/3oru5JOq3496Ym3LZws8ffLUXRPdlg0DcwqM1jc8QzuScL2Dur/m9QAQI
         rE0yvxSCuuYgqE5kOAyomzzny6zbBa+6NrXJ+OMo27aOtmgFj8u4CeR4nDyepvSJci2+
         M+FwO+R0DJvLFgocAMiN9/So9jFJqQg+L5zIfsnrQ1qxMrBSbN1jNIWo8o3jlGIjdzkS
         7w1+PEafbgmgcjb+2DWAHzU/UDKlQYFsNyUylBeW2hCs0fFS6Rmwr79YltSHAFFi6s30
         4Q8ncUzA/Is+sB8vKKG3JytEXlUqLgbTXffjMV+CMX1/dgMmU6y1oqpf4wq5ZflZHsw1
         ZGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689947881; x=1690552681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QoSMNchEXwuX3x9QSSuoNR4qaNrXEAa88B7oBatCh9k=;
        b=lgny7LbevnFIe16THKJSGNg9lfTlyui7r216LGuj1oW4HET7GwitIWSd58u76r6I+Y
         b3nIh/1lSLEm0vnVjrtXZ8/UH7nyx0D+rvFSuueUOoFQzOE2rYkvE3xcskO2IqVlRpcI
         Xd3NazRXGvlwJCZVbsLvSHTVeXFItG9JUehc6nATJUB1E6Hvd20rXsSRcllvJXDOZL78
         ww7PWjiWmwsjlLAQSgS5c9mGaOo4o304LQM5LEHXKRfhR7PzJvPgFk9xOS+uYRZ72mh2
         nNQWdtObxDVZ6ulNrUbJ6oFsKN4O+ihlVO1zu50/ZYFbklvnb1u6knFLZa345S8zE4JO
         +FkA==
X-Gm-Message-State: ABy/qLaw03SVODzY4wrKbsJ1c2JlXLXUHP+/yBJhwZqBNYoCeIFY06tv
        AzDUp0/qVGyBMGnmq0DbfVo=
X-Google-Smtp-Source: APBJJlHmttUgEOA8yerCrYZ3YpsTBZRkS659sRzG7iiET26bD9k0Lb9TaFyYTCHJdPm+Jcdy4SDrHg==
X-Received: by 2002:aa7:c394:0:b0:521:a740:29b7 with SMTP id k20-20020aa7c394000000b00521a74029b7mr1630499edq.36.1689947880398;
        Fri, 21 Jul 2023 06:58:00 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s11-20020aa7cb0b000000b0051def9be785sm2131434edt.85.2023.07.21.06.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 06:58:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/7] dt-bindings: arm: tegra: pmc: Improve property descriptions
Date:   Fri, 21 Jul 2023 15:57:53 +0200
Message-ID: <20230721135759.2994770-1-thierry.reding@gmail.com>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- instead of rewriting it, drop the reg property description in patch 2
- add Reviewed-by: from Rob

 .../arm/tegra/nvidia,tegra20-pmc.yaml         | 212 +++++++++---------
 1 file changed, 103 insertions(+), 109 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index 89191cfdf619..38fe66142547 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -26,12 +26,10 @@ properties:
 
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
@@ -41,105 +39,103 @@ properties:
 
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
@@ -152,37 +148,32 @@ properties:
 
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
@@ -195,41 +186,44 @@ properties:
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

