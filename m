Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26884C433DB
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 13:51:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E006E64F53
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 13:51:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236418AbhBDNv0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 4 Feb 2021 08:51:26 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10656 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235380AbhBDNvN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 4 Feb 2021 08:51:13 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601bfba60000>; Thu, 04 Feb 2021 05:50:30 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 13:50:29 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 4 Feb 2021 13:50:27 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 0/3] Rename audio graph export functions
Date:   Thu, 4 Feb 2021 19:20:09 +0530
Message-ID: <1612446612-32613-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612446630; bh=dj10Gs3BbaHOUAmMCPFkQcwO1Cd4oSq8N9+7lh0+Rss=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         Content-Type;
        b=mRNYrg7TJ3Idx7panBFWSs8ed8piVcACwNbrakognWWxj5GJlsFVk+LS1Criny3kt
         r0n0mHZOSbcPgFttuxTmQ6PcMuXwvkgZ5iFl/YVV8Unvp6TmBaBH9RbTkMCb7Eua6I
         NNW40CFzJ3AC8WzREMY00zeRxWYXW6OFHQqDav3aj26Mz+J3e62KYLbmfQIkSZ68h8
         KT3n5SkyCHgTJXa3FVAbcCBkKulioX8PtSStxJEK9Z8eQePCiaNfcMA5VflTcyJ+tF
         W90FN66jxqbiUcTiTJ9BuUUS3xfud/8lIbRx1d10tT+RdG318gUS0ba9uK/Dcsi5Fs
         a6zIr7CUGLUyw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series renames exported functions from audio graph for a better
global visibility. In doing so update the references in audio graph
and Tegra audio graph card drivers.


Changelog
=========

v1 -> v2:
---------
 [Patch v2 1/3]:
   - Rename graph_parse_of() to audio_graph_parse_of() and
     graph_card_probe() to audio_graph_card_probe() as well.

   - Update above references in audio graph driver.

 [Patch v2 2/3]: New patch
   - Update references for audio_graph_parse_of() and
     audio_graph_card_probe() in Tegra graph driver.

   - Add "Depends-on" tag

 [Patch v2 3/3]:
   - Update commit message to add "Depends-on" tag.

Sameer Pujar (3):
  ASoC: audio-graph: Rename functions needed for export
  ASoC: tegra: Update references of audio graph helpers
  ASoC: tegra: Add driver remove() callback

 include/sound/graph_card.h               |  6 ++++--
 sound/soc/generic/audio-graph-card.c     | 17 +++++++++--------
 sound/soc/tegra/tegra_audio_graph_card.c |  9 +++++----
 3 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.7.4

