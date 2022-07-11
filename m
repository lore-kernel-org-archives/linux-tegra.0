Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE982CCA47B
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jul 2022 15:20:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbiGKPU3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiGKPU2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jul 2022 11:20:28 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8496CE00;
        Mon, 11 Jul 2022 08:20:27 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id b11so9378309eju.10;
        Mon, 11 Jul 2022 08:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h5gtdbHKuHCnRNnjB1FkKh1pxZFvIslnnJHoDKnfMjw=;
        b=Kne6cbNrZk11oZbX1a2QjLJQ8ohuxDpVL2qw+RKE0twX1amma5/Xqpah4tcLWcppA7
         Dzkorp23taPHDeyYB1P8eD87qk5LOg0ezlXMQHgUDe6FjMI+bsMcdUSzcHnMKI5AFtZh
         aMlDIBifGm2u2L0/Y3P+mSd67vxxl+LjauIb5Dqap1lOOhyz3CEB7y5mHgzJKMnUZnBH
         HUj//YDGDeBcX+Did06O7KzaWNV8RpqkrxWl3plwOyXJGloNRHFcAyTBhChg8uVEy1N+
         5T43dZylmy1T31FVkqCsPqpC79dt4h6czr/ui12BdZcNTW917YhRh+TnrRhjDBhaUF4y
         IGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h5gtdbHKuHCnRNnjB1FkKh1pxZFvIslnnJHoDKnfMjw=;
        b=U8b152JUE2IexMBxt+FSrWyIvCtFdqT0llE4Yf9ivoC2cfZUPL4MguqHsSSD66wb86
         blSxwLMQNaZDaFncx9/bxNdgvJqOtW5ARhbmXSke/74YEQ6sRVivT7l51sVHIsD8wJFW
         5fFANn+bFj1vJNRLgJjBNgo4rjTin6Tg3gE2L/GuUgX4sfNNNclxE4UqWv5tyNQLn6RC
         ogjzMbCiSlBz4ea2Nsp7DGjacD4oCeD0FoWDt8S8cGlvbZCvcHlRD/kq5slIVVWKyCrx
         CxG8uM/uNJhgzPvuU9WbbGLbVzw+k/9kyWZzFDJMTqr3h56A6v4eNuj6ws0/mTZZiGR1
         D0Sw==
X-Gm-Message-State: AJIora8hc+oZaXWDhLJx3Gyexn91Cc/qt5a/FwSGVml2yRHTaBQ439QE
        Uf5/+fFlG3G9/jSCX8Bm3zs=
X-Google-Smtp-Source: AGRyM1vfmJM7CTKQmWx8yY9R7xPm256zvQyg99TTiwmCOT4a9gLVD4P+mKIKa7tB0lnTJ/TuDt+CVw==
X-Received: by 2002:a17:906:84fa:b0:72b:3257:527b with SMTP id zp26-20020a17090684fa00b0072b3257527bmr14944847ejb.477.1657552826314;
        Mon, 11 Jul 2022 08:20:26 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l6-20020a170906938600b006fec56c57e6sm2755558ejx.46.2022.07.11.08.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:20:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: arm: tegra: ahb: Convert to json-schema
Date:   Mon, 11 Jul 2022 17:20:17 +0200
Message-Id: <20220711152020.688461-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152020.688461-1-thierry.reding@gmail.com>
References: <20220711152020.688461-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the NVIDIA Tegra AHB bindings from the free-form text format to
json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/arm/tegra/nvidia,tegra20-ahb.txt | 17 --------
 .../arm/tegra/nvidia,tegra20-ahb.yaml         | 39 +++++++++++++++++++
 2 files changed, 39 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.yaml

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
deleted file mode 100644
index 9a4295b54539..000000000000
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-NVIDIA Tegra AHB
-
-Required properties:
-- compatible : For Tegra20, must contain "nvidia,tegra20-ahb".  For
-  Tegra30, must contain "nvidia,tegra30-ahb".  Otherwise, must contain
-  '"nvidia,<chip>-ahb", "nvidia,tegra30-ahb"' where <chip> is tegra124,
-  tegra132, or tegra210.
-- reg : Should contain 1 register ranges(address and length).  For
-  Tegra20, Tegra30, and Tegra114 chips, the value must be <0x6000c004
-  0x10c>.  For Tegra124, Tegra132 and Tegra210 chips, the value should
-  be be <0x6000c000 0x150>.
-
-Example (for a Tegra20 chip):
-	ahb: ahb@6000c004 {
-		compatible = "nvidia,tegra20-ahb";
-		reg = <0x6000c004 0x10c>; /* AHB Arbitration + Gizmo Controller */
-	};
diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.yaml
new file mode 100644
index 000000000000..6d9baab76258
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20-ahb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+title: NVIDIA Tegra AHB
+
+properties:
+  compatible:
+    oneOf:
+      - const: nvidia,tegra20-ahb
+      - const: nvidia,tegra30-ahb
+      - items:
+          - enum:
+              - nvidia,tegra114-ahb
+              - nvidia,tegra124-ahb
+              - nvidia,tegra210-ahb
+          - const: nvidia,tegra30-ahb
+
+  reg:
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    ahb@6000c004 {
+      compatible = "nvidia,tegra20-ahb";
+      reg = <0x6000c004 0x10c>; /* AHB Arbitration + Gizmo Controller */
+    };
-- 
2.36.1

