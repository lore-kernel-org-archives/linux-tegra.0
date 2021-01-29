Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3451BC433E6
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 18:29:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E11D664E04
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 18:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232657AbhA2S3V (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 13:29:21 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8264 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbhA2S2u (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 13:28:50 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601453b10000>; Fri, 29 Jan 2021 10:28:01 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:28:00 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 18:27:57 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <thierry.reding@gmail.com>, <broonie@kernel.org>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>
CC:     <kuninori.morimoto.gx@renesas.com>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <sharadg@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 2/9] ASoC: dt-bindings: tegra: Add iommus property to Tegra graph card
Date:   Fri, 29 Jan 2021 23:57:39 +0530
Message-ID: <1611944866-29373-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611944881; bh=SLGxbjmqkghCiCzoXbOehlvqpU26zswcFn4UUR9CvHU=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=Vdm2wo8TGuiqC5cW4j6CpLghBGKZHWnI4DWJ7A6UJfEg1/KENZZ/JFJwuyPdyjp2I
         cR+6dBWBwRO8sUshxpIe9zOfvBC31eCBQfdqKJj0uMfN4aiLbrqioFAsxVNqxWk1Dj
         aOLnN4+bUBzdVFgZBuas+M9uFDYvBbLmyTufhqq9f1JKRiSRSIsVTC2God55vRPoBq
         AUdBOsG+CM8GuftbrOEiybM9nxS7D8iCkNlIZa8VB/b9qXske8w0/m0bhPOFHDNzJ/
         9vuqguEW+thyZQyOusd2icT+SP1gI3M+mVfHdEyvVbwkSZCAFQ59YWJwvXez94eO4g
         +/Ea75IRdqW9w==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Document 'iommus' property for APE (Audio Processing Engine) sound
card.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
index fc271f6..2499709 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
@@ -45,6 +45,9 @@ properties:
     minItems: 1
     maxItems: 3
 
+  iommus:
+    maxItems: 1
+
 required:
   - clocks
   - clock-names
-- 
2.7.4

