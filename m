Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA664C433E6
	for <linux-tegra@archiver.kernel.org>; Sun,  7 Feb 2021 17:38:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C81F64DEB
	for <linux-tegra@archiver.kernel.org>; Sun,  7 Feb 2021 17:38:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhBGRhw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 7 Feb 2021 12:37:52 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:3595 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhBGRhv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 7 Feb 2021 12:37:51 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B602025470002>; Sun, 07 Feb 2021 09:37:11 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 7 Feb
 2021 17:37:10 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Sun, 7 Feb 2021 17:37:08 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 1/2] ASoC: audio-graph: Rename functions needed for export
Date:   Sun, 7 Feb 2021 23:06:57 +0530
Message-ID: <1612719418-5858-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612719418-5858-1-git-send-email-spujar@nvidia.com>
References: <1612719418-5858-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612719431; bh=QNOEKARjC18l+zl2o4mNJlCfnihZnl9yHW4AuVCikCc=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=TUMbdtqcIQ1x4CyaenmKFhySINP4EE5esWR76/Ys/Jz5x3wZHLntAur8gMdVGvEnB
         HStAPgD29wPnSWR+1blusi5zPucGUBGvPLtr51GKuldKm34zvSAVM5u7Bj0jQRi5dO
         LCx87tCEXHEjiDFRRxOKozF+DV6VUR1EIYOikEO/1PqttJMmIZ1TuLJ8RtRgUNqVkl
         0m4T62s9X5Fmi7c8DvI9Wc/Epu5vG/7wKWeGqvjb99Zjtvws4W75/C6leUJTWBiTa1
         jQCkXFT8SzbeUlfd0gzKaN/9kWZINQxMyFPz/oOrPV4CIC6Y/G2HG8/lE8IJtmpm2x
         9mxtVkAeV/u9w==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Following functions are renamed for a better global visibility.
  graph_card_probe() --> audio_graph_card_probe()
  graph_parse_of()   --> audio_graph_parse_of()
  graph_remove()     --> audio_graph_remove() [exported as well]

The references of these are updated in audio graph and Tegra audio
graph card drivers.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/graph_card.h               |  6 ++++--
 sound/soc/generic/audio-graph-card.c     | 17 +++++++++--------
 sound/soc/tegra/tegra_audio_graph_card.c |  6 +++---
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/include/sound/graph_card.h b/include/sound/graph_card.h
index bbb5a13..0137844 100644
--- a/include/sound/graph_card.h
+++ b/include/sound/graph_card.h
@@ -9,8 +9,10 @@
 
 #include <sound/simple_card_utils.h>
 
-int graph_card_probe(struct snd_soc_card *card);
+int audio_graph_card_probe(struct snd_soc_card *card);
 
-int graph_parse_of(struct asoc_simple_priv *priv, struct device *dev);
+int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev);
+
+int audio_graph_remove(struct platform_device *pdev);
 
 #endif /* __GRAPH_CARD_H */
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 16a04a6..8c5cdcd 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -532,7 +532,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 static void graph_get_dais_count(struct asoc_simple_priv *priv,
 				 struct link_info *li);
 
-int graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
+int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct link_info li;
@@ -608,7 +608,7 @@ int graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(graph_parse_of);
+EXPORT_SYMBOL_GPL(audio_graph_parse_of);
 
 static int graph_count_noml(struct asoc_simple_priv *priv,
 			    struct device_node *cpu_ep,
@@ -705,7 +705,7 @@ static void graph_get_dais_count(struct asoc_simple_priv *priv,
 		li->link, li->dais, li->conf);
 }
 
-int graph_card_probe(struct snd_soc_card *card)
+int audio_graph_card_probe(struct snd_soc_card *card)
 {
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
 	int ret;
@@ -720,7 +720,7 @@ int graph_card_probe(struct snd_soc_card *card)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(graph_card_probe);
+EXPORT_SYMBOL_GPL(audio_graph_card_probe);
 
 static int graph_probe(struct platform_device *pdev)
 {
@@ -736,20 +736,21 @@ static int graph_probe(struct platform_device *pdev)
 	card = simple_priv_to_card(priv);
 	card->dapm_widgets	= graph_dapm_widgets;
 	card->num_dapm_widgets	= ARRAY_SIZE(graph_dapm_widgets);
-	card->probe		= graph_card_probe;
+	card->probe		= audio_graph_card_probe;
 
 	if (of_device_get_match_data(dev))
 		priv->dpcm_selectable = 1;
 
-	return graph_parse_of(priv, dev);
+	return audio_graph_parse_of(priv, dev);
 }
 
-static int graph_remove(struct platform_device *pdev)
+int audio_graph_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
 	return asoc_simple_clean_reference(card);
 }
+EXPORT_SYMBOL_GPL(audio_graph_remove);
 
 static const struct of_device_id graph_of_match[] = {
 	{ .compatible = "audio-graph-card", },
@@ -766,7 +767,7 @@ static struct platform_driver graph_card = {
 		.of_match_table = graph_of_match,
 	},
 	.probe = graph_probe,
-	.remove = graph_remove,
+	.remove = audio_graph_remove,
 };
 module_platform_driver(graph_card);
 
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

