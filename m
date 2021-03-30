Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A9AC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 23:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BBA2619CA
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 23:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233114AbhC3XFa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 19:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233090AbhC3XFS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 19:05:18 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E114C061574;
        Tue, 30 Mar 2021 16:05:16 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id y18so17577144qky.11;
        Tue, 30 Mar 2021 16:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJ4MVowzhmJecvZBk7knuUfAsH6A3UThgH1O85+opf4=;
        b=lE5wwIkVeP1ng+H7N7Td43lDAidck+ZZMEc0BC4HmC4ELF5I9M91HEi5OvpMn+sOLZ
         Do9gC4nbXpIUbVnT/09kIhr36i2y4/8ymZebT5ZRQg+COo2D8emTO2k3HJflJGWkSHO/
         5horJPfZFdwNpW4v41oAfg0PjyqEndhMIFUwQfJUQG+rqwQYoEHstr2YJn+zR7Be+WHy
         oyfN840uGYsfrUOXxwzQzhm+kBGgl/wO24lf0lCVosloxluTqO/KJ+QGDxBdxdtCUy/p
         ZH+RzQct6fqOUSey66YFHjxUzTn4YyBaXgD10sbCFbRAcsG6toeXwSF2NPFzmyrN6wLC
         8E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJ4MVowzhmJecvZBk7knuUfAsH6A3UThgH1O85+opf4=;
        b=acCjDGhYOuDaNLELuazZ859AaXHHyi+O15TmRoOqkiNBJC4+Or6NymoIhK1mmdX7o7
         rg81uMC6sccugHKv9w5GLu3Rmm7U28jodH931S3/ayk99Q58ZDFGglMzQHwftJ4BeAFI
         XclFfK4zLCcb7mjDTY99XZdOxPa2Ctwb6Ix/iEsFHtkW1s6LnsJxWecc6QcHEnEtT+W/
         xHOqHBtrOQWa6eYBXErQkLdInKjGgKAGiwCZHzxZV0RqpzDG6x0adn2Iw67HuFN9Qn3I
         UWrQgFhXoJ3zQsCEKs87UoslGKzYMjKo6c3us/35GmV8TeurNV8YFFloaxDlZvBm/9kk
         WpMg==
X-Gm-Message-State: AOAM530/OxmS3nYufYmS51kdTx+2ugApOrekSe2NXs7XhBZH5X5+HdA8
        9IcrVuqFDQ4LY208Ao9y7+0=
X-Google-Smtp-Source: ABdhPJxvzfQ/8ikvpSAekHsKugb04FR2YOJ+pHCUB9HsNjaKmBnsUdxGSWsgTb1kZcwg9uT/tr0TIw==
X-Received: by 2002:a37:78b:: with SMTP id 133mr605070qkh.109.1617145515447;
        Tue, 30 Mar 2021 16:05:15 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.gmail.com with ESMTPSA id 10sm160061qkc.83.2021.03.30.16.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 16:05:15 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/6] NVIDIA Tegra memory improvements
Date:   Wed, 31 Mar 2021 02:04:39 +0300
Message-Id: <20210330230445.26619-1-digetx@gmail.com>
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

Changelog:

v2: - Fixed typos in the converted schemas.
    - Corrected reg entry of tegra20-mc-gart schema to use fixed number of items.
    - Made power-domain to use maxItems instead of $ref phandle in schemas.

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
 .../memory-controllers/nvidia,tegra20-mc.yaml |  79 +++++
 .../nvidia,tegra30-emc.yaml                   |   7 +-
 drivers/memory/tegra/tegra124-emc.c           |  12 +-
 drivers/memory/tegra/tegra20-emc.c            |  20 +-
 drivers/memory/tegra/tegra30-emc.c            |  18 +-
 9 files changed, 406 insertions(+), 201 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml

-- 
2.30.2

