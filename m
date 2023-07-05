Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C527FEB64DA
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 15:31:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbjGEPbD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 11:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbjGEPbB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 11:31:01 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8981709;
        Wed,  5 Jul 2023 08:31:00 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3141c3a7547so7019165f8f.2;
        Wed, 05 Jul 2023 08:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688571058; x=1691163058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G08qe2rzsWUKKvfQmuR7vHXIhRnUox6mBuYVwWHjBzA=;
        b=Mz48JymfnL+kBNsjSIVBZ88MpQhaA0UDGAmQRTPbhLzgKH2Kfwv0BicVne5U+fctBH
         a5P14OPR9oFeGbZiuoJWsVGDnDGAL8uPd8/LumszXoYdTAV8B3YE2g97vG/96OINqEzD
         FDzLT4wIfcf/6nO/YxzGyn7a1zl17sDLyJd9XjjqxBFBMm/06sXt5zK/2N5BINjZacUE
         kOBwb4hDXM0wsjaAIjRbcXP1abPHi4x7y5yIDp1u/mRENIJGK+5LkSkFAVLOEYehhwdL
         DAib9rO46vdubq4JGrFqXNHsD27jmBcGhxkiLW79CZYsbQf503BjeFuGDvBb4hRbDtwm
         ir5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688571058; x=1691163058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G08qe2rzsWUKKvfQmuR7vHXIhRnUox6mBuYVwWHjBzA=;
        b=FEXFdEGk/ShuwQ2Pp+AAlifZ54uTcNb4D7Bwshfy/OTbhLDVrBlZPNTesxQUfsUily
         cI5vWnQzSKW2xLwnM6hVxa3qUiF4qPSwYxWIiIr4GQvIZnFnRIGM9RuL9Bsh5rPIOduj
         K7/cECOc28nVh7Z8QRI/tSysNzkxcym5VASHD/NyVQUV4wGrDeKVK7og2YLYJNrA51op
         7uO1UnFwm5KbWTBS3bsrklkc5aDRCBmn1evczRAFg4xqgo4s4lvmsr2Vl06OZFcaEVoo
         Aq+TMZ/R780e6GBc3HIE9ZBJtKPgxlA7jARbcfRRwck7yiO+/smfCMtYiPOyeDf65V87
         /SKg==
X-Gm-Message-State: ABy/qLYaZb7pDJnRjkEQ0z6snFC6UH/BaKbES3naA6eODrnHcdgDFKQC
        h77HA8+ENA4J4ZrZC8FWK7Q=
X-Google-Smtp-Source: APBJJlF06uMYspWnvkDfaVsh+GjnTCu+Oft17X7p7FEDIMnMJBiuz5uD9rmHYH+VDlyqnicWeja45w==
X-Received: by 2002:adf:fec3:0:b0:314:1318:18b7 with SMTP id q3-20020adffec3000000b00314131818b7mr11325137wrs.19.1688571057556;
        Wed, 05 Jul 2023 08:30:57 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id b3-20020adfe303000000b0030fd03e3d25sm31371656wrj.75.2023.07.05.08.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 08:30:57 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: tegra: Convert to json-schema
Date:   Wed,  5 Jul 2023 17:30:56 +0200
Message-ID: <20230705153056.2514908-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the Tegra timer bindings from the free-form text format to
json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/timer/nvidia,tegra20-timer.yaml  | 121 ++++++++++++++++++
 .../bindings/timer/nvidia,tegra210-timer.yaml |  70 ++++++++++
 2 files changed, 191 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra20-timer.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/nvidia,tegra20-timer.yaml b/Documentation/devicetree/bindings/timer/nvidia,tegra20-timer.yaml
new file mode 100644
index 000000000000..d57663d73095
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nvidia,tegra20-timer.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/nvidia,tegra20-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 (and later) Timer
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: The Tegra20 timer provides four 29-bit timer channels and a single 32-bit free
+  running counter. The first two channels may also trigger a watchdog reset.
+
+  The timer found on Tegra30 provides ten 29-bit timer channels, a single 32-bit free running
+  counter, and 5 watchdog modules. The first two channels may also trigger a legacy watchdog
+  reset.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - nvidia,tegra114-timer
+              - nvidia,tegra124-timer
+          - const: nvidia,tegra30-timer
+
+      - items:
+          - const: nvidia,tegra30-timer
+          - const: nvidia,tegra20-timer
+
+      - const: nvidia,tegra20-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 4
+    maxItems: 6
+
+  clocks:
+    items:
+      - description: module clock
+
+  clock-names:
+    items:
+      - const: timer
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra30-timer
+    then:
+      properties:
+        interrupts:
+          description: One interrupt per each of timer channels 1 through 5 and one shared
+            interrupt for the remaining channels.
+          minItems: 6
+    else:
+      properties:
+        interrupts:
+          description: One interrupt for each timer channel.
+          maxItems: 4
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@60005000 {
+        compatible = "nvidia,tegra20-timer";
+        reg = <0x60005000 0x60>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA20_CLK_TWD>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@60005000 {
+        compatible = "nvidia,tegra30-timer", "nvidia,tegra20-timer";
+        reg = <0x60005000 0x400>;
+        interrupts = <GIC_SPI 0   IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 1   IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 41  IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 42  IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA30_CLK_TWD>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra114-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@60005000 {
+      compatible = "nvidia,tegra114-timer", "nvidia,tegra30-timer";
+      reg = <0x60005000 0x400>;
+      interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&tegra_car TEGRA114_CLK_TIMER>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.yaml b/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.yaml
new file mode 100644
index 000000000000..2b42d8d03b7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/nvidia,tegra210-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra210 Timer
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: The Tegra210 timer provides fourteen 29-bit timer counters and one 32-bit timestamp
+  counter. The TMRs run at either a fixed 1 MHz clock rate derived from the oscillator clock
+  (TMR0-TMR9) or directly at the oscillator clock (TMR10-TMR13). Each TMR can be programmed to
+  generate one-shot, periodic, or watchdog interrupts.
+
+properties:
+  compatible:
+    const: nvidia,tegra210-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: One interrupt per each timer channels 0 through 13.
+    minItems: 14
+    maxItems: 14
+
+  clocks:
+    items:
+      - description: module clock
+
+  clock-names:
+    items:
+      - const: timer
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@60005000 {
+        compatible = "nvidia,tegra210-timer";
+        reg = <0x60005000 0x400>;
+        interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA210_CLK_TIMER>;
+        clock-names = "timer";
+    };
-- 
2.41.0

