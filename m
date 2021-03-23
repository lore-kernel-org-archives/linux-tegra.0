Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0C3C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 16:37:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8010B61993
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 16:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233318AbhCWQhN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 12:37:13 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:38660 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbhCWQgk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 12:36:40 -0400
Received: by mail-io1-f42.google.com with SMTP id e8so18348375iok.5;
        Tue, 23 Mar 2021 09:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=541LKQ57D+BvmUsaoliHNppqzLoXCmsKVD7T7MlJimQ=;
        b=CNJ4mw6rgTAtpdW63r+nsyyPaPyLuFB4Og/8Kdb0GtV5MyOV+XY9uLw9KcJc9f5652
         CJZM9vTwbPsp5S6oJLQ3TQPcgPW6phjvyjT/hwg/lnonEX8mGGjldgSoy8Jk3Oz5seoz
         lHisu2tx/8yZfRdni/kGv2/JB5XZ+sPPRJKoTQ07H97oAyhTsaKPsZWpvuXayw+p1bhI
         3jlId4Ui2jf2dG73aUp5MODAp9vDOiL4ndDmkRF45mqzdiFES9fPEvVh3A7KUn3cSAsv
         XMqGfG8SsJuWq4qOFSZVLO3yS70K2Ql2O1b+NpQO715bgzy4Z628NyZr3IXsHsubU7d7
         j0ww==
X-Gm-Message-State: AOAM531i91YIlsLQGYPhw8oDVk/kcPbsZvS1RDjob1wb335z4pTXcgzN
        DECJrn62h8fcoCWEgAPS+g==
X-Google-Smtp-Source: ABdhPJzR+wm/3d7iE9OkgZDgKyWi2DrqnKcHW2ercCH72t76IuuS7N0iQNoI+0NwhAVjeDhFDK1lMQ==
X-Received: by 2002:a02:7419:: with SMTP id o25mr5241097jac.100.1616517399087;
        Tue, 23 Mar 2021 09:36:39 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id r18sm9771268ilj.86.2021.03.23.09.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 09:36:37 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/3] ASoC: dt-bindings: Rework audio-graph-port schema
Date:   Tue, 23 Mar 2021 10:36:31 -0600
Message-Id: <20210323163634.877511-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series refactors the audio-graph-port.yaml schema moving the
'port' node out of the schema and updating to use graph.yaml schema.
This allows users to define what each 'port' node is like other graph
binding users.

Rob

Cc: alsa-devel@alsa-project.org
Cc: linux-tegra@vger.kernel.org
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Lubomir Rintel <lkundrak@v3.sk>
Cc: Mark Brown <broonie@kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Sameer Pujar <spujar@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>

Rob Herring (3):
  ASoC: dt-bindings: Move port/ports properties out of
    audio-graph-port.yaml
  ASoC: dt-bindings: Use OF graph schema
  ASoC: dt-bindings: socionext: Use audio-graph-port schema

 .../bindings/sound/audio-graph-port.yaml      | 104 ++++++++----------
 .../bindings/sound/marvell,mmp-sspa.yaml      |   6 +-
 .../bindings/sound/nvidia,tegra186-dspk.yaml  |  11 +-
 .../sound/nvidia,tegra210-admaif.yaml         |  11 +-
 .../bindings/sound/nvidia,tegra210-ahub.yaml  |  11 +-
 .../bindings/sound/nvidia,tegra210-dmic.yaml  |  11 +-
 .../bindings/sound/nvidia,tegra210-i2s.yaml   |  11 +-
 .../bindings/sound/renesas,rsnd.yaml          |   5 +-
 .../sound/socionext,uniphier-aio.yaml         |   8 +-
 .../sound/socionext,uniphier-evea.yaml        |   8 +-
 10 files changed, 89 insertions(+), 97 deletions(-)

-- 
2.27.0

