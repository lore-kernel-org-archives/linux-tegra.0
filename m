Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECA2EB64DD
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 15:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbjGEPwd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 11:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232744AbjGEPwa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 11:52:30 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 402EC173E;
        Wed,  5 Jul 2023 08:52:29 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-313e09a5b19so835617f8f.0;
        Wed, 05 Jul 2023 08:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688572348; x=1691164348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fABguDt96MTqNU6LI534/ldIxROywgL2RVsqvPcPS+g=;
        b=XRIbNER4buof7DyC+vM63shCft46V7IxwhUeJvR9zFdvRZVCJAJwdvYTxG5ec+crDj
         bQ+Hid9sYABqpygY9YWsadxaSxjMoZzX93YL0HnBCKqC30f/bSKL/ltyPQXDZF0OKkCE
         RdKCiNZGQAwdobZRdhtNI+CzxJf9ecGqrmjD06V602yxiyX/doOtN10mqMpKl1fvBdiG
         uEt9hm9HcLtTwHwLNH0vBg28DClCqX1fe0PskYHpEIzLpRshJDDDkvzlo4zzMoHr6WNA
         SoIVEy/YJ1CZghoDVH2qbTKpo+5vxPt9tl+isPdqM9YJaaQnmm18/XmZqyuOx8ev7b0F
         Tukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688572348; x=1691164348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fABguDt96MTqNU6LI534/ldIxROywgL2RVsqvPcPS+g=;
        b=ba9Rm9kRjKF5McRyKQ7PhJrJlRYwCt4tP+PaCQNd6jtoIREqzWXqwEIlT95XM4Gz3S
         g6fGlUpXE6b1OUNl1CBY+FLBe79Ddg+Xid8eWr5EShdZMZOOm2Q9jS1JI5+pJcq/Q1M5
         g7kaWhqA8zTs5WjxkUEe3BmbIxh+AsuCt0wcYhQj8NjXQSensCpPhODkw4h+f1fqOp8F
         xsLVWj81XD7lNmJWDl5byeBRx8Ti+Yvd7b/zuqUHuqRHn80tA65M+JaQqa828jdUgrHm
         Z15FqLl9S/ZAiWjMaXgzL40mdyG/QOTmc7/W2UCSG8Ph1MjluueSILsDI9sUEt2k3wYV
         +gqQ==
X-Gm-Message-State: ABy/qLZWd0rXCpzr5vyIvE8nGsdVJYd4FL/LOkQ4IwL/aLA+BpyYckdR
        u8pTUKwmR586Z99yOs0UwNj4LAiZPUk=
X-Google-Smtp-Source: APBJJlHVOYXVL6U+T1n2B1fMz4asSKGfNVUR2HRgEej+n4ovAmDNNvs+BrwD+MuLCTYcaRKcZEjf8A==
X-Received: by 2002:a5d:42c6:0:b0:314:98f:2495 with SMTP id t6-20020a5d42c6000000b00314098f2495mr2399171wrr.12.1688572347537;
        Wed, 05 Jul 2023 08:52:27 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r3-20020adfda43000000b0030ae3a6be4asm31462132wrl.72.2023.07.05.08.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 08:52:27 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: arm: tegra: ahb: Convert to json-schema
Date:   Wed,  5 Jul 2023 17:52:21 +0200
Message-ID: <20230705155222.2519728-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705155222.2519728-1-thierry.reding@gmail.com>
References: <20230705155222.2519728-1-thierry.reding@gmail.com>
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
Changes in v2:
- collate all single entry compatibles into an enum
- use 4 spaces for indentation in example
- move to soc/tegra directory

 .../bindings/arm/tegra/nvidia,tegra20-ahb.txt | 17 --------
 .../soc/tegra/nvidia,tegra20-ahb.yaml         | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
 create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-ahb.yaml

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
diff --git a/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-ahb.yaml b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-ahb.yaml
new file mode 100644
index 000000000000..2f7269a26b8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-ahb.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/tegra/nvidia,tegra20-ahb.yaml#
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
+      - enum:
+          - nvidia,tegra20-ahb
+          - nvidia,tegra30-ahb
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
+        compatible = "nvidia,tegra20-ahb";
+        reg = <0x6000c004 0x10c>; /* AHB Arbitration + Gizmo Controller */
+    };
-- 
2.41.0

