Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A220AC433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 16:51:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69C8660FE5
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 16:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233247AbhDTQw1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233092AbhDTQw1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 12:52:27 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78CCCC06174A
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 09:51:55 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id e7so45829916edu.10
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 09:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PdUrQlkiyY7oRk/83TPvogLNsdCueuzriHljJ6lcdas=;
        b=MUfOTcOgj1HLmen99NjLsp/wRBqUBEOZLPu8kfO9x3dX733amMLN/B/RC+DTMF8Bnc
         L+VXMmuUZjA9awQ6rnYV3GsIKKyWOgi16itli5qQYOd0mjcFsyuWfBncg0zhwz04PLxR
         9iXZFVyOR4Ri865OjsxIebv8M1TOhokot9FaRIXJ9clP79XIWtPnyvKopuFglOdusWPA
         RsIVb9RxBQ9lnk6T/JhSi1Nvea4N5DH2y22wXin49+Oyuk1FXA8zu6+kAqrPTxAxgEVQ
         VV0/112BWMi5BRnWXU05yQzv8iQWcAJuqYUcvlXf7chPpzeA2LvE8UeNrE6lyj+EjWZW
         6BkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PdUrQlkiyY7oRk/83TPvogLNsdCueuzriHljJ6lcdas=;
        b=avPx5Aw0bppLsOmTbC1879JkZ/GYzDOK4rT6HBYcWUdNDPYwExMB3QnQDBYN3QdFfQ
         GHYZaUCEC+LhjHTN4MgNL0fknf866t3cmSEp+2lIB+unhQeOZfIKfELGsd90EMr2KjOh
         qrEJ4ihHQY6bEizPvNnWPuhUvZtHCL5vKCPUe6Fu8+zrbuzOVUDyNtcVPjsd3TkLu7XZ
         0VJJhAY52Pnib6ZOJ8K0ChLxMpRAp6Y7KBoEK6c4skHC6yO3GIwX0ofPOVvFgb+c1WP0
         W3fNw/0gtoihDGRjNY6+/lGfMc80jgh2ieXrskpL28bHm5YpIJdXePzekJCkX9NnSqyS
         nB8Q==
X-Gm-Message-State: AOAM533xV4YIgTo7LB7CXYiNrEBfUZI0fMzM120BbOwiSPV9bWKIIS9g
        e1/t5HeODVdeDs+XkcapMh8=
X-Google-Smtp-Source: ABdhPJzciFkz6f4iDHOYBYfGaYZtqGbqF/85zauD9FePGxttbz8Z7UpTwC7KI0mvNGxLnCzggGUFCw==
X-Received: by 2002:aa7:c40b:: with SMTP id j11mr33830029edq.219.1618937514207;
        Tue, 20 Apr 2021 09:51:54 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v19sm10905639edr.21.2021.04.20.09.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:51:53 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/10] memory: tegra: Driver unification
Date:   Tue, 20 Apr 2021 18:52:28 +0200
Message-Id: <20210420165237.3523732-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this set of patches converges the feature sets of the pre-Tegra186 and
the post-Tegra186 memory controller drivers such that newer chips can
take advantage of some features that were previously only implemented
on earlier chips.

Note that this looks a bit daunting from a diffstat point of view but
the bulk of this is in the first two patches that basically shuffle
around where some of the per-memory-client register definitions are
located, hence the big number of changed lines.

I haven't done any exhaustive testing on the series yet, but wanted to
get some feedback on the general idea. I'll queue up this up for our
automated testing in the coming days.

Thierry

Thierry Reding (10):
  memory: tegra: Consolidate register fields
  memory: tegra: Unify struct tegra_mc across SoC generations
  memory: tegra: Push suspend/resume into SoC drivers
  memory: tegra: Make per-SoC setup more generic
  memory: tegra: Extract setup code into callback
  memory: tegra: Parameterize interrupt handler
  memory: tegra: Only initialize reset controller if available
  memory: tegra: Unify drivers
  memory: tegra: Add memory client IDs to tables
  memory: tegra: Split Tegra194 data into separate file

 drivers/iommu/tegra-smmu.c      |   16 +-
 drivers/memory/tegra/Makefile   |    6 +-
 drivers/memory/tegra/mc.c       |  324 +++----
 drivers/memory/tegra/mc.h       |   26 +
 drivers/memory/tegra/tegra114.c | 1245 +++++++++++++-----------
 drivers/memory/tegra/tegra124.c | 1306 ++++++++++++++-----------
 drivers/memory/tegra/tegra186.c | 1609 ++++++++-----------------------
 drivers/memory/tegra/tegra194.c | 1353 ++++++++++++++++++++++++++
 drivers/memory/tegra/tegra20.c  |  110 ++-
 drivers/memory/tegra/tegra210.c | 1433 ++++++++++++++-------------
 drivers/memory/tegra/tegra30.c  | 1292 ++++++++++++++-----------
 include/soc/tegra/mc.h          |   58 +-
 12 files changed, 4991 insertions(+), 3787 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra194.c

-- 
2.30.2

