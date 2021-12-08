Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03ED8C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Dec 2021 14:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235168AbhLHOgp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Dec 2021 09:36:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231398AbhLHOgo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 09:36:44 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B263DC061746;
        Wed,  8 Dec 2021 06:33:12 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id i5so4445453wrb.2;
        Wed, 08 Dec 2021 06:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=39lIMxgrwq27ig8P6denT2mMVO2CMALEl/L6qk1MSlw=;
        b=JtEhhV/3OsCVNKtVxGRsPOCwZjA+3WyQQxXW/Nx43mO38j/E0IHJV9ERxxaLvYlBzZ
         dKP/hHDAxYOCj+ZdmCGdM6cZX+k8LTiGOpSlqhYmzoceA4lYh7mI6AoGcxx06LxnPRfW
         pjHJMc5J2QxFMsWP206FOyky5k4pX8UZekvaw3tGtw3T5DvgX5wyp4WYLXPjhKkE6+Xw
         o8qqBb5TfDjnwp+fe2ALenIm/ap9PXi7jYagITFqA9/av8Xj3kNofUKIKkzO58ewdZpt
         mqQ2GDh8Bf1quM2t5CrWn1Blf07iEMmgsv8fhKX8Zjx9GYeMN2cOG07CjGAAdz5oq11m
         T5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=39lIMxgrwq27ig8P6denT2mMVO2CMALEl/L6qk1MSlw=;
        b=Ttk88ENw9wITUu2wRwKPzy23U+kLXQkg6APl8vtH+7vJ2Iz6rIUjqLGrRwpBdcPqU8
         QAkyY6d1BVvZVxLjtqxHRC0u5QBgvRq33ZckrcGsyJjVsKlchPEh5CoJalal/rinoHSH
         zvmQbmNOBKzmwTNFGrRytKYBujyaE3aTMdXMkZpNiiMQUsraFqXIdIUIEMoRYtizBvm6
         7kB1NoXnoYtVAM3H5bZwSuIwmcazC07zzJ1wnKVSASkmZLcdHDkkGoGAA7NdAmlYWaQo
         xh2PVFkPXSQG1oSeqFt+qaOqAjHArGnLgp8eBoVl9jJdjwdO7LSUb5TMP81fRAiNL63g
         9/Rw==
X-Gm-Message-State: AOAM533hYkywAe+t0LcDRAglVA5YFMg/r8ZS7UGcm2L8LooQypKWxrSY
        7rfMVa3Gs1gZVZ0xFXCGQRc=
X-Google-Smtp-Source: ABdhPJwWTNyt+tu68nlcPAXHYCsr3Kz0aNCgZ4k+O7Z3QNsjkhCB6o73TXh/P52/hWhGUrIOiKKRnQ==
X-Received: by 2002:adf:e84d:: with SMTP id d13mr59588374wrn.72.1638973991225;
        Wed, 08 Dec 2021 06:33:11 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id h16sm3118034wrm.27.2021.12.08.06.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 06:33:10 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3] dt-bindings: i2c: tegra-bpmp: Convert to json-schema
Date:   Wed,  8 Dec 2021 15:33:06 +0100
Message-Id: <20211208143306.534700-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the NVIDIA Tegra186 (and later) BPMP I2C bindings from the
free-form text format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- include i2c-controller.yaml and use unevaluatedProperties: false

Changes in v2:
- add missing additionalProperties: false

 .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt | 42 -----------------
 .../i2c/nvidia,tegra186-bpmp-i2c.yaml         | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
deleted file mode 100644
index ab240e10debc..000000000000
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-NVIDIA Tegra186 BPMP I2C controller
-
-In Tegra186, the BPMP (Boot and Power Management Processor) owns certain HW
-devices, such as the I2C controller for the power management I2C bus. Software
-running on other CPUs must perform IPC to the BPMP in order to execute
-transactions on that I2C bus. This binding describes an I2C bus that is
-accessed in such a fashion.
-
-The BPMP I2C node must be located directly inside the main BPMP node. See
-../firmware/nvidia,tegra186-bpmp.txt for details of the BPMP binding.
-
-This node represents an I2C controller. See ../i2c/i2c.txt for details of the
-core I2C binding.
-
-Required properties:
-- compatible:
-    Array of strings.
-    One of:
-    - "nvidia,tegra186-bpmp-i2c".
-- #address-cells: Address cells for I2C device address.
-    Single-cell integer.
-    Must be <1>.
-- #size-cells:
-    Single-cell integer.
-    Must be <0>.
-- nvidia,bpmp-bus-id:
-    Single-cell integer.
-    Indicates the I2C bus number this DT node represent, as defined by the
-    BPMP firmware.
-
-Example:
-
-bpmp {
-	...
-
-	i2c {
-		compatible = "nvidia,tegra186-bpmp-i2c";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		nvidia,bpmp-bus-id = <5>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
new file mode 100644
index 000000000000..b8319dcf3d8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nvidia,tegra186-bpmp-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra186 (and later) BPMP I2C controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  In Tegra186 and later, the BPMP (Boot and Power Management Processor)
+  owns certain HW devices, such as the I2C controller for the power
+  management I2C bus. Software running on other CPUs must perform IPC to
+  the BPMP in order to execute transactions on that I2C bus. This
+  binding describes an I2C bus that is accessed in such a fashion.
+
+  The BPMP I2C node must be located directly inside the main BPMP node.
+  See ../firmware/nvidia,tegra186-bpmp.yaml for details of the BPMP
+  binding.
+
+  This node represents an I2C controller. See ../i2c/i2c.txt for details
+  of the core I2C binding.
+
+properties:
+  compatible:
+    const: nvidia,tegra186-bpmp-i2c
+
+  nvidia,bpmp-bus-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Indicates the I2C bus number this DT node represents,
+      as defined by the BPMP firmware.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - nvidia,bpmp-bus-id
-- 
2.34.1

