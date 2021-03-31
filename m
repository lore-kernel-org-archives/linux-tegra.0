Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23567C433B4
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 14:28:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E91EB60FF2
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 14:28:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235968AbhCaO2E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 31 Mar 2021 10:28:04 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:41921 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235787AbhCaO1v (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Mar 2021 10:27:51 -0400
Received: by mail-oi1-f181.google.com with SMTP id z15so20177445oic.8;
        Wed, 31 Mar 2021 07:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wtt/6BX1Tdfid27/aCLws3P6mkfARPhCm6lARDr04cg=;
        b=GTZR+z4wFtjps8vk9i9tXwPhRdVcrXNnbqg6Bsad2+otj/LgVngUHzMaR4t9MMJ6gs
         Yd4hAGxif9OGFEgdmL4RfTH4dXgcdwMMVx4OsRFpQzwqAqSyY5nbyAP70USO9jrsc9Sr
         dFQE9YBnFly6HBuVnY5mpfyjuJgmKjVf5fjq+5QnYOBO6ZH/tAJUeSiJ2CqYv1oWKsVC
         haPz8HIKqbStGeZPMMV+0ahT9PXgFj0MPz5TfNaQCGeN1Q2Pv7xm03WQfYPK5Aeu3GTY
         Ymw2hNPjNr4Ff2GGWCo+nQ7EqzZT1hSAEE0zb62BJDptPJp64fW8lJFrxS53HwXUHlfq
         XdRw==
X-Gm-Message-State: AOAM533bBn/5CjWhu7d0tiUU0yK9FD9vGTVJP85KaPHD2bmaeC7sGh6H
        fk4dI6O3FYQn84ob1iZ8hw==
X-Google-Smtp-Source: ABdhPJzQCtRAKChGGJ8hU5u/x1BvO7XS3DqJEL/hzq2eppjLWh8LfjhB92bi9TKGCvqx86XOKiENNg==
X-Received: by 2002:aca:aa84:: with SMTP id t126mr2539037oie.50.1617200871097;
        Wed, 31 Mar 2021 07:27:51 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id v136sm451146oie.15.2021.03.31.07.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 07:27:50 -0700 (PDT)
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
Subject: [PATCH v2 0/3] ASoC: dt-bindings: Rework audio-graph-port schema
Date:   Wed, 31 Mar 2021 09:27:45 -0500
Message-Id: <20210331142748.2163272-1-robh@kernel.org>
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

v2:
- Rebase on ASoC tree

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

