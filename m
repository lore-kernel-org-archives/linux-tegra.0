Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC542C4727E
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 17:33:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DB7E20897
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 17:33:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="DcDXK86b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732934AbgJARdk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 13:33:40 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9922 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732876AbgJARdh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 13:33:37 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7612bd0000>; Thu, 01 Oct 2020 10:32:45 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 17:33:33 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 1 Oct 2020 17:33:28 +0000
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
Subject: [PATCH v3 01/13] ASoC: soc-core: Fix component name_prefix parsing
Date:   Thu, 1 Oct 2020 23:02:55 +0530
Message-ID: <1601573587-15288-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601573565; bh=uRImc76K31n+hTi7iV8LIW2zE967Cr4MOzJhpu4XeKk=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=DcDXK86bTbtPxFls8Nzc2w1338dEuAY1M7adk3YDn5Z6cDRDchIlmBMIdwm078snY
         ZB3p89jB2O2eRpkRUu+/xGsVG1IIsorYHsuKVfQa0zSvdCtoxb840H/DklTNUQGwpv
         4gYsl7Oa7IAaBzzzPolyu+W3TKzl+RHwaanFqz6psT8Mw58z1ZDm40Vvr81IoB6NL2
         A+dNeyMnfGpns3kja5tj5Aay5qc9secKAqlv9/xIb/ZmPmYKev2YsxzX9C5K3AGYc/
         IsFU/EZ7YNRw28/mgeOeS0yGpzBa6ywMucK9KRvFdJR/xfsotmOHxQ3qB8Tt54niNK
         Efx9jvfU+0qxw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The "prefix" can be defined in DAI link node or it can be specified as
part of the component node itself. Currently "sound-name-prefix" defined
in a component is not taking effect. Actually the property is not getting
parsed. It can be fixed by parsing "sound-name-prefix" property whenever
"prefix" is missing in DAI link Codec node.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/soc-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 74df224..a784943 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1124,7 +1124,8 @@ static void soc_set_name_prefix(struct snd_soc_card *card,
 	for (i = 0; i < card->num_configs; i++) {
 		struct snd_soc_codec_conf *map = &card->codec_conf[i];
 
-		if (snd_soc_is_matching_component(&map->dlc, component)) {
+		if (snd_soc_is_matching_component(&map->dlc, component) &&
+		    map->name_prefix) {
 			component->name_prefix = map->name_prefix;
 			return;
 		}
-- 
2.7.4

