Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13245C2BD0C
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 14:43:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4EA321556
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 14:43:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="KEUH5O24"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409143AbgJPOnm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 10:43:42 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:3526 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409120AbgJPOnj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 10:43:39 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f89b1400001>; Fri, 16 Oct 2020 07:42:08 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 14:43:37 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 14:43:31 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <p.zabel@pengutronix.de>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v4 02/15] ASoC: soc-pcm: Get all BEs along DAPM path
Date:   Fri, 16 Oct 2020 20:12:49 +0530
Message-ID: <1602859382-19505-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602859328; bh=sz5SRa46M4KShycO2xxM0tI3Ze3FSCkmlO0AbxOI+dI=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=KEUH5O246MlC9fQGJ4Qr/pmklWOm+aNZ2oA2kyDnoMldY5f+OPCrZHfvtgUU0yp2Y
         amHZ8MJL/mqt5ZsoInuUEjpnne/TVxbe+aG/Lk8i5WcoOHj/BlvEgpz7zYt6Lt7S9O
         vSQPh+KhPQzzkyiJSdX9bjF11WEc+Hb3Seeoxirz6aRTtg+7+WFPUWHb7J/TGUhMGT
         JEiCoo2mqk2EtiYaZGY/lzGMHW07B4R3drYyBUgaXToQ1dWWScNibqoERz9UQcuhQn
         A1bFTcTigenWeL7hrxo3Ts4kNmfajB86WUa/7jnNuWgePmJVuGR1xzXM5j2YUc+8gC
         ePgpasCGEwVWw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

dpcm_end_walk_at_be() stops the graph walk when first BE is found for
the given FE component. In a component model we may want to connect
multiple DAIs from different components. A new flag is introduced in
'snd_soc_card', which when set allows DAI/component chaining. Later
PCM operations can be called for all these listed components for a
valid DAPM path.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 include/sound/soc.h | 1 +
 sound/soc/soc-pcm.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 3b038c5..9b69d70 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1084,6 +1084,7 @@ struct snd_soc_card {
 	unsigned int fully_routed:1;
 	unsigned int disable_route_checks:1;
 	unsigned int probed:1;
+	unsigned int component_chaining:1;
 
 	void *drvdata;
 };
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index dcab952..9bd2d65 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1284,7 +1284,8 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 
 	/* get number of valid DAI paths and their widgets */
 	paths = snd_soc_dapm_dai_get_connected_widgets(cpu_dai, stream, list,
-			dpcm_end_walk_at_be);
+			fe->card->component_chaining ?
+				NULL : dpcm_end_walk_at_be);
 
 	dev_dbg(fe->dev, "ASoC: found %d audio %s paths\n", paths,
 			stream ? "capture" : "playback");
-- 
2.7.4

