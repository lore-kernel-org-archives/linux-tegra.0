Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDC8C64E7D
	for <linux-tegra@archiver.kernel.org>; Wed, 18 Nov 2020 08:07:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3390A21D7A
	for <linux-tegra@archiver.kernel.org>; Wed, 18 Nov 2020 08:07:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="mY8ZItWG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbgKRIGo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 18 Nov 2020 03:06:44 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:12005 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgKRIGm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Nov 2020 03:06:42 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb4d6070000>; Wed, 18 Nov 2020 00:06:31 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Nov
 2020 08:06:40 +0000
Received: from audio.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 18 Nov 2020 08:06:38 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <broonie@kernel.org>
CC:     <jonathanh@nvidia.com>, <sharadg@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 2/3] dt-bindings: tegra: Convert HDA doc to json-schema
Date:   Wed, 18 Nov 2020 13:36:21 +0530
Message-ID: <1605686782-29469-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605686782-29469-1-git-send-email-spujar@nvidia.com>
References: <1605686782-29469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605686791; bh=aoJcYwi5/UenP9bLitxom4hRAg/DI2I1tYEOVWyMeuY=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=mY8ZItWGAP8elYufCNd5Da4m3C0jLMu3TUT4NZZ5gFwbs69X2J6nsxOaDAkCDHZet
         t0XkD16DGDNCoQ9JLY9QRff4VAkLekBCyEg247QccWeqG/jGu9BLtzuOJuZp8Wauwl
         OHwKJCQ2U6j9plHPXuYjCv5PqNQIey0lA0ziJxvpgsslAlsO65lK8cGLhd6s2eb6x4
         uA4ypVrUvviaIvL7+m5xx5445OKu9rOdVQlDi3AcIRMceORHDW3Q1YUsYASraTzKu4
         PJrMAvvEyN+4TSTeQRG7xC5ptVDzT/Eaex2fFq05v1SZHqYOqvL1Qg0KFcJ147qi38
         BdL2BFMv+l/Uw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert Tegra HDA doc to YAML format.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../bindings/sound/nvidia,tegra30-hda.txt          | 35 --------
 .../bindings/sound/nvidia,tegra30-hda.yaml         | 98 ++++++++++++++++++++++
 2 files changed, 98 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
deleted file mode 100644
index 21cd310..0000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-NVIDIA Tegra30 HDA controller
-
-Required properties:
-- compatible : For Tegra30, must contain "nvidia,tegra30-hda".  Otherwise,
-  must contain '"nvidia,<chip>-hda", "nvidia,tegra30-hda"', where <chip> is
-  tegra114, tegra124, or tegra132.
-- reg : Should contain the HDA registers location and length.
-- interrupts : The interrupt from the HDA controller.
-- clocks : Must contain an entry for each required entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries: hda, hda2hdmi, hda2codec_2x
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries: hda, hda2hdmi, hda2codec_2x
-
-Optional properties:
-- nvidia,model : The user-visible name of this sound complex. Since the property
-  is optional, legacy boards can use default name provided in hda driver.
-
-Example:
-
-hda@70030000 {
-	compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
-	reg = <0x0 0x70030000 0x0 0x10000>;
-	interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&tegra_car TEGRA124_CLK_HDA>,
-		 <&tegra_car TEGRA124_CLK_HDA2HDMI>,
-		 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
-	clock-names = "hda", "hda2hdmi", "hda2codec_2x";
-	resets = <&tegra_car 125>, /* hda */
-		 <&tegra_car 128>, /* hda2hdmi */
-		 <&tegra_car 111>; /* hda2codec_2x */
-	reset-names = "hda", "hda2hdmi", "hda2codec_2x";
-	nvidia,model = "jetson-tk1-hda";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
new file mode 100644
index 0000000..3059bc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra HDA controller
+
+description: |
+  The High Definition Audio (HDA) block provides a serial interface to
+  audio codec. It supports multiple input and output streams.
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^hda@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra30-hda
+      - items:
+          - enum:
+              - nvidia,tegra194-hda
+              - nvidia,tegra186-hda
+              - nvidia,tegra210-hda
+              - nvidia,tegra124-hda
+          - const: nvidia,tegra30-hda
+      - items:
+          - const: nvidia,tegra132-hda
+          - const: nvidia,tegra124-hda
+          - const: nvidia,tegra30-hda
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: The interrupt from the HDA controller
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    maxItems: 3
+    items:
+      - const: hda
+      - const: hda2hdmi
+      - const: hda2codec_2x
+
+  resets:
+    maxItems: 3
+
+  reset-names:
+    maxItems: 3
+    items:
+      - const: hda
+      - const: hda2hdmi
+      - const: hda2codec_2x
+
+  nvidia,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      The user-visible name of this sound complex. If this property is
+      not specified then boards can use default name provided in hda driver.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include<dt-bindings/clock/tegra124-car-common.h>
+    #include<dt-bindings/interrupt-controller/arm-gic.h>
+
+    hda@70030000 {
+        compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
+        reg = <0x70030000 0x10000>;
+        interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA124_CLK_HDA>,
+                 <&tegra_car TEGRA124_CLK_HDA2HDMI>,
+                 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
+        clock-names = "hda", "hda2hdmi", "hda2codec_2x";
+        resets = <&tegra_car 125>, /* hda */
+                 <&tegra_car 128>, /* hda2hdmi */
+                 <&tegra_car 111>; /* hda2codec_2x */
+        reset-names = "hda", "hda2hdmi", "hda2codec_2x";
+        nvidia,model = "jetson-tk1-hda";
+    };
+
+...
-- 
2.7.4

