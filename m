Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52453C4741F
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 17:34:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AE0E208C7
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 17:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ofk/1Mxw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732938AbgJARew (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 13:34:52 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18215 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732407AbgJARew (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 13:34:52 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f76132f0003>; Thu, 01 Oct 2020 10:34:39 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 17:34:47 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 1 Oct 2020 17:34:41 +0000
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
Subject: [PATCH v3 08/13] ASoC: audio-graph: Expose helpers from audio graph
Date:   Thu, 1 Oct 2020 23:03:02 +0530
Message-ID: <1601573587-15288-9-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601573679; bh=fvJEjJoXH9qCM6UDH1pRLmiRVww30y/yRy8RfTCHrP8=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=ofk/1MxwXwLQ/DyWiGUlHbvif4b/uhYHkPbbx/PWOyDgu1QphhiAIFjoD5FMvrv/p
         Fij6mt0BxfdNIdqFE5aPHXDlLo89Um68U5ONpM2QGJpqsGN2eEcfai33lClwSdBTLP
         hoeNbK0Korr4aZdATpsYJuVx55bRDAuwyrajQC6H7CqJNUvQ3sqIriFD6/N2MAaaFW
         x1Uj7bL9RPjwEonKdI6N/qQm77RbPSmhfHemVXhlRlDCaeca1q5sZWTFur9NGX/Swi
         HCUu9uYso0GT8bn47J8MbA/XFLdpBmP7Igkz/SNn85mAAFnMYqRCnc4uK/A5hJ3wly
         y5FXb/Ayrbiuw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This commit exposes following functions which can be used by a sound
card driver based on audio graph driver. Idea is vendors can have a
thin driver and re-use common stuff from audio graph driver.

 - graph_card_probe()
 - graph_get_dais_count()
 - graph_parse_of()

In doing so a new header file is added for audio graph which can be
included by vendor drivers.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/graph_card.h           | 19 +++++++++++++++++++
 sound/soc/generic/audio-graph-card.c | 11 +++++++----
 2 files changed, 26 insertions(+), 4 deletions(-)
 create mode 100644 include/sound/graph_card.h

diff --git a/include/sound/graph_card.h b/include/sound/graph_card.h
new file mode 100644
index 0000000..0372c1c
--- /dev/null
+++ b/include/sound/graph_card.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * ASoC audio graph card support
+ *
+ */
+
+#ifndef __GRAPH_CARD_H
+#define __GRAPH_CARD_H
+
+#include <sound/simple_card_utils.h>
+
+int graph_card_probe(struct snd_soc_card *card);
+
+void graph_get_dais_count(struct asoc_simple_priv *priv,
+			  struct link_info *li);
+
+int graph_parse_of(struct asoc_simple_priv *priv);
+
+#endif /* __GRAPH_CARD_H */
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index fb34e34..ae234bf 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -529,7 +529,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static int graph_parse_of(struct asoc_simple_priv *priv)
+int graph_parse_of(struct asoc_simple_priv *priv)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct link_info li;
@@ -566,6 +566,7 @@ static int graph_parse_of(struct asoc_simple_priv *priv)
 
 	return asoc_simple_parse_card_name(card, NULL);
 }
+EXPORT_SYMBOL_GPL(graph_parse_of);
 
 static int graph_count_noml(struct asoc_simple_priv *priv,
 			    struct device_node *cpu_ep,
@@ -604,8 +605,8 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static void graph_get_dais_count(struct asoc_simple_priv *priv,
-				 struct link_info *li)
+void graph_get_dais_count(struct asoc_simple_priv *priv,
+			  struct link_info *li)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 
@@ -661,8 +662,9 @@ static void graph_get_dais_count(struct asoc_simple_priv *priv,
 	dev_dbg(dev, "link %d, dais %d, ccnf %d\n",
 		li->link, li->dais, li->conf);
 }
+EXPORT_SYMBOL_GPL(graph_get_dais_count);
 
-static int graph_card_probe(struct snd_soc_card *card)
+int graph_card_probe(struct snd_soc_card *card)
 {
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
 	int ret;
@@ -677,6 +679,7 @@ static int graph_card_probe(struct snd_soc_card *card)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(graph_card_probe);
 
 static int graph_probe(struct platform_device *pdev)
 {
-- 
2.7.4

