Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F772C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B263613A3
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235986AbhKSOmY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:42:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbhKSOmY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:42:24 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E62C061574;
        Fri, 19 Nov 2021 06:39:22 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id c4so18513286wrd.9;
        Fri, 19 Nov 2021 06:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Npk8T09MN3u7MPB/kTqp1CMriQODziO/BDGRUCLRDHg=;
        b=Gh3PkeeZL/gj5+pnoDmcs86bzqehgJ7giTtUokIwqiW+bbevRAH3ofCcrr5b/Iqczs
         VPpqce/BofQh023pvGr5ByNXw1YklQXkKg0QgwF89rrCoerd0USWSl7bABLPRuY2ShyD
         +kUNzOfmJwpK3AaEqjspd/5BbL9l/0eKNKX5zt90J54U9bxfQO7aG2K3U28/hXXQunLc
         8qUsmgs+HyXdc0ChqeeSVAQPHgKQ5LxQC50KixaiqFsipE3RK3buw5T8/l4KUSKavNvn
         Irwk6i2urrdKFXxdfg3BNLEzRT0xIeqQl/sjejCRZubEDoFlTY/VtqqPapLxxD0CKCIN
         y94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Npk8T09MN3u7MPB/kTqp1CMriQODziO/BDGRUCLRDHg=;
        b=ql6V9EciQfZcKx/0jGd7KnXXJArk4qhvhn4VBj4Y15X4IBK1ITPaCeb5lOG7lI/+DP
         iD9lcvjs4qGM6p/bR+GYZvyDxb/0a1YXhutKznWdss0y4AnwgaseHi7955VYxAfYvXCz
         HmVGyV+rBh3p01Xj5YrGtj2rqHTbCfgXNmFvyG+Nuy1mRENyFOMiZjeQtXYddHo45VhV
         3gwU+jxV6MLvRbm/4zr4r7GPqg1X9YiTtVdNBJqm6gZkvGIduIaAap1/ECE6PdqFnpUv
         DcrpBUx3u2Yv+7w0+oNfa3Jr7fhF3yRqdLMGsgyW4nnecueZhOoHkDPsEgWvI++3CxwR
         i49Q==
X-Gm-Message-State: AOAM532wA91pYymk9DKg4nCN7SXBQNMGxa+DWzPISHY1LuvvnCuz5JyR
        NmUeKDJYIS3kw6Cwubju19kM2DxsLUpO/g==
X-Google-Smtp-Source: ABdhPJzsEgjlrZDt9AzKuHvWrRW6Y6rapVr6FtfNi6HqQqW6VdEzp6fnnGIjspLTKxPMR7MZnwJFAA==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr7849359wru.108.1637332760691;
        Fri, 19 Nov 2021 06:39:20 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id j17sm4490850wmq.41.2021.11.19.06.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:39:19 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 14/16] dt-bindings: thermal: tegra186-bpmp: Convert to json-schema
Date:   Fri, 19 Nov 2021 15:38:37 +0100
Message-Id: <20211119143839.1950739-15-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the Tegra186 (and later) BPMP thermal device tree bindings from
the free-form text format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../thermal/nvidia,tegra186-bpmp-thermal.txt  | 33 ---------------
 .../thermal/nvidia,tegra186-bpmp-thermal.yaml | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.txt b/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.txt
deleted file mode 100644
index fc87f6aa1b8f..000000000000
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-NVIDIA Tegra186 BPMP thermal sensor
-
-In Tegra186, the BPMP (Boot and Power Management Processor) implements an
-interface that is used to read system temperatures, including CPU cluster
-and GPU temperatures. This binding describes the thermal sensor that is
-exposed by BPMP.
-
-The BPMP thermal node must be located directly inside the main BPMP node. See
-../firmware/nvidia,tegra186-bpmp.txt for details of the BPMP binding.
-
-This node represents a thermal sensor. See Documentation/devicetree/bindings/thermal/thermal-sensor.yaml for details of the
-core thermal binding.
-
-Required properties:
-- compatible:
-    Array of strings.
-    One of:
-    - "nvidia,tegra186-bpmp-thermal"
-    - "nvidia,tegra194-bpmp-thermal"
-- #thermal-sensor-cells: Cell for sensor index.
-    Single-cell integer.
-    Must be <1>.
-
-Example:
-
-bpmp {
-	...
-
-	bpmp_thermal: thermal {
-		compatible = "nvidia,tegra186-bpmp-thermal";
-		#thermal-sensor-cells = <1>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml
new file mode 100644
index 000000000000..c91fd07e4061
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/nvidia,tegra186-bpmp-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra186 (and later) BPMP thermal sensor
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  In Tegra186, the BPMP (Boot and Power Management Processor) implements
+  an interface that is used to read system temperatures, including CPU
+  cluster and GPU temperatures. This binding describes the thermal
+  sensor that is exposed by BPMP.
+
+  The BPMP thermal node must be located directly inside the main BPMP
+  node. See ../firmware/nvidia,tegra186-bpmp.yaml for details of the
+  BPMP binding.
+
+  This node represents a thermal sensor. See
+
+    Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
+
+  for details of the core thermal binding.
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra186-bpmp-thermal
+      - nvidia,tegra194-bpmp-thermal
+
+  '#thermal-sensor-cells':
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of cells needed in the phandle specifier to
+      identify a given sensor. Must be 1 and the single cell specifies
+      the sensor index.
+    const: 1
+
+additionalProperties: false
-- 
2.33.1

