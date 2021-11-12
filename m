Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2ECC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 851EC61038
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234927AbhKLMI6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:08:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235010AbhKLMIw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:08:52 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61251C06120D;
        Fri, 12 Nov 2021 04:06:01 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id i12so6673669wmq.4;
        Fri, 12 Nov 2021 04:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VVYIZDn15I2C0Kl4HGeX5Mb3P/WZc0xghwN4nBOMhp4=;
        b=OeQ8/gsLJ8MMh9ILlCTcGkDdF7c6XocR8cbeJDOWbCV6vFFV+rXKI5taJdR2hIjrbe
         rHfTtsaPZFdWnIu38FxAXH1VhANGhmviAnXCkO/Y8aLWUBpRTjSr466JH46tmQEI/+3B
         k0QQ2fNkNhJYAK/tVpC6yMtyvgzS4rIpLBJhQuer8yFHBh42HFvZ9t1OeW84JDWN0Y+0
         tgz+CfF+s0ABC4XvnVuPmenXeLk8u7V3JvNbHnSoysiBHDXMxFQ0/QzoBLikp0g4jKbh
         ssIAjwxNENznvGok4k/p7DXoTnDzccWEcIkk5a//Q6rQEcXGS8pflv8U5ClN1IkJyyV2
         QfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VVYIZDn15I2C0Kl4HGeX5Mb3P/WZc0xghwN4nBOMhp4=;
        b=ME1rEhHbuYtEBfE40XW2uktFpTIM7xdacAlMplnOI4RN2gIcXUa56m2LVOq8CUbnZL
         oVv3P1tZ9MqP5DNEHbnTmJUELTD8DNV18JLjNYmXYqAyKYR6k46TdsZaoNGMnCn+Kj5h
         UrdlalCPyBIobs2U0BtxGi5sSxsq0HpSxB38D27FMu2vU89kEDNGclm0EmmEyVPg7Yop
         royEgKFNL4kLxQA8hED+CRfTR+Sfhtlrmn60OO6QXjXlTj6+V3SMfIysCrHAOxjXxWdG
         rOQW7+Pp31fEFeC1IFMjjzmI0LeBzWSSLuo+PBXsEVwWULmYbJYzVP2wmTirgWLl9/iH
         HMCQ==
X-Gm-Message-State: AOAM53228qef1tLdLAJd9WSrrfVAlKQKBYm6VZ735SaOPDSQeSJKb79O
        N+eTub0oUphZFWLm+9knV14=
X-Google-Smtp-Source: ABdhPJxRsF6Lpc/hbUzmWYDdRZP35gv+Atfdc3c4G+60IPhEE7qMqWoM6W33O0V0tH3OqraqcgPOkA==
X-Received: by 2002:a1c:a905:: with SMTP id s5mr34762056wme.150.1636718759957;
        Fri, 12 Nov 2021 04:05:59 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id j17sm6491201wmq.41.2021.11.12.04.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:05:59 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 13/15] dt-bindings: i2c: tegra-bpmp: Convert to json-schema
Date:   Fri, 12 Nov 2021 13:05:16 +0100
Message-Id: <20211112120518.3679793-14-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112120518.3679793-1-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com>
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
 .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt | 42 -------------------
 .../i2c/nvidia,tegra186-bpmp-i2c.yaml         | 40 ++++++++++++++++++
 2 files changed, 40 insertions(+), 42 deletions(-)
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
index 000000000000..f3a68097dd6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
@@ -0,0 +1,40 @@
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
-- 
2.33.1

