Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3CCC43334
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jul 2022 15:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbiGKPU1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiGKPU1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jul 2022 11:20:27 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41BE7CE00;
        Mon, 11 Jul 2022 08:20:26 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id eq6so6687960edb.6;
        Mon, 11 Jul 2022 08:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wTu+cUyVm67/XnEYVu1jCf3AbukYLlOvv0/JzbYxvHI=;
        b=KC6EbrSpDy73y3WlSzo8MwvTpGUK1Git/9SSp2QIYbQhRPY9niOBB359xQLyKWE+I1
         m/ygzgk93Z5hsiEVeaJZSQick6AFccfFVJDE2OgdTLZQd/Re31TLS14mvxq/ZbYRX+gI
         7LpJayOonnqIbR89NhbmWQpYoiQwGVUKhzYN/p3A9WfpRPNlNXheppzpdD23TEJ2DE6K
         tYRcVRaWLEi7TN2bAbtzBKmz11IbFMO8z6XqUKcFkbWJ6CtqeXjACjEMr4sB/sf2hde9
         YXlp6SE+z8LJDEbx8/CL3yT8zQFyNXXOk68RB6TVpcsKgTsQ0rpcdFxzMRcsLjuRDBu3
         2MJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wTu+cUyVm67/XnEYVu1jCf3AbukYLlOvv0/JzbYxvHI=;
        b=XwhR8xIQzHbWKCcPSgcxEH9ugCoRRdfnmvGezuqJ7FGnZahNFYmwJ4nhZDtVRACeQx
         TKs0bS8Ga7hZ+I+x9yCVMU10FMc3hrIeXS/bz/IXvQjENvPdG6f6OrTvS0+7jALDfSI+
         QCG2O2uocO4TYTwTL3fGSsJGqCqNtFxAMMHml+Y3u5WIVsNI5P1yuLz9TBI07U1cWeph
         F+RWn/SHR5kVTVuxkstkvHur+R+hz9yhwbZISd924rI+4T4pFCPXM3lXV5+KWTFaOTBI
         M0bKR3BPPRUMwpshGcalOb59N0rBWrY3dnswYsj2/qARxkRgvVX62fHoTaa0xzFaUR09
         +xpA==
X-Gm-Message-State: AJIora8spXGOqZyX/8oBBY1CZcfQ6fnjM5wBpiR1KaurgJDzc3B4y4y9
        7kGSKXranr1T747WqglZPUI=
X-Google-Smtp-Source: AGRyM1tnjQQ/SbI6vQBKXIrGHkZgnghzoNqWod2XuAp81gRZjqdSL5DOdZ1gLVkcq8B6fWUK/Z6qAw==
X-Received: by 2002:a05:6402:1e8c:b0:43a:c57f:2cbb with SMTP id f12-20020a0564021e8c00b0043ac57f2cbbmr15202685edf.97.1657552824569;
        Mon, 11 Jul 2022 08:20:24 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h8-20020aa7cdc8000000b004355998ec1asm4459274edw.14.2022.07.11.08.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:20:23 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: arm: tegra: flowctrl: Convert to json-schema
Date:   Mon, 11 Jul 2022 17:20:16 +0200
Message-Id: <20220711152020.688461-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
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
 .../arm/tegra/nvidia,tegra20-flowctrl.txt     | 18 --------
 .../arm/tegra/nvidia,tegra20-flowctrl.yaml    | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.yaml

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
diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.yaml
new file mode 100644
index 000000000000..416739ad8c1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20-flowctrl.yaml#
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
2.36.1

