Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0953DC433E7
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 14:44:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A210D20866
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 14:44:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="MXBmyFPG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409218AbgJPOod (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 10:44:33 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11294 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395502AbgJPOoa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 10:44:30 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f89b1a10003>; Fri, 16 Oct 2020 07:43:45 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 14:44:25 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 14:44:20 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <p.zabel@pengutronix.de>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v4 10/15] ASoC: dt-bindings: tegra: Add graph bindings
Date:   Fri, 16 Oct 2020 20:12:57 +0530
Message-ID: <1602859382-19505-11-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602859425; bh=p/k/pqswaom0r/vwo+mzlUVsgythPhPIMLpr24Czlus=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=MXBmyFPGWhWqFCutwCNWlANGF19yEf+D7LKKG/HyJwNyxP7nJJh7FVLY7J2D8JEbu
         Dd9TjuJRvNQ+zPMBPSBtKsIZey14QKrOo/0BJQaS3jijjURrwVxnyha9Mjq8T46IZa
         hZ3A4d4oSQyFz8oWMG/yNn3r6xN/hXjCvEGNa69P104JexNBiQOyqJ4A5gRiOjfMYO
         +8zWn2hQ5Ei+4d0OVaTTQLy9St8BwGQyGkd0EPxLv7KtjmHVjhj7tYtleCQS6pP9F8
         O11Y6wmKsVr6/qYfuFg77RGhHyyVJTB52rDlv2wzY77eGmVv7dxssOA4EH44SDYK6w
         DpXritlNZ9i7Q==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add device tree binding properties of generic graph to ASoC component
devices. This allows to define audio ports out of these components or
DAIs and audio graph based sound card can be realised with this.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml  | 7 +++++++
 .../devicetree/bindings/sound/nvidia,tegra210-admaif.yaml          | 7 +++++++
 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml  | 7 +++++++
 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml  | 7 +++++++
 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml   | 7 +++++++
 5 files changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
index ed2fb32..23875b1 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
@@ -55,6 +55,13 @@ properties:
       The name can be "DSPK1" or "DSPKx", where x depends on the maximum
       available instances on a Tegra SoC.
 
+  ports:
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/ports
+
+patternProperties:
+  "^port(@[0-9a-f]+)?$":
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index c028b25..26ba725 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -37,6 +37,13 @@ properties:
 
   dma-names: true
 
+  ports:
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/ports
+
+patternProperties:
+  "^port(@[0-9a-f]+)?$":
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
+
 if:
   properties:
     compatible:
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index d772197..d6aa849 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -56,6 +56,13 @@ properties:
 
   ranges: true
 
+  ports:
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/ports
+
+patternProperties:
+  "^port(@[0-9a-f]+)?$":
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
index 2a3207b..36232ed 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
@@ -56,6 +56,13 @@ properties:
       The name can be "DMIC1" or "DMIC2" ... "DMICx", where x depends
       on the maximum available instances on a Tegra SoC.
 
+  ports:
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/ports
+
+patternProperties:
+  "^port(@[0-9a-f]+)?$":
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
index dfc1bf7..f5cdf33 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
@@ -74,6 +74,13 @@ properties:
       The name can be "I2S1" or "I2S2" ... "I2Sx", where x depends
       on the maximum available instances on a Tegra SoC.
 
+  ports:
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/ports
+
+patternProperties:
+  "^port(@[0-9a-f]+)?$":
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
+
 required:
   - compatible
   - reg
-- 
2.7.4

