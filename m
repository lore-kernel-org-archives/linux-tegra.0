Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CFBC433ED
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Apr 2021 07:11:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 448426108E
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Apr 2021 07:11:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234010AbhDPHLi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Apr 2021 03:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbhDPHLi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Apr 2021 03:11:38 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034D1C061574
        for <linux-tegra@vger.kernel.org>; Fri, 16 Apr 2021 00:11:14 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id r9so40617092ejj.3
        for <linux-tegra@vger.kernel.org>; Fri, 16 Apr 2021 00:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1OaqrHj95z02mUJg5I8GmywTZZPXMCAVkBh62//UPOA=;
        b=UGYqfc5Xo3+IrByEO5c0PrV2EvT8svx3aGBdPL1lIp891q42vgBo1AyHIf6L/wB4HZ
         KewVTuL9XgeYSj76hRocuaKivTWleXDSgq1ayDk2CM5YlwW3tuS+dPngoKZ+Zwt6hzy4
         zuwEPjeFe2eoNCS59Wrd1MpP+Xld8N1Ot/ZzXSg4d73I+mLLNEzPOdAYl8EbMpqIndKB
         FdkYBsNWzkDX1t3Zuyuejt86aK4E3eIt/UitSlZDKulQ6zbWyo9jC5+T4En3ILGnQW0o
         PV0sKkVog132Xgu6JdoXVOH4yf7Aci9JmOrXK8uKwD9ZR31bxqhiu0RrWz1JGbVJtdZ/
         SBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1OaqrHj95z02mUJg5I8GmywTZZPXMCAVkBh62//UPOA=;
        b=WRhYwBOGjaDHHK22rKRqXpjlDYwEuadcZop7RH9j+5aQyojFSSbi5ux/OZE+M4vPMt
         fp4Hsrv3wlihCV1XCMkCfN8W7AzPcOv2qNOPB8BBd3JUzhm+X1rKjS2gPQxiAFe0lT7s
         6d4EDLaikfCNNhZ6u7j3X6cnFjc2G/wT07INHNG4eScb5gnXi9Ck11mDL0XfSEysUGIp
         tyll3OkLgGYW8+J754SYYFV0aN+03sMwDPC1LTq2FPfCRwYtm+R9a5Nu8yoVD6zZ9qLQ
         8RLoVY7IWhSszgp+hWaXXfH2dwO9vpEDWq2KZL6kclCUCDwbMSbyu/PfbuFvrU/P3W5J
         7BdQ==
X-Gm-Message-State: AOAM533GLcym4s6ZcBpLu7DNN3g2elcn1mvuCeHDIgwC8mTRoBo9+EC9
        coAg6gKX+4KGbEPaRY/4Xac=
X-Google-Smtp-Source: ABdhPJzA9XroXjTUkZpBMQqDnrJBdNTCik88OkIpZFkcHXsn9PvgoKbFEW45Uf/H4WUs2ORq8+DG2w==
X-Received: by 2002:a17:906:51da:: with SMTP id v26mr6978466ejk.212.1618557072680;
        Fri, 16 Apr 2021 00:11:12 -0700 (PDT)
Received: from localhost (p2e5be10e.dip0.t-ipconnect.de. [46.91.225.14])
        by smtp.gmail.com with ESMTPSA id w13sm3692224edx.80.2021.04.16.00.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 00:11:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jon Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] ASoC: simple-card-utils: Propagate errors on too many links
Date:   Fri, 16 Apr 2021 09:11:46 +0200
Message-Id: <20210416071147.2149109-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The DAI counting code doesn't propagate errors when the number of
maximum links is exceeded, which causes subsequent initialization code
to continue to run and that eventually leads to memory corruption with
the code trying to access memory that is out of bounds.

Fix this by propgating errors when the maximum number of links is
reached, which ensures that the driver fails to load and prevents the
memory corruption.

Fixes: f2138aed231c ("ASoC: simple-card-utils: enable flexible CPU/Codec/Platform")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 sound/soc/generic/audio-graph-card.c | 19 +++++++++++--------
 sound/soc/generic/simple-card.c      | 17 ++++++++++-------
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 0582fe296471..2401212281c2 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -539,8 +539,8 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	return ret;
 }
 
-static void graph_get_dais_count(struct asoc_simple_priv *priv,
-				 struct link_info *li);
+static int graph_get_dais_count(struct asoc_simple_priv *priv,
+				struct link_info *li);
 
 int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 {
@@ -552,7 +552,10 @@ int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 	card->dev = dev;
 
 	memset(&li, 0, sizeof(li));
-	graph_get_dais_count(priv, &li);
+	ret = graph_get_dais_count(priv, &li);
+	if (ret < 0)
+		return ret;
+
 	if (!li.link)
 		return -EINVAL;
 
@@ -657,8 +660,8 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static void graph_get_dais_count(struct asoc_simple_priv *priv,
-				 struct link_info *li)
+static int graph_get_dais_count(struct asoc_simple_priv *priv,
+				struct link_info *li)
 {
 	/*
 	 * link_num :	number of links.
@@ -706,9 +709,9 @@ static void graph_get_dais_count(struct asoc_simple_priv *priv,
 	 *	=> 4 DAIs  = 2xCPU + 2xCodec
 	 *	=> 1 ccnf  = 1xdummy-Codec
 	 */
-	graph_for_each_link(priv, li,
-			    graph_count_noml,
-			    graph_count_dpcm);
+	return graph_for_each_link(priv, li,
+				   graph_count_noml,
+				   graph_count_dpcm);
 }
 
 int audio_graph_card_probe(struct snd_soc_card *card)
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index bf5ddf1ea65f..1d1c4309b582 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -526,8 +526,8 @@ static int simple_count_dpcm(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static void simple_get_dais_count(struct asoc_simple_priv *priv,
-				  struct link_info *li)
+static int simple_get_dais_count(struct asoc_simple_priv *priv,
+				 struct link_info *li)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *top = dev->of_node;
@@ -584,12 +584,12 @@ static void simple_get_dais_count(struct asoc_simple_priv *priv,
 		li->num[0].platforms	= 1;
 
 		li->link = 1;
-		return;
+		return 0;
 	}
 
-	simple_for_each_link(priv, li,
-			     simple_count_noml,
-			     simple_count_dpcm);
+	return simple_for_each_link(priv, li,
+				    simple_count_noml,
+				    simple_count_dpcm);
 }
 
 static int simple_soc_probe(struct snd_soc_card *card)
@@ -628,7 +628,10 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	card->probe		= simple_soc_probe;
 
 	memset(&li, 0, sizeof(li));
-	simple_get_dais_count(priv, &li);
+	ret = simple_get_dais_count(priv, &li);
+	if (ret < 0)
+		return ret;
+
 	if (!li.link)
 		return -EINVAL;
 
-- 
2.30.2

