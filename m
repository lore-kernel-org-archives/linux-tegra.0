Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAA8C433E6
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 13:51:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22F3A64F45
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 13:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236437AbhBDNvd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 4 Feb 2021 08:51:33 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16337 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236389AbhBDNvZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 4 Feb 2021 08:51:25 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601bfbac0008>; Thu, 04 Feb 2021 05:50:36 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 13:50:36 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 4 Feb 2021 13:50:33 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 2/3] ASoC: tegra: Update references of audio graph helpers
Date:   Thu, 4 Feb 2021 19:20:11 +0530
Message-ID: <1612446612-32613-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612446612-32613-1-git-send-email-spujar@nvidia.com>
References: <1612446612-32613-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612446636; bh=2pd/AAFg5WK8Z9T8q9P2ZlY87W9EDATBwGUAwCiwYCk=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=BkQeR+6QhRlKhDEgPxy6UFGIPv4QDrRzDG+oFlUteHrHqMqmGsAA7Y1JGbTtf/ogl
         EbcXVAjV3GFY7/CTQNy0Gd3dAOSdSotDCb/nwnSgmIj2GtGxOq5/Qe/POexb1rJlSc
         n0IqFTqgl5gxPg3xz+xK0WIMUvqXx9PbXhQpiNbMizxCmJNVg0NejlwhMakN/otCjj
         Y207POoob1DHm0fVKszVv2vX6snBlW8VRx2O2ccUtRe6xodhpbnhsBxFv+Q+kuY4z6
         oM+VRZX/o0Ine/LGWc7ydcIl6x+xBwpU7m/NZ7YIIr1naHzCvm3gZY0j6QViq0eTul
         mLLzAA8SNA89g==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The audio graph helper functions are renamed now for a better global
visibility and hence references need to be updated in Tegra audio
graph.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra_audio_graph_card.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index 9e43f16..121e572 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -184,7 +184,7 @@ static int tegra_audio_graph_card_probe(struct snd_soc_card *card)
 		return PTR_ERR(priv->clk_plla_out0);
 	}
 
-	return graph_card_probe(card);
+	return audio_graph_card_probe(card);
 }
 
 static int tegra_audio_graph_probe(struct platform_device *pdev)
@@ -201,12 +201,12 @@ static int tegra_audio_graph_probe(struct platform_device *pdev)
 
 	card->probe = tegra_audio_graph_card_probe;
 
-	/* graph_parse_of() depends on below */
+	/* audio_graph_parse_of() depends on below */
 	card->component_chaining = 1;
 	priv->simple.ops = &tegra_audio_graph_ops;
 	priv->simple.force_dpcm = 1;
 
-	return graph_parse_of(&priv->simple, dev);
+	return audio_graph_parse_of(&priv->simple, dev);
 }
 
 static const struct tegra_audio_cdata tegra210_data = {
-- 
2.7.4

