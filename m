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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A265BC433B4
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Apr 2021 07:11:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76B4861153
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Apr 2021 07:11:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234991AbhDPHLm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Apr 2021 03:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbhDPHLl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Apr 2021 03:11:41 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14094C061574
        for <linux-tegra@vger.kernel.org>; Fri, 16 Apr 2021 00:11:16 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id l4so40576477ejc.10
        for <linux-tegra@vger.kernel.org>; Fri, 16 Apr 2021 00:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W1nsXVYbKk4iy5sxLt7TvvDcW4X+AnalxkH0tuZSNic=;
        b=bREnFIiYl9coe4uVnwp50tyb2JBKqIQ3oFgPk/ztIofEQcCzle7w851NBHvnLMtCB0
         LU4xW1le5Put/IhkoNY/wWolFg5xiFzbE9J1giTtYLvTv5NiFKsOjHp3W+uCdI1bg2Xl
         MpzOKKA547jTAR4WUH7s5cNcb/Fz98Pby8/eMGz3Migv8+ORMJo4VDS21wPCjGKpJhGx
         VV32lkTk0drV8fAnrTftSPad16fyIykcxphAtRRhU9x4Sa4JEwMDyLanLZyEmYXiod8o
         BO4IjRLGjp4a7p99F4uoy6IdlppfEh+E3Iurris75rqwesOlq9hPpdSJKK57UoRcX3rJ
         coFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W1nsXVYbKk4iy5sxLt7TvvDcW4X+AnalxkH0tuZSNic=;
        b=GQS3wR2rUZZSqcQor9CmHATj+svBcuw7vi/Hbsw8CQDgFEuQc9/xW2MlgVOcoqP6T+
         kW17rTIERdZGUoxkrbb3vs5+iW6HyBaT90l92GzO576HgnV6WPt7mQEPoMdbLMU+M8gC
         glN6iIyNVgOJUEx6sQCjtyv2nYXv6t5dn/j64a2WBTZiUwu3i+T4MpHGPh/cgzMrrODY
         9ksvHQmSyKLygT/SRB0CcEqIxUqzRZQHj7pk21sMktg29JIqacfB/emTxQY0iLuUA0xz
         hLgrEjEirNk16ursZHhvuVdVTOwCZAKKeC/9CFQLP4OjwRomqBN7BICzKr3fFmjFU041
         QplQ==
X-Gm-Message-State: AOAM530WEzVO3IA+H7DhEWnNcQIQ7Nie+emrySBrpdEMMz+pdtJStEx/
        FS4CLZGqGPXK9HKfNNEZzWE=
X-Google-Smtp-Source: ABdhPJyhfSMgTGGbG8vxZg7h36lO/yDWjzG2dTHF139BfidXiHusKF2aX/1ruMZo/gMmhTNuQCJbAw==
X-Received: by 2002:a17:907:2662:: with SMTP id ci2mr6894506ejc.467.1618557074856;
        Fri, 16 Apr 2021 00:11:14 -0700 (PDT)
Received: from localhost (p2e5be10e.dip0.t-ipconnect.de. [46.91.225.14])
        by smtp.gmail.com with ESMTPSA id c19sm4382715edu.20.2021.04.16.00.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 00:11:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jon Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] ASoC: simple-card-utils: Increase maximum number of links to 128
Date:   Fri, 16 Apr 2021 09:11:47 +0200
Message-Id: <20210416071147.2149109-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210416071147.2149109-1-thierry.reding@gmail.com>
References: <20210416071147.2149109-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Tegra186 and later, the number of links can go up to 72, so bump the
maximum number of links to the next power of two (128).

Fixes: f2138aed231c ("ASoC: simple-card-utils: enable flexible CPU/Codec/Platform")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/sound/simple_card_utils.h    | 4 +++-
 sound/soc/generic/audio-graph-card.c | 4 ++--
 sound/soc/generic/simple-card.c      | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index fac3b832d982..e318a2d4ac44 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -115,10 +115,12 @@ struct asoc_simple_priv {
 		     ((codec) = simple_props_to_dai_codec(props, i));	\
 	     (i)++)
 
+#define SNDRV_MAX_LINKS 128
+
 struct link_info {
 	int link; /* number of link */
 	int cpu;  /* turn for CPU / Codec */
-	struct prop_nums num[SNDRV_MINOR_DEVICES];
+	struct prop_nums num[SNDRV_MAX_LINKS];
 };
 
 int asoc_simple_parse_daifmt(struct device *dev,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 2401212281c2..d6d90285967c 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -616,7 +616,7 @@ static int graph_count_noml(struct asoc_simple_priv *priv,
 {
 	struct device *dev = simple_priv_to_dev(priv);
 
-	if (li->link >= SNDRV_MINOR_DEVICES) {
+	if (li->link >= SNDRV_MAX_LINKS) {
 		dev_err(dev, "too many links\n");
 		return -EINVAL;
 	}
@@ -639,7 +639,7 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
 {
 	struct device *dev = simple_priv_to_dev(priv);
 
-	if (li->link >= SNDRV_MINOR_DEVICES) {
+	if (li->link >= SNDRV_MAX_LINKS) {
 		dev_err(dev, "too many links\n");
 		return -EINVAL;
 	}
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 1d1c4309b582..59b41019c65f 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -484,7 +484,7 @@ static int simple_count_noml(struct asoc_simple_priv *priv,
 			     struct device_node *codec,
 			     struct link_info *li, bool is_top)
 {
-	if (li->link >= SNDRV_MINOR_DEVICES) {
+	if (li->link >= SNDRV_MAX_LINKS) {
 		struct device *dev = simple_priv_to_dev(priv);
 
 		dev_err(dev, "too many links\n");
@@ -505,7 +505,7 @@ static int simple_count_dpcm(struct asoc_simple_priv *priv,
 			     struct device_node *codec,
 			     struct link_info *li, bool is_top)
 {
-	if (li->link >= SNDRV_MINOR_DEVICES) {
+	if (li->link >= SNDRV_MAX_LINKS) {
 		struct device *dev = simple_priv_to_dev(priv);
 
 		dev_err(dev, "too many links\n");
-- 
2.30.2

