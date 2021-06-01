Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021FAC4708F
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA6A1613AD
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbhFAR7z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 13:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbhFAR7z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 13:59:55 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD15DC061574
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 10:58:12 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id y7so18486263eda.2
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 10:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CNiq8vr2Tk0sYmcYOKh4gKll4G6xn2zVSpJq/E/4PTw=;
        b=AUnNR5/gktwc0PGP57AV972FlbJns0XSGrSkgK+DS3WCixHDQLwLBoApaHp+beeVEL
         Vk8BkftgbB7M1M3npeIcTFBWMUlYZdwINAGenVmW7cYYljRj+yDpCeNIMr10b11SuNW6
         pCCBFbebOQR/9dU9hw3FGNBMhnvXZQ8NjfvgsjEMEIjn3Ndqqic/HalsgQ2itHR2Tqmt
         AlNO+JI8qhoaPAHcmdNsXaR+VdTZUNOXT2BbzqW0rPYlXTsD8aLlKT+1jB+s9XNr1fQc
         7O6Rvilem9dJFWiyNui2lBchaACSNrHp6e5CCBnv5165ltFwsKDVwu/3pN86oWnKJBPe
         tAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CNiq8vr2Tk0sYmcYOKh4gKll4G6xn2zVSpJq/E/4PTw=;
        b=DGRm1imhmVOWAmME2o07vyvPV6BxYQSbLi++1BmydN5W42dueYKDVDSZV6bdcgwnvg
         XCoKCHukeA+OPWXsXJKK9FKAza+IyCUhIWGeoFw49UyxDWLZyuIEOX9oe0CC+NwSlDi4
         cPtfRDjbszcouzcFrhR4gAIkSim2GP2xuGJay6OCFQM3ugxXQ6Cs4osuMv2KKoTo9sRn
         91tvtDalvqHdfXs61pMop4wUzhvczW41wKsANGoT3g/dGdssuV0JDJr6UTo22PXTna3o
         QreYyeXHOywBf4SenAJlD6aSLG3HDaNY+ZupRZ/6zkLAvkryqeK5wPPfKbg70pTf/B8E
         +8og==
X-Gm-Message-State: AOAM5314CEYSY9lT50ZbRTG+/L5hN1DviYWnpywcDGPW1FqCp3gThDci
        1/ViOLFVkOunHkEbSYF7KEc1MKC/NnQ=
X-Google-Smtp-Source: ABdhPJz8wzGv7DFfF7GKHuRBNFQzTQQyjpz7AuvCh0OBDvOM8VtWp8Kurcbl4DLU/HURc03JhxFshA==
X-Received: by 2002:aa7:cc10:: with SMTP id q16mr34633728edt.53.1622570291405;
        Tue, 01 Jun 2021 10:58:11 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z20sm275666ejd.18.2021.06.01.10.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 10:58:10 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 00/12] memory: tegra: Driver unification
Date:   Tue,  1 Jun 2021 19:59:30 +0200
Message-Id: <20210601175942.1920588-1-thierry.reding@gmail.com>
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
 drivers/memory/tegra/mc.h       |   26 +
 drivers/memory/tegra/tegra114.c | 1245 +++++++++++++-----------
 drivers/memory/tegra/tegra124.c | 1306 ++++++++++++++-----------
 drivers/memory/tegra/tegra186.c | 1609 ++++++++-----------------------
 drivers/memory/tegra/tegra194.c | 1353 ++++++++++++++++++++++++++
 drivers/memory/tegra/tegra20.c  |  110 ++-
 drivers/memory/tegra/tegra210.c | 1433 ++++++++++++++-------------
 drivers/memory/tegra/tegra30.c  | 1292 ++++++++++++++-----------
 include/soc/tegra/mc.h          |   62 +-
 12 files changed, 4979 insertions(+), 3791 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra194.c

-- 
2.31.1

