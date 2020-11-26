Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54273C56202
	for <linux-tegra@archiver.kernel.org>; Thu, 26 Nov 2020 18:04:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E39A321D81
	for <linux-tegra@archiver.kernel.org>; Thu, 26 Nov 2020 18:04:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="If6Pscyj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404528AbgKZSDy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 26 Nov 2020 13:03:54 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1967 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404669AbgKZSDy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 26 Nov 2020 13:03:54 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fbfee100000>; Thu, 26 Nov 2020 10:04:00 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 26 Nov
 2020 18:03:53 +0000
Received: from audio.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 26 Nov 2020 18:03:50 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <kuninori.morimoto.gx@renesas.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v6 1/6] ASoC: dt-bindings: tegra: Add graph bindings
Date:   Thu, 26 Nov 2020 23:33:38 +0530
Message-ID: <1606413823-19885-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
References: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1606413840; bh=wSbiZL/NM0UtDU3bPzfMihVkMzdLJDTXJ2ICU4gUlTc=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=If6PscyjV8P40Q01MyFyDGvUZZ53XHXkQQsV7++q5B05QRKKIZI20QyNgUCUzN+UK
         byv99X4V4s99jQ6R19+I/nHWvc6u8dyPn7rx2oAYi6i4SJvK41qoRfBgp7lGeItjKo
         XP1YIklUwcrb6Pg/uE6HAn+yKUfXKC0iPU8rAt5k2RinTvxSrWxDvcze75nau2M/B7
         eq2j0oG83rDflXZqiQH101urP0i9WnS+3beq475I5x0MEcWmjJfKpg9l0CcaVLKlS1
         hws+h7fm67m5gFRu+TUSkEf1rV8ZrSh3kgWJBGo0os3Pw1xjiKcF5Y/GTcNfse+rxl
         TnChc+Wxc02Vg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add device tree binding properties of generic graph to ASoC component
devices. This allows to define audio ports out of these components or
DAIs and audio graph based sound card can be realised with this.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../bindings/sound/nvidia,tegra186-dspk.yaml           | 18 +++++++++++++++++-
 .../bindings/sound/nvidia,tegra210-admaif.yaml         | 13 ++++++++++++-
 .../bindings/sound/nvidia,tegra210-ahub.yaml           | 13 +++++++++++--
 .../bindings/sound/nvidia,tegra210-dmic.yaml           | 18 +++++++++++++++++-
 .../devicetree/bindings/sound/nvidia,tegra210-i2s.yaml | 18 +++++++++++++++++-
 5 files changed, 74 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
index ed2fb32..b8645d9 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
@@ -17,6 +17,9 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
+allOf:
+  - $ref: audio-graph-port.yaml#
+
 properties:
   $nodename:
     pattern: "^dspk@[0-9a-f]*$"
@@ -55,6 +58,19 @@ properties:
       The name can be "DSPK1" or "DSPKx", where x depends on the maximum
       available instances on a Tegra SoC.
 
+  ports:
+    type: object
+    properties:
+      port@0:
+        description: |
+          DSPK ACIF (Audio Client Interface) port connected to the
+          corresponding AHUB (Audio Hub) ACIF port.
+
+      port@1:
+        description: |
+          DSPK DAP (Digital Audio Port) interface which can be connected
+          to external audio codec for playback.
+
 required:
   - compatible
   - reg
@@ -64,7 +80,7 @@ required:
   - assigned-clock-parents
   - sound-name-prefix
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index c028b25..7cee772 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -17,6 +17,9 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
+allOf:
+  - $ref: audio-graph-port.yaml#
+
 properties:
   $nodename:
     pattern: "^admaif@[0-9a-f]*$"
@@ -37,6 +40,14 @@ properties:
 
   dma-names: true
 
+  ports:
+    description: |
+      Contains list of ACIF (Audio CIF) port nodes for ADMAIF channels.
+      The number of port nodes depends on the number of ADMAIF channels
+      that SoC may have. These are interfaced with respective ACIF ports
+      in AHUB (Audio Hub). Each port is capable of data transfers in
+      both directions.
+
 if:
   properties:
     compatible:
@@ -81,7 +92,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index d772197..31f3e51 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -17,6 +17,9 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
+allOf:
+  - $ref: audio-graph-port.yaml#
+
 properties:
   $nodename:
     pattern: "^ahub@[0-9a-f]*$"
@@ -56,6 +59,13 @@ properties:
 
   ranges: true
 
+  ports:
+    description: |
+      Contains list of ACIF (Audio CIF) port nodes for AHUB (Audio Hub).
+      These are connected to ACIF interfaces of AHUB clients. Thus the
+      number of port nodes depend on the number of clients that AHUB may
+      have depending on the SoC revision.
+
 required:
   - compatible
   - reg
@@ -67,8 +77,7 @@ required:
   - "#size-cells"
   - ranges
 
-additionalProperties:
-  type: object
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
index 2a3207b..89f4f47 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
@@ -16,6 +16,9 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
+allOf:
+  - $ref: audio-graph-port.yaml#
+
 properties:
   $nodename:
     pattern: "^dmic@[0-9a-f]*$"
@@ -56,6 +59,19 @@ properties:
       The name can be "DMIC1" or "DMIC2" ... "DMICx", where x depends
       on the maximum available instances on a Tegra SoC.
 
+  ports:
+    type: object
+    properties:
+      port@0:
+        description: |
+          DMIC ACIF (Audio Client Interface) port connected to the
+          corresponding AHUB (Audio Hub) ACIF port.
+
+      port@1:
+        description: |
+          DMIC DAP (Digital Audio Port) interface which can be connected
+          to external audio codec for capture.
+
 required:
   - compatible
   - reg
@@ -64,7 +80,7 @@ required:
   - assigned-clocks
   - assigned-clock-parents
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
index dfc1bf7..5564603 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
@@ -16,6 +16,9 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
+allOf:
+  - $ref: audio-graph-port.yaml#
+
 properties:
   $nodename:
     pattern: "^i2s@[0-9a-f]*$"
@@ -74,6 +77,19 @@ properties:
       The name can be "I2S1" or "I2S2" ... "I2Sx", where x depends
       on the maximum available instances on a Tegra SoC.
 
+  ports:
+    type: object
+    properties:
+      port@0:
+        description: |
+          I2S ACIF (Audio Client Interface) port connected to the
+          corresponding AHUB (Audio Hub) ACIF port.
+
+      port@1:
+        description: |
+          I2S DAP (Digital Audio Port) interface which can be connected
+          to external audio codec for playback or capture.
+
 required:
   - compatible
   - reg
@@ -82,7 +98,7 @@ required:
   - assigned-clocks
   - assigned-clock-parents
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.7.4

