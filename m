Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C929C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:05:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7910861038
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:05:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234982AbhKLMIn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:08:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbhKLMIf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:08:35 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E81C061208;
        Fri, 12 Nov 2021 04:05:44 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d5so15129917wrc.1;
        Fri, 12 Nov 2021 04:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zTgoiDtftXkWEfv9C7aih70MwJ2a4O75MmxJfPyeLFI=;
        b=VE+L/nN/O5/CoFIOm2vKp6Ymd5kgFc4D5EUyLoIi6QrkWzzPB5r9OUA/zEV/iRfPBF
         IF84F06d5WCWpMX8yuAoSvAoMnsfiii2k5AxR6N45cYsxfzV28bCsIHXhpvfrFlN2iAv
         i7bi9+uJQ++Z097i8lxiX4DcvI6JnD7tOIvPBERapLbgJBeYA+JUfHDoem4ZiUcm3stg
         G+/CYZ7ISLB0fVj38LiDdR/PZfoUmBk+ck8Q057IlqwIey7Ofn97R6CyuvZwhvPgj8Uo
         tF/Wocl64V5sW08RmaT/Aj7gyCevP2uZop5M2U91tXm7fUg13WzupaRNByKYTD8qOA3Y
         Pv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zTgoiDtftXkWEfv9C7aih70MwJ2a4O75MmxJfPyeLFI=;
        b=wOtC9hHT8QN0AwV4zbTwYzCGiopyioaOJXlIZ1zdHyPk/Pvo5PHuQsPxT5mIRU941X
         uLPkcM7Ukq0W7CD8ZQ6h7PhQM3QA78svteyCFWJ3Qsm1QZXz8GItWtuBrI5x4WVuVdMc
         u3DvYCFPp8jzxZj7TWl3NVxEYF05nEavN/io/nrfS7Z5aQRHMDq/nDedaGtnSFixEpOy
         RTAViYllUDFTA//aevUSdRaLlJW7aSXyTCScXadFfmkJzryglibHpve/wPPF2M1X4Bq+
         yWlkFnF5j2VqZANjDw69TP/i0LJffh1spyQlmgeJVzKLaTfSbkok/sqgxTO5ViKwimEw
         8gmA==
X-Gm-Message-State: AOAM533gaiuEp4T863dNh+XO+P7I45z4zdfSCsatJw9mdrQ85nPvkHlp
        AvmMFLoZU9ow7AT70RwgMtY=
X-Google-Smtp-Source: ABdhPJyDucasfdmo8jsDajIz16QI8FiG1dgoMYnpX5upfM4tbn3zF6wtrWsTviOQD5D78iJ2nYbs0Q==
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr18415795wrr.11.1636718743455;
        Fri, 12 Nov 2021 04:05:43 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id f133sm5593467wmf.31.2021.11.12.04.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:05:42 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 07/15] dt-bindings: fuse: tegra: Convert to json-schema
Date:   Fri, 12 Nov 2021 13:05:10 +0100
Message-Id: <20211112120518.3679793-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112120518.3679793-1-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com>
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
 .../bindings/fuse/nvidia,tegra20-fuse.txt     | 42 ----------
 .../bindings/fuse/nvidia,tegra20-fuse.yaml    | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 42 deletions(-)
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
index 000000000000..9389be60c198
--- /dev/null
+++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
@@ -0,0 +1,79 @@
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

