Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AA3EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 12:46:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjGUMq3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 08:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjGUMq2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 08:46:28 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D8610CB;
        Fri, 21 Jul 2023 05:46:25 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fc0aecf107so15629155e9.2;
        Fri, 21 Jul 2023 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689943584; x=1690548384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yw2+KJ51Qdq/eOHuDYpFQjl/4+dc5rrKNzQkcqcYH0w=;
        b=j32FdyTCUK7ADxHmHSuJuOdVeTwWKt1bPQcbamSIe2+HB0bZ9Jr3U2MF788LMqrQNg
         Rj3rrGVFDXabb/na8a3dc+/cd4x7Iwfa62PcgYs3RwhY9hnrt3ukLz2m29Q7uon/bwgE
         jugNjw4Q9KzaoYvfByOUMaMDbZHRl9iJdv3g2Bqx0sWqZ63dA7uVf8B/P8+kJrV4y77w
         DFjyKdov77HRFYdmQqLMyVEXlrygtVr+A89MEKDOdHiu0djr6jGBVLgYwqDadlN8EVM6
         0ZmIircwNZ5gVtC1Qzp4ZRdgdWnFQzDbMmvCTgL16Le3SVCRRGLOWE5JH5x2PW02bLHQ
         iCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689943584; x=1690548384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yw2+KJ51Qdq/eOHuDYpFQjl/4+dc5rrKNzQkcqcYH0w=;
        b=f0qsdo61/8aqZCMtq+oJdjSUOBd59Q439M7xDp1WzYtZs5pJWfltzOiuwO6CjGknz1
         was9OhnZ8xw62ZyR5fVT34VJF19mKg8HYiirhnTk+JwAmS+612rudw27M0BUx0AxSW3d
         96uL/znPiEZ8InFRAX/84vIHST1JNq6kZWWuYKda8vPfyAMEopocfUboILwOqhe4WHa9
         Ua4v0DAQVHSy0CvlRoKFzc3yvxEU2K6x2DoP/XDfuxT+7cGWUFrIznbtXGkUz4VDxz9U
         OXWujW/59Ouo174YFzeBveK/tCvec0RIisfEdImSkZjkymuPttA+61aHXtHrzYKRqviH
         nDcg==
X-Gm-Message-State: ABy/qLaacrC9E7S9CG/SPzSsBkEDJX3D7EbC9S+SaJ6bXH99dYgiUdTn
        gC9MEUtCdZMI/NDGWAXOvHQ=
X-Google-Smtp-Source: APBJJlF4l2F5ozvVQU8a9aXly0dFqxX6E0GvcioUvAYtpn3pHTAjVWIhps18Y09n4uncYQjC0OIg6w==
X-Received: by 2002:a7b:cb94:0:b0:3fc:4e0:caf8 with SMTP id m20-20020a7bcb94000000b003fc04e0caf8mr1298045wmi.34.1689943583956;
        Fri, 21 Jul 2023 05:46:23 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s18-20020a05600c045200b003fc01495383sm6022260wmb.6.2023.07.21.05.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 05:46:23 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Dietrich <marvin24@gmx.de>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3] dt-bindings: arm: tegra: nvec: Convert to json-schema
Date:   Fri, 21 Jul 2023 14:46:23 +0200
Message-ID: <20230721124623.2988445-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the NVIDIA embedded controller bindings from the free-form text
format to json-schema.

Acked-by: Marc Dietrich <marvin24@gmx.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- rename node to i2c to clarify that it's a repurposed I2C controller
- drop unused #address-cells and #size-cells

Changes in v2:
- drop $ref for standard clock-frequency property
- use 4 spaces for indentation in example
- move to soc/tegra directory
---
 .../bindings/arm/tegra/nvidia,nvec.txt        | 21 -----
 .../bindings/soc/tegra/nvidia,nvec.yaml       | 84 +++++++++++++++++++
 2 files changed, 84 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
 create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
deleted file mode 100644
index 5ae601e7f51f..000000000000
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-NVIDIA compliant embedded controller
-
-Required properties:
-- compatible : should be "nvidia,nvec".
-- reg : the iomem of the i2c slave controller
-- interrupts : the interrupt line of the i2c slave controller
-- clock-frequency : the frequency of the i2c bus
-- gpios : the gpio used for ec request
-- slave-addr: the i2c address of the slave controller
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  Tegra20/Tegra30:
-  - div-clk
-  - fast-clk
-  Tegra114:
-  - div-clk
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries:
-  - i2c
diff --git a/Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml b/Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml
new file mode 100644
index 000000000000..d5261ce3a619
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/tegra/nvidia,nvec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA compliant embedded controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,nvec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: divider clock
+      - description: fast clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: div-clk
+      - const: fast-clk
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: i2c
+
+  clock-frequency: true
+
+  request-gpios:
+    description: phandle to the GPIO used for EC request
+
+  slave-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: I2C address of the slave controller
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - clock-frequency
+  - request-gpios
+  - slave-addr
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/gpio/tegra-gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2c@7000c500 {
+        compatible = "nvidia,nvec";
+        reg = <0x7000c500 0x100>;
+        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+        clock-frequency = <80000>;
+        request-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
+        slave-addr = <138>;
+        clocks = <&tegra_car TEGRA20_CLK_I2C3>,
+                 <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
+        clock-names = "div-clk", "fast-clk";
+        resets = <&tegra_car 67>;
+        reset-names = "i2c";
+    };
-- 
2.41.0

