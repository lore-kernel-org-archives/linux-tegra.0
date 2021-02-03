Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EDBC433DB
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 16:10:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D16C64F9B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 16:10:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234158AbhBCQKv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Feb 2021 11:10:51 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6839 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234607AbhBCQKp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Feb 2021 11:10:45 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601acad30000>; Wed, 03 Feb 2021 08:09:55 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Feb
 2021 16:09:55 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 3 Feb 2021 16:09:52 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 0/2] Add remove path for Tegra audio graph card
Date:   Wed, 3 Feb 2021 21:39:33 +0530
Message-ID: <1612368575-25991-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612368595; bh=mdEjIwUsTxOW77J3RnmCZ4pTZ0Qu0nvmWND3Zms5/f4=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         Content-Type;
        b=F4ayGu5PT0iyyJpOrH2xeEFMQAG0FO/HOtM39Wq+RISGDSLMiDqGbFzarQk9t5/dx
         BR+ODcbO8N3QMnKqQ+THZlLx39pCfnpKIlxkg4xBEv0wIdeweFX5pwfS2f5Ls/BfNA
         9No1oHO5yjCt9gGA7gl3F4xLJP0/B+Yfiy6XNejmJC9UUqfXm3hCjRqWMHVwKdAjLD
         iL6eyX9cU62mHYJtk9j11CgEA/jDqASY3SIGA/VWOcCXPmWcBcItXCEcXK+YawF5N8
         tzwyfQd7ffGAK4E4um2rHjkHHEQwAJ4lJTctrd+p15gmCGaH97dKqehdBSwb+uvF7b
         uwLNTTC0aNPmw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Audio graph driver cleans up phandle references of CPU/CODEC nodes in
graph_remove() path. As Tegra graph card driver is based on this
populate remove callback for it.

Sameer Pujar (2):
  ASoC: audio-graph: Export graph_remove() function
  ASoC: tegra: Add driver remove() callback

 include/sound/graph_card.h               | 2 ++
 sound/soc/generic/audio-graph-card.c     | 3 ++-
 sound/soc/tegra/tegra_audio_graph_card.c | 3 ++-
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.7.4

