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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC62C63697
	for <linux-tegra@archiver.kernel.org>; Wed, 18 Nov 2020 08:07:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAD5F246B4
	for <linux-tegra@archiver.kernel.org>; Wed, 18 Nov 2020 08:07:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ocKWrZos"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbgKRIGr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 18 Nov 2020 03:06:47 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:12009 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbgKRIGo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Nov 2020 03:06:44 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb4d60a0000>; Wed, 18 Nov 2020 00:06:34 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Nov
 2020 08:06:44 +0000
Received: from audio.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 18 Nov 2020 08:06:41 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <broonie@kernel.org>
CC:     <jonathanh@nvidia.com>, <sharadg@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 3/3] dt-bindings: tegra: Add missing HDA properties
Date:   Wed, 18 Nov 2020 13:36:22 +0530
Message-ID: <1605686782-29469-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605686782-29469-1-git-send-email-spujar@nvidia.com>
References: <1605686782-29469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605686794; bh=g6WzfzkxGm1Rrc/PS9d7uqmNnF/hATJUD1WCAcXHzoM=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=ocKWrZosAEr+oXyDNz64JWNL+ytD2HGQ/LePF+SpvAkSsiW/J6h71Mk0PCW3dynV+
         0F2NPhrRYYREh/Cut9/NUBUawQD1+d8d6NV/bbU3MDgt9+c2dLUs+/Il0VviB3T5Cm
         j8dUOdNu9hN31EtsBYd1wiyEfVPikO0LdDkDxOvni+89D6ZTxrEfXV2tgYcSLh/9JI
         K5bxVlTRu+JLPK9aIihxOmBUxiOK7x2Y1Vs89AZoZ6YvVxkyVqMT9/iEDjwYun4p5E
         Kfsp3ZOYQ4inoZPRSU4VeN+v217fRJx4uI++uTzkEgYXRZWMUJw+KBtfwFYv/pULkn
         fPGGDMO/W+auQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Document the missing properties which are currently required for
Tegra186/Tegra194 DT files.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../devicetree/bindings/sound/nvidia,tegra30-hda.yaml      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
index 3059bc3..e543a61 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -60,6 +60,20 @@ properties:
       - const: hda2hdmi
       - const: hda2codec_2x
 
+  power-domains:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: dma-mem
+      - const: write
+
+  iommus:
+    maxItems: 1
+
   nvidia,model:
     $ref: /schemas/types.yaml#/definitions/string
     description: |
-- 
2.7.4

