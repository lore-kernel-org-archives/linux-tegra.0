Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE39AC433E9
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 18:29:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A13F64E04
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 18:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232682AbhA2S3X (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 13:29:23 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8278 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232655AbhA2S2v (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 13:28:51 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601453b50000>; Fri, 29 Jan 2021 10:28:05 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:28:04 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 18:28:01 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <thierry.reding@gmail.com>, <broonie@kernel.org>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>
CC:     <kuninori.morimoto.gx@renesas.com>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <sharadg@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 3/9] ASoC: audio-graph-card: Add clocks property to endpoint node
Date:   Fri, 29 Jan 2021 23:57:40 +0530
Message-ID: <1611944866-29373-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611944885; bh=8rCymPluJ1fUEPrMoQ5Gx5LsQlp+yRtKBAeGRmkhoEc=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=G1d+n92d6yK2YA73nDfo1PcAoEe5hSzVgOruUcSNj27pHkdqPPP8JSX7S4+SswibI
         /Vq/4ZrHsoNs6B1rNKiKgQVYuyPQzGI9AIVymwQQJ1nQoeIejVZ6Oet1M1/RXWyDyf
         kVBH4pOP6cWthsajccJvTpUFxfLw4bI/+47ojqOs/lKRVq6jMwxYEOeC45qSMBw362
         f37yfrVMQPW6SXC5I6bPpR2dXY3bmtrXwCHmTVcz44EhG2bi33OM5J05nh2XLWNjv4
         7nsfH02XbNBvIic9oKryQalIr7Lt0FMe2R/4W00aAs5o2KfjDYWIneaRIaV4QRrEdb
         AXWAQhvAydoYQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add optional 'clocks' property to audio port 'endpoint' node. One
such example is where SoC supplies a clock to external audio codec
component.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 766e910..08ed8f5 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -33,6 +33,9 @@ properties:
         properties:
           remote-endpoint:
             maxItems: 1
+          clocks:
+            maxItems: 1
+            description: Describes the clock used by audio component.
           mclk-fs:
             description: |
               Multiplication factor between stream rate and codec mclk.
-- 
2.7.4

