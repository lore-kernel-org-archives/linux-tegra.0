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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13FFC4727E
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 17:34:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DB2220897
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 17:34:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="qh6ixMdr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732791AbgJAReL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 13:34:11 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9976 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732751AbgJAReL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 13:34:11 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7612de0002>; Thu, 01 Oct 2020 10:33:18 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 17:34:06 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 1 Oct 2020 17:34:01 +0000
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
Subject: [PATCH v3 04/13] ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM
Date:   Thu, 1 Oct 2020 23:02:58 +0530
Message-ID: <1601573587-15288-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601573599; bh=FxtLB3V25/9092fJImUbmEK5DDd1xaC11DWTieE2aCs=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=qh6ixMdrkj816QIY0WmOUzRZcLvyEd3MNzsOR3UMAb1KnCe6PBtrKmtui7l835exM
         FMWyfdPQkYQUmGT8bfc32gsUqdTerVWX7S4tl8Z/HUpnDESTtGu+xub8jU5N1Q6Fk3
         P/97eKI5f4bV/QxpDQj3+W+dEs/MFv3xLZq8ixCR+1Bf9li/Dz1jr4ZeKEj0tCfoZb
         KHwAq0yES2wk5QeT0eyqz2xzciFfAR3vS0Jckk6/Nb2LTsNOknf7MVoF02QpxPRbHq
         7RtUYGew/iybPmTll5JvwEasbWt6OnVq8u+H1PDPSCE6RQBt9exOoUBbgpnl0mwxeE
         hRzEpYfvFMaAA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

PCM devices are created for FE dai links with 'no-pcm' flag as '0'.
Such DAI links have CPU component which implement either pcm_construct()
or pcm_new() at component or dai level respectively. Based on this,
current patch exposes a helper function to identify such components
and populate 'no_pcm' flag for DPCM DAI link.

This helps to have BE<->BE component links where PCM devices need
not be created for CPU component involved in such links.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 1e20562..9b06841 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -111,6 +111,17 @@ static int graph_get_dai_id(struct device_node *ep)
 	return id;
 }
 
+static bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
+{
+	struct snd_soc_dai *dai = snd_soc_find_dai_with_mutex(dlc);
+
+	if (dai && (dai->component->driver->pcm_construct ||
+		    dai->driver->pcm_new))
+		return true;
+
+	return false;
+}
+
 static int asoc_simple_parse_dai(struct device_node *ep,
 				 struct snd_soc_dai_link_component *dlc,
 				 int *is_single_link)
@@ -205,6 +216,7 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 				  int dup_codec)
 {
 	struct device *dev = simple_priv_to_dev(priv);
+	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct device_node *top = dev->of_node;
@@ -259,6 +271,19 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 		if (ret < 0)
 			goto out_put_node;
 
+		/*
+		 * In BE<->BE connections it is not required to create
+		 * PCM devices at CPU end of the dai link and thus 'no_pcm'
+		 * flag needs to be set. It is useful when there are many
+		 * BE components and some of these have to be connected to
+		 * form a valid audio path.
+		 *
+		 * For example: FE <-> BE1 <-> BE2 <-> ... <-> BEn where
+		 * there are 'n' BE components in the path.
+		 */
+		if (card->component_chaining && !soc_component_is_pcm(cpus))
+			dai_link->no_pcm = 1;
+
 		/* card->num_links includes Codec */
 		asoc_simple_canonicalize_cpu(dai_link, is_single_links);
 	} else {
-- 
2.7.4

