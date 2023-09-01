Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2747CA0FE1
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Sep 2023 10:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234239AbjIAKRx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Sep 2023 06:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjIAKRx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Sep 2023 06:17:53 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9719F1B2
        for <linux-tegra@vger.kernel.org>; Fri,  1 Sep 2023 03:17:49 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bce552508fso29781511fa.1
        for <linux-tegra@vger.kernel.org>; Fri, 01 Sep 2023 03:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693563468; x=1694168268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nYg8l6Jyfp1iBKfTo4myl31mihhTTXccbSjg7R4uzxI=;
        b=e7bq76U1i9KPi1ckAryxz9YXai0UFk1lXlq7gVQXZ8wHTQOMQSzdunlG1rSSRYwg5s
         nwwttHYonMFaoaCkJTVCckQjJeXKbHMeyykhyLFGrgy/vhjSNUD3JkdrB0Het8KL8Xbz
         uPQC+kk1aH2mUXSLZHoMwwOYNR+yNrJmfPZVz61z/subM8ufQtfg1yCzBKqb5K+6tYwK
         dSNqHjm7SOUtacYM4qpu2rgmUpjT1M4xUD2syaml18e+WW9UYOtowrZ6eHqZ2jV1iRw0
         BztBnVnFtE1xFiHAxG3VQf948ooy1V7sn5eUtoFvBm6O2PdUVpz/ErimNoQeBml9scHF
         vF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693563468; x=1694168268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYg8l6Jyfp1iBKfTo4myl31mihhTTXccbSjg7R4uzxI=;
        b=ld0Fpe1W50l3vuWG6sgBZ4wJvVEStBODibwT9gGL2mGaBmOt8KzPVG+S+bRLUAtG8h
         dYPL5ARr2VzebfUwqInI9Pio5Iq9vjXcVBwN7QdCBi4eoO7liLshMr7peMPZhW2MULpV
         kQLCOK+a1fRg2HixAETz/H0YCSUfa28z5/plFJqt8BKnyI65JjUM7AtBRz+xFXEZ6vQY
         wCSEFdVPFA4soNGzkdYPSrZp8uv6d8Duxi3AMxWWNkZC96wLcqciBNPZiHqXGGbAI2rE
         JAhJMQnEN16joPtC0EKxizxSNuIel448WIkMNoIEdEjthq/eUU2QfIDprsMf6Po7feeO
         oaZQ==
X-Gm-Message-State: AOJu0Yw9f3iBtOAFJepEv2kcrxIfCIn8jPGlj5VncZNaHMNvSUuwuFFm
        335zVKl3Nbqs5Lye1vl9KNE=
X-Google-Smtp-Source: AGHT+IFkAG3fG76w4qNUIzW19jbYrK07Oj1yWuRbsFhuuKlkDeLerwPOKJ01T068DSHKL5Z9R8w5uA==
X-Received: by 2002:a19:2d17:0:b0:500:9a45:636 with SMTP id k23-20020a192d17000000b005009a450636mr1157658lfj.13.1693563466598;
        Fri, 01 Sep 2023 03:17:46 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bo9-20020a0564020b2900b0052889d090bfsm1876647edb.79.2023.09.01.03.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 03:17:46 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 1/2] dt-bindings: Changes for v6.6-rc1
Date:   Fri,  1 Sep 2023 12:17:40 +0200
Message-ID: <20230901101742.1871434-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 72738fdeccd172210539a786e23b09b67565d509:

  dt-bindings: firmware: Add support for tegra186-bpmp DRAM MRQ GSCs (2023-07-26 18:23:42 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.6-dt-bindings-v2

for you to fetch changes up to 9d697e4b743080f560e3eee54599853e8ee8fa25:

  dt-bindings: arm: tegra: pmc: Relicense and move into soc/tegra directory (2023-08-16 18:19:53 +0200)

As discussed previously, here are some late updates for the Tegra tree.

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.6-rc1

This the conversion of one more DT binding to json-schema.

----------------------------------------------------------------
Thierry Reding (7):
      dt-bindings: arm: tegra: pmc: Improve property descriptions
      dt-bindings: arm: tegra: pmc: Remove useless boilerplate descriptions
      dt-bindings: arm: tegra: pmc: Move additionalProperties
      dt-bindings: arm: tegra: pmc: Increase maximum number of clocks per powergate
      dt-bindings: arm: tegra: pmc: Restructure pad configuration node schema
      dt-bindings: arm: tegra: pmc: Reformat example
      dt-bindings: arm: tegra: pmc: Relicense and move into soc/tegra directory

 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 393 -------------------
 .../bindings/soc/tegra/nvidia,tegra20-pmc.yaml     | 416 +++++++++++++++++++++
 2 files changed, 416 insertions(+), 393 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
