Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FB5C433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Apr 2021 16:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 125BE611C9
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Apr 2021 16:40:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbhDSQlI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Apr 2021 12:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238515AbhDSQlH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Apr 2021 12:41:07 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90053C06174A
        for <linux-tegra@vger.kernel.org>; Mon, 19 Apr 2021 09:40:37 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id n2so53911394ejy.7
        for <linux-tegra@vger.kernel.org>; Mon, 19 Apr 2021 09:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tYD7iKUGDbvQ7xhqvcEek4tJrzFRX/ATvZrSVpamY0s=;
        b=RjEialUZD7kChrGxyPKEsP5Wr+y6NEFyQeHB8YTaoLNZYKDy8PW92VlHFOyn8a6HcQ
         ZErNSMibeYa3TEC/oKk1qi2tLPPGnX8FMa3NM5y2jslqCQOoJUWI6RWPc6Rnr8J1GHWx
         hUZxQqI8xy4a2uCC+nqTT+96LmhMZL9ZU6iJXZElrccMkWUCads5Tl+OGcnxax1vvHs/
         E09OosP8NiQiseq8CLaVUSVchSe0/yhPcBlM4O1v2j3HwQugD7sIaRliHnbVSGFdr17E
         EZSRDjvyudg7EVztTAnWMobS3Yk5ZZPUuwGxXErc/6JRa54OUgezJwjevjj+Ve/p5KzY
         C6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tYD7iKUGDbvQ7xhqvcEek4tJrzFRX/ATvZrSVpamY0s=;
        b=Vu3gUkQsGBEOegWWz42cPl7ze7l1gK5pdT6++qL+bqwOKufIV5PG70ngWESbCyR7Oy
         aVnX24muZqRfWgDpuEghxxeeZcACx0SSsr9Ugl2jhh7OpAFY8EDSX+UER5sHDR6Ya4tJ
         Z0NjaoC2lh9NMdJlFcxRx89qu7oCKyCo9LJr0WLqs1FwD1Y+s3/nsvywxfVrrWKGruDV
         XHSmMMfEVJmf9l/E9KsGyPzHTt676qdaQQsE5e59GfWkxBrnTbZo0CdsYXFwlk63Ov8f
         5BYVjJzdGSN11bCg7CyiKyYJEWILEwu6uN+URIsgPqqWggK+S0ntiCvnoCWCOONolFom
         P5Tw==
X-Gm-Message-State: AOAM532qaEi41znUY6/hZGoLVY/y5El8O4tSfwHTNziLk7M33ScrMIzT
        yzCEA7KbsF1/VVwm1zLTiT4=
X-Google-Smtp-Source: ABdhPJyT0QKTkuCiONsSK1Um/TdKUMfW6JX+g+qt12SXzsljY/kZWhtWBDRG4qIu3OYC/9nFgFtCfQ==
X-Received: by 2002:a17:906:90b:: with SMTP id i11mr23136383ejd.168.1618850436277;
        Mon, 19 Apr 2021 09:40:36 -0700 (PDT)
Received: from localhost (p2e5be10e.dip0.t-ipconnect.de. [46.91.225.14])
        by smtp.gmail.com with ESMTPSA id u1sm13253974edv.90.2021.04.19.09.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 09:40:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jon Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: simple-card-utils: Allocate link info structure on heap
Date:   Mon, 19 Apr 2021 18:41:17 +0200
Message-Id: <20210419164117.1422242-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

struct link_info can grow fairly large and may cause the stack frame
size to be exceeded when allocated on the stack. Some architectures
such as 32-bit ARM, RISC-V or PowerPC have small stack frames where
this causes a compiler warning, so allocate these structures on the
heap instead of the stack.

Fixes: 343e55e71877 ("ASoC: simple-card-utils: Increase maximum number of links to 128")
Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 sound/soc/generic/audio-graph-card.c | 18 +++++++++++-------
 sound/soc/generic/simple-card.c      | 23 +++++++++++++----------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index c7369beee805..e45a560aa9b0 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -548,21 +548,24 @@ static int graph_get_dais_count(struct asoc_simple_priv *priv,
 int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
-	struct link_info li;
+	struct link_info *li;
 	int ret;
 
+	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
+	if (!li)
+		return -ENOMEM;
+
 	card->owner = THIS_MODULE;
 	card->dev = dev;
 
-	memset(&li, 0, sizeof(li));
-	ret = graph_get_dais_count(priv, &li);
+	ret = graph_get_dais_count(priv, li);
 	if (ret < 0)
 		return ret;
 
-	if (!li.link)
+	if (!li->link)
 		return -EINVAL;
 
-	ret = asoc_simple_init_priv(priv, &li);
+	ret = asoc_simple_init_priv(priv, li);
 	if (ret < 0)
 		return ret;
 
@@ -581,8 +584,8 @@ int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	memset(&li, 0, sizeof(li));
-	ret = graph_for_each_link(priv, &li,
+	memset(li, 0, sizeof(*li));
+	ret = graph_for_each_link(priv, li,
 				  graph_dai_link_of,
 				  graph_dai_link_of_dpcm);
 	if (ret < 0)
@@ -600,6 +603,7 @@ int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto err;
 
+	devm_kfree(dev, li);
 	return 0;
 
 err:
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 8b9964d25757..ca27cb9ff9e1 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -442,10 +442,9 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 	return ret;
 }
 
-static int simple_parse_of(struct asoc_simple_priv *priv)
+static int simple_parse_of(struct asoc_simple_priv *priv, struct link_info *li)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
-	struct link_info li;
 	int ret;
 
 	ret = asoc_simple_parse_widgets(card, PREFIX);
@@ -461,8 +460,8 @@ static int simple_parse_of(struct asoc_simple_priv *priv)
 		return ret;
 
 	/* Single/Muti DAI link(s) & New style of DT node */
-	memset(&li, 0, sizeof(li));
-	ret = simple_for_each_link(priv, &li,
+	memset(li, 0, sizeof(*li));
+	ret = simple_for_each_link(priv, li,
 				   simple_dai_link_of,
 				   simple_dai_link_of_dpcm);
 	if (ret < 0)
@@ -612,7 +611,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct snd_soc_card *card;
-	struct link_info li;
+	struct link_info *li;
 	int ret;
 
 	/* Allocate the private data and the DAI link array */
@@ -625,21 +624,24 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	card->dev		= dev;
 	card->probe		= simple_soc_probe;
 
-	memset(&li, 0, sizeof(li));
-	ret = simple_get_dais_count(priv, &li);
+	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
+	if (!li)
+		return -ENOMEM;
+
+	ret = simple_get_dais_count(priv, li);
 	if (ret < 0)
 		return ret;
 
-	if (!li.link)
+	if (!li->link)
 		return -EINVAL;
 
-	ret = asoc_simple_init_priv(priv, &li);
+	ret = asoc_simple_init_priv(priv, li);
 	if (ret < 0)
 		return ret;
 
 	if (np && of_device_is_available(np)) {
 
-		ret = simple_parse_of(priv);
+		ret = simple_parse_of(priv, li);
 		if (ret < 0) {
 			if (ret != -EPROBE_DEFER)
 				dev_err(dev, "parse error %d\n", ret);
@@ -698,6 +700,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err;
 
+	devm_kfree(dev, li);
 	return 0;
 err:
 	asoc_simple_clean_reference(card);
-- 
2.30.2

