Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9081C47096
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 14:36:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF96E613F1
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 14:36:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhFCOiC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 10:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbhFCOiC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 10:38:02 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E68C06174A;
        Thu,  3 Jun 2021 07:36:04 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id jt22so9586479ejb.7;
        Thu, 03 Jun 2021 07:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wK9EVXAXq74ZBV/Us3NrtXVBYQSEq1AIEb2FO6jLjss=;
        b=fOlFmjKgSlFY/7Lif5C2qicO0BDEQ3FvglhnbTImsBxldUE1H2maGyIFQV+MJHXeO1
         foSjMEYTSoEfI2cehapelKQbNgXgXwMLMJPDMyC+rxWocCnKJY1fQTD/Iqm1zZDEHeGV
         5Wxf3k9jqJakZ/+ijFkJHXzo57GiGUVoYG5Fkl/iCA+KZgpUX12k9k7LszZ1Otk4f2pu
         BPaukvirQHcCqr7QvdAzcSj6uRPzyRDDHNY/JeAR4U5/6uuUENgLPqLOgA7VNtGtLqJ5
         5J48ABwCm/cqlBC3hfifmb756oVH33HLvj7M/rhIUxqBOeBV21+BWuEyD6HsFZJNsLK4
         e1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wK9EVXAXq74ZBV/Us3NrtXVBYQSEq1AIEb2FO6jLjss=;
        b=XtBh6nidm+TEhwMO/o3c0n/Wj5jO8mh53fIhco/8/R66yn5YfBNBR2xkH7Lai+N1i0
         hKdobC0E6zSxVU2oW+8NIZEalRIUxpXRiKy2/kLbqOyL6Ahxr7eVuiqwWgrj4vvzIWe1
         LasX7Uf3wUsCtsXadfMXcJfwniLIEETtc5/3tD3nu71A5hdzCp39cwsYzXZojzq8OrJF
         uG4gcWoAKAZHPRJ7/3Ckvj2BF67yjmB/XuxQ7EbWacvpPAjiRc3LGyPwhA0SXT9pHnaG
         ob6KxJ24aRrI7W1PpMrm29P6U2mjKdQyHnZ3YujH1F4UZfONjbScXChGdb5yBhR/kcdv
         xwBQ==
X-Gm-Message-State: AOAM5305QSd8aA+tlFVRkUD4MQFoB/3qTEoB8ZTKenjRxOULxdVB/Eyy
        aodFL1EV6nNOXfF1Nus33X4=
X-Google-Smtp-Source: ABdhPJyccAJuE5nx9TQlaFSKTX6Lg9Gpxw4Fgv9EM2De08PWT9sgJrr5vmLoKKsbYJjupKRZaUAkdA==
X-Received: by 2002:a17:906:c316:: with SMTP id s22mr12632780ejz.17.1622730963596;
        Thu, 03 Jun 2021 07:36:03 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p7sm1882133edw.43.2021.06.03.07.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 07:36:02 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PULL] memory: tegra: Changes for v5.14-rc1
Date:   Thu,  3 Jun 2021 16:37:39 +0200
Message-Id: <20210603143739.787957-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Krzysztof,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-memory

for you to fetch changes up to b4f74b59b99fab61ab97fc0e506f349579d8fefc:

  memory: tegra30-emc: Use devm_tegra_core_dev_init_opp_table() (2021-06-03 14:24:03 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.14-rc1

This stable tag contains Dmitry's power domain work, including all the
necessary dependencies from the regulator, clock and ARM SoC trees.

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

Thierry Reding (3):
      Merge branch 'for-5.14/regulator' into for-5.14/soc
      Merge branch 'for-5.14/clk' into for-5.14/memory
      Merge branch 'for-5.14/soc' into for-5.14/memory

 drivers/clk/tegra/clk-periph-gate.c      |  80 +++++++++++++++----------
 drivers/clk/tegra/clk-periph.c           |  11 ++++
 drivers/clk/tegra/clk-pll.c              |  12 ++--
 drivers/clk/tegra/clk-tegra-periph.c     |   6 +-
 drivers/clk/tegra/clk-tegra-super-cclk.c |  16 ++++-
 drivers/clk/tegra/clk-tegra20.c          |   6 +-
 drivers/clk/tegra/clk-tegra30.c          |   6 +-
 drivers/clk/tegra/clk.h                  |   4 --
 drivers/memory/tegra/Kconfig             |  18 +++---
 drivers/memory/tegra/tegra124-emc.c      |   4 +-
 drivers/memory/tegra/tegra20-emc.c       |  48 ++-------------
 drivers/memory/tegra/tegra30-emc.c       |  52 ++--------------
 drivers/regulator/core.c                 |  23 +++++++
 drivers/soc/tegra/common.c               |  97 ++++++++++++++++++++++++++++++
 drivers/soc/tegra/pmc.c                  |   5 --
 drivers/soc/tegra/regulators-tegra20.c   |  75 ++++++++++++++++++++++-
 drivers/soc/tegra/regulators-tegra30.c   |  75 ++++++++++++++++++++++-
 include/linux/clk/tegra.h                | 100 ++++++++++++++++++++++++-------
 include/linux/regulator/driver.h         |   1 +
 include/soc/tegra/common.h               |  31 ++++++++++
 include/soc/tegra/fuse.h                 |  20 ++++++-
 21 files changed, 507 insertions(+), 183 deletions(-)
