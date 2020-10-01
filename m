Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B855C4727E
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 17:34:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53A52208B6
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 17:34:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="J48GOF67"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732988AbgJARd4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 13:33:56 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9954 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732876AbgJARd4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 13:33:56 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7612d00000>; Thu, 01 Oct 2020 10:33:04 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 17:33:53 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 1 Oct 2020 17:33:48 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 03/13] ASoC: audio-graph: Use of_node and DAI for DPCM DAI link names
Date:   Thu, 1 Oct 2020 23:02:57 +0530
Message-ID: <1601573587-15288-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601573584; bh=DUfSjxqgTyMLeILJTEcFS/WZ2++sn+Xe/SbNNLGn5Pg=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=J48GOF67g8IwIWiaMDft3OCFD6E4u3eJCstB4b1GncdNLIeuARL9ZaH8R7XVvFxRd
         cKsWB1hF4boJmfcIR2Np85EWGuvAUJov1CZ9r5zouB+cLEDaicbDP1SVhxdNQtmChm
         eEaTaAeDNFlTZi0/pcp/2o5sh3FNUZlqgtWe58tPjgscQNup21ZbvgcNzF9YffI07Y
         hVyaaS/6T1TGwqKJJy2Y5KgfBi5iDpeXwnCxrXEfPpg2nJxA75PLM7AdqPIEwf9sna
         PU7UXLhCcEmQEXAVbUyyjefatXZvwAFgSQ7oKEC4oZyqg8CnnWEfG17Wo+EAHwUS3F
         fKeC91lhm/qDw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

For multiple instances of components, using DAI name alone for DAI links
is causing conflicts. Components can define multiple DAIs and hence using
just a device name won't help either. Thus DT device node reference and
DAI names are used to uniquely represent DAI link names.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 97b4f54..1e20562 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -253,7 +253,8 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 			goto out_put_node;
 
 		ret = asoc_simple_set_dailink_name(dev, dai_link,
-						   "fe.%s",
+						   "fe.%pOFP.%s",
+						   cpus->of_node,
 						   cpus->dai_name);
 		if (ret < 0)
 			goto out_put_node;
@@ -287,7 +288,8 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 			goto out_put_node;
 
 		ret = asoc_simple_set_dailink_name(dev, dai_link,
-						   "be.%s",
+						   "be.%pOFP.%s",
+						   codecs->of_node,
 						   codecs->dai_name);
 		if (ret < 0)
 			goto out_put_node;
-- 
2.7.4

