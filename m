Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8318C4708F
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:31:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80AB161984
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhFBQdP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 12:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhFBQdO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 12:33:14 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32B5C061574
        for <linux-tegra@vger.kernel.org>; Wed,  2 Jun 2021 09:31:30 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id dg27so3625266edb.12
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 09:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lMvkgT61BB1Do0cZc1nr6/swmO3QfR5Di1uAZP96r9U=;
        b=T3+J1HEkNbIf5Rs4frnoPky+Ayjh8kytezI+i2AKZnlpkdoXOOurUxOFkK1Ectn8+x
         fIXeCJtt56FyungkNyv34BcgP0hos9PPIwqyPTSBt/7yYHgH57ydJPzk61JiHXF+tIbv
         9ive6iF1QOf8iAYyl6gjmyZGwxUHQbqEZdgOUW7IL57PYACb91jWrpRlyx+TM73iRte6
         Gdg7G8F03n1LapgLO6vTheIbkIiSBBY+eJ+PMn4JnFT+Hgn8zjDsSOLUl/fbd5oaQo51
         /sY8P7X0qR/h7hJXCiorDPrai3tLJLFcfr9/OTQJkZMWsxKbl+YugGKoU8WsF8WqHOTU
         3EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lMvkgT61BB1Do0cZc1nr6/swmO3QfR5Di1uAZP96r9U=;
        b=PzIpktIbpn61nha5HSZBHKk24/poT0IDvAnmULsQJzRlAobNsHTWOP81Z1zr2gvqbd
         s0oC/mDEyHz+MJOkwZ/O08wv5R/BI+ET+05rRxbioY4ifPIrNIPeBt+6NNJuJdHpTEDn
         xkPyD6LmsAEHFKmCUNavcZfRWVFW47tyZQPs/dCoj3sokqlLAUU6q4YJW61NFz5DOxHT
         OrJdqctfPblL/E5ZmusaiXjUAxBmGkg5qjWJFVSJ+aLsayDonGJW6eWCpAGPr3OuJ0Gg
         Q0nPA2BYtl5p1KpHe5x2EBAru+o6ukQ0Dx9IO3m2IHlJgBTWrey9DzJDu1cAmKl9/mQV
         EDeA==
X-Gm-Message-State: AOAM533NnxAArrjLZZqjTl1n/cDKp2c1/0EIAl/A6BHmGmbb35+WF1up
        rjq5XrzCexotNvLbJshMu78=
X-Google-Smtp-Source: ABdhPJz7AiswGSIbLPA2IvpDWWaFMkUIedRPt9qCh043BfkTXnKvGDzOe+woDUOm4FrkwGfv/zyq3Q==
X-Received: by 2002:a05:6402:4310:: with SMTP id m16mr39487302edc.279.1622651489317;
        Wed, 02 Jun 2021 09:31:29 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h23sm230032eds.73.2021.06.02.09.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:31:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 00/12] memory: tegra: Driver unification
Date:   Wed,  2 Jun 2021 18:32:50 +0200
Message-Id: <20210602163302.120041-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
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

Changes in v3:
- remove redundant #ifdef/#endif guards
- make tegra30_mc_handle_irq() static

Changes in v2:
- split patches up a bit for smaller, logical changes
- add better documentation for ->probe() callback
- use SET_SYSTEM_SLEEP_OPS where appropriate
- include Tegra194 separation patch
- use prefix for global variables
- drop commented-out code

Thierry

Thierry Reding (12):
  memory: tegra: Consolidate register fields
  memory: tegra: Unify struct tegra_mc across SoC generations
  memory: tegra: Introduce struct tegra_mc_ops
  memory: tegra: Push suspend/resume into SoC drivers
  memory: tegra: Make per-SoC setup more generic
  memory: tegra: Extract setup code into callback
  memory: tegra: Parameterize interrupt handler
  memory: tegra: Make IRQ support opitonal
  memory: tegra: Only initialize reset controller if available
  memory: tegra: Unify drivers
  memory: tegra: Add memory client IDs to tables
  memory: tegra: Split Tegra194 data into separate file

 drivers/iommu/tegra-smmu.c      |   16 +-
 drivers/memory/tegra/Makefile   |    6 +-
 drivers/memory/tegra/mc.c       |  312 +++---
 drivers/memory/tegra/mc.h       |   25 +
 drivers/memory/tegra/tegra114.c | 1245 +++++++++++++-----------
 drivers/memory/tegra/tegra124.c | 1306 ++++++++++++++-----------
 drivers/memory/tegra/tegra186.c | 1609 ++++++++-----------------------
 drivers/memory/tegra/tegra194.c | 1351 ++++++++++++++++++++++++++
 drivers/memory/tegra/tegra20.c  |  110 ++-
 drivers/memory/tegra/tegra210.c | 1433 ++++++++++++++-------------
 drivers/memory/tegra/tegra30.c  | 1292 ++++++++++++++-----------
 include/soc/tegra/mc.h          |   62 +-
 12 files changed, 4976 insertions(+), 3791 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra194.c

-- 
2.31.1

