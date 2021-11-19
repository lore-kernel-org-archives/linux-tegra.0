Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7183C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D2E6613A3
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235984AbhKSOmV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbhKSOmV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:42:21 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C99C061574;
        Fri, 19 Nov 2021 06:39:19 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 133so8757024wme.0;
        Fri, 19 Nov 2021 06:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LjZ/5bCfvgAYNU29SXvVCwSOZPvlGg9Q7EKb9yXZgRo=;
        b=Be5MYLq01UlHSFyrR33m71Fo4hQk1xcOQHyHP5jpm3gzUYCOTKqCbc+asS7eWYwj1w
         yJdFKNU9LlmfvRDArjx7VYyy1SEOUxxyR6wLNI612SLUBs0YmVon872MdAkHDJNbj8R9
         Ef1jTL9Z2d6tqBvCiHPM07PsFWgTvOiEwXD5SAuqGxuo4O2BERJ8BoSsehuqhSuiERMH
         sMfno5EGPmlavQbDh6Ny+OequZvSH5FTO+qOnZQ0LTb1kg7FjgmknxJwYUKBzs/3knf7
         F0rjuYgZCGqsfLv5EmA5oYcjOrFRVfObstEurzx0ETUa5K6jpn91KGL7v1hylARkeXTb
         dsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LjZ/5bCfvgAYNU29SXvVCwSOZPvlGg9Q7EKb9yXZgRo=;
        b=OfwU9JYizzVLg3MZI1sRyhU0L1ZjZn+Kz6CBVkdZGYQ2tBPPoA0myIL1YcHoFcUD1d
         7vlUHSyDOoWVJTOM4LMt8ostH+G9ac2CR0xMq6MNDZKRmDt5rC5PxhILSJYquXRY0lot
         jnvdXa13X+5WmkuSAhMzGFh69a/NmfDTNiY9Ta3lOboO6Y59MKRtMPqjWOLBo8GG5Tmg
         qvB3qCiwMXvXNvkrNFyBqDwVe+mPg1wAG6QBRAE/owWJsn3LX0R7HWTwLDPjtzdmpeIl
         rrYCrdaij+xo9hUesZwnSEUIPXj31CcNE2RXqv6f7KptL9NXDmkXuSijNffi4RgKNGms
         xe4g==
X-Gm-Message-State: AOAM532gZXIQOtW2PxhpWALr0IrQyZS/DMpmFDENujXNK2nLCLHVLNCz
        zilybcYp8JyVf2oSyBo8ulc=
X-Google-Smtp-Source: ABdhPJxECfuHdw6S+QsoLt9aJ60lGEzdgS/Jf1mvcUO0WMdK2eAvE7Y9wAbwRhJhddzzI4Uj2WR0Hw==
X-Received: by 2002:a05:600c:500d:: with SMTP id n13mr142526wmr.174.1637332758158;
        Fri, 19 Nov 2021 06:39:18 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id s24sm2964761wmj.26.2021.11.19.06.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:39:17 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 13/16] dt-bindings: i2c: tegra-bpmp: Convert to json-schema
Date:   Fri, 19 Nov 2021 15:38:36 +0100
Message-Id: <20211119143839.1950739-14-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
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
Changes in v2:
- add missing additionalProperties: false

 .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt | 42 -------------------
 .../i2c/nvidia,tegra186-bpmp-i2c.yaml         | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 42 deletions(-)
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
index 000000000000..351e12124959
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
@@ -0,0 +1,42 @@
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  nvidia,bpmp-bus-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Indicates the I2C bus number this DT node represents,
+      as defined by the BPMP firmware.
+
+additionalProperties: false
-- 
2.33.1

