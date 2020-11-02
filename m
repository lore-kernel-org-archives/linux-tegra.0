Return-Path: <SRS0=G4SC=EI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629DDC00A89
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Nov 2020 15:11:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11DA22084C
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Nov 2020 15:11:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="RytsHP0P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgKBPLS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Nov 2020 10:11:18 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4716 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgKBPLS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Nov 2020 10:11:18 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa021960000>; Mon, 02 Nov 2020 07:11:18 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Nov
 2020 15:11:16 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Mon, 2 Nov 2020 15:11:12 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v5 0/7] Audio Graph Updates
Date:   Mon, 2 Nov 2020 20:40:07 +0530
Message-ID: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604329878; bh=87L96NLcj8xmhNDHPt+LVHpG/YRx6A+VjJPBDkXZ2H8=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         Content-Type;
        b=RytsHP0PnRhpXP6yUolp1rSrNt2+utfHZUkY6gI5VzSrIAP5xVAxsCPRFTgSbwx+5
         SNnefiSTZT9DbBdySZ+OAZ60C6OkQ57zHxEPQfBV7+0pbI0lM50moi03Hf+Xxq7uvN
         0OusLCV2sue9WdA/5kmIIW92AY7oGE67LSfu5HJ2Qk3nH0TSV4ZQNHuZe+P/HXGghl
         ru6NEUKjCJ3jE9W/r3QhWR8rs1ZuiQ5ZcmFQc/70pozqn1J7FTIsosf0O4HDZSopvm
         Qnq1GDYI5DHH0JWhmreoJogHudPWHQ7EdRB5rW8oPki3Oka67LjJDeQ77idGMhskbB
         lnzGL5osOPhow==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series is a prepraration for using generic graph driver for Tegra210
audio. Tegra audio graph series will be sent in a separate series because
it has some dependency over other series for documentation work. This
series can focus on the generic ASoC driver updates. Below are the summary
of changes done.

 * Support multiple instances of a component. For example there can be
   multiple I2S devices which can use the same component driver.

 * Support open platforms with empty Codec endpoint. Customers can plug
   their own HW and can populate codec endpoint.

 * In a component model there can be many components which can be
   connected together. In such cases Identify no-pcm DPCM DAI links which
   can be used in BE<->BE connections.

 * Expose structures or helpers to be re-used by other similar graph
   drivers.

The series is based on following references where DPCM usgae for Tegra
Audio and simple-card driver proposal were discussed.

 * https://lkml.org/lkml/2020/4/30/519 (DPCM for Tegra)
 * https://lkml.org/lkml/2020/6/27/4 (simple-card driver)

Changelog
=========

v4 -> v5
--------
 * No changes in the core/audio-graph driver patches which are
   part of the current series.
 * Dropped Tegra audio patches and doc patches. This will be
   sent separately once the doc depdendencies are resolved.

v3 -> v4
--------
 * Added new patches to convert graph.txt and audio-graph-card.txt
   to corresponding json-schema files. Later these references
   are used in Tegra audio graph schema.

 * AHUB component binding docs are updated to reflect the usage
   of ports/port/endpoint

 * More common stuff is moved into graph_parse_of() and this is
   used by both generic and Tegra audio graph.

 * DT binding for Tegra audio graph is updated to included "ports { }"

 * As per the suggestion 'void *data' member is dropped from
   'asoc_simple_priv' and instead container method is used to
   maintain required custom data internal to Tegra audio graph. 

v2 -> v3
--------
 * Dropped new compatible addition in generic graph driver
   after reviewing it with Morimoto-san. Instead added Tegra
   audio graph driver and new compatibles are added in the same.
 * Added new patches to expose new members for customization
   in audio graph driver.
 * Added new patch for Tegra audio graph driver and related
   documentation.
 * Minor change in below commit where mutex version of helper is used
   "ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM"
 * DT binding is updated to use the newly exposed compatibles
 * No changes in other patches

v1 -> v2
--------
 * Re-organized ports/endpoints description for ADMAIF and XBAR.
   Updated DT patches accordingly.
 * After above change, multiple Codec endpoint support is not
   required and hence dropped for now. This will be considered
   separately if at all required in future.
 * Re-ordered patches in the series.

Sameer Pujar (7):
  ASoC: soc-core: Fix component name_prefix parsing
  ASoC: soc-pcm: Get all BEs along DAPM path
  ASoC: audio-graph: Use of_node and DAI for DPCM DAI link names
  ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM
  ASoC: audio-graph: Support empty Codec endpoint
  ASoC: audio-graph: Expose new members for asoc_simple_priv
  ASoC: audio-graph: Expose helpers from audio graph

 include/sound/graph_card.h           |  16 ++++
 include/sound/simple_card_utils.h    |   3 +
 include/sound/soc.h                  |   1 +
 sound/soc/generic/audio-graph-card.c | 175 ++++++++++++++++++++++++-----------
 sound/soc/soc-core.c                 |   3 +-
 sound/soc/soc-pcm.c                  |   3 +-
 6 files changed, 143 insertions(+), 58 deletions(-)
 create mode 100644 include/sound/graph_card.h

-- 
2.7.4

