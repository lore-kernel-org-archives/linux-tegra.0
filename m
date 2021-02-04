Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBE1C43381
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 13:51:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4673C64F53
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 13:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236447AbhBDNvj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 4 Feb 2021 08:51:39 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16359 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbhBDNvZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 4 Feb 2021 08:51:25 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601bfbaf0006>; Thu, 04 Feb 2021 05:50:39 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 13:50:39 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 4 Feb 2021 13:50:36 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 3/3] ASoC: tegra: Add driver remove() callback
Date:   Thu, 4 Feb 2021 19:20:12 +0530
Message-ID: <1612446612-32613-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612446612-32613-1-git-send-email-spujar@nvidia.com>
References: <1612446612-32613-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612446639; bh=N/HUC5nO63V7ziFfbl7mA/9IeZbh8vyGK/1MWRYaR/M=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=nA553Q5Qn/JAbDDXTpn6CciLcUf8jDFG17YMMiyYR+RWB0OM4xc8ghkCF6fo2Qlsg
         s3Jw9WUO4QR++Xp3mMvaqExOfhTHsssYYrvL6LQwwR8ZM/26NZMBvJVrV4Vu/1L5RX
         OIHxtfYp4SJY5rlZQtXyV30vI/q3H5dyO8vuaXfCxF37sWlUhxpZj75/iXDUtZb7i1
         XYMxuolQiUlz0alJRecNZbASBfEuGXlL+5X0eat8Yfa0Ymy+HelZ8AQo/K2x8zb4L9
         KfCgzDeK3v7q7yzIKDiFSPk1spXkVQueuY8sytS16jPWDs625jMbn/aUvAOzMcs/yk
         cCVeYvYCReQBA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There is cleanup required, related to release of phandles, during driver
removal and hence point remove function pointer to audio_graph_remove().

Fixes: 202e2f774543 ("ASoC: tegra: Add audio graph based card driver")
Depends-on: "ASoC: audio-graph: Rename functions needed for export"
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
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

