Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D644EC433E0
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1C40617C9
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbhC2TrP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 15:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbhC2Tq4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 15:46:56 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6805AC061574;
        Mon, 29 Mar 2021 12:46:56 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id v15so20225921lfq.5;
        Mon, 29 Mar 2021 12:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RlAxOrTeNWfItUXF2nZSSUWDHw16HGPSpDKepnxZ6Z0=;
        b=OoycNIvlW03YOIxLs1qtFJrH4bgu2gYEI1wNX4wmOXibu5/zsWr9wxlGMnHURldPBY
         jTZ0nbGehtNosQTNzkpgMVARLSt/qFqIAbLoo8aJn/j8xjDISUEb6orZgqkOrA9akSEy
         iKqIrgr4ObGM5324sgrhxymIFkKY2Zc+Tn8+VoJxzFyvdVOQGsaNuBySZxbYkEku3twU
         TbZDGvlzpZrcXhxkkqWgEXiOlk1aZ7JZlHS04/+aiE8qH5o6G8X6DCvisaT5BlXaVehG
         q8lyQVQKMve0HoThMB3nDEgqbRjlB7VSQM/Mha5OjV5UAuMmxSYI4xdKs82exg3oMH17
         3CkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RlAxOrTeNWfItUXF2nZSSUWDHw16HGPSpDKepnxZ6Z0=;
        b=prutR2HOg3i3n82PZZv8xHc7/aLDgflv/k8knR/GAx2210xZnBHHkP/vrpxfLxSch/
         uw43Up6bOiAAs1ikis40J7ENihAmFTcj7ebFquTzrds2Q4F0J2rSGeDYqAtVUEty1RVW
         J+eiNMp0VozaE50iAoGy53tfIE3XzvaRbuki0xvWI80DKCKKr2fOIgM35J77tAfQdyfN
         kQxr3RhRoY4ImwnG9TWpRETYKRT68N/0b1Zj/CAYLm/nr2OpAS7esQWzx3gM0Gv4164V
         VtOd08l6X5cIG+OO25KLZnyzc4KszWk7+IfwQJy/VySTb52geLMbPQeGcvOGn2F+sR5c
         Whqg==
X-Gm-Message-State: AOAM533rm+tZ65do4YuxDa9mF1b4AfRapfIewHZER2x3hSgTMC4XVEpZ
        uflCvRFNfGxT8gKXnQHDCqZWhYNTve4=
X-Google-Smtp-Source: ABdhPJy2yTZIuxcOpKHj4irlGPSx5rLDxfdD/3HGOA40ifC+qi7dIegXyA3VVYa6gPW6OT00WSwJJw==
X-Received: by 2002:ac2:490b:: with SMTP id n11mr16569266lfi.491.1617047215013;
        Mon, 29 Mar 2021 12:46:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.gmail.com with ESMTPSA id p24sm1927693lfj.76.2021.03.29.12.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:46:54 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/6] NVIDIA Tegra memory improvements
Date:   Mon, 29 Mar 2021 22:45:56 +0300
Message-Id: <20210329194602.17049-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

This series replaces the raw voltage regulator with a power domain that
will be managing SoC core voltage. The core power domain patches are still
under review, but it's clear at this point that this is the way we will
implement the DVFS support.

The remaining Tegra20 memory bindings are converted to schema. I also
made a small improvement to the memory drivers.

Dmitry Osipenko (6):
  dt-bindings: memory: tegra20: emc: Replace core regulator with power
    domain
  dt-bindings: memory: tegra30: emc: Replace core regulator with power
    domain
  dt-bindings: memory: tegra124: emc: Replace core regulator with power
    domain
  dt-bindings: memory: tegra20: mc: Convert to schema
  dt-bindings: memory: tegra20: emc: Convert to schema
  memory: tegra: Print out info-level once per driver probe

 .../nvidia,tegra124-emc.yaml                  |   7 +-
 .../memory-controllers/nvidia,tegra20-emc.txt | 130 --------
 .../nvidia,tegra20-emc.yaml                   | 294 ++++++++++++++++++
 .../memory-controllers/nvidia,tegra20-mc.txt  |  40 ---
 .../memory-controllers/nvidia,tegra20-mc.yaml |  78 +++++
 .../nvidia,tegra30-emc.yaml                   |   7 +-
 drivers/memory/tegra/tegra124-emc.c           |  12 +-
 drivers/memory/tegra/tegra20-emc.c            |  20 +-
 drivers/memory/tegra/tegra30-emc.c            |  18 +-
 9 files changed, 405 insertions(+), 201 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml

-- 
2.30.2

