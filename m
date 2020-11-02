Return-Path: <SRS0=G4SC=EI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69227C388F2
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Nov 2020 15:11:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D68F21D40
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Nov 2020 15:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="cIO5+jTj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbgKBPLq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Nov 2020 10:11:46 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7830 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgKBPLq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Nov 2020 10:11:46 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa021bc0001>; Mon, 02 Nov 2020 07:11:56 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Nov
 2020 15:11:40 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Mon, 2 Nov 2020 15:11:37 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v5 6/7] ASoC: audio-graph: Expose new members for asoc_simple_priv
Date:   Mon, 2 Nov 2020 20:40:13 +0530
Message-ID: <1604329814-24779-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
References: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604329916; bh=NXU8XQwjRWZ/2sG+RWIF67eZnui/M+pQ/b5OeUa57ks=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=cIO5+jTj/JJrY4m33IEpY6HFu4zPXuxmWFV0YixAl1gm4313mJ5VP09Q0FvE/Jfg4
         WdDa0wtPSNdliSm7+4bVcCQOpxhGVBQ4a/I1RhYxyviNO9ZMME1CGj3NCr8x5TOqVi
         LMOavRItwEB3mQXMfyAcKf+pVAUPkcw/gyMoFlwjWjT1Ty//S8SjBungFrdpMK1aLD
         W1hwjNuljxsHkCptHSSQ860pK7bt15bOvMxOOfaKgP4Bh5f+he4Lg0vcJ7H3f6I0Fx
         0PGtRuNHpxZY8HU76zajBXl3Bqln704v4rRBFqUmFmo82y0TpXoFOuYZ0CvtfUVGr0
         7vrSLv06ltuHw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add new members in struct 'asoc_simple_priv'. Idea is to leverage
simple or graph card driver as much as possible and vendor can
maintain a thin driver to control the behavior by populating these
newly exposed members.

Following are the members added in 'asoc_simple_priv':

  - 'ops' struct: In some cases SoC vendor drivers may want to
    implement 'snd_soc_ops' callbacks differently. In such cases
    custom callbacks would be used.

  - 'force_dpcm' flag: Right now simple or graph card drivers
    detect DAI links as DPCM links if:

      * The dpcm_selectable is set AND
      * Codec is connected to multiple CPU endpoints or aconvert
        property is used for rate/channels.

    So there is no way to directly specify usage of DPCM alone. So a
    flag is exposed to mark all links as DPCM. Vendor driver can
    set this if required.

  - 'dpcm_selectable': Currently simple or audio graph drivers
    provide a way to enable this for specific compatibles. However
    vendor driver may want to define some additional info. Thus
    expose this variable where vendor drivers can set this if
    required.

Audio graph driver is updated to consider above flags or callbacks.
Subsequent patches in the series illustrate usage for above.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h    |  3 +++
 sound/soc/generic/audio-graph-card.c | 41 ++++++++++++++++++++++++++++--------
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 86a1e95..ba4a3e1 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -56,6 +56,9 @@ struct asoc_simple_priv {
 	struct asoc_simple_dai *dais;
 	struct snd_soc_codec_conf *codec_conf;
 	struct gpio_desc *pa_gpio;
+	const struct snd_soc_ops *ops;
+	unsigned int dpcm_selectable:1;
+	unsigned int force_dpcm:1;
 };
 #define simple_priv_to_card(priv)	(&(priv)->snd_card)
 #define simple_priv_to_props(priv, i)	((priv)->dai_props + (i))
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 0ba50be9..4db9c0e 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -355,6 +355,11 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	snd_soc_dai_link_set_capabilities(dai_link);
 
 	dai_link->ops			= &graph_ops;
+
+	/* Use custom snd_soc_ops callbacks if available */
+	if (priv->ops)
+		dai_link->ops = priv->ops;
+
 	dai_link->init			= asoc_simple_dai_init;
 
 out_put_node:
@@ -439,6 +444,28 @@ static int graph_dai_link_of(struct asoc_simple_priv *priv,
 	return 0;
 }
 
+static inline bool parse_as_dpcm_link(struct asoc_simple_priv *priv,
+				      struct device_node *codec_port,
+				      struct asoc_simple_data *adata)
+{
+	if (priv->force_dpcm)
+		return true;
+
+	if (!priv->dpcm_selectable)
+		return false;
+
+	/*
+	 * It is DPCM
+	 * if Codec port has many endpoints,
+	 * or has convert-xxx property
+	 */
+	if ((of_get_child_count(codec_port) > 1) ||
+	    (adata->convert_rate || adata->convert_channels))
+		return true;
+
+	return false;
+}
+
 static int graph_for_each_link(struct asoc_simple_priv *priv,
 			struct link_info *li,
 			int (*func_noml)(struct asoc_simple_priv *priv,
@@ -459,7 +486,6 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	struct device_node *codec_port;
 	struct device_node *codec_port_old = NULL;
 	struct asoc_simple_data adata;
-	uintptr_t dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
 	int rc, ret;
 
 	/* loop for all listed CPU port */
@@ -482,14 +508,8 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 			graph_parse_convert(dev, codec_ep, &adata);
 			graph_parse_convert(dev, cpu_ep,   &adata);
 
-			/*
-			 * It is DPCM
-			 * if Codec port has many endpoints,
-			 * or has convert-xxx property
-			 */
-			if (dpcm_selectable &&
-			    ((of_get_child_count(codec_port) > 1) ||
-			     adata.convert_rate || adata.convert_channels))
+			/* check if link requires DPCM parsing */
+			if (parse_as_dpcm_link(priv, codec_port, &adata))
 				ret = func_dpcm(priv, cpu_ep, codec_ep, li,
 						(codec_port_old == codec_port));
 			/* else normal sound */
@@ -678,6 +698,9 @@ static int graph_probe(struct platform_device *pdev)
 	card->num_dapm_widgets	= ARRAY_SIZE(graph_dapm_widgets);
 	card->probe		= graph_card_probe;
 
+	if (of_device_get_match_data(dev))
+		priv->dpcm_selectable = 1;
+
 	memset(&li, 0, sizeof(li));
 	graph_get_dais_count(priv, &li);
 	if (!li.link || !li.dais)
-- 
2.7.4

