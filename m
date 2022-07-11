Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBB7C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jul 2022 15:20:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbiGKPUb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiGKPUa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jul 2022 11:20:30 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78905CE00;
        Mon, 11 Jul 2022 08:20:29 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a9so9397297ejf.6;
        Mon, 11 Jul 2022 08:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cnfAJe/WXrON+hzYDcI3/SEXE/mQyPp3cVRsfY90PD0=;
        b=FB/y12xGxuK3LKR7CMhiOjbf4U6Cbqh/myuQrj57Pdg06IXLL0XjJN9YdTzU9jwH8V
         Ds+UBeGM8vhc5DSb1+HZEOVy+IPXGnuNOHG/M4k9DdvoB8o5K1W4+au8tKyOBGh9gdij
         fljQhdT13x8pC1TTKimaMnQhwh/8BdRpwSjLNUEdBL0tOJXrEqPFc40WlUGxnm4ePOpJ
         dQezddbmGLgOqwf1yR6J+xuE5BUg0HNiTpZvXCQL/f1oB+g1bM1CmxMJFrei1oUI7jmC
         eXVS4H8OntRPIgndZrtDnJA/0wpG2gcLdznEyzHVMzOsSkko8VA98FmIuOgeX+KtY2+0
         hQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cnfAJe/WXrON+hzYDcI3/SEXE/mQyPp3cVRsfY90PD0=;
        b=tY3/BJBusnQ8YIkURJSJt/H2YfrXIywN9gFpDQoxYY+xysXSjPG7tJLsj4lmGPBYzK
         GWhiwdfGko/fOQtoaeuuHn/f1jYa+FZX/RVDYehJ/LUPu8izSRg3CJiArb9pBeuh8IzZ
         7ouurTj1l+ZTaLLcJJxSZOaC758o84vbjONWDCoudWX2gJuRWj+8Fc43ZvHte7r/d7oW
         jZXV8L1WWu/QZY31IHg70AN4CcU3+CcvRG1outdvDoGuPzDvBWSFHzm/Iy0UXFfymaSx
         MR3+AERTIdoQrnLQ5IHwkGKK36oQVCAhyMGNHzB4uRNeEan44WOQLjHEavyPMce3ReaF
         kv7Q==
X-Gm-Message-State: AJIora/h2qk/91pgYLKfrFIIU69OZqIZ8GnqYGiTNXLJaEBqRRuLT3nH
        dbZVRAuJ+dGJLuCnHh3u+Pk=
X-Google-Smtp-Source: AGRyM1t888CD3hwlRJuWkHHqX87MJ8DaVfnNQUeohIopyGnDJs31B8cj2f482PgDV9pBT4cCTyM6UQ==
X-Received: by 2002:a17:906:8479:b0:72a:5610:f151 with SMTP id hx25-20020a170906847900b0072a5610f151mr18806600ejc.125.1657552827945;
        Mon, 11 Jul 2022 08:20:27 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 14-20020a170906318e00b00715705dd23asm2767265ejy.89.2022.07.11.08.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:20:27 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marc Dietrich <marvin24@gmx.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: arm: tegra: nvec: Convert to json-schema
Date:   Mon, 11 Jul 2022 17:20:18 +0200
Message-Id: <20220711152020.688461-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152020.688461-1-thierry.reding@gmail.com>
References: <20220711152020.688461-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the NVIDIA embedded controller bindings from the free-form text
format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Marc,

you authored this binding a long time ago, which makes the default
license for this GPL-2.0. However, the preference is for DT bindings to
be dual-licensed under the more permissive GPL-2.0-only OR BSD-2-Clause
as done in this patch. Do you have any objections to relicensing?

Thierry

 .../bindings/arm/tegra/nvidia,nvec.txt        | 21 -----
 .../bindings/arm/tegra/nvidia,nvec.yaml       | 94 +++++++++++++++++++
 2 files changed, 94 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.yaml

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
diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.yaml
new file mode 100644
index 000000000000..c997faa42c31
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/tegra/nvidia,nvec.yaml#
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
+  clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: frequency of the I2C bus
+
+  request-gpios:
+    description: phandle to the GPIO used for EC request
+
+  slave-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: I2C address of the slave controller
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
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
+    nvec@7000c500 {
+      compatible = "nvidia,nvec";
+      reg = <0x7000c500 0x100>;
+      interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      clock-frequency = <80000>;
+      request-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
+      slave-addr = <138>;
+      clocks = <&tegra_car TEGRA20_CLK_I2C3>,
+               <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
+      clock-names = "div-clk", "fast-clk";
+      resets = <&tegra_car 67>;
+      reset-names = "i2c";
+    };
-- 
2.36.1

