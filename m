Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262A3C433FE
	for <linux-tegra@archiver.kernel.org>; Sat, 19 Nov 2022 01:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbiKSBsU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 20:48:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbiKSBsC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 20:48:02 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9B913CE4
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 17:20:27 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id me22so392422ejb.8
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 17:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IToAu/avs85iHjX2G3ErwhMpjfj+DVl7n22pFP/gPq4=;
        b=c3glxmPleqWj8ru+mBD9ddkaRO46xA8e24qwkVxo16GrnHU7xmvxUQoHCn8OFAGxCw
         ibthFlQgXfnBI9byslf6aEIP7wefTyM5z87uNyV67UOB0ODKizgEWC6mpXW9yYq6rbm8
         cZtgcXxuLjnsW7c47ak/Op3mQkplnzIUZEaN3BlB0oIGn7V8uafxl99vEi2oW2aWt0bE
         b06r1ckmLB1B5q/hWAkBHEUoxUr8GidRLmmW/d2jJRTtNThU1bMcMGfDYxIFacp2y0eq
         cCy1ynr8Nk5/0zWe+dToFQnvfiKYf9munwH7JR8NzbhshHHa7xddlSYr1v+LyRvs/sf1
         fW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IToAu/avs85iHjX2G3ErwhMpjfj+DVl7n22pFP/gPq4=;
        b=W4oYrhlqb2EiqOAsm9sLzENJq76n2o+2kW/NovNGwbS+DY8ycdho3AvaYnGkhV2Pf/
         YQc0oKZr6mz6UQvfYomk40dCbQgKBSgijtdxYgixzt2RCU5Y9tApeVR1b/eHeucpwp4s
         XuOZHpONtxAtlYcJtelWqU5ZQ4/DQVfAwevXlmwXmNEPkgKcuRNgvlS0q5F7Z5dCXjFx
         /HlNiQzj97o/1Fg1nhEbdsYeCULAIv7RiVt6v+gY7YLnpS4UotNoH58MhrxCLAnaISpv
         0mSexpS0Loqcn4d1Dc2CVuBivzsM0tXRIo6AMtpY9LGwGKbLvjYqnKsc6nrWBoi4tBHP
         D9EA==
X-Gm-Message-State: ANoB5plbkJ42vvf95uOE/qnwGn+5B5Q+iugh40cGphnIzisKTI9PrUKx
        xD1pDsT0lOsndU4bIZ8ZUIQ=
X-Google-Smtp-Source: AA0mqf6pUWsttjD3Z2Y5oQ6CqZ/QeRj7S7j6vUI1V4JT55e9MDIehH5xQXTsHcL8JsW5x+NLoHIh+g==
X-Received: by 2002:a17:907:c007:b0:78d:b371:16d4 with SMTP id ss7-20020a170907c00700b0078db37116d4mr7944463ejc.434.1668820826431;
        Fri, 18 Nov 2022 17:20:26 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id be24-20020a0564021a3800b0045726e8a22bsm1341795edb.46.2022.11.18.17.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 17:20:26 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/8] soc/tegra: Changes for v6.2-rc1
Date:   Sat, 19 Nov 2022 02:20:18 +0100
Message-Id: <20221119012025.3968358-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-soc

for you to fetch changes up to b6c6bbfc65f53c4d314ea69ff11bad04606e83e4:

  soc/tegra: cbb: Remove redundant dev_err call (2022-11-17 23:21:36 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.2-rc1

In addition to a number of improvements and cleanups this contains a
fix for the FUSE access on newer chips, adds Tegra234 I/O pad support
and fixes various issues with wake events.

The SoC sysfs revision attribute is updated to include the platform
information so drivers can check for silicon vs. pre-silicon, among
other things.

----------------------------------------------------------------
Kartik (3):
      soc/tegra: fuse: Use SoC specific nvmem cells
      soc/tegra: fuse: Add nvmem keepout list
      soc/tegra: fuse: Use platform info with SoC revision

Liu Shixin (1):
      soc/tegra: cbb: Use DEFINE_SHOW_ATTRIBUTE to simplify tegra_cbb_err

Manish Bhardwaj (1):
      firmware: tegra: include IVC header file only once

Petlozu Pravareshwar (4):
      soc/tegra: pmc: Select IRQ_DOMAIN_HIERARCHY
      soc/tegra: pmc: Add I/O pad table for Tegra234
      soc/tegra: pmc: Fix dual edge triggered wakes
      soc/tegra: pmc: Process wake events during resume

Shang XiaoJing (1):
      soc/tegra: cbb: Remove redundant dev_err call

Sumit Gupta (4):
      soc/tegra: cbb: Use correct master_id mask for CBB NOC in Tegra194
      soc/tegra: cbb: Update slave maps for Tegra234
      soc/tegra: cbb: Add checks for potential out of bound errors
      soc/tegra: cbb: Check firewall before enabling error reporting

 drivers/soc/tegra/Kconfig              |   1 +
 drivers/soc/tegra/cbb/tegra-cbb.c      |  13 +-
 drivers/soc/tegra/cbb/tegra194-cbb.c   |  18 +-
 drivers/soc/tegra/cbb/tegra234-cbb.c   | 170 +++++--
 drivers/soc/tegra/fuse/fuse-tegra.c    | 134 +----
 drivers/soc/tegra/fuse/fuse-tegra30.c  | 278 ++++++++++-
 drivers/soc/tegra/fuse/fuse.h          |   4 +
 drivers/soc/tegra/fuse/tegra-apbmisc.c |   1 +
 drivers/soc/tegra/pmc.c                | 878 +++++++++++++++++++++++----------
 include/soc/tegra/fuse.h               |  15 +
 include/soc/tegra/ivc.h                |   1 +
 include/soc/tegra/pmc.h                |   6 +-
 12 files changed, 1092 insertions(+), 427 deletions(-)
