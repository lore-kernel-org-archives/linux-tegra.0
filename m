Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB90DC433DB
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 16:11:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AEC464DDD
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 16:11:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234800AbhBCQLF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Feb 2021 11:11:05 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7510 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234712AbhBCQKp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Feb 2021 11:10:45 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601acad90001>; Wed, 03 Feb 2021 08:10:01 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Feb
 2021 16:10:01 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 3 Feb 2021 16:09:58 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 2/2] ASoC: tegra: Add driver remove() callback
Date:   Wed, 3 Feb 2021 21:39:35 +0530
Message-ID: <1612368575-25991-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612368575-25991-1-git-send-email-spujar@nvidia.com>
References: <1612368575-25991-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612368601; bh=PjUOj+qZWimYXJl6j0hq0SkuuiLq1QiE8oYFb4NR7Ig=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=Yq2cMGL1tb4WqGuqAl12zqEaeQN+bQG6fC7vvt10ES+WwvHjjIOmzzT/kFbnO1KU5
         R0aF4HzZ2ZRQsQ3DKnjZah1nQ3Hmb3WA/XQVi3aANfC65RqF4paIa+l1R0HvdZTc1R
         Ps/EfeIwkeecCa6LbUVJjjukeKgIwiEhYo7Y/0kPT+ESkP1cOcNtR9TXUPGSWCPekm
         SujFPThaejc8zg45IPcdtEzspiX1jMqhYE107y+jysZ9vdq7fNPFqMQBRFM7IAef+V
         TmrPaRhM7FLQx0Tckiywv6cvseKwKsU1lOtUpvp46DNhd+7k3MGasgO1F9sEaF60H3
         7qae5XgLWvGpA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There is cleanup required, related to release of phandles, during driver
removal and hence point remove function pointer to graph_remove().

Fixes: 202e2f774543 ("ASoC: tegra: Add audio graph based card driver")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra_audio_graph_card.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index 9e43f16..f43d302 100644
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
+	.remove = graph_remove,
 };
 module_platform_driver(tegra_audio_graph_card);
 
-- 
2.7.4

