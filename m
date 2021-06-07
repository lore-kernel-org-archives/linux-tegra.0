Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F23C47082
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Jun 2021 08:49:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E499661245
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Jun 2021 08:49:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbhFGIvG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Jun 2021 04:51:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39465 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbhFGIvG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Jun 2021 04:51:06 -0400
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lqAwc-0004ko-Lc
        for linux-tegra@vger.kernel.org; Mon, 07 Jun 2021 08:49:14 +0000
Received: by mail-wr1-f72.google.com with SMTP id v15-20020a5d4a4f0000b0290118dc518878so7587409wrs.6
        for <linux-tegra@vger.kernel.org>; Mon, 07 Jun 2021 01:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cZ1PobqwBPaq9OP1zdBWQXQtgWjqazmERJP5g1G4lIo=;
        b=ho+PZUyRUmvfn6i4MmzGwYKoPxGRPowO6SqhvphtWe7M0dPJzPIr8wl17K5vLAIexA
         R1etkh/bWu7rdWBBqha3MQkHZI1aZ6ZNidp6FdAc97iarZr5u1pMbi6RqNbnjouv7SY+
         ep28mVhSbnAD3kGUOYEVohhczW+fV2bomu/Y2mVXSTp8e0dQxVr4WFucZQ9rX/N93dqb
         eQP/yGL4JgFGoFlW4bqfO6e1HMx/d6NJO3jCDc9hyxEZAnzHkW76PXe0zki2S6at7Gv6
         qWmMTCwpPEHrHkEgGkyUfMN3Z3lnHYixdSiiIZeV5vH0FH0QlRfxiVLs8xHPzc4n6i7r
         uLBA==
X-Gm-Message-State: AOAM531UDiIy4bJ9tRFyipfQCsAOQLhgBlNXBBy2vbQCoA6OatpBiMGJ
        w2a2mehSNP80Xg3KRK9DchVRdrMJkkNHT1/QwAp6wiaHZ7Wh4IzLoyzn6x5ETRFypaGfu+fMV87
        V07gYyeISuYeUb9YvkUTuSftHz00bQTYh44xhQG4v
X-Received: by 2002:a05:6000:18a8:: with SMTP id b8mr15594903wri.208.1623055754367;
        Mon, 07 Jun 2021 01:49:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzA7m3LT7tZJSbZni7ARguVUZ0E3Tcg3okMcx3uwOvjUO9dttwrLYXz7AJDCS5ICKmPinUN0w==
X-Received: by 2002:a05:6000:18a8:: with SMTP id b8mr15594895wri.208.1623055754224;
        Mon, 07 Jun 2021 01:49:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id k16sm13380079wmr.42.2021.06.07.01.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 01:49:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Osipenko <digetx@gmail.com>
Subject: [GIT PULL] memory: Tegra memory controller for v5.14
Date:   Mon,  7 Jun 2021 10:49:10 +0200
Message-Id: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Olof and Arnd,

Tegra memory controller driver changes with necessary dependency from Thierry
(which you will also get from him):
1. Dmitry's power domain work on Tegra MC drivers,
2. Necessary clock and regulator dependencies for Dmitry's work.


Hi Thierry and Will,

This is the pull for you to base further SMMU aptches (prevent early SMMU
faults).

Best regards,
Krzysztof


The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.14

for you to fetch changes up to 393d66fd2cacba3e6aa95d7bb38790bfb7b1cc3a:

  memory: tegra: Implement SID override programming (2021-06-03 21:50:43 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.14 - Tegra SoC

1. Enable compile testing of Tegra memory controller drivers.
2. Unify Tegra memory controller drivers. From Thierry Reding:
   "This set of patches converges the feature sets of the pre-Tegra186
   and the post-Tegra186 memory controller drivers such that newer chips
   can take advantage of some features that were previously only
   implemented on earlier chips."
3. Implement SID override programming as part of work to prevent early
   SMMU faults.
4. Some simplifications, e.g. use devm-helpers.

This pulls dedicated tag from Thierry Reding with necessary changes to
Tegra memory controller drivers, as a pre-requisite to series applied
here.  The changes from Thierry's tree also include their own
dependencies: regulator and clock driver changes.

----------------------------------------------------------------
Dmitry Osipenko (18):
      clk: tegra30: Use 300MHz for video decoder by default
      clk: tegra: Fix refcounting of gate clocks
      clk: tegra: Ensure that PLLU configuration is applied properly
      clk: tegra: Halve SCLK rate on Tegra20
      clk: tegra: Don't allow zero clock rate for PLLs
      clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
      clk: tegra: Mark external clocks as not having reset control
      clk: tegra: Don't deassert reset on enabling clocks
      regulator: core: Add regulator_sync_voltage_rdev()
      soc/tegra: regulators: Bump voltages on system reboot
      soc/tegra: Add stub for soc_is_tegra()
      soc/tegra: Add devm_tegra_core_dev_init_opp_table()
      soc/tegra: fuse: Add stubs needed for compile-testing
      clk: tegra: Add stubs needed for compile-testing
      memory: tegra: Fix compilation warnings on 64bit platforms
      memory: tegra: Enable compile testing for all drivers
      memory: tegra20-emc: Use devm_tegra_core_dev_init_opp_table()
      memory: tegra30-emc: Use devm_tegra_core_dev_init_opp_table()

Krzysztof Kozlowski (1):
      Merge tag 'tegra-for-5.14-memory' of https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into for-v5.14/tegra-mc

Thierry Reding (16):
      Merge branch 'for-5.14/regulator' into for-5.14/soc
      Merge branch 'for-5.14/clk' into for-5.14/memory
      Merge branch 'for-5.14/soc' into for-5.14/memory
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
      memory: tegra: Implement SID override programming

 drivers/clk/tegra/clk-periph-gate.c      |   80 +-
 drivers/clk/tegra/clk-periph.c           |   11 +
 drivers/clk/tegra/clk-pll.c              |   12 +-
 drivers/clk/tegra/clk-tegra-periph.c     |    6 +-
 drivers/clk/tegra/clk-tegra-super-cclk.c |   16 +-
 drivers/clk/tegra/clk-tegra20.c          |    6 +-
 drivers/clk/tegra/clk-tegra30.c          |    6 +-
 drivers/clk/tegra/clk.h                  |    4 -
 drivers/iommu/tegra-smmu.c               |   16 +-
 drivers/memory/tegra/Kconfig             |   18 +-
 drivers/memory/tegra/Makefile            |    6 +-
 drivers/memory/tegra/mc.c                |  321 +++---
 drivers/memory/tegra/mc.h                |   25 +
 drivers/memory/tegra/tegra114.c          | 1245 ++++++++++++----------
 drivers/memory/tegra/tegra124-emc.c      |    4 +-
 drivers/memory/tegra/tegra124.c          | 1306 ++++++++++++-----------
 drivers/memory/tegra/tegra186.c          | 1679 +++++++++---------------------
 drivers/memory/tegra/tegra194.c          | 1351 ++++++++++++++++++++++++
 drivers/memory/tegra/tegra20-emc.c       |   48 +-
 drivers/memory/tegra/tegra20.c           |  110 +-
 drivers/memory/tegra/tegra210.c          | 1433 +++++++++++++------------
 drivers/memory/tegra/tegra30-emc.c       |   52 +-
 drivers/memory/tegra/tegra30.c           | 1292 ++++++++++++-----------
 drivers/regulator/core.c                 |   23 +
 drivers/soc/tegra/common.c               |   97 ++
 drivers/soc/tegra/pmc.c                  |    5 -
 drivers/soc/tegra/regulators-tegra20.c   |   75 +-
 drivers/soc/tegra/regulators-tegra30.c   |   75 +-
 include/linux/clk/tegra.h                |  100 +-
 include/linux/regulator/driver.h         |    1 +
 include/soc/tegra/common.h               |   31 +
 include/soc/tegra/fuse.h                 |   20 +-
 include/soc/tegra/mc.h                   |   65 +-
 33 files changed, 5566 insertions(+), 3973 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra194.c
