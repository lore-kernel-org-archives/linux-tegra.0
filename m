Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B51FC001E0
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 15:52:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232744AbjGEPwd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 11:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232492AbjGEPwb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 11:52:31 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBB6198A;
        Wed,  5 Jul 2023 08:52:30 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbc12181b6so77897345e9.2;
        Wed, 05 Jul 2023 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688572348; x=1691164348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIQyRzBGzTzBZQL4IQeClCh6Kbl/cczJt9nqtjEwyIg=;
        b=aInodbE9H0dvAhbNyLNsv8iCAwr/36wxk0tbKpqzUuXVXAiqWwqooeB1RsUc8SGCkQ
         8+zJfiCxKIp99apg+Fb+O+x3nteolwXMjV/+C2+n5IUHIRknLBhrgetOHpTnxA08zj41
         TNksZ64aoiP2oA89z+BdwhZ4exQFD2WcESINp7yF1nUkSvSMb6Z8lp77msQrpT4At5lt
         F/hwzVZwkDlmsBLBH2LDxVuLLdSLj8RrFzKyzL8ZHtKOkVm2vGu4WTK8oZW8+FRXq2aa
         EG/uExK389mszMuYgApcfNx4QMBnOhfReqPnzFukgVtjeURaPBolpAsmGtd3ByC/ueOt
         kk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688572348; x=1691164348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIQyRzBGzTzBZQL4IQeClCh6Kbl/cczJt9nqtjEwyIg=;
        b=GIIDgFdtOYsw9qNQp3NxJ5pUCF6k+bSA0j8+l4FE39LF6pcn9uMkmbQ4s2Th21mbPz
         6pLo5RX7B/33a1pD4EF8Y4R9AoivJszZr22ObFdvHIch3kW9h9OumOIQweqCU7SoewYb
         wPwWIh1FovNJOZjEhSE3KEY/GXTFT6j6nvoFThqfoFUYTQuFSP0b6ttCI+A1fd2rXCFM
         qChLN77XFW81otRcfLlOBEqkm1Yy22bDGGzbRb+QgoNRZW4a0dmcSbfh7fQBZ3c6pzoR
         LJbW5lhqsS6/qMW4PDmBH7VuEB4uDQzqRqyWJEPJ8ehh9J9vaxQKugfXE2BnMYXVjHK+
         LJ2w==
X-Gm-Message-State: AC+VfDy9iTw9lUr4pDw0osspJUJ63S2N8Mis2D46cqTPWD9AUFu5GN2i
        wRIZ2m2dhXKUalq+19vTNE8=
X-Google-Smtp-Source: ACHHUZ68n7kIULwsd4ifjIb4SHMy8bRmxOrsvSOtOeIc/hOIy3KXEBLZwihGjoXDTiZijSRXlW3pqA==
X-Received: by 2002:a7b:cbc7:0:b0:3fb:c15c:698a with SMTP id n7-20020a7bcbc7000000b003fbc15c698amr14808926wmi.4.1688572348566;
        Wed, 05 Jul 2023 08:52:28 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p1-20020a05600c204100b003fa96fe2bebsm2455134wmg.41.2023.07.05.08.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 08:52:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH v2 3/3] dt-bindings: arm: tegra: nvec: Convert to json-schema
Date:   Wed,  5 Jul 2023 17:52:22 +0200
Message-ID: <20230705155222.2519728-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705155222.2519728-1-thierry.reding@gmail.com>
References: <20230705155222.2519728-1-thierry.reding@gmail.com>
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
Changes in v2:
- drop $ref for standard clock-frequency property
- use 4 spaces for indentation in example
- move to soc/tegra directory

 .../bindings/arm/tegra/nvidia,nvec.txt        | 21 -----
 .../bindings/soc/tegra/nvidia,nvec.yaml       | 92 +++++++++++++++++++
 2 files changed, 92 insertions(+), 21 deletions(-)
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
index 000000000000..0b4f898b2a1d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml
@@ -0,0 +1,92 @@
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
+        compatible = "nvidia,nvec";
+        reg = <0x7000c500 0x100>;
+        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
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

