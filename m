Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60FDC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91F6160F14
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235272AbhKSOlv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:41:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhKSOlv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:41:51 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BB2C061574;
        Fri, 19 Nov 2021 06:38:49 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id w29so18497510wra.12;
        Fri, 19 Nov 2021 06:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VypbopsrzjbLiXpW/5jIEdbTxIotLoER2uda7Lkx/6Q=;
        b=E8MR4yPts33q6YqyiWoLW3QODea4CH6/S3ndVqJH0rfWK4gj1wxg0gI8LZqwUPPdMg
         wKn2VOT1SOkoVBNhTrqTq/WMMpTd8rfQwgLxJ0r+/GKYKpC2araL3RKK9+xeo1AehVOL
         c3EnX63s+QTizlMCSWigcT2kRJtS7EROqYRKfDxIm3t+KUk7MPNMcZBlYSvPPhDWRlzT
         T7KejXwbuiezJKJ/Jy0CojeaQwLbueSLF1AmTjmUe92RGvmJ/HLFLxuPsLqNCivyg2M6
         GlYII7JCEyHqk8efiH4Fe/ObnUinQzRTXHWkRCUnc/5GdWIAsFWGevNroYSwOPNVmlnq
         9THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VypbopsrzjbLiXpW/5jIEdbTxIotLoER2uda7Lkx/6Q=;
        b=owHr1yiFThy99jhjrG8egR4xLzN0bewPpar7zWtRwj/Y2ZxiHOXJwvQaG/wcPG4Lz/
         lGw7HBo83JL0pnb/0EyqTDjZJEe25O+r3UIX0pFZ3kDUecE+p8k5SM4TUv//MXRnTV2G
         yCDPb9phcvVvDmhXsNVpvQ5kJqSmTAnfVSWFsUEb0EIvHCM6sjyX7PoZYH/0DJEBjHre
         dA1yMZrl2g5ygobMIY5FRyXmC2I4mX2CgQ3+B4hbWh+cEeUMn8SkKw+qbC1u5LBkaaCn
         jaah2STNG92z7GtKT0pbiJ+ktXHNXRKUoLVGRARhJHWvTMq8PO9r6e6YbBvzdESHbonf
         0wDQ==
X-Gm-Message-State: AOAM531d/mEXf0PzsQ4IoKtddFccPQKj+HpAXiwZ6E//fGr3HhrJkebL
        TA5uVbaPuu0cAj60OSqdpa0=
X-Google-Smtp-Source: ABdhPJzFs74+on7xCkmOV3NoFwJXILBSdfsRXBmcHap2Fx8sQB13xc4R+z3tf9yIfAA24S17dO0D8Q==
X-Received: by 2002:a5d:6dc3:: with SMTP id d3mr7881950wrz.159.1637332727926;
        Fri, 19 Nov 2021 06:38:47 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id 138sm7496538wma.17.2021.11.19.06.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:38:47 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 01/16] dt-bindings: misc: Convert Tegra MISC to json-schema
Date:   Fri, 19 Nov 2021 15:38:24 +0100
Message-Id: <20211119143839.1950739-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the device tree bindings for the MISC register block found on
NVIDIA Tegra SoCs from plain text to json-schema format.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/misc/nvidia,tegra186-misc.txt    | 14 -----
 .../bindings/misc/nvidia,tegra186-misc.yaml   | 43 ++++++++++++++++
 .../bindings/misc/nvidia,tegra20-apbmisc.txt  | 17 -------
 .../bindings/misc/nvidia,tegra20-apbmisc.yaml | 51 +++++++++++++++++++
 4 files changed, 94 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt
 create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml
 delete mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
 create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.yaml

diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt
deleted file mode 100644
index 43d777ed8316..000000000000
--- a/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-NVIDIA Tegra186 (and later) MISC register block
-
-The MISC register block found on Tegra186 and later SoCs contains registers
-that can be used to identify a given chip and various strapping options.
-
-Required properties:
-- compatible: Must be:
-  - Tegra186: "nvidia,tegra186-misc"
-  - Tegra194: "nvidia,tegra194-misc"
-  - Tegra234: "nvidia,tegra234-misc"
-- reg: Should contain 2 entries: The first entry gives the physical address
-       and length of the register region which contains revision and debug
-       features. The second entry specifies the physical address and length
-       of the register region indicating the strapping options.
diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml b/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml
new file mode 100644
index 000000000000..cacb845868f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/nvidia,tegra186-misc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra186 (and later) MISC register block
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: The MISC register block found on Tegra186 and later SoCs contains
+  registers that can be used to identify a given chip and various strapping
+  options.
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra186-misc
+      - nvidia,tegra194-misc
+      - nvidia,tegra234-misc
+
+  reg:
+    items:
+      - description: physical address and length of the registers which
+          contain revision and debug features
+      - description: physical address and length of the registers which
+          indicate strapping options
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    misc@100000 {
+        compatible = "nvidia,tegra186-misc";
+        reg = <0x00100000 0xf000>,
+              <0x0010f000 0x1000>;
+    };
diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
deleted file mode 100644
index 83f6a251ba3e..000000000000
--- a/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-NVIDIA Tegra APBMISC block
-
-Required properties:
-- compatible: Must be:
-  - Tegra20: "nvidia,tegra20-apbmisc"
-  - Tegra30: "nvidia,tegra30-apbmisc", "nvidia,tegra20-apbmisc"
-  - Tegra114: "nvidia,tegra114-apbmisc", "nvidia,tegra20-apbmisc"
-  - Tegra124: "nvidia,tegra124-apbmisc", "nvidia,tegra20-apbmisc"
-  - Tegra132: "nvidia,tegra124-apbmisc", "nvidia,tegra20-apbmisc"
-  - Tegra210: "nvidia,tegra210-apbmisc", "nvidia,tegra20-apbmisc"
-- reg: Should contain 2 entries: the first entry gives the physical address
-       and length of the registers which contain revision and debug features.
-       The second entry gives the physical address and length of the
-       registers indicating the strapping options.
-
-Optional properties:
-- nvidia,long-ram-code: If present, the RAM code is long (4 bit). If not, short (2 bit).
diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.yaml b/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.yaml
new file mode 100644
index 000000000000..6f504fa74007
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/nvidia,tegra20-apbmisc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra APBMISC block
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - nvidia,tegra210-apbmisc
+              - nvidia,tegra124-apbmisc
+              - nvidia,tegra114-apbmisc
+              - nvidia,tegra30-apbmisc
+          - const: nvidia,tegra20-apbmisc
+
+      - items:
+          - const: nvidia,tegra20-apbmisc
+
+  reg:
+    items:
+      - description: physical address and length of the registers which
+          contain revision and debug features
+      - description: physical address and length of the registers which
+          indicate strapping options
+
+  nvidia,long-ram-code:
+    description: If present, the RAM code is long (4 bit). If not, short
+      (2 bit).
+    type: boolean
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    apbmisc@70000800 {
+        compatible = "nvidia,tegra20-apbmisc";
+        reg = <0x70000800 0x64>, /* Chip revision */
+              <0x70000008 0x04>; /* Strapping options */
+    };
-- 
2.33.1

