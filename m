Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED60DC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA4FB60EE4
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235966AbhKSOmG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:42:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhKSOmG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:42:06 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95EF7C061574;
        Fri, 19 Nov 2021 06:39:04 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id y196so8708220wmc.3;
        Fri, 19 Nov 2021 06:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CQxCnPcAPbozA2Unzyb1BDSDrGy+z8YGUBHGD0vjHKA=;
        b=Gci5VyVHTqf1lB328y24FBP7t8yi7uP18OIw71G4rDqcHzQzV47zsBtjZ3hw+kDJWf
         pC/FwJsNs5Vat0o+l5ks74qdZtTkKf/Pl1xIIdqpop6esB/mPyrGb2pbQH8ngNlxUWjP
         mBHbRUazjBoDg+FRDmyh25qnfxU0Y+PgfPGvtEkwHf3QWTWDEgSktp6P6LYpJNk7qVBn
         4WR903htchz63AgSpuUAw9gQOM8aAr4X7/JVvOpv/TVp/NEmNY5IAIycFPDF50i1MvFJ
         1JL6tU+JZw2vdt/IedLEBVIAAwlEhXUt+2aiPoP9SscSiHR6UdMTTEa9T7wC0+O4B9zw
         maRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CQxCnPcAPbozA2Unzyb1BDSDrGy+z8YGUBHGD0vjHKA=;
        b=FaDESd20d85ubgVSeGXKLoNFOjtZ8J5FA/U6KjYCq2khBJCHSeEySFmJ8pOPU2FP9i
         6zCSFJfQqm6hvzIZzXtT8RDcaxv+PiY9N09m6eNMnW+xGyMat5dFDrbh36IUgwIfn93e
         8iFAP7LXie6hZPnbvvyGiSir5vbifO2xCIlci7Z8iwjzyObQDoysEGjC3JVe2JOzJung
         WVl5J9tksnDUL9lh0GEMMaK2hS+T/3to0cxX9SRpBNf1PzOC+6P+8iWAottt9tkM7aHT
         vebe72L5Fe8OFBHFWhPNmKDAkt1x5KxuRII9jS3juhR239Gei6RcBADckRxn9J0qid9i
         tijg==
X-Gm-Message-State: AOAM532fijRxY8JTPOvXgwSdq63p9nKQaNER5Avm15KlKtReQNKtsPhd
        Hv0uYuEP4C+NB+OMM/bZJa4=
X-Google-Smtp-Source: ABdhPJxhdNtCfz2zPSLVc8pZFLWoFagwwEYOpBucfpd3lI7H7Ty//JolA4XHo2ZA/dI4WFlD7m7sRA==
X-Received: by 2002:a1c:4d15:: with SMTP id o21mr76615wmh.171.1637332743117;
        Fri, 19 Nov 2021 06:39:03 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id p12sm3208028wro.33.2021.11.19.06.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:39:02 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 07/16] dt-bindings: fuse: tegra: Convert to json-schema
Date:   Fri, 19 Nov 2021 15:38:30 +0100
Message-Id: <20211119143839.1950739-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the NVIDIA Tegra FUSE bindings from the free-form text format to
json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add missing additionalProperties: false

 .../bindings/fuse/nvidia,tegra20-fuse.txt     | 42 ----------
 .../bindings/fuse/nvidia,tegra20-fuse.yaml    | 81 +++++++++++++++++++
 2 files changed, 81 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
 create mode 100644 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml

diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
deleted file mode 100644
index b109911669e4..000000000000
--- a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-NVIDIA Tegra20/Tegra30/Tegr114/Tegra124 fuse block.
-
-Required properties:
-- compatible : For Tegra20, must contain "nvidia,tegra20-efuse".  For Tegra30,
-  must contain "nvidia,tegra30-efuse".  For Tegra114, must contain
-  "nvidia,tegra114-efuse".  For Tegra124, must contain "nvidia,tegra124-efuse".
-  For Tegra132 must contain "nvidia,tegra132-efuse", "nvidia,tegra124-efuse".
-  For Tegra210 must contain "nvidia,tegra210-efuse". For Tegra186 must contain
-  "nvidia,tegra186-efuse". For Tegra194 must contain "nvidia,tegra194-efuse".
-  For Tegra234 must contain "nvidia,tegra234-efuse".
-  Details:
-  nvidia,tegra20-efuse: Tegra20 requires using APB DMA to read the fuse data
-	due to a hardware bug. Tegra20 also lacks certain information which is
-	available in later generations such as fab code, lot code, wafer id,..
-  nvidia,tegra30-efuse, nvidia,tegra114-efuse and nvidia,tegra124-efuse:
-	The differences between these SoCs are the size of the efuse array,
-	the location of the spare (OEM programmable) bits and the location of
-	the speedo data.
-- reg: Should contain 1 entry: the entry gives the physical address and length
-       of the fuse registers.
-- clocks: Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: Must include the following entries:
-  - fuse
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must include the following entries:
- - fuse
-
-Example:
-
-	fuse@7000f800 {
-		compatible = "nvidia,tegra20-efuse";
-		reg = <0x7000f800 0x400>,
-		      <0x70000000 0x400>;
-		clocks = <&tegra_car TEGRA20_CLK_FUSE>;
-		clock-names = "fuse";
-		resets = <&tegra_car 39>;
-		reset-names = "fuse";
-	};
-
-
diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
new file mode 100644
index 000000000000..8d608e722ab2
--- /dev/null
+++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fuse/nvidia,tegra20-fuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra FUSE block
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra20-efuse
+          - nvidia,tegra30-efuse
+          - nvidia,tegra114-efuse
+          - nvidia,tegra124-efuse
+          - nvidia,tegra210-efuse
+          - nvidia,tegra186-efuse
+          - nvidia,tegra194-efuse
+
+      - items:
+          - const: nvidia,tegra132-efuse
+          - const: nvidia,tegra124-efuse
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: fuse
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: fuse
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - nvidia,tegra20-efuse
+          - nvidia,tegra30-efuse
+          - nvidia,tegra114-efuse
+          - nvidia,tegra124-efuse
+          - nvidia,tegra132-efuse
+          - nvidia,tegra210-efuse
+then:
+  required:
+    - resets
+    - reset-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+
+    fuse@7000f800 {
+        compatible = "nvidia,tegra20-efuse";
+        reg = <0x7000f800 0x400>;
+        clocks = <&tegra_car TEGRA20_CLK_FUSE>;
+        clock-names = "fuse";
+        resets = <&tegra_car 39>;
+        reset-names = "fuse";
+    };
-- 
2.33.1

