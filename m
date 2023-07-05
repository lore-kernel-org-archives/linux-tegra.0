Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D3CC001DE
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 15:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbjGEPwc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 11:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbjGEPw3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 11:52:29 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CCC71980;
        Wed,  5 Jul 2023 08:52:28 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc54cab6fso62542535e9.0;
        Wed, 05 Jul 2023 08:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688572347; x=1691164347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2/kSi53CG1eKE+d3z+4nF+Gv2i9Cq21A2aJTR7JHkU=;
        b=pImisVolPnAJxmulJVOtxagCpwTDHMTpo4cDdsl0fIGTenfObqG61eoiBC90HhvTtq
         odIIpVhSCC52rqx5bhbILZIQ/sc5kOufjVw3kK6APsbSVwPtzqZrJxoISAknXXcL9Bii
         PvDFkdmH3PjXMqx+LUj0+4GuHgw8O3o4I26T3OM7MX/WvUSNj5nG6tQVOiq6qSbMi1T2
         kscPdwEyDPYFNJFiNp0j5tNcEGBrVHX8z949ACGgMX52HKl2hQJEVnPEYUNVUICMhkFu
         Wkv6bHZKGeN5smVXkmjXcX8HiVxyqTXSNNstN2v+8KkLpL2QW7R9bETNOZZNbEhd+e7e
         ci0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688572347; x=1691164347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2/kSi53CG1eKE+d3z+4nF+Gv2i9Cq21A2aJTR7JHkU=;
        b=KvRudYt7zTPzgHn1XVJ6MXpKKmNi1vqWkm7/ZUJeC9cpjbzGQFaNm9UGBo4EOc0qrv
         UAWprd3n5/V6J6mJ02crERszfq1rotjR0Gz9vrd/Bc/IgGBsTe2gkWoZ0IUselMC0vWW
         vrI+RAn6pf2e4VnbmvVekf80Nt1dpcB+O0Y7cBhcaKEvUN39s3A2R5Eg0iBOICKhTWlE
         Xi3FHGRwhwBiZJST4t1wbNmtSES0Md4sxBgI6yZToCsQWBVYQah4uGGJU2ZDNgwJxv5S
         uCTDh2rvf6bYs9qDNrmEIUrQDOGcRcKc5ygYVh3UGRFqW63DPCsAyAL2PMOPtBwiAT4D
         iVUA==
X-Gm-Message-State: AC+VfDy4TTfa5oM1EiP75gsqz/CdMVSIvJwMcI32LB1XbpC3tpNCS0wc
        FKj2Wlh6oKElQIfvEskd1gE=
X-Google-Smtp-Source: ACHHUZ6+UpPe6OxvIrJMNJE0tCUOUJZvg3lL/rslPKUvg/TJFkGocLkCjJOx5rFoUN8w51+WkB+8ew==
X-Received: by 2002:a05:600c:22c3:b0:3fb:a1d0:a882 with SMTP id 3-20020a05600c22c300b003fba1d0a882mr13279526wmg.20.1688572346479;
        Wed, 05 Jul 2023 08:52:26 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n26-20020a7bcbda000000b003fbc30825fbsm2481820wmi.39.2023.07.05.08.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 08:52:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: arm: tegra: flowctrl: Convert to json-schema
Date:   Wed,  5 Jul 2023 17:52:20 +0200
Message-ID: <20230705155222.2519728-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the Tegra flow controller bindings from the free-form text
format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- move to soc/tegra directory (Krzysztof)

 .../arm/tegra/nvidia,tegra20-flowctrl.txt     | 18 --------
 .../soc/tegra/nvidia,tegra20-flowctrl.yaml    | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt
 create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-flowctrl.yaml

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt
deleted file mode 100644
index a855c1bffc0f..000000000000
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-NVIDIA Tegra Flow Controller
-
-Required properties:
-- compatible: Should contain one of the following:
-  - "nvidia,tegra20-flowctrl": for Tegra20
-  - "nvidia,tegra30-flowctrl": for Tegra30
-  - "nvidia,tegra114-flowctrl": for Tegra114
-  - "nvidia,tegra124-flowctrl": for Tegra124
-  - "nvidia,tegra132-flowctrl", "nvidia,tegra124-flowctrl": for Tegra132
-  - "nvidia,tegra210-flowctrl": for Tegra210
-- reg: Should contain one register range (address and length)
-
-Example:
-
-	flow-controller@60007000 {
-		compatible = "nvidia,tegra20-flowctrl";
-		reg = <0x60007000 0x1000>;
-	};
diff --git a/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-flowctrl.yaml b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-flowctrl.yaml
new file mode 100644
index 000000000000..705544b7f98f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-flowctrl.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/tegra/nvidia,tegra20-flowctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Flow Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra20-flowctrl
+          - nvidia,tegra30-flowctrl
+          - nvidia,tegra114-flowctrl
+          - nvidia,tegra124-flowctrl
+          - nvidia,tegra210-flowctrl
+
+      - items:
+          - const: nvidia,tegra132-flowctrl
+          - const: nvidia,tegra124-flowctrl
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    flow-controller@60007000 {
+        compatible = "nvidia,tegra20-flowctrl";
+        reg = <0x60007000 0x1000>;
+    };
-- 
2.41.0

