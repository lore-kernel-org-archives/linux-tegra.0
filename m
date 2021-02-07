Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5955C433E9
	for <linux-tegra@archiver.kernel.org>; Sun,  7 Feb 2021 17:38:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B82DC64E4E
	for <linux-tegra@archiver.kernel.org>; Sun,  7 Feb 2021 17:38:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhBGRhz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 7 Feb 2021 12:37:55 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10739 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhBGRhy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 7 Feb 2021 12:37:54 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6020254a0000>; Sun, 07 Feb 2021 09:37:14 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 7 Feb
 2021 17:37:14 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Sun, 7 Feb 2021 17:37:11 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 2/2] ASoC: tegra: Add driver remove() callback
Date:   Sun, 7 Feb 2021 23:06:58 +0530
Message-ID: <1612719418-5858-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612719418-5858-1-git-send-email-spujar@nvidia.com>
References: <1612719418-5858-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612719434; bh=KVg63vf5VvqvH+XrCPWnE0FONvvdchylgE/elPzsp7U=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=gU9qYH07cR0wRn/KNECToKq50Rk2cxEOgfyYQeXfUHZl1zTBQ0wEzHyixn5fK6FMb
         3Qmv2jfFPinbTQwkooqkZW4h4BmHoLzpos/etMIg5BhQZD2YRJxsO6vzB7/zLC5Q1M
         O6SZEsEE7LwsVpzmUFDlv14xRMBMGvz8hvBT6z2l3aU0BvNnApdWYXViMzz8D6Z1N8
         6RAX9IBcjlDar3oJGQHG2BfZDSng13e2Pr39chHd0KDHHqyV4qVuEsQhCC30seJYNm
         nUD19eWlaQUbQGImaS5ZiTe/nv8NgF34+WDWE3ZjJn/SFKvrHHFA0OqapVqpKd6+MB
         vO/ZEZ6jLuG/g==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There is cleanup required, related to release of phandles, during driver
removal and hence point remove callback to audio_graph_remove().

Fixes: 202e2f774543 ("ASoC: tegra: Add audio graph based card driver")
Depends-on: "ASoC: audio-graph: Rename functions needed for export"
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra_audio_graph_card.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index 121e572..ddedf18 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -2,7 +2,7 @@
 //
 // tegra_audio_graph_card.c - Audio Graph based Tegra Machine Driver
 //
-// Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+// Copyright (c) 2020-2021 NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/math64.h>
 #include <linux/module.h>
@@ -243,6 +243,7 @@ static struct platform_driver tegra_audio_graph_card = {
 		.of_match_table = graph_of_tegra_match,
 	},
 	.probe = tegra_audio_graph_probe,
+	.remove = audio_graph_remove,
 };
 module_platform_driver(tegra_audio_graph_card);
 
-- 
2.7.4

